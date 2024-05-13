<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

	String result = "";
	StringBuffer sql = new StringBuffer();
	String hogiSql = "";
	JSONObject mainObj = new JSONObject();
	
	int hogi = Integer.parseInt(request.getParameter("hogi"));

	if(hogi != 0	){
		hogiSql = "AND ttl.hogi = '"+hogi+"' ";
	}
	
	sql.append("SELECT * FROM tb_tong_log as ttl ");
	sql.append("LEFT OUTER JOIN ");
	sql.append("(SELECT * ");
	sql.append("FROM tb_recipe_auto1 ");
	sql.append("UNION ALL ");
	sql.append("SELECT * ");
	sql.append("FROM tb_recipe_auto2 ");
	sql.append("UNION ALL ");
	sql.append("SELECT * ");
	sql.append("FROM tb_recipe_auto3 ");
	sql.append("UNION ALL ");
	sql.append("SELECT * ");
	sql.append("FROM tb_recipe_auto4 ");
	sql.append("UNION ALL ");
	sql.append("SELECT * ");
	sql.append("FROM tb_recipe_auto5 ");
	sql.append("UNION ALL ");
	sql.append("SELECT * ");
	sql.append("FROM tb_recipe_auto6) as tra ");
	sql.append("ON ttl.hogi = tra.hogi AND ttl.item_cd = tra.pnum ");
	sql.append("WHERE 1=1 ");
	sql.append(hogiSql);
	sql.append("ORDER BY ttl.datetiem1 DESC ");
	sql.append("LIMIT 20");

	
	
	
	
	Statement stmt = null;
	ResultSet rs = null;

	try {
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();

		while(rs.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("hogi", rs.getString("hogi"));
			rowObj.put("barcode", rs.getString("barcode"));
			rowObj.put("lot", rs.getString("lot"));
			rowObj.put("item_cd", rs.getString("item_cd"));
			rowObj.put("pname", rs.getString("pname"));
			rowObj.put("gang", rs.getString("gang"));
			rowObj.put("cp", rs.getString("cp_jin"));
			rowObj.put("quen", rs.getString("q_temp_jin"));
			rowObj.put("temp", rs.getString("t_temp_jin"));
			rowObj.put("t_gb", rs.getString("t_gb"));
			
			
			
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("rows", rowsArray);  
		mainObj.put("last_page", 1);  

		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		out.print(mainObj);
		out.flush();
	}
		
%>
