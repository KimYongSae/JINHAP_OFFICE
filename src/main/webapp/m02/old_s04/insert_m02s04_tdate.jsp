<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	String year = request.getParameter("year");
	String bungi = request.getParameter("bungi");
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		u_sql.append("UPDATE tb_heatoil_file SET tdate = '"+tdate+"' ");
		u_sql.append("WHERE year1 = '"+year+"' AND bungi = '"+bungi+"분기' ");

		

		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.executeUpdate();
		
		
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
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>