<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector.jsp" %>

<%
	String f = request.getParameter("f");	//파일구분
	String h = request.getParameter("h");	//호기
	String w = request.getParameter("w");	//작업일자 
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	
	JSONObject mainObj = new JSONObject();  
	 //ARG_ROSLT : 0100, ARG_FDATE : 20200422 
	 
	sql.append("SELECT filename ");
	sql.append("FROM tb_report_file ");
	sql.append("WHERE yn='Y' AND RIGHT(filename,10) = '"+f+"'  ");
	sql.append("AND wdate = '"+w+"' AND hogi = '"+h+"' ");

		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());
		    	 String work_flag = "";
		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();
					rowObj.put("filename",rs.getString("filename"));			//파일명
		    		 
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
