<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String b_line = request.getParameter("b_line");
	//String b_name = request.getParameter("b_name");
	
		
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	
	
	if (sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)) {
		whereSql.append(" AND tbd.bd_date BETWEEN '" + sdate + "' AND '" + edate + "'");
	}

	if (b_line != null && !"".equals(b_line)) {
		whereSql.append(" AND tb.b_hogi = '" + b_line + "'");
	}
	
	sql.append("SELECT DISTINCT tb.b_name ");
	sql.append("FROM tb_bupum tb ");
	sql.append("INNER JOIN tb_bupum_detail tbd ON tb.b_code = tbd.b_code ");
	sql.append("WHERE 1=1 AND tbd.yn ='Y' ");
	sql.append(whereSql.toString());
	     
//	System.out.println(sql.toString());
	Statement stmt = null;
	ResultSet rs = null;
	try {  
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();  
		   
		while(rs.next()){		    	   
			JSONObject rowObj = new JSONObject();
	    	
			rowObj.put("b_name", rs.getString("b_name"));
	        
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("rows", rowsArray);
		mainObj.put("sql", sql.toString());
		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		out.print(mainObj);
		out.flush();
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
		
%>
