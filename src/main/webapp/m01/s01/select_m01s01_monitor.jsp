<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	String tdate = request.getParameter("tdate");
	String tdate2 = request.getParameter("tdate2");
	
	String tdate_r = request.getParameter("tdate").replace("-","");
	String tdate2_r = request.getParameter("tdate2").replace("-","");
	
/*	
	tdate = "2023-08-28";
	tdate2 = "2023-08-29";
	
	tdate_r = "20230828";
	tdate2_r = "20230829";	
*/
//	System.out.println("tdate : "+tdate+"// tdate2 : "+tdate2+", tdate_r : "+tdate_r+", tdate2_r : "+tdate2_r);
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	 
	StringBuffer whereSql = new StringBuffer();
	 
	JSONObject mainObj = new JSONObject();  
	JSONArray mapArray = new JSONArray();
	JSONArray mapArray2 = new JSONArray();
	
	Statement stmt = null;
	ResultSet rs = null;
	Statement stmt2 = null;
	ResultSet rs2 = null;
	try{
		
		sql.append("SELECT hogi, COUNT(*) AS ccnt ");
		sql.append("FROM tb_out_log ");
		sql.append("WHERE 1=1 ");
		sql.append("AND yn = 'Y' ");
		sql.append("AND location != '' ");
		sql.append("AND input_gb = 'W' ");
		sql.append("AND regtime >= '"+tdate+" 08:00:00' ");
		sql.append("AND regtime <= '"+tdate2+" 07:59:59' ");
		sql.append("GROUP BY hogi ");
		sql.append("ORDER BY hogi ");

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("a_3",rs.getInt("ccnt"));
			mapArray.add(mapObj);
			
		}
		
		
		sql2.append("SELECT hogi, ROUND(SUM(weight)) AS weight ");
		sql2.append("FROM tb_tong_in ");
		sql2.append("WHERE 1=1 ");
		sql2.append("AND datetiem1 >= '"+tdate_r+"080000' ");
		sql2.append("AND datetiem1 <= '"+tdate2_r+"075959' ");
		sql2.append("AND weight IS NOT NULL ");
		sql2.append("GROUP BY hogi ");

		stmt2 = conn.createStatement();
		rs2 = stmt2.executeQuery(sql2.toString());
		
		while(rs2.next()){
			JSONObject mapObj2 = new JSONObject();			
			//생산능력
			mapObj2.put("a_11",rs2.getInt("weight"));
			mapArray2.add(mapObj2);
			
		}
		
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
	     mainObj.put("rows2",mapArray2);
		       
		       
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
/*				
				if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
				if(rs != null) try {rs.close();}catch(SQLException sqle){}
				if(conn != null) try {conn.close();}catch(SQLException sqle){}

				if(stmt_erp != null) try {stmt_erp.close();}catch(SQLException sqle){}
				if(rs_erp != null) try {rs_erp.close();}catch(SQLException sqle){}
				if(stmt_erp2 != null) try {stmt_erp2.close();}catch(SQLException sqle){}
				if(rs_erp2 != null) try {rs_erp2.close();}catch(SQLException sqle){}
				if(conn_erp != null) try {conn_erp.close();}catch(SQLException sqle){}	
*/
			}
%>
