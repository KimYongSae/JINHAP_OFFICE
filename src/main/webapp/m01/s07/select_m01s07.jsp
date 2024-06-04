<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

	String hogi = request.getParameter("hogi");
	
	String hogiSql = "";
	switch(hogi){
		case "1-2" :
			hogiSql = "    (hogi = '1' or hogi = '2') ";
			break;
		case "3-4" :
			hogiSql = "    (hogi = '3' or hogi = '4') ";
			break;
		case "5-6" :
			hogiSql = "    (hogi = '5' or hogi = '6') ";
			break;
	}


	String result = "";
	StringBuffer sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	Statement stmt = null;
	ResultSet rs = null;

	sql.append(" SELECT ");
	sql.append("    hogi, lot, item_cd, ");
	sql.append("    STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') AS stime ");
	sql.append(" FROM ");
	sql.append("    tb_tong_log ");
	sql.append(" WHERE ");
	sql.append(hogiSql);
	sql.append("    AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN DATE_SUB(NOW(), INTERVAL '3:30' HOUR_MINUTE) AND NOW() ");
	sql.append(" ORDER BY ");
	sql.append("   hogi, datetiem1 DESC;");

	
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql.toString());
	
	

	try {
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();

		while(rs.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("hogi", rs.getString("hogi"));
			rowObj.put("item_cd", rs.getString("item_cd"));
			String stime = rs.getString("stime");
			
			rowObj.put("stime", stime.substring(0, stime.length()-2));
			rowObj.put("lot", rs.getString("lot"));
			
			
			
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("rows", rowsArray);  
		mainObj.put("last_page", 1);  

		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		out.print(mainObj);
		out.flush();
	}
		
%>
