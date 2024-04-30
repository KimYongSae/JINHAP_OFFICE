<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

// 미작성
		String hogi = request.getParameter("hogi");
		String lot = request.getParameter("lot");
		String pname = request.getParameter("pname");

		String result = "";
		StringBuffer sql1 = new StringBuffer();
		StringBuffer sql2 = new StringBuffer();
		StringBuffer whereSql = new StringBuffer();
		JSONObject mainObj = new JSONObject();
		
		 
		sql1.append("select distinct(lot) from ");
	    sql1.append("tb_recipe_auto" + hogi);
	    sql1.append(" where 1=1");
	    if (pname != null && !pname.isEmpty() && !pname.equals("0")) {
	        sql1.append(" AND pname = '" + pname + "'");
	    }
	    sql1.append(" order by pnum asc");

	    sql2.append("select distinct(pname) from ");
	    sql2.append("tb_recipe_auto" + hogi);
	    sql2.append(" where 1=1");
	    if (lot != null && !lot.isEmpty() && !lot.equals("0")) {
	        sql2.append(" AND lot = '" + lot + "'");
	    }
	    sql2.append(" order by gang asc");
	    	
		 Statement stmt = null;
		 ResultSet rs = null;
	     try {  
	       stmt = conn.createStatement();  
	       mainObj.put("status", String.valueOf("ok"));
	       JSONArray lotArray = new JSONArray();  
	       JSONArray pnameArray = new JSONArray();  
	       
	       rs = stmt.executeQuery(sql1.toString());
	       
	       // 품목명
	       while(rs.next()){  
	         JSONObject rowObj = new JSONObject();
	         
	         rowObj.put("lot", rs.getString("lot"));
	         lotArray.add(rowObj);  
	       }  
	       mainObj.put("lot", lotArray);
	       
	       rs = stmt.executeQuery(sql2.toString());
	       
	       while(rs.next()){  
	         JSONObject rowObj = new JSONObject();
	         
	         rowObj.put("pname", rs.getString("pname"));
	         pnameArray.add(rowObj);  
	       }  
	       mainObj.put("pname", pnameArray);
	       
	       result = mainObj.toJSONString();  
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
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>
