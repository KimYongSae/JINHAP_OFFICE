<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
	String sdate = request.getParameter("date");
	String edate = request.getParameter("edate");
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	 
	StringBuffer whereSql = new StringBuffer();
	 
	JSONObject mainObj = new JSONObject();  
	JSONArray mapArray = new JSONArray();
	JSONArray mapArray2 = new JSONArray();
	
	Statement stmt = null;
	ResultSet rs = null;
	try{

		for (int i = 1; i <= 6; i++) {
		    if (i > 1) {
		        sql.append(" UNION ALL ");
		    }
		    sql.append("SELECT "+i+" AS hogi, ");
		    sql.append("SUM(tlw.lot_weight) AS total_lot_weight, ");
		    sql.append("SUM(CASE WHEN tlw.lot_weight IS NOT NULL THEN 1 ELSE 1 END) AS total_count ");
		    sql.append("FROM ( ");
		    sql.append("    SELECT ");
		    sql.append("        SUM(CASE WHEN sub.lot_group != @prev_lot_group THEN 1 ELSE 0 END) OVER (ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') ASC) AS new_lot_group, ");
		    sql.append("        sub.lot_weight ");
		    sql.append("    FROM ( ");
		    sql.append("        SELECT ");
		    sql.append("            t.datetiem1, ");
		    sql.append("            t.lot_weight, ");
		    sql.append("            MIN(STR_TO_DATE(t.datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY t.lot_group) AS first_datetiem1_in_group, ");
		    sql.append("            t.lot_group ");
		    sql.append("        FROM ( ");
		    sql.append("            SELECT ");
		    sql.append("                t.datetiem1, ");
		    sql.append("                t.lot_weight, ");
		    sql.append("                @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, ");
		    sql.append("                @prev_gubun := t.gubun ");
		    sql.append("            FROM tb_tong_log t ");
		    sql.append("            CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '') AS init ");
		    sql.append("            WHERE t.hogi = '"+i+"' ");
		    sql.append("            AND STR_TO_DATE(t.datetiem1, '%Y%m%d%H%i%s') BETWEEN '"+sdate+" 07:00:00' AND '"+edate+" 12:00:00' ");
		    sql.append("        ) AS t ");
		    sql.append("    ) AS sub ");
		    sql.append("    WHERE STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00' ");
		    sql.append("    ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') ASC ");
		    sql.append(") AS tlw ");
		}


		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("hogi",rs.getString("hogi"));
			mapObj.put("lot_weight",rs.getString("total_lot_weight"));
			mapObj.put("lot_count",rs.getString("total_count"));
			mapArray.add(mapObj);
			
		}
		/* sql2.append("SELECT a.hogi AS hogi, a.proc_cnt AS proc_cnt, ");
		sql2.append(" b.proc_gb AS proc_gb FROM v_hogi_gantry_cnt AS a ");
		sql2.append(" INNER JOIN tb_hogi_job AS b ON a.hogi = b.hogi");
	
		rs = stmt.executeQuery(sql2.toString());
		
		while(rs.next()){
			JSONObject delayObj = new JSONObject();
			
			delayObj.put("hogi", rs.getString("hogi"));
			delayObj.put("proc_cnt", rs.getString("proc_cnt"));
			delayObj.put("proc_gb", rs.getString("proc_gb"));
			mapArray2.add(delayObj);
		} */
		
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
	     /* mainObj.put("delay",mapArray2); */
		       
		       
//		       conn.commit();
		     }	
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				out.print(mainObj);
				out.flush();
			
				if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
				if(rs != null) try {rs.close();}catch(SQLException sqle){}
				if(conn != null) try {conn.close();}catch(SQLException sqle){}

			}
%>
