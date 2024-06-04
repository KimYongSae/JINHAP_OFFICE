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
		sql.append("SELECT "); 
		sql.append("    tb_out_log.hogi, "); 
		sql.append("    tb_out_log.num, ");
		sql.append("    vri.pname AS recipe_pname, "); 
		sql.append("    vri.pnum AS recipe_pnum "); 
		sql.append("FROM ( "); 
		sql.append("    SELECT "); 
		sql.append("        hogi, "); 
		sql.append("        pname, "); 
		sql.append("        pnum, "); 
		sql.append("        regtime, "); 
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num "); 
		sql.append("    FROM tb_out_log "); 
		sql.append("    WHERE input_gb = 'W' AND hogi = 6 "); 
		sql.append(") AS tb_out_log "); 
		sql.append("JOIN ( "); 
		sql.append("    SELECT "); 
		sql.append("        pname, "); 
		sql.append("        pnum "); 
		sql.append("    FROM v_recipe_info "); 
		sql.append(") AS vri "); 
		sql.append("ON tb_out_log.pnum = vri.pnum "); 
		sql.append("WHERE tb_out_log.num IN (1, 2);");

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("pname",rs.getString("recipe_pname"));
			mapObj.put("num",rs.getString("num"));
			mapObj.put("hogi",rs.getString("hogi"));
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
