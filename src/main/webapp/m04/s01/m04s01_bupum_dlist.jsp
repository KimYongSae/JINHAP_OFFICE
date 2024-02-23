<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

	
	String sdate = request.getParameter("s_sdate");
	String edate = request.getParameter("s_edate");
	String b_hogi = request.getParameter("bd_hogi");
	String b_name = request.getParameter("b_name");


	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	if (sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)) {
		whereSql.append(" AND tbd.bd_date BETWEEN '" + sdate + "' AND '" + edate + "'" );
	}if (b_hogi != null && !"".equals(b_hogi)) {
		whereSql.append(" AND tb.b_hogi = '" + b_hogi + "'" );
	}if (b_name != null && !"".equals(b_name)) {
		whereSql.append(" AND tb.b_name = '" + b_name + "'" );
    }
	
	sql.append("SELECT tb.b_name, tb.b_hogi,tb.b_loc, tbd.bd_date, tbd.bd_type, tbd.bd_memo, tb.b_code, tbd.bd_code ");
	sql.append( "FROM tb_bupum tb ");
	sql.append("INNER JOIN tb_bupum_detail tbd ON tb.b_code = tbd.b_code ");
	sql.append("WHERE 1=1 ");
	sql.append("AND tb.yn = 'Y' ");
	sql.append("AND tbd.yn = 'Y' ");
	sql.append(whereSql.toString());
	
	
           
	   //System.out.println("SQL query: " + sql.toString());
	
	
	Statement stmt = null;
	ResultSet rs = null;
	try {  
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();  
		   
		while(rs.next()){		    	   
			JSONObject rowObj = new JSONObject();
	    	
			rowObj.put("bd_code", rs.getString("bd_code"));
			rowObj.put("b_code", rs.getString("b_code"));
			rowObj.put("b_loc", rs.getString("b_loc"));
			rowObj.put("b_name", rs.getString("b_name"));
	        rowObj.put("b_hogi", rs.getString("b_hogi"));
	        rowObj.put("bd_date", rs.getString("bd_date"));
	        //rowObj.put("bd_loc", rs.getString("bd_loc"));
	        rowObj.put("bd_type", rs.getString("bd_type"));
	        rowObj.put("bd_memo", rs.getString("bd_memo"));
	        
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("data", rowsArray);  
		mainObj.put("last_page", 1);  
		mainObj.put("sql", sql.toString());  
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
