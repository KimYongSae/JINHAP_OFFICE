<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		int hogi = Integer.parseInt(request.getParameter("hogi"));
		String sdate = request.getParameter("sdate");
		String stime = request.getParameter("stime");
		String edate = request.getParameter("edate");
		String etime = request.getParameter("etime");

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer hogiSql = new StringBuffer();
		 StringBuffer timeSql = new StringBuffer();
		 
		 
		 switch(hogi){
			 case 1: hogiSql.append(" AND hogi = 1"); break;
			 case 2: hogiSql.append(" AND hogi = 2"); break;
			 case 3: hogiSql.append(" AND hogi = 3"); break;
			 case 4: hogiSql.append(" AND hogi = 4"); break;
			 case 5: hogiSql.append(" AND hogi = 5"); break;
			 case 6: hogiSql.append(" AND hogi = 6"); break;
		 }
		 
		 if(sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)
			      && stime != null && !"".equals(stime) && etime != null && !"".equals(etime)){
			      timeSql.append(" AND regtime between '"+sdate+" "+stime+":00' AND '"+edate+" "+etime+":00'");
			   } else {
				    try {
				        throw new Exception("날짜 및 시간 조건이 충족되지 않음");
				    } catch (Exception e) {
				        e.printStackTrace();
				    }
				}
		 
		 
		 sql.append(" SELECT lot, pnum, barcode, left(regtime, 19) AS regtime FROM tb_out_log WHERE 1=1 ");
		 sql.append(hogiSql.toString());
		 sql.append(timeSql.toString());
		 sql.append(" ORDER BY regtime DESC");
		 
		 
		 
//		 System.out.println(sql.toString());
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 Statement stmt = null;
		 ResultSet rs = null;
		 
	     try {
	    	 
	    	 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
//		    int rowCount = rs.last() ? rs.getRow() : 0;	
//		    rs.beforeFirst(); 				    
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				String hogiValue = rs.getString("pnum");
				String barcode = rs.getString("barcode");
				String regtime = rs.getString("regtime");
				
				
				rowObj.put("lot",rs.getString("lot"));
				rowObj.put("pnum",rs.getString("pnum"));
				rowObj.put("barcode",rs.getString("barcode"));
				rowObj.put("regtime",rs.getString("regtime"));
				
				mainArray.add(rowObj);
				
			}
			
			mainObj.put("rows",mainArray);
	       
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
