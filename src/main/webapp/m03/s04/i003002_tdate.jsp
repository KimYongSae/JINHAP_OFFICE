<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	try
	{
			u_sql.append("UPDATE tb_ppk SET date1 = '"+tdate+"' ");
			u_sql.append("WHERE cnt = "+cnt+" ");
		

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