<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	
	StringBuffer s_sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	
	Statement stmt = null;
	ResultSet rs = null;
	try
	{	
		s_sql.append("select cnt, hogi, month1, if(m_ppk<>'',round(m_ppk,2),'') as m_val, date1 as m_date, ");
		s_sql.append("file_yn ");
		s_sql.append("from tb_ppk ");
		s_sql.append("where year1 = '"+tdate+"' ");
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst();  		
		
		mainObj.put("total", String.valueOf(rowCount));
		mainObj.put("status", String.valueOf("ok"));
		JSONArray hogi1Array = new JSONArray();
		JSONArray hogi2Array = new JSONArray();
		JSONArray hogi3Array = new JSONArray();
		JSONArray hogi4Array = new JSONArray();
		JSONArray hogi5Array = new JSONArray();
		JSONArray hogi6Array = new JSONArray();
		
		
		int idx = 0;
		while(rs.next()){
			JSONObject row1Obj = new JSONObject();
			JSONObject row2Obj = new JSONObject();
			JSONObject row3Obj = new JSONObject();
			JSONObject row4Obj = new JSONObject();
			JSONObject row5Obj = new JSONObject();
			JSONObject row6Obj = new JSONObject();
			
			
			String color = "#FFFFFF;";
			int f = 0;
			if("1호기".equals(rs.getString("hogi"))){
				row1Obj.put("cnt",rs.getInt("cnt"));
				row1Obj.put("val",rs.getString("m_val"));
				row1Obj.put("date",rs.getString("m_date"));
				row1Obj.put("file_yn",rs.getString("file_yn"));
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row1Obj.put("color",color);
					
					f = 1;					
					row1Obj.put("f",f);
				}else{
					row1Obj.put("f",f);
				}
				
			}else if("2호기".equals(rs.getString("hogi"))){
				row2Obj.put("cnt",rs.getInt("cnt"));
				row2Obj.put("val",rs.getString("m_val"));
				row2Obj.put("date",rs.getString("m_date"));				
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row2Obj.put("color",color);	
					f = 1;					
					row2Obj.put("f",f);
				}else{
					row2Obj.put("f",f);
				}
			}else if("3호기".equals(rs.getString("hogi"))){
				row3Obj.put("cnt",rs.getInt("cnt"));
				row3Obj.put("val",rs.getString("m_val"));
				row3Obj.put("date",rs.getString("m_date"));				
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row3Obj.put("color",color);	
					f = 1;					
					row3Obj.put("f",f);
				}else{
					row3Obj.put("f",f);
				}
			}else if("4호기".equals(rs.getString("hogi"))){
				row4Obj.put("cnt",rs.getInt("cnt"));
				row4Obj.put("val",rs.getString("m_val"));
				row4Obj.put("date",rs.getString("m_date"));				
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row4Obj.put("color",color);	
					f = 1;					
					row4Obj.put("f",f);
				}else{
					row4Obj.put("f",f);
				}
			}else if("5호기".equals(rs.getString("hogi"))){
				row5Obj.put("cnt",rs.getInt("cnt"));
				row5Obj.put("val",rs.getString("m_val"));
				row5Obj.put("date",rs.getString("m_date"));				
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row5Obj.put("color",color);	
					f = 1;					
					row5Obj.put("f",f);
				}else{
					row5Obj.put("f",f);
				}				
			}else if("6호기".equals(rs.getString("hogi"))){
				row6Obj.put("cnt",rs.getInt("cnt"));
				row6Obj.put("val",rs.getString("m_val"));
				row6Obj.put("date",rs.getString("m_date"));				
				if(!"".equals(rs.getString("m_val"))){
					color = "#D9E5FF;";
					row6Obj.put("color",color);	
					f = 1;					
					row6Obj.put("f",f);
				}else{
					row6Obj.put("f",f);
				}
			}
			
			
			if(idx < 12){
				hogi1Array.add(row1Obj);
			}else if(idx < 24){
				hogi2Array.add(row2Obj);
			}else if(idx < 36){
				hogi3Array.add(row3Obj);
			}else if(idx < 48){
				hogi4Array.add(row4Obj);
			}else if(idx < 60){
				hogi5Array.add(row5Obj);
			}else if(idx < 72){
				hogi6Array.add(row6Obj);
			}
			
			idx++;
		}
		
		
		
		mainObj.put("h1",hogi1Array);
		mainObj.put("h2",hogi2Array);
		mainObj.put("h3",hogi3Array);
		mainObj.put("h4",hogi4Array);
		mainObj.put("h5",hogi5Array);
		mainObj.put("h6",hogi6Array);
		
		/*
		System.out.println(hogi1Array);
		System.out.println("------------------------------------------------------");
		System.out.println(hogi2Array);
		System.out.println("------------------------------------------------------");
		System.out.println(hogi3Array);
		System.out.println("------------------------------------------------------");
		System.out.println(hogi4Array);
		System.out.println("------------------------------------------------------");
		System.out.println(hogi5Array);
		System.out.println("------------------------------------------------------");
		System.out.println(hogi6Array);
		System.out.println("------------------------------------------------------");
		*/
		
		
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