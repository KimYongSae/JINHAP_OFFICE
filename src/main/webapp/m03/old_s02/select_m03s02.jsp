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
	 
	sql.append("SELECT cnt, hogi, zone, tdate_t_plan, tdate_t_act, ");
	sql.append("tdate_b_plan, tdate_b_act, IFNULL(chk_t,'') chk_t, IFNULL(chk_b,'') chk_b, ");
	sql.append("filename_t, filename_b, file_yn_t, file_yn_b ");
	sql.append("FROM tb_tus_file ");
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
					rowObj.put("zone",rs.getString("zone"));
//					rowObj.put("y_t",rs.getString("y_top"));
//					rowObj.put("y_b",rs.getString("y_bottom"));
					rowObj.put("tdate_t_plan",rs.getString("tdate_t_plan"));
					rowObj.put("tdate_t_act",rs.getString("tdate_t_act"));

					
					rowObj.put("tdate_b_plan",rs.getString("tdate_b_plan"));
					rowObj.put("tdate_b_act",rs.getString("tdate_b_act"));
					
					rowObj.put("chk_t",rs.getString("chk_t"));
					rowObj.put("chk_b",rs.getString("chk_b"));
					
					rowObj.put("filename_t",rs.getString("filename_t"));
					rowObj.put("filename_b",rs.getString("filename_b"));
					
					rowObj.put("file_yn_t",rs.getString("file_yn_t"));
					rowObj.put("file_yn_b",rs.getString("file_yn_b"));
		 			
					if("Y".equals(rs.getString("file_yn_t"))){
						rowObj.put("color_t","#D9E5FF;");
					}else{
						rowObj.put("color_t","#FFFFFF;");
					}
					
					if("Y".equals(rs.getString("file_yn_b"))){
						rowObj.put("color_b","#D9E5FF;");
					}else{
						rowObj.put("color_b","#FFFFFF;");
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
