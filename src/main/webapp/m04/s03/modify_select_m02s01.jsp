<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		int hogi = Integer.parseInt(request.getParameter("hogi"));
		String pnum = request.getParameter("pnum");
		String gang = request.getParameter("gang");
		String t_gb = request.getParameter("t_gb");

		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer whereSql = new StringBuffer();

		 whereSql.append("WHERE pnum = '"+pnum+"' AND gang = '"+gang+"' AND t_gb = '"+t_gb+"' ");
		 


		 sql.append("(SELECT * FROM tb_recipe_auto1 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1) ");
		 sql.append("UNION ");
		 sql.append("(SELECT * FROM tb_recipe_auto2 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1) ");
		 sql.append("UNION ");
		 sql.append("(SELECT * FROM tb_recipe_auto3 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1) ");
		 sql.append("UNION ");
		 sql.append("(SELECT * FROM tb_recipe_auto4 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1) ");
		 sql.append("UNION ");
		 sql.append("(SELECT * FROM tb_recipe_auto5 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1) ");
		 sql.append("UNION ");
		 sql.append("(SELECT * FROM tb_recipe_auto6 ");
		 sql.append(whereSql.toString());
		 sql.append("LIMIT 1);");

		 
		 
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
				
	            rowObj.put("hogi", rs.getString("hogi"));
				/* rowObj.put("pnum",rs.getString("pnum"));
				rowObj.put("pname",rs.getString("pname"));
				rowObj.put("gang",rs.getString("gang"));
				rowObj.put("t_gb",rs.getString("t_gb"));
				rowObj.put("lot",rs.getString("lot")); */
				rowObj.put("q_temp_jin",rs.getString("q_temp_jin"));
				rowObj.put("t_temp_jin",rs.getString("t_temp_jin"));
				rowObj.put("cp_jin",rs.getString("cp_jin"));
				rowObj.put("q_temp_ez",rs.getString("q_temp_ez"));
				rowObj.put("t_temp_ez",rs.getString("t_temp_ez"));
				rowObj.put("cp_ez",rs.getString("cp_ez"));
				rowObj.put("weight",rs.getString("weight"));
				rowObj.put("hardness",rs.getString("hardness"));
				
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
