<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String sspecial = request.getParameter("sspecial");
	String year1 = request.getParameter("year1");
	
	String[] idArray = id.split("_");
	
	String hogi = idArray[0];
	String zone = idArray[1];
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	
	Statement stmt = null;
	ResultSet rs = null;
		
	try
	{
		
		u_sql.append("UPDATE tb_temperature_qun SET special = '"+sspecial+"' ");
		u_sql.append("WHERE hogi = '"+hogi+"' AND year1 = '"+year1+"' ");
		
		
		
//		System.out.println(u_sql.toString());
		
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