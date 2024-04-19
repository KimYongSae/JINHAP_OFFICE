<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String hogi = request.getParameter("hogi");
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	whereSql.append(" WHERE year1 = "+year+" AND month1 = "+month+" AND hogi = "+hogi);
	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append(" SELECT * ");
	sql.append(" FROM tb_fproof ");
	sql.append(whereSql.toString());
	sql.append(" ORDER BY cnt ");

	Statement stmt = null;
	ResultSet rs = null;

		     try {
		    	 
		    	stmt = conn.createStatement();
		    	rs = stmt.executeQuery(sql.toString());
		 		int rowCount = rs.last() ? rs.getRow() : 0;  
				rs.beforeFirst();  		
				
				mainObj.put("total", String.valueOf(rowCount));
				mainObj.put("status", String.valueOf("ok"));		    	 
		 		JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 
		 			JSONObject rowObj = new JSONObject();
					rowObj.put("cnt",rs.getInt("cnt"));
					rowObj.put("year",rs.getString("year1"));
					rowObj.put("month",rs.getString("month1"));
					rowObj.put("hogi",rs.getString("hogi"));
					rowObj.put("zone",rs.getString("zone"));
					rowObj.put("category",rs.getString("category"));
					rowObj.put("memo",rs.getString("memo"));
	
					rowObj.put("day"+day,rs.getString("day"+day));
					
					mainArray.add(rowObj);
		    	 }
		       
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
