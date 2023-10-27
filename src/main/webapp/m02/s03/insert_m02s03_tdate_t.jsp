<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String tdate = request.getParameter("tdate");
	String year1 = request.getParameter("year1");
	
	String[] idArray = id.split("_");
	
	String hogi = idArray[0];
	String zone = idArray[1];
	String column = "";
	if("date".equals(idArray[2])){
		column = "o"+idArray[2];
	}else{
		column = idArray[2];
	}
	
	String c_zone = zone.substring(0,1);
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{
		
		
		u_sql.append("UPDATE tb_temperature_temper SET "+column+" = '"+tdate+"' ");
		u_sql.append("WHERE hogi = '"+hogi+"' AND "+c_zone+"zone = '"+zone+"' AND year1 = '"+year1+"' ");
		
		
		
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