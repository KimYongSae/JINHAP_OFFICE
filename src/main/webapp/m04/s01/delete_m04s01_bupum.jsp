<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

	
	String b_code = request.getParameter("b_code");


	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	
	sql.append("UPDATE tb_bupum ");
	sql.append("SET yn = 'N' ");
	sql.append("WHERE b_code = ? ");
	
	sql2.append("UPDATE tb_bupum_detail ");
	sql2.append("SET yn = 'N' ");
	sql2.append("WHERE b_code = ? ");
	
           
	 System.out.println("SQL query: " + sql.toString());
	 System.out.println(b_code);
	
	 PreparedStatement pstmt = null;
	 PreparedStatement pstmt2 = null;

	    try {
	        pstmt = conn.prepareStatement(sql.toString());
	        pstmt2 = conn.prepareStatement(sql2.toString());
	        
	        pstmt.setString(1, b_code);
	        pstmt.executeUpdate();
	        
	        pstmt2.setString(1, b_code);
	        pstmt2.executeUpdate();
		
	        conn.commit();
	        JSONObject mainObj = new JSONObject();  
	        mainObj.put("status", "ok");
	        out.print(mainObj);
	    } catch (SQLException e) {
	        JSONObject mainObj = new JSONObject();  
	        mainObj.put("status", "error");
	        out.print(mainObj);
	        
	        e.printStackTrace();
	    } finally {
	        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	    }
	%>
