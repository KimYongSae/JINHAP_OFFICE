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
	JSONObject rowObj = new JSONObject();	
	
	sql.append("SELECT * ");
	sql.append("FROM v_bupum_detail_code ");

	
	
	Statement stmt = null;
	ResultSet rs = null;
	try {  
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	
		while(rs.next()){	    	
			rowObj.put("bd_code", rs.getString("b_code"));
		}
		
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		out.print(rowObj);
		out.flush();
	}
		
%>
