<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String sdate = request.getParameter("sdate");
//	String edate = request.getParameter("edate");
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	if(!"".equals(sdate) && sdate != null){
		whereSql.append(" and LEFT(tdate,4) = '"+sdate+"' ");
	}
	
	JSONObject mainObj = new JSONObject();  
	 //ARG_ROSLT : 0100, ARG_FDATE : 20200422 
	 
	sql.append("SELECT cnt, tdate, filename, file_yn ");
	sql.append("FROM tb_auth_file ");
	sql.append("WHERE file_yn = 'Y' ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY tdate, filename ");

	Statement stmt = null;
	ResultSet rs = null;

		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());
		    	
		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();
		    		rowObj.put("cnt",rs.getInt("cnt"));
					rowObj.put("tdate",rs.getString("tdate"));					//날짜
					rowObj.put("file_yn",rs.getString("file_yn"));				
					rowObj.put("filename",
							rs.getString("filename")
							.replace("$",".").replace("^"," "));			//파일명
							
//					System.out.println(rs.getString("filename"));
							
							
		    		rowObj.put("version",
		    				rs.getString("filename").substring(
		    						rs.getString("filename").lastIndexOf('.'), 
		    						rs.getString("filename").length()));

					mainArray.add(rowObj);
						
		    	 }
		    	 
				
		       
		       mainObj.put("status", String.valueOf("ok"));			       
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
