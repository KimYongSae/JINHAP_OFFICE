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

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int gb = Integer.parseInt(request.getParameter("gb"));
	
	StringBuffer s_sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{
		
		switch(gb){
			case 1:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 2:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 3:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 4:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 5:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 6:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 7:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 8:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 9:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 10:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 11:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;
			case 12:
				s_sql.append("select filename_"+gb+" AS filename ");
				s_sql.append("from tb_sat_file ");
				s_sql.append("where cnt = "+cnt+" ");
			break;			
		}
		


		JSONArray mainArray = new JSONArray();
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst();  		
		
		mainObj.put("total", String.valueOf(rowCount));
		mainObj.put("status", String.valueOf("ok"));		
		
		while(rs.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("filename",rs.getString("filename"));
			
			
			mainArray.add(rowObj);
		}
		
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