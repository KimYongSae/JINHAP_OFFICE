<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String tdate = request.getParameter("tdate");
	String hogi = request.getParameter("hogi");
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	StringBuffer whereSql2 = new StringBuffer();
	 
	if(!"".equals(tdate) && tdate != null){
		whereSql.append(" and tdate = '"+tdate+" 00:00:00' ");
	}
	
	if(!"".equals(hogi) && hogi != null){
		whereSql2.append(" and hogi = "+ hogi);
		
	}
	
	JSONObject mainObj = new JSONObject();  
	 
	 
	sql.append(" SELECT * FROM tb_work_log ");
	sql.append(" WHERE 1=1 ");
	sql.append(whereSql.toString());
	sql.append(whereSql2.toString());
	Statement stmt = null;
	ResultSet rs = null;
		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());
		    	 String work_flag = "";
		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();
		    		
		    		switch (rs.getString("hogi")) {
			        case "1":
			            rowObj.put("hogi", "Q01-HN01");
			            break;
			        case "2":
			            rowObj.put("hogi", "Q01-HN02");
			            break;
			        case "3":
			            rowObj.put("hogi", "Q01-HN03");
			            break;
			        case "4":
			            rowObj.put("hogi", "Q01-HN04");
			            break;
			        case "5":
			            rowObj.put("hogi", "Q01-HN05");
			            break;
			        case "6":
			            rowObj.put("hogi", "Q01-HN06");
			            break;
			        default:
			            rowObj.put("hogi", rs.getString("hogi"));
			            break;
			   		}
		    		 
					
					rowObj.put("tdate",rs.getString("tdate"));
					rowObj.put("filename",rs.getString("filename"));
					rowObj.put("cnt",rs.getString("cnt"));
					
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
