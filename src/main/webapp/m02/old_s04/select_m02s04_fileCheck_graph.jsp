<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String year = request.getParameter("year");
	String hogi = request.getParameter("hogi");
	String bungi = request.getParameter("bungi");
	
	StringBuffer s_sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		
		s_sql.append("select file_graph"+hogi+" AS filename ");
		s_sql.append("from tb_heatoil_file ");
		s_sql.append("where year1 = '"+year+"' AND bungi = '"+bungi+"분기' ");



		JSONArray mainArray = new JSONArray();
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst();  		
		
		mainObj.put("total", String.valueOf(rowCount));
		mainObj.put("status", String.valueOf("ok"));		
		
		while(rs.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("filename",rs.getString("filename"));
			
			
			mainArray.add(rowObj);
		}
		
		mainObj.put("rows",mainArray);
		
		
		conn.commit();	
		
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