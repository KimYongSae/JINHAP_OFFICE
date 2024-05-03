<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String cnt = request.getParameter("cnt");
	    
		StringBuilder sql = new StringBuilder();
		
		PreparedStatement pstmt = null;  
		
		sql.append("DELETE FROM tb_spare WHERE cnt = ?");

	    
		System.out.println(sql);
		
	    try { 
	    	
	    	pstmt = conn.prepareStatement(sql.toString());
	    	pstmt.setString(1, cnt);
 			pstmt.executeUpdate();
	        
	        conn.commit();
	     }	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		//out.flush();
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>
