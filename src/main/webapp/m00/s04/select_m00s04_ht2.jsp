<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	sql.append("SELECT * ");
	sql.append("FROM tb_temp2_now ");
	sql.append("ORDER BY datetime1 DESC ");
	sql.append("LIMIT 1 ");
	     
	
	Statement stmt = null;
	ResultSet rs = null;
	try {  
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();  
		   
		JSONObject rowObj = new JSONObject();
		while(rs.next()){

			rowObj.put("q1_pv", rs.getString("q1_pv"));
			rowObj.put("q2_pv", rs.getString("q2_pv"));
			rowObj.put("q3_pv", rs.getString("q3_pv"));
			rowObj.put("q4_pv", rs.getString("q4_pv"));
			rowObj.put("q5_pv", rs.getString("q5_pv"));
			
			rowObj.put("oil_pv", rs.getString("oil_pv"));
			
			rowObj.put("t1_pv", rs.getString("t1_pv"));
			rowObj.put("t2_pv", rs.getString("t2_pv"));
			rowObj.put("t3_pv", rs.getString("t3_pv"));
			rowObj.put("t4_pv", rs.getString("t4_pv"));
			
			rowObj.put("a_pv", rs.getString("a_pv"));
			rowObj.put("cp_pv", rs.getInt("cp_pv")*0.001);

			rowObj.put("q1_sp", rs.getInt("q1_sp")*0.1);
			rowObj.put("q2_sp", rs.getInt("q2_sp")*0.1);
			rowObj.put("q3_sp", rs.getInt("q3_sp")*0.1);
			rowObj.put("q4_sp", rs.getInt("q4_sp")*0.1);
			rowObj.put("q5_sp", rs.getInt("q5_sp")*0.1);
			
			rowObj.put("oil_sp", rs.getInt("oil_sp")*0.1);
			
			rowObj.put("t1_sp", rs.getInt("t1_sp")*0.1);
			rowObj.put("t2_sp", rs.getInt("t2_sp")*0.1);
			rowObj.put("t3_sp", rs.getInt("t3_sp")*0.1);
			rowObj.put("t4_sp", rs.getInt("t4_sp")*0.1);
			
			rowObj.put("a_sp", rs.getInt("a_sp")*0.1);
			rowObj.put("cp_sp", rs.getInt("cp_sp")*0.001);
	        
		}
		    	
		mainObj.put("rows", rowObj);
		
		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		out.print(mainObj);
		out.flush();
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
		
%>
