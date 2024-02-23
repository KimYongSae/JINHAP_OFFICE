<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

	
	String b_hogi = request.getParameter("b_hogi");
	String b_zone = request.getParameter("b_zone");
	

	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	
	if(b_hogi != null && !"".equals(b_hogi)){
		whereSql.append(" AND b_hogi = '"+b_hogi+"' ");
	}
	if(b_zone != null && !"".equals(b_zone)){
		whereSql.append(" AND b_loc = '"+b_zone+"' ");
	}
	
	sql.append("SELECT * ");
	sql.append("FROM tb_bupum ");
	sql.append("WHERE 1=1 ");
	sql.append("AND yn = 'Y' ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY regtime DESC LIMIT 20 ");


	   //System.out.println("SQL query: " + sql.toString());
	
	
	Statement stmt = null;
	ResultSet rs = null;
	try {  
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();  
		   
		while(rs.next()){		    	   
			JSONObject rowObj = new JSONObject();
	    	
			rowObj.put("b_code", rs.getString("b_code"));
			rowObj.put("b_hogi", rs.getString("b_hogi"));
			rowObj.put("b_name", rs.getString("b_name"));
			rowObj.put("b_detail", rs.getString("b_detail"));
			rowObj.put("b_loc", rs.getString("b_loc"));
	        
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("data", rowsArray);  
		mainObj.put("last_page", 1);  
		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		out.print(mainObj);
		out.flush();
	}
		
%>
