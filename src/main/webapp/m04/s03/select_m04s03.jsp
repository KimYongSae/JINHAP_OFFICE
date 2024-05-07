<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		/* int hogi = Integer.parseInt(request.getParameter("hogi"));
		String pnum = request.getParameter("pnum");
		String gang = request.getParameter("gang");
		String t_gb = request.getParameter("t_gb"); */
		StringBuffer sql = new StringBuffer();
		String whereSql = "";

		int seolbi = Integer.parseInt(request.getParameter("seolbi"));
		
		switch(seolbi){
			case 1:
				whereSql = "AND seolbi = '연속로'";
				break;
			case 2:
				whereSql = "AND seolbi = '소입로'";
				break;
			case 3:
				whereSql = "AND seolbi = '배치로'";
				break;
			case 4:
				whereSql = "AND seolbi = '변성로'";
				break;
		}
		
		
		 

		sql.append(" SELECT * FROM tb_spare WHERE 1=1 ");
		sql.append(whereSql);
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 mainObj.put("sql", sql.toString());
		 Statement stmt = null;
		 ResultSet rs = null;
		 
	     try {
	    	 
			stmt = conn.createStatement();
 			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				rowObj.put("cnt",rs.getString("cnt"));
				rowObj.put("seolbi",rs.getString("seolbi"));
				rowObj.put("component_name",rs.getString("component_name"));
				rowObj.put("usage_location",rs.getString("usage_location"));
				rowObj.put("specifications",rs.getString("specifications"));
				rowObj.put("manufacturer",rs.getString("manufacturer"));
				rowObj.put("replacement_frequency",rs.getString("replacement_frequency"));
				rowObj.put("purchase_cycle",rs.getString("purchase_cycle"));
				rowObj.put("current_stock",rs.getString("current_stock"));
				rowObj.put("safety_stock",rs.getString("safety_stock"));
				rowObj.put("shortage_stock",rs.getString("shortage_stock"));
				rowObj.put("unit",rs.getString("unit"));
				rowObj.put("storage_location",rs.getString("storage_location"));
				rowObj.put("rack_number",rs.getString("rack_number"));
				rowObj.put("purchase_request",rs.getString("purchase_request"));
				rowObj.put("remarks",rs.getString("remarks"));
				
				mainArray.add(rowObj);
				
			}
			
			mainObj.put("rows",mainArray);
	       
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
		 
%>
