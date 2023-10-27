<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	
	StringBuffer s_sql = new StringBuffer();
	int chk = 0;

	CallableStatement cstmt = null;
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{
		cstmt = conn.prepareCall("{call sp_temperature_qun_set(?) }");
		cstmt.setString(1,tdate);
		
		cstmt.executeUpdate();
		
		conn.commit();	

		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(cstmt != null) try {cstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>