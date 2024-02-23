<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
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
/* 		sql.append("select machine, v1, v2, v3, v4, v5, v6, v7 ");
		sql.append("FROM v_machine_performance_total ");
		sql.append("UNION ALL ");
		sql.append("SELECT '합계' AS machine, ");
		sql.append("SUM(v1) AS v1, SUM(v2) AS v2, ");
		sql.append("ROUND((SUM(v2)/SUM(total_proc))*100,1) AS v3, ");
		sql.append("ROUND((SUM(v1)/SUM(total_proc))*100,1) AS v4, ");
		sql.append("ROUND((SUM(lot_weight)/SUM(lot_total_weight))*100,1) AS v5, ");
		sql.append("SUM(v6) AS v6, SUM(v7) AS v7 ");
		sql.append("FROM v_machine_performance_total "); */

		sql.append("WITH machine_list AS ( ");
		 sql.append("  SELECT 'Q01-HN01' AS machine ");
		 sql.append("  UNION ALL SELECT 'Q01-HN02' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN03' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN04' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN05' ");
		 sql.append("  UNION ALL SELECT 'Q01-HN06' ");
		 sql.append(") ");
		 sql.append("SELECT ");
		 sql.append("  ml.machine, ");
		 sql.append("  COALESCE(SUM(v1), 0) AS v1, ");
		 sql.append("  COALESCE(SUM(v2), 0) AS v2, ");
		 sql.append("  ROUND(COALESCE(SUM(v2), 0) / COALESCE(SUM(total_proc), 1) * 100, 1) AS v3, ");
		 sql.append("  ROUND(COALESCE(SUM(v1), 0) / COALESCE(SUM(total_proc), 1) * 100, 1) AS v4, ");
		 sql.append("  ROUND(COALESCE(SUM(lot_weight), 0) / COALESCE(SUM(lot_total_weight), 1) * 100, 1) AS v5, ");
		 sql.append("  COALESCE(SUM(v6), 0) AS v6, ");
		 sql.append("  COALESCE(SUM(v7), 0) AS v7 ");
		 sql.append("FROM machine_list ml ");
		 sql.append("LEFT JOIN v_machine_performance_total vmp ON ml.machine = vmp.machine ");
		 sql.append("GROUP BY ml.machine ");
		 sql.append("UNION ALL ");
		 sql.append("SELECT ");
		 sql.append("  '합계' AS machine, ");
		 sql.append("  SUM(v1) AS v1, ");
		 sql.append("  SUM(v2) AS v2, ");
		 sql.append("  ROUND((SUM(v2) / SUM(total_proc)) * 100, 1) AS v3, ");
		 sql.append("  ROUND((SUM(v1) / SUM(total_proc)) * 100, 1) AS v4, ");
		 sql.append("  ROUND((SUM(lot_weight) / SUM(lot_total_weight)) * 100, 1) AS v5, ");
		 sql.append("  SUM(v6) AS v6, ");
		 sql.append("  SUM(v7) AS v7 ");
		 sql.append("FROM v_machine_performance_total");

		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("machine",rs.getString("machine"));
			mapObj.put("v1",rs.getString("v1"));
			mapObj.put("v2",rs.getString("v2"));
			mapObj.put("v3",rs.getString("v3"));
			mapObj.put("v4",rs.getString("v4"));
			mapObj.put("v5",rs.getString("v5"));
			mapObj.put("v6",rs.getString("v6"));
			mapObj.put("v7",rs.getString("v7"));
			mapArray.add(mapObj);
			
		}
		
	
		
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
		       
		       
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
