<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 
<%@ page import="javax.activation.*"%> 
<%@ page import="javax.mail.*"%> 
<%@ page import="javax.mail.internet.*"%> 
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.util.Date"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cnt = request.getParameter("cnt");
	
	PreparedStatement pstmt = null;
	
	StringBuffer u_sql = new StringBuffer();
	
//	System.out.println(cnt);
	
	
	JSONObject mainObj = new JSONObject(); 
	
	try
	{
		u_sql.append("UPDATE tb_user SET yn = 'N' ");
		u_sql.append("WHERE cnt in ("+cnt+") ");
		System.out.print(u_sql);
		
		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.executeUpdate();
		
		
		conn.commit();
		mainObj.put("status", "success");

	}
	catch(Exception e)
	{
		response.setStatus(500);
		mainObj.put("status", "error");
	    mainObj.put("message", e.getMessage());
		e.printStackTrace();
	}
	finally
	{
		out.print(mainObj);
		out.flush();
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>