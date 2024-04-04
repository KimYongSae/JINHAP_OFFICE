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
	    
		StringBuilder sql = new StringBuilder();
		
		PreparedStatement pstmt = null;  

		String hogiNum = hogi.substring(hogi.length()-1);
		
		sql.append("DELETE FROM tb_recipe_auto"+hogiNum+" WHERE ");
		sql.append("hogi = '" + hogiNum + "' AND ");
		sql.append("pnum = '" + pnum + "' AND ");
		sql.append("pname = '" + pname + "' AND ");
		sql.append("gang = '" + gang + "' AND ");
		sql.append("t_gb = '" + t_gb + "' AND ");
		sql.append("lot = '" + lot + "' AND ");
		sql.append("q_temp_jin = '" + q_temp_jin + "' AND ");
		sql.append("t_temp_jin = '" + t_temp_jin + "' AND ");
		sql.append("cp_jin = '" + cp_jin + "' AND ");
		sql.append("q_temp_ez = '" + q_temp_ez + "' AND ");
		sql.append("t_temp_ez = '" + t_temp_ez + "' AND ");
		sql.append("cp_ez = '" + cp_ez + "' AND ");
		sql.append("weight = '" + weight + "' AND ");
		sql.append("hardness = '" + hardness + "';");

		Statement stmt = null;
	    
		System.out.println(sql);
		
	    try { 
	    	
	    	stmt = conn.createStatement();
 			stmt.executeUpdate(sql.toString());
	        
	        conn.commit();
	     }	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		//out.flush();
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>
