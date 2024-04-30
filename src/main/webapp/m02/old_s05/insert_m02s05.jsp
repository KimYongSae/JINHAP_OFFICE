<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
/*
			"cnt":$("#list_cnt").val(),
			"bdate":$("#i_bdate").val(),
			"ndate":$("#i_ndate").val(),
			"date1":$("#i_date").val(),
			"bigo":$("#i_bigo").val()
*/
	request.setCharacterEncoding("UTF-8");

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	String bdate = request.getParameter("bdate");
	String ndate = request.getParameter("ndate");
	String date1 = request.getParameter("date1");
	String bigo = request.getParameter("bigo");
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		u_sql.append("UPDATE tb_o2sensor SET change_bdate = '"+bdate+"', ");
		u_sql.append("change_ndate = '"+ndate+"', change_date = '"+date1+"', ");
		u_sql.append("bigo1 = '"+bigo+"' ");
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