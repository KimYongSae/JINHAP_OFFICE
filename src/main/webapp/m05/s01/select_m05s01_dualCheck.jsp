<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	
	String id = request.getParameter("id");
	String phone = request.getParameter("phone");
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	 	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append("SELECT count(*) as id_cnt ");
	sql.append("FROM tb_user ");
	sql.append("WHERE u_id = '"+id+"' and yn='Y' ");

	sql2.append("SELECT count(*) as phone_cnt ");
	sql2.append("FROM tb_user ");
	sql2.append("WHERE u_phone = '"+phone+"' and yn='Y' ");		 

	Statement stmt2 = null;
	ResultSet rs2 = null;
	
	Statement stmt = null;
	ResultSet rs = null;
		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());

		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		JSONObject rowObj = new JSONObject();
					rowObj.put("id_cnt",rs.getInt("id_cnt"));
		    		 
					mainArray.add(rowObj);
						
		    	 }
		    	 
		    	 stmt2 = conn.createStatement();
		    	 rs2 = stmt2.executeQuery(sql2.toString());		    	 
				
		    	 while(rs2.next()){
		    		 JSONObject rowObj2 = new JSONObject();
		    		 rowObj2.put("phone_cnt",rs2.getInt("phone_cnt"));
		    		 
		    		 mainArray.add(rowObj2);
		    	 }
		    	 
		       
		       mainObj.put("status", String.valueOf("ok"));			       
		       mainObj.put("rows",mainArray);
//		       System.out.println(mainObj.get("rows"));
		       
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
				if(stmt2 != null) try {stmt2.close();}catch(SQLException sqle){}
				if(rs2 != null) try {rs2.close();}catch(SQLException sqle){}				
				if(conn != null) try {conn.close();}catch(SQLException sqle){}		
			}
			/*
				//유니크 값이 없을 경우
				out.print(mainObj);
				out.flush();
			*/
%>
