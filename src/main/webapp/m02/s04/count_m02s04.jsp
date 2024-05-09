<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String year = request.getParameter("year");
	
	StringBuffer s_sql = new StringBuffer();
	
	CallableStatement cstmt = null;
	
	try
	{
		cstmt = conn.prepareCall("{call sp_oil_set(?) }");
		cstmt.setInt(1,Integer.parseInt(year));
		
		cstmt.executeUpdate();
		
		conn.commit();	

		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(cstmt != null) try {cstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>