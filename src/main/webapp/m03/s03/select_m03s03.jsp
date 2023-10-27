<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String year1 = request.getParameter("year1");
	String zone = request.getParameter("zone");
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	if(!"".equals(year1) && year1 != null){
		whereSql.append(" AND year1 = '"+year1+"' ");
	}
	
	if(!"".equals(zone) && zone != null){
		whereSql.append(" AND zone = '"+zone+"' ");
	}
	
	JSONObject mainObj = new JSONObject();  
	 
	sql.append("SELECT cnt, hogi, zone ");
		for(int i=1; i<=12; i++){
			sql.append(",tdate_"+i+", chk_"+i+", filename_"+i+", file_yn_"+i+", memo_"+i+" ");			
		}
	
	sql.append("FROM tb_sat_file ");
	sql.append("WHERE 1=1 ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY hogi, zone ");

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
					rowObj.put("cnt",rs.getInt("cnt"));
					rowObj.put("hogi",rs.getString("hogi"));
					rowObj.put("zone",rs.getString("zone").replace("/","</br>"));
//					rowObj.put("y_t",rs.getString("y_top"));
//					rowObj.put("y_b",rs.getString("y_bottom"));
	
					for(int i=1; i<=12; i++){
						rowObj.put("tdate_"+i,rs.getString("tdate_"+i));
						rowObj.put("chk_"+i,rs.getString("chk_"+i));
						rowObj.put("filename_"+i,rs.getString("filename_"+i));
						rowObj.put("file_yn_"+i,rs.getString("file_yn_"+i));
						rowObj.put("memo_"+i,rs.getString("memo_"+i));
						if("Y".equals(rs.getString("file_yn_"+i))){
							rowObj.put("color_"+i,"#D9E5FF;");
						}else{
							rowObj.put("color_"+i,"#FFFF;");
						}
						if("Y".equals(rs.getString("file_yn_"+i))){
							rowObj.put("color_"+i,"#D9E5FF;");
						}else{
							rowObj.put("color_"+i,"#FFFF;");
						}
					}
		 			
					
					
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
