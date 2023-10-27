<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append("SELECT cnt, u_name, u_id, u_pw, u_pw2, u_phone, yn ");
	sql.append("FROM tb_user ");
	sql.append("WHERE yn = 'Y' ");
	sql.append("ORDER BY cnt ");

	Statement stmt = null;
	ResultSet rs = null;		 

		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());

		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();
					rowObj.put("cnt",rs.getInt("cnt"));
					rowObj.put("u_name",rs.getString("u_name"));
					rowObj.put("u_id",rs.getString("u_id"));
					rowObj.put("u_pw_login",rs.getString("u_pw"));
					rowObj.put("u_pw_sign",rs.getString("u_pw2"));
					rowObj.put("u_phone",rs.getString("u_phone"));
					
					rowObj.put("yn",rs.getString("yn"));
					
		    		 
					mainArray.add(rowObj);
						
		    	 }
		    	 
				
		       
		       mainObj.put("status", String.valueOf("ok"));			       
		       mainObj.put("rows",mainArray);
		       
		       
		       result = mainObj.toJSONString();
		       conn.commit();
		     }	
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				out.print(mainObj);
				out.flush();
				if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
				if(rs != null) try {rs.close();}catch(SQLException sqle){}
				if(conn != null) try {conn.close();}catch(SQLException sqle){}		
			}
			/*
				//유니크 값이 없을 경우
				out.print(mainObj);
				out.flush();
			*/
%>
