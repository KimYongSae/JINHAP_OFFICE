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
		String lot = request.getParameter("lot");
		String pname = request.getParameter("pname");

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer hogiSql = new StringBuffer();
		 StringBuffer timeSql = new StringBuffer();
		 StringBuffer lotSql = new StringBuffer();
		 StringBuffer pnameSql = new StringBuffer();
		 
		 if(!lot.equals("0")){
			 lotSql.append(" AND tl.lot = '" + lot + "' ");
		 } else{
			 lotSql.append("");
		 }
		 if(!pname.equals("0")){
			 pnameSql.append(" AND ra.pname = '" + pname + "' ");
		 } else{
			 pnameSql.append("");
		 }
		 
		 switch(hogi){
			 case 1: hogiSql.append(" AND tl.hogi = 1"); break;
			 case 2: hogiSql.append(" AND tl.hogi = 2"); break;
			 case 3: hogiSql.append(" AND tl.hogi = 3"); break;
			 case 4: hogiSql.append(" AND tl.hogi = 4"); break;
			 case 5: hogiSql.append(" AND tl.hogi = 5"); break;
			 case 6: hogiSql.append(" AND tl.hogi = 6"); break;
		 }
		 
		 if(sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)
			      && stime != null && !"".equals(stime) && etime != null && !"".equals(etime)){
			      timeSql.append(" AND tl.datetiem1 between DATE_FORMAT('"+sdate+" "+stime+"', '%Y%m%d%H%i%s') AND DATE_FORMAT('"+edate+" "+etime+"','%Y%m%d%H%i%s') ");
			   } else {
				    try {
				        throw new Exception("날짜 및 시간 조건이 충족되지 않음");
				    } catch (Exception e) {
				        e.printStackTrace();
				    }
				}
		 
		 
		 sql.append(" SELECT ra.pname, tl.lot, tl.item_cd, tl.barcode, left(STR_TO_DATE(tl.datetiem1, '%Y%m%d%H%i%s'), 19) AS regtime FROM tb_tong_log AS tl ");
		 sql.append(" LEFT OUTER JOIN tb_recipe_auto"+hogi+" AS ra ON tl.item_cd = ra.pnum WHERE 1=1 ");
		 sql.append(hogiSql.toString());
		 sql.append(timeSql.toString());
		 sql.append(lotSql.toString());
		 sql.append(pnameSql.toString());
		 sql.append(" ORDER BY regtime DESC");
		 
		 
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 Statement stmt = null;
		 ResultSet rs = null;
		 
	     try {
	    	 
	    	 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				
				
				rowObj.put("lot",rs.getString("lot"));
				rowObj.put("pname",rs.getString("pname"));
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
