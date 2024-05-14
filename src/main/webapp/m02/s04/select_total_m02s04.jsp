<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int lastYear = year-1;
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	
	JSONObject mainObj = new JSONObject();  

	sql.append("SELECT ");
	sql.append("COALESCE(year1, 0) AS year1, ");
	sql.append("COALESCE(month1, 0) AS month1, ");
	sql.append("COALESCE(hogi, 0) AS hogi, ");
	sql.append("COALESCE(dongjeomdo, '') AS kinematic_viscosity, ");
	sql.append("COALESCE(moisture_content, '') AS moisture_content, ");
	sql.append("COALESCE(max_cooling_rate, '') AS max_cooling_rate, ");
	sql.append("COALESCE(jeonsanga, '') AS total_acid_number, ");
	sql.append("COALESCE(ivf, '') AS ivf, ");
	sql.append("COALESCE(bigo, '') AS bigo ");
	sql.append(" FROM tb_oil ");
	sql.append(" WHERE (year1 = " +  lastYear  + " AND month1 > "+month+") OR (year1 = "+year+" AND month1 <= "+month+") ");
	sql.append(" order by year1 desc,  month1 desc, hogi asc ");

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
		 			String year1 =  rs.getString("year1");
		 			String month1 =  rs.getString("month1");
		 			String hogi =  rs.getString("hogi");
		 			
		 			String kv = year1+"-"+month1+"-"+hogi+"-"+"kv";
		 			String mc = year1+"-"+month1+"-"+hogi+"-"+"mc";
		 			String mcr = year1+"-"+month1+"-"+hogi+"-"+"mcr";
		 			String tan = year1+"-"+month1+"-"+hogi+"-"+"tan";
		 			
		 			
					rowObj.put(kv,rs.getString("kinematic_viscosity"));
					rowObj.put(mc,rs.getString("moisture_content"));
					rowObj.put(mcr,rs.getString("max_cooling_rate"));
					rowObj.put(tan,rs.getString("total_acid_number"));
		 			
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
