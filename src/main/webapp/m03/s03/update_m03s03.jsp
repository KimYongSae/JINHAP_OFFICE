<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int hogi = Integer.parseInt(request.getParameter("hogi"));
	String day = "day"+request.getParameter("day");
	String zone = request.getParameter("zone");
	String category = request.getParameter("category");
	String value = request.getParameter("value");
	String gubun = request.getParameter("gubun");
	
	String whereSql = "";
	switch(gubun){
	case "1":
		whereSql = "tb_fproof";
		break;
	case "2":
		whereSql = "tb_sat";
		break;
	}
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
	
		u_sql.append("UPDATE "+whereSql+" SET "+day+" = ? WHERE year1 = ? AND month1 = ? AND hogi = ? AND zone = ? AND category = ?");
		System.out.println(u_sql.toString());
		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.setString(1, value);
		pstmt.setInt(2, year);
		pstmt.setInt(3, month);
		pstmt.setInt(4, hogi);
		pstmt.setString(5, zone);
		pstmt.setString(6, category);
		
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