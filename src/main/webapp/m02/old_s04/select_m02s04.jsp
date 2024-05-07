<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String year1 = request.getParameter("year1");
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	if(!"".equals(year1) && year1 != null){
		whereSql.append(" AND year1 = '"+year1+"' ");
	}
	
	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append("SELECT LEFT(bungi,1) AS bungi, tdate, file_report, file_report_yn, ");
	sql.append("file_graph1, file_graph2, file_graph3, file_graph4, file_graph5, ");
	sql.append("file_graph6, ");
	sql.append("file_graph_yn1, file_graph_yn2, file_graph_yn3, file_graph_yn4, ");
	sql.append("file_graph_yn5, file_graph_yn6 ");
	sql.append("FROM tb_heatoil_file ");
	sql.append("WHERE 1=1 ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY bungi ");

	Statement stmt = null;
	ResultSet rs = null;

		     try {
		    	 
		    	stmt = conn.createStatement();
		    	rs = stmt.executeQuery(sql.toString());
		 		int rowCount = rs.last() ? rs.getRow() : 0;  
				rs.beforeFirst();  		
				
				mainObj.put("total", String.valueOf(rowCount));
				mainObj.put("status", String.valueOf("ok"));		    	 
		 		JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 
		 			JSONObject rowObj = new JSONObject();
					rowObj.put("bungi",rs.getString("bungi"));
					rowObj.put("tdate",rs.getString("tdate"));
					rowObj.put("file_report",rs.getString("file_report"));
					rowObj.put("file_report_yn",rs.getString("file_report_yn"));
					
					rowObj.put("file_graph1",rs.getString("file_graph1"));
					rowObj.put("file_graph2",rs.getString("file_graph2"));
					rowObj.put("file_graph3",rs.getString("file_graph3"));
					rowObj.put("file_graph4",rs.getString("file_graph4"));
					rowObj.put("file_graph5",rs.getString("file_graph5"));
					rowObj.put("file_graph6",rs.getString("file_graph6"));
					
					rowObj.put("file_graph_yn1",rs.getString("file_graph_yn1"));
					rowObj.put("file_graph_yn2",rs.getString("file_graph_yn2"));
					rowObj.put("file_graph_yn3",rs.getString("file_graph_yn3"));
					rowObj.put("file_graph_yn4",rs.getString("file_graph_yn4"));
					rowObj.put("file_graph_yn5",rs.getString("file_graph_yn5"));
					rowObj.put("file_graph_yn6",rs.getString("file_graph_yn6"));
					
					mainArray.add(rowObj);
		    	 }
		       
		    	mainObj.put("rows",mainArray);
		    	 
		       result = mainObj.toJSONString();
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
			/*
				//유니크 값이 없을 경우
				out.print(mainObj);
				out.flush();
			*/
%>
