<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
	
<%
	request.setCharacterEncoding("UTF-8");
	
	JSONObject root = new JSONObject();
	
 	try {
	  
 		session.invalidate();
 		
 		root.put("isSuccess", true);
	
 	} catch (Exception e) {
 		
	 	e.printStackTrace();
		root.put("isSuccess", false);
		
	} finally {
		
		out.print(root);
		out.flush();
		
	}

 %>