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

		/* for (int i = 1; i <= 6; i++) {
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
		} */

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
		 sql.append("        WHERE hogi IN ('1', '2', '3', '4', '5', '6') ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '"+edate+" 12:00:00' ");
		 sql.append("        ORDER BY hogi ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '"+edate+" 08:00:00' ");
		 sql.append("GROUP BY hogi;");

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		int cnt = 1;
		while(rs.next()){
			JSONObject mapObj = new JSONObject();
			//1호기
			//생산능력
			/* mapObj.put("machine",rs.getString("machine"));
			mapObj.put("v1",rs.getString("v1"));
			mapObj.put("v2",rs.getString("v2"));
			mapObj.put("v3",rs.getString("v3"));
			mapObj.put("v4",rs.getString("v4"));
			mapObj.put("v5",rs.getString("v5"));
			mapObj.put("v6",rs.getString("v6"));
			mapObj.put("v7",rs.getString("v7")); */
			
			for(; cnt < rs.getInt("hogi"); cnt++){
				mapObj.put("hogi",cnt);
				mapObj.put("v1","0");
				mapObj.put("v6","0");
				mapObj.put("sdate","0");
				mapObj.put("edate","0");
				mapArray.add(mapObj);
				mapObj = new JSONObject();
			}
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
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '1' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 2 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay2");
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '2' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 3 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay3");
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '3' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 4 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay4");
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '4' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 5 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay5");
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '5' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 6 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay6");
		sql2.append(" WHERE tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '6' AND tdatetime >= '").append(sdate).append("' AND tdatetime <= '").append(edate).append("'");
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
