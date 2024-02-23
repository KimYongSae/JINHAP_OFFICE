<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String hogi = request.getParameter("hogi");
		String pnum = request.getParameter("pnum");
		String gang = request.getParameter("gang");
		String t_gb = request.getParameter("t_gb");

		String result = "";
		StringBuffer sql1 = new StringBuffer();
		StringBuffer sql2 = new StringBuffer();
		StringBuffer sql3 = new StringBuffer();
		StringBuffer whereSql = new StringBuffer();
		JSONObject mainObj = new JSONObject();
		
		 
		sql1.append("select distinct(pnum) from ");
	    sql1.append("tb_recipe_auto" + hogi);
	    sql1.append(" where 1=1");
	    if (gang != null && !gang.isEmpty() && !gang.equals("0")) {
	        sql1.append(" AND gang = '" + gang + "'");
	    }
	    if (t_gb != null && !t_gb.isEmpty() && !t_gb.equals("0")) {
	        sql1.append(" AND t_gb = '" + t_gb + "'");
	    }
	    sql1.append(" order by pnum asc");

	    sql2.append("select distinct(gang) from ");
	    sql2.append("tb_recipe_auto" + hogi);
	    sql2.append(" where 1=1");
	    if (pnum != null && !pnum.isEmpty() && !pnum.equals("0")) {
	        sql2.append(" AND pnum = '" + pnum + "'");
	    }
	    if (t_gb != null && !t_gb.isEmpty() && !t_gb.equals("0")) {
	        sql2.append(" AND t_gb = '" + t_gb + "'");
	    }
	    sql2.append(" order by gang asc");

	    sql3.append("select distinct(t_gb) from ");
	    sql3.append("tb_recipe_auto" + hogi);
	    sql3.append(" where 1=1");
	    if (gang != null && !gang.isEmpty() && !gang.equals("0")) {
	        sql3.append(" AND gang = '" + gang + "'");
	    }
	    if (pnum != null && !pnum.isEmpty() && !pnum.equals("0")) {
	        sql3.append(" AND pnum = '" + pnum + "'");
	    }
	    sql3.append(" order by t_gb asc");
	    	
		 Statement stmt = null;
		 ResultSet rs = null;
	     
	     try {  
	       /* int rowCount = rs.last() ? rs.getRow() : 0; */  
	       /* mainObj.put("total", String.valueOf(rowCount)); */
	       /* rs.beforeFirst();   */
	       stmt = conn.createStatement();  
	       mainObj.put("status", String.valueOf("ok"));
	       JSONArray pnumArray = new JSONArray();  
	       JSONArray gangArray = new JSONArray();  
	       JSONArray t_gbArray = new JSONArray();  
	       
	       rs = stmt.executeQuery(sql1.toString());
	       
	       // 품목명
	       while(rs.next()){  
	         JSONObject rowObj = new JSONObject();
	         
	         rowObj.put("pnum", rs.getString("pnum"));
	         pnumArray.add(rowObj);  
	       }  
	       mainObj.put("pnum", pnumArray);
	       
	       rs = stmt.executeQuery(sql2.toString());
	       
	       // 강종
	       while(rs.next()){  
	         JSONObject rowObj = new JSONObject();
	         
	         rowObj.put("gang", rs.getString("gang"));
	         gangArray.add(rowObj);  
	       }  
	       mainObj.put("gang", gangArray);
	       
	       // t급
	       rs = stmt.executeQuery(sql3.toString());
	       
	       while(rs.next()){  
	         JSONObject rowObj = new JSONObject();
	         
	         rowObj.put("t_gb", rs.getString("t_gb"));
	         t_gbArray.add(rowObj);  
	       }  
	       mainObj.put("t_gb", t_gbArray);
	       
	       
	       
	       
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
