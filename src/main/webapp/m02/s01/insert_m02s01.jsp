<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String hogi = request.getParameter("hogi");
		String pnum = request.getParameter("pnum");
		String pname = request.getParameter("pname");
		String gang = request.getParameter("gang");
		String t_gb = request.getParameter("t_gb");
		String lot = request.getParameter("lot");
		String q_temp_jin = request.getParameter("q_temp_jin");
		String t_temp_jin = request.getParameter("t_temp_jin");
		String cp_jin = request.getParameter("cp_jin");
		String q_temp_ez = request.getParameter("q_temp_ez");
		String t_temp_ez = request.getParameter("t_temp_ez");
		String cp_ez = request.getParameter("cp_ez");
		String temp1 = null;
		String temp2 = null;
		String temp3 = null;
		String weight = request.getParameter("weight");
		String hardness = request.getParameter("hardness");
	    	
		PreparedStatement pstmt = null;  
	    String sql = "{call sp_recipe_auto(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	     
	    try {  
	       
	    	pstmt = conn.prepareStatement(sql);
	       
	        pstmt.setString(1, hogi );
	        pstmt.setString(2, pnum );
	        pstmt.setString(3, pname );
	        pstmt.setString(4, gang );
	        pstmt.setString(5, t_gb );
	        pstmt.setString(6, lot );
	        pstmt.setString(7, q_temp_jin );
	        pstmt.setString(8, t_temp_jin );
	        pstmt.setString(9, cp_jin );
	        pstmt.setString(10, q_temp_ez );
	        pstmt.setString(11, t_temp_ez );
	        pstmt.setString(12, cp_ez );
	        pstmt.setString(13, temp1 );
	        pstmt.setString(14, temp2 );
	        pstmt.setString(15, temp3 );
	        pstmt.setString(16, weight );
	        pstmt.setString(17, hardness );
	        
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
