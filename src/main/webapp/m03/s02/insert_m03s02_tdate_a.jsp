<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int gb = Integer.parseInt(request.getParameter("gb"));
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{

		if(gb == 1){
			u_sql.append("UPDATE tb_tus_file SET tdate_t_act = '"+tdate+"' ");	
		}else{
			u_sql.append("UPDATE tb_tus_file SET tdate_b_act = '"+tdate+"' ");
		}
		
		
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