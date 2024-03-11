<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.io.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	StringBuffer s_sql = new StringBuffer();
	
	Statement stmt = null;
	ResultSet rs = null;
	FileInputStream fis = null;
	OutputStream os = null;
	try
	{
		
		s_sql.append("select filename ");
		s_sql.append("from tb_auth_file ");
		s_sql.append("where cnt = "+cnt+" ");
		


		JSONArray mainArray = new JSONArray();
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());

		String fileName = "";
		if(rs.next()){
			fileName = rs.getString("filename");
		}
		String filePath = "D:/file/m05s02/"+fileName;
		
		File file = new File(filePath);
		
		fis = new FileInputStream(file);
		os = response.getOutputStream();
		
		byte[] buffer = new byte[1024];
		int bytesRead;
		while ((bytesRead = fis.read(buffer)) != -1){
			os.write(buffer, 0, bytesRead);
		}
		fis.close();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		//out.flush();		
		if(fis != null) try{fis.close();} catch(IOException ioe){}
		if(os != null) try{os.close();} catch(IOException ioe){}
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>