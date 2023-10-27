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

	int u_cnt = Integer.parseInt(request.getParameter("u_cnt"));
	String u_id = request.getParameter("u_id");
	String u_name = request.getParameter("u_name");
	String u_pw = request.getParameter("u_pw");
	String u_pw2 = request.getParameter("u_pw2");
	String u_phone = request.getParameter("u_phone");
	
	CallableStatement cstmt = null;
	JSONObject mainObj = new JSONObject(); 
	
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		
		
		cstmt = conn.prepareCall("{call sp_user_web_set(?,?,?,?,?,?)}");
		cstmt.setInt(1,u_cnt);
		cstmt.setString(2,u_id);
		cstmt.setString(3,u_name);
		cstmt.setString(4,u_pw);
		cstmt.setString(5,u_pw2);
		cstmt.setString(6,u_phone);
		
		cstmt.executeUpdate();
		
		conn.commit();
		
		
/*		
	  	StringBuffer sql = new StringBuffer();
	  	
	  	sql.append("select u_id, u_pw, u_name, u_level, u_group from tb_user where u_id = '"+u_id+"'");

		rs = stmt.executeQuery(sql.toString());
		
		while (rs.next()) {
			
			String userPWD = rs.getString("u_pw");
			String userName = rs.getString("u_name");
			String userLevel = rs.getString("u_level");
			String userGroup = rs.getString("u_group");
			String userId = rs.getString("u_id");
			
			session.setAttribute("sname", userName);
			session.setAttribute("slevel", userLevel);		
			session.setAttribute("sgroup", userGroup);
			session.setAttribute("sid",userId);
			session.setMaxInactiveInterval(-1);	
		}
*/

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		out.print(mainObj);
		out.flush();
		if(cstmt != null) try {cstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>