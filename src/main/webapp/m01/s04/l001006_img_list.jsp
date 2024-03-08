<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector.jsp" %>

<%


		String result = "";
		 
		StringBuffer sql = new StringBuffer();
		StringBuffer whereSql = new StringBuffer();
		 
		sql.append("SELECT u_level, u_id, u_pw, u_name, ");
		sql.append("	regdate, img_path, num ");
		sql.append("FROM ( ");
		sql.append("	SELECT ");
		sql.append("		si.id_level AS u_level, us.u_id AS u_id, ");
		sql.append("		us.u_pw AS u_pw, us.u_name AS u_name, ");
		sql.append("		si.regdate AS regdate, si.img_path AS img_path, ");
		sql.append("		ROW_NUMBER() OVER(PARTITION BY si.id_level ORDER BY si.regdate DESC) AS num ");
		sql.append("	FROM tb_user_signimg si ");
		sql.append("	INNER JOIN tb_user us ");
		sql.append("	ON si.id = us.u_id ");
		sql.append("	WHERE si.yn = 'Y' ");
		sql.append(") AS aadd ");
		sql.append("WHERE num = 1 ");
		sql.append("ORDER BY u_level ");
		 
		 
		JSONObject mainObj = new JSONObject();
		JSONArray mainArray = new JSONArray();
		 
		mainObj.put("status", String.valueOf("ok"));

	    try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				rowObj.put("u_id",rs.getString("u_id"));
				rowObj.put("u_name",rs.getString("u_name"));
				rowObj.put("u_level",rs.getString("u_level"));
				rowObj.put("img_path",rs.getString("img_path"));
				
				mainArray.add(rowObj);
			}
			
			
			mainObj.put("rowCount",rowCount);
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

