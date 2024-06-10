<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String filename = request.getParameter("filename");
	
	StringBuffer u_sql = new StringBuffer();
	
	PreparedStatement pstmt = null;
	
	String fileName = "";
	try
	{
		
		u_sql.append("update tb_lot_report set filename = '', yn = 'N' ");
		u_sql.append("where filename = '"+filename+"' ");
		
		System.out.println(u_sql.toString());
		
		
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
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>