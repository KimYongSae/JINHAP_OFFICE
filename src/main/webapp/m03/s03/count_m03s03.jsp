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
	String hogi = request.getParameter("hogi");
	int gb = Integer.parseInt(request.getParameter("gb"));
	
	StringBuffer s_sql = new StringBuffer();
	
	CallableStatement cstmt = null;
	
	try
	{
		if(gb == 1){
			cstmt = conn.prepareCall("{call sp_fproof_set(?,?,?) }");
		} else{
			cstmt = conn.prepareCall("{call sp_sat_set(?,?,?) }");
		}
		cstmt.setInt(1,Integer.parseInt(year));
		cstmt.setInt(2,Integer.parseInt(month));
		cstmt.setInt(3,Integer.parseInt(hogi));
		
		cstmt.executeUpdate();
		
		conn.commit();	

		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(cstmt != null) try {cstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>