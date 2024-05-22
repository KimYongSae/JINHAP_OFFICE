<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
	String sdate = request.getParameter("sdate");
	String etime = request.getParameter("etime");
	
	String delaySdate = sdate + " 08:00:00";
	String delayEdate = sdate + " " + etime;
	
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
/*
select machine, v1, v2, v3, v4, v5, v6, v7
from v_machine_performance_total
UNION
select '합계' AS machine,
SUM(v1) AS v1, SUM(v2) AS v2, 
ROUND((SUM(v1)/SUM(total_proc))*100,1) AS v3, 
ROUND((SUM(v2)/SUM(total_proc))*100,1) AS v4,
ROUND((SUM(lot_weight)/SUM(lot_total_weight))*100,1) AS v5,
SUM(v6) AS v6, SUM(v7) AS v7
from v_machine_performance_total
*/		

/* 		sql.append("select machine, v1, v2, v3, v4, v5, v6, v7 ");
		sql.append("FROM v_machine_performance_total ");
		sql.append("UNION ALL ");
		sql.append("SELECT '합계' AS machine, ");
		sql.append("SUM(v1) AS v1, SUM(v2) AS v2, ");
		sql.append("ROUND((SUM(v2)/SUM(total_proc))*100,1) AS v3, ");
		sql.append("ROUND((SUM(v1)/SUM(total_proc))*100,1) AS v4, ");
		sql.append("ROUND((SUM(lot_weight)/SUM(lot_total_weight))*100,1) AS v5, ");
		sql.append("SUM(v6) AS v6, SUM(v7) AS v7 ");
		sql.append("FROM v_machine_performance_total ");
 */
 
		 /* sql.append("WITH MachineList AS ( ");
		 sql.append("  SELECT 'Q01-HN01' AS machine ");
		 sql.append("  UNION ALL SELECT 'Q01-HN02' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN03' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN04' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN05' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN06' ");
		 sql.append(") ");
		 sql.append("SELECT ");
		 sql.append("  ml.machine, ");
		 sql.append("  COALESCE(vmp.v1, 0) AS v1, ");
		 sql.append("  COALESCE(vmp.v2, 0) AS v2, ");
		 sql.append("  COALESCE(vmp.v3, 0) AS v3, ");
		 sql.append("  COALESCE(vmp.v4, 0) AS v4, ");
		 sql.append("  COALESCE(vmp.v5, 0) AS v5, ");
		 sql.append("  COALESCE(vmp.v6, 0) AS v6, ");
		 sql.append("  COALESCE(vmp.v7, 0) AS v7 ");
		 sql.append("FROM MachineList ml ");
		 sql.append("LEFT JOIN ( ");
		 sql.append("  SELECT machine, v1, v2, v3, v4, v5, v6, v7 ");
		 sql.append("  FROM v_machine_performance_total ");
		 sql.append(") vmp ON ml.machine = vmp.machine ");
		 sql.append("UNION ALL ");
		 sql.append("SELECT '합계' AS machine, ");
		 sql.append("SUM(v1) AS v1, SUM(v2) AS v2, ");
		 sql.append("ROUND((SUM(v2)/SUM(total_proc))*100,1) AS v3, ");
		 sql.append("ROUND((SUM(v1)/SUM(total_proc))*100,1) AS v4, ");
		 sql.append("ROUND((SUM(lot_weight)/SUM(lot_total_weight))*100,1) AS v5, ");
		 sql.append("SUM(v6) AS v6, SUM(v7) AS v7 ");
		 sql.append("FROM v_machine_performance_total"); */




		 sql.append("SELECT 1 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '1' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		 sql.append("UNION ALL ");

		 sql.append("SELECT 2 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '2' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		 sql.append("UNION ALL ");

		 sql.append("SELECT 3 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '3' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		 sql.append("UNION ALL ");

		 sql.append("SELECT 4 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '4' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		 sql.append("UNION ALL ");

		 sql.append("SELECT 5 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '5' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		 sql.append("UNION ALL ");

		 sql.append("SELECT 6 AS hogi, IFNULL(SUM(lot_weight), 0) AS weight, IFNULL(COUNT(idx), 0) AS lot_count, IFNULL(STR_TO_DATE(MIN(datetiem1), '%Y%m%d%H%i%s'), '1970-01-01 00:00:00') AS sdate, IFNULL(MAX(check_time), '1970-01-01 00:00:00') AS edate ");
		 sql.append("FROM ( ");
		 sql.append("    SELECT main.*, MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		 sql.append("    FROM ( ");
		 sql.append("        SELECT t.*, @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group, @prev_gubun := gubun ");
		 sql.append("        FROM tb_tong_log t ");
		 sql.append("        CROSS JOIN (SELECT @group_num := 0, @prev_gubun := '', @prev_lot_group := NULL) AS init ");
		 sql.append("        WHERE hogi = '6' ");
		 sql.append("        AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '" + sdate + " 07:00:00' AND '" + sdate + " 12:00:00' ");
		 sql.append("    ) AS main ");
		 sql.append(") AS sub ");
		 sql.append("WHERE STR_TO_DATE(IFNULL(sub.first_datetiem1_in_group, '1970-01-01 00:00:00'), '%Y-%m-%d %H:%i:%s') BETWEEN '" + sdate + " 08:00:00' AND '" + sdate + " " + etime + "' ");

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
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
			
			mapObj.put("hogi",rs.getString("hogi"));
			mapObj.put("v1",rs.getInt("weight")*0.01);
			mapObj.put("v6",rs.getString("lot_count"));
			mapObj.put("sdate",rs.getString("sdate"));
			mapObj.put("edate",rs.getString("edate"));
			mapArray.add(mapObj);
			
		}
		sql2.append("SELECT 1 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay1");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '1' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 2 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay2");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '2' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 3 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay3");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '3' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 4 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay4");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '4' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 5 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay5");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '5' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" ) AS union_result");
		sql2.append(" WHERE union_result.value != 1");
		sql2.append(" UNION ");

		sql2.append("SELECT 6 AS hogi,");
		sql2.append(" SUM(time_difference_seconds) AS total_time_difference");
		sql2.append(" FROM (");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, time_difference_seconds, VALUE, NULL AS value_detail");
		sql2.append(" FROM v_auto_delay6");
		sql2.append(" WHERE tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
		sql2.append(" UNION");
		sql2.append(" SELECT idx, hogi, tdatetime, prev_tdatetime, COMMENT, UNIX_TIMESTAMP(prev_tdatetime) - UNIX_TIMESTAMP(tdatetime) AS time_difference_seconds, VALUE, value_detail");
		sql2.append(" FROM tb_delay_manual");
		sql2.append(" WHERE hogi = '6' AND tdatetime >= '").append(delaySdate).append("' AND tdatetime <= '").append(delayEdate).append("'");
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
