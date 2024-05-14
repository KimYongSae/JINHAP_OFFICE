<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String id = request.getParameter("id");
	String value = request.getParameter("value");
	
	String columnSql = "";
	String[] idArr = id.split("_");
	
	switch(idArr[0]){
	case "kv":
		columnSql = "dongjeomdo";
		break;
	case "mc":
		columnSql = "moisture_content";
		break;
	case "mcr":
		columnSql = "max_cooling_rate";
		break;
	case "tan":
		columnSql = "jeonsanga";
		break;
	case "ivf":
		columnSql = "ivf";
		break;
	}
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
	
		u_sql.append("UPDATE tb_oil SET " + columnSql + " = ? WHERE year1 = ? AND month1 = ? AND hogi = ? ");
		System.out.println(u_sql.toString());
		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.setString(1, value);
		pstmt.setString(2, year);
		pstmt.setString(3, month);
		pstmt.setString(4, idArr[1]);
		
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