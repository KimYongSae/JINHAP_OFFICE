<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	 
	StringBuffer whereSql = new StringBuffer();
	 
	JSONObject mainObj = new JSONObject();  
	JSONArray mapArray = new JSONArray();
	JSONArray mapArray2 = new JSONArray();
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		
		sql.append("select machine, v1, v2, v3, v4, v5, v6, v7 ");
		sql.append("FROM v_machine_performance_sum ");
		sql.append("WHERE machine = 'Q01-HN05' ");

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("machine",rs.getString("machine"));
			mapObj.put("v15",rs.getString("v1"));
			mapObj.put("v16",rs.getString("v2"));
			mapObj.put("v17",rs.getString("v3"));
			mapObj.put("v18",rs.getString("v7"));
			mapObj.put("v19",rs.getString("v6"));
			mapObj.put("v20",rs.getString("v5"));
			mapArray.add(mapObj);
			
		}
		
	
		
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
		       
		       
//		       conn.commit();
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
