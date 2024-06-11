<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
	//String sdate = request.getParameter("sdate");
	String sdate = "2024-05-23";
	String edate = request.getParameter("edate");
	String delaySdate = sdate + " 20:00:00";
	String delayEdate = edate + " 08:00:00";
	
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
		 
		 sql.append("SELECT ");
		 sql.append("    hogi, ");
		 sql.append("    IFNULL(SUM(lot_weight), 0) AS weight, ");
		 sql.append("    IFNULL(COUNT(idx), 0) AS lot_count, ");
		 sql.append("    IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, ");
		 sql.append("    IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate, ");
		 sql.append("    COUNT(DISTINCT lot_group) AS distinct_lot_groups ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT ");
		 sql.append("        main.*, ");
		 sql.append("        MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, ");
		 sql.append("        COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT ");
		 sql.append("            t.*, ");
		 sql.append("            @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, ");
		 sql.append("            @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '1' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 19:00:00' AND '" + edate + " 09:00:00' ");
		 sql.append("        ORDER BY hogi ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 20:00:00' AND '" + edate + " 08:00:00'  ");
		 sql.append("GROUP BY hogi;");
		 
		 

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		int cnt = 1;
		while(rs.next()){
			JSONObject mapObj = new JSONObject();
			
			mapObj.put("hogi",rs.getString("hogi"));
			mapObj.put("v1",rs.getInt("weight")*0.01);
			mapObj.put("v6",rs.getString("distinct_lot_groups"));
			mapObj.put("sdate",rs.getString("sdate"));
			mapObj.put("edate",rs.getString("edate"));
			mapArray.add(mapObj);
			cnt++;
			
		}
		sql2.append("SELECT 1 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay1");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
	
		rs = stmt.executeQuery(sql2.toString());
		
		while(rs.next()){
			JSONObject delayObj = new JSONObject();
			
			delayObj.put("hogi", rs.getString("hogi"));
			delayObj.put("delay", rs.getInt("total_time_difference")/3600);
			mapArray2.add(delayObj);
		}
		
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
	     mainObj.put("delay",mapArray2);
		       
		       
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
