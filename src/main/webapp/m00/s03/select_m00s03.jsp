<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String hogi = request.getParameter("hogi");
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	StringBuffer fromSql = new StringBuffer();	
	JSONObject mainObj = new JSONObject();  
	
	switch(hogi){
		case "1" :
			fromSql.append("FROM tb_alarm_monitoring1 ");
			break;
		case "2" :
			fromSql.append("FROM tb_alarm_monitoring2 ");
			break;
		case "3" :
			fromSql.append("FROM tb_alarm_monitoring3 ");
			break;
		case "4" :
			fromSql.append("FROM tb_alarm_monitoring4 ");
			break;
		case "5" :
			fromSql.append("FROM tb_alarm_monitoring5 ");
			break;
		case "6" :
			fromSql.append("FROM tb_alarm_monitoring6 ");
			break;
	}
	

	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	boolean checkValue = true;
	
	try {
			JSONArray rowsArray = new JSONArray();
		
			sql.setLength(0);
			sql.append("SELECT * ");
			sql.append(fromSql.toString());
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());

			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				rowObj.put("B10b0", rs.getInt("B10b0h"));
				rowObj.put("B10b1", rs.getInt("B10b1h"));
				rowObj.put("B10b5", rs.getInt("B10b5h"));
				rowObj.put("B10c1", rs.getInt("B10c1h"));
				rowObj.put("B10c2", rs.getInt("B10c2h"));
				rowObj.put("B10c3", rs.getInt("B10c3h"));
				rowObj.put("B10c4", rs.getInt("B10c4h"));
				rowObj.put("B10c5", rs.getInt("B10c5h"));
				rowObj.put("B10c6", rs.getInt("B10c6h"));
				rowObj.put("B10c7", rs.getInt("B10c7h"));
				rowObj.put("B10c8", rs.getInt("B10c8h"));
				rowObj.put("B10c9", rs.getInt("B10c9h"));
				rowObj.put("B10ca", rs.getInt("B10cah"));
				rowObj.put("B10cb", rs.getInt("B10cbh"));
				rowObj.put("B10cc", rs.getInt("B10cch"));
				rowObj.put("B10cd", rs.getInt("B10cdh"));
				rowObj.put("B10ce", rs.getInt("B10ceh"));
				rowObj.put("B10cf", rs.getInt("B10cfh"));
				rowObj.put("B10d0", rs.getInt("B10d0h"));
				rowObj.put("B10d1", rs.getInt("B10d1h"));
				rowObj.put("B10d2", rs.getInt("B10d2h"));
				rowObj.put("B10d3", rs.getInt("B10d3h"));
				rowObj.put("B10d4", rs.getInt("B10d4h"));
				rowObj.put("B10d5", rs.getInt("B10d5h"));
				rowObj.put("B10d7", rs.getInt("B10d7h"));
				rowObj.put("B10d8", rs.getInt("B10d8h"));
				rowObj.put("B10d9", rs.getInt("B10d9h"));
				rowObj.put("B10da", rs.getInt("B10dah"));
				rowObj.put("B10db", rs.getInt("B10dbh"));
				rowObj.put("B10dc", rs.getInt("B10dch"));
				rowObj.put("B10dd", rs.getInt("B10ddh"));
				rowObj.put("B10de", rs.getInt("B10deh"));
				rowObj.put("B10e1", rs.getInt("B10e1h"));
				rowObj.put("B10e2", rs.getInt("B10e2h"));
				rowObj.put("B10e3", rs.getInt("B10e3h"));
				rowObj.put("B10e5", rs.getInt("B10e5h"));
				rowObj.put("B10e6", rs.getInt("B10e6h"));
				rowObj.put("B10e7", rs.getInt("B10e7h"));
				rowObj.put("B10e8", rs.getInt("B10e8h"));
				rowObj.put("B10e9", rs.getInt("B10e9h"));
				rowObj.put("B10f0", rs.getInt("B10f0h"));
				rowObj.put("B10f4", rs.getInt("B10f4h"));
				rowObj.put("B10f5", rs.getInt("B10f5h"));
				rowObj.put("B10f6", rs.getInt("B10f6h"));
				rowObj.put("B10f7", rs.getInt("B10f7h"));
				rowObj.put("B10f8", rs.getInt("B10f8h"));
				rowObj.put("B10f9", rs.getInt("B10f9h"));
				rowObj.put("B10fa", rs.getInt("B10fah"));
				rowObj.put("B10fb", rs.getInt("B10fbh"));
				rowObj.put("B10fc", rs.getInt("B10fch"));
				rowObj.put("B10fd", rs.getInt("B10fdh"));


				
				rowsArray.add(rowObj);
			}
			
			mainObj.put("data", rowsArray);  
			mainObj.put("last_page", 1);  			
			mainObj.put("status", String.valueOf("ok"));
					
			result = mainObj.toJSONString();		
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		out.print(mainObj);
		out.flush();
	}
		
%>
