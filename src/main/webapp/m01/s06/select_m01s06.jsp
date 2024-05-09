<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>
<%@include file="../../db/DBConnector_Oracle.jsp" %>
<%-- <%@include file="../../db/DBConnector_MSSQL.jsp" %> --%>

<%

	String result = "";
	StringBuffer sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	

	sql.append("SELECT DISTINCT ");
	sql.append("    item_nm, ITEM_CD, GANGJONG, ITEM_LAG_CAT, JHLOTNUM, ");
	sql.append("    COUNT(item_nm) OVER (PARTITION BY item_nm, jhlotnum) AS tong_count ");
	sql.append("FROM ");
	sql.append("    STORE_JOB_VIEW ORDER BY item_cd ");
	
	
	
	
	
	Statement stmt_oracle = null;
	ResultSet rs_oracle = null;

	try {
		stmt_oracle = conn_oracle.createStatement();  
	    rs_oracle = stmt_oracle.executeQuery(sql.toString());  
	       
		mainObj.put("status", String.valueOf("ok"));
		JSONArray rowsArray = new JSONArray();

		int listIdx = 0;
		while(rs_oracle.next()){
			listIdx++;
			JSONObject rowObj = new JSONObject();
			rowObj.put("listIdx", listIdx);
			rowObj.put("pnum", rs_oracle.getString("item_cd"));
			rowObj.put("jhlot", rs_oracle.getString("JHLOTNUM"));
			rowObj.put("pname", rs_oracle.getString("item_nm"));
			rowObj.put("gang", rs_oracle.getString("GANGJONG"));
			rowObj.put("t_gb", rs_oracle.getString("ITEM_LAG_CAT"));
			rowObj.put("tongCount", rs_oracle.getString("tong_count"));
			
			
			
			rowsArray.add(rowObj);
		}
		    	
		mainObj.put("rows", rowsArray);  
		mainObj.put("last_page", 1);  

		result = mainObj.toJSONString();  
	}	
	catch(Exception e){
		e.printStackTrace();
	}finally{
		
		if(stmt_oracle != null) try {stmt_oracle.close();}catch(SQLException sqle){}
		if(rs_oracle != null) try {rs_oracle.close();}catch(SQLException sqle){}
		if(conn_oracle != null) try {conn_oracle.close();}catch(SQLException sqle){}
		out.print(mainObj);
		out.flush();
	}
		
%>
