<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String wdate = request.getParameter("wdate");
	String hogi = request.getParameter("hogi");
	String lotno = request.getParameter("lotno");
	String pno = request.getParameter("pno");
	String pname = request.getParameter("pname");
	String spec = request.getParameter("spec");
	String qty = request.getParameter("qty");
	String weight = request.getParameter("weight");
	String bigo = request.getParameter("bigo");
	
	StringBuffer u_sql = new StringBuffer();

	CallableStatement cstmt = null;
	
	try
	{
		cstmt = conn.prepareCall("{call sp_lotlist_set(?,?,?,?,?,?,?,?,?) }");
		cstmt.setString(1,wdate);
		cstmt.setString(2,hogi);
		cstmt.setString(3,lotno);
		cstmt.setString(4,pno);
		cstmt.setString(5,pname);
		cstmt.setString(6,spec);
		cstmt.setString(7,qty);
		cstmt.setString(8,weight);
		cstmt.setString(9,bigo);
		
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