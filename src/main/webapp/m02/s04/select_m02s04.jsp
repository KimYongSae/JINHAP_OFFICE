<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	whereSql.append(" WHERE year1 = "+year+" AND month1 = "+month );
	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append("SELECT ");
	sql.append("COALESCE(year1, 0) AS year, ");
	sql.append("COALESCE(month1, 0) AS month, ");
	sql.append("COALESCE(hogi, 0) AS hogi, ");
	sql.append("COALESCE(dongjeomdo, '') AS kv, ");
	sql.append("COALESCE(moisture_content, '') AS mc, ");
	sql.append("COALESCE(max_cooling_rate, '') AS mcr, ");
	sql.append("COALESCE(jeonsanga, '') AS tan, ");
	sql.append("COALESCE(ivf, '') AS ivf, ");
	sql.append("COALESCE(bigo, '') AS bigo ");
	sql.append(" FROM tb_oil ");
	sql.append(whereSql.toString());
	sql.append(" ORDER BY hogi ");

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
					rowObj.put("year",rs.getInt("year"));
					rowObj.put("month",rs.getInt("month"));
					rowObj.put("hogi",rs.getInt("hogi"));
					rowObj.put("kv",rs.getString("kv"));
					rowObj.put("mc",rs.getString("mc"));
					rowObj.put("mcr",rs.getString("mcr"));
					rowObj.put("tan",rs.getString("tan"));
					rowObj.put("ivf",rs.getString("ivf"));
					rowObj.put("bigo",rs.getString("bigo"));
	
					
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
