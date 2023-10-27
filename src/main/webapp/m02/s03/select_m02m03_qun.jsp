<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String tdate = request.getParameter("tdate");
	String zone = request.getParameter("zone");
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	if(!"".equals(tdate) && tdate != null){
		whereSql.append(" and year1 = '"+tdate+"' ");
	}
	
	
	JSONObject mainObj = new JSONObject();  
	 //ARG_ROSLT : 0100, ARG_FDATE : 20200422 
	 
	sql.append("SELECT hogi, azone, bzone, odate AS date, tdate, bdate, ");
	sql.append("oval AS val, tval, bval, special, ");
	sql.append("bigo, year1 ");
	sql.append("FROM tb_temperature_qun ");
	sql.append("WHERE 1=1 ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY year1, hogi, cnt ");

	Statement stmt = null;
	ResultSet rs = null;

		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());
		    	 
		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();

		    		 String b_val = rs.getString("hogi")+"_"+rs.getString("bzone");
		    		 
		    		 String a_val = rs.getString("hogi")+"_"+rs.getString("azone");
		    		 
		    		 rowObj.put("qbigo",rs.getString("bigo"));
		    		 
		    		 rowObj.put(b_val+"_date",rs.getString("date"));
		    		 rowObj.put(b_val+"_tdate",rs.getString("tdate"));
		    		 rowObj.put(b_val+"_bdate",rs.getString("bdate"));
		    		 rowObj.put(rs.getString("hogi")+"_special",rs.getString("special"));
		    		 
		    		 rowObj.put(a_val+"_date",rs.getString("date"));
		    		 rowObj.put(a_val+"_tdate",rs.getString("tdate"));
		    		 rowObj.put(a_val+"_bdate",rs.getString("bdate"));

		    		 rowObj.put(b_val+"_val",rs.getString("val"));
		    		 rowObj.put(b_val+"_tval",rs.getString("tval"));
		    		 rowObj.put(b_val+"_bval",rs.getString("bval"));
		    		 
		    		 rowObj.put(a_val+"_val",rs.getString("val"));
		    		 rowObj.put(a_val+"_tval",rs.getString("tval"));
		    		 rowObj.put(a_val+"_bval",rs.getString("bval"));
		    		 

					
					mainArray.add(rowObj);
						
		    	 }
		    	 
//				System.out.println(mainArray);
		       
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
