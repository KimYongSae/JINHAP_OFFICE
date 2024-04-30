<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	StringBuffer u_sql = new StringBuffer();
	StringBuffer s_sql = new StringBuffer();
	
	PreparedStatement pstmt = null;
	
	String fileName = "";
	String realPath = request.getRealPath("/")+"upload";
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{
		
		s_sql.append("SELECT filename ");
		s_sql.append("FROM tb_o2sensor ");
		s_sql.append("WHERE cnt = "+cnt+" ");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		while(rs.next()){
			fileName = rs.getString("filename");
		}
		
		File file = new File(realPath+"/"+fileName);
		
		if(file.exists()){
			file.delete();
		}
		
		u_sql.append("update tb_o2sensor set filename = '', file_yn = 'N' ");
		u_sql.append("where cnt = "+cnt+" ");
		
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