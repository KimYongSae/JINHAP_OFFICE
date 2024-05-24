<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	 
	StringBuffer whereSql = new StringBuffer();
	 
	JSONObject mainObj = new JSONObject();  
	JSONArray mapArray = new JSONArray();
	JSONArray mapArray2 = new JSONArray();
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto1.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto1.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 1 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto1 ");
		sql.append(") AS tb_recipe_auto1 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto1.pnum AND tb_recipe_auto1.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("UNION ALL ");

		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto2.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto2.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 2 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto2 ");
		sql.append(") AS tb_recipe_auto2 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto2.pnum AND tb_recipe_auto2.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("UNION ALL ");

		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto3.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto3.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 3 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto3 ");
		sql.append(") AS tb_recipe_auto3 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto3.pnum AND tb_recipe_auto3.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("UNION ALL ");

		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto4.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto4.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 4 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto4 ");
		sql.append(") AS tb_recipe_auto4 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto4.pnum AND tb_recipe_auto4.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("UNION ALL ");

		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto5.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto5.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 5 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto5 ");
		sql.append(") AS tb_recipe_auto5 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto5.pnum AND tb_recipe_auto5.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("UNION ALL ");

		sql.append("SELECT ");
		sql.append("    tb_out_log.hogi, ");
		sql.append("    tb_recipe_auto6.pname AS recipe_pname, ");
		sql.append("    tb_recipe_auto6.pnum AS recipe_pnum ");
		sql.append("FROM ( ");
		sql.append("    SELECT ");
		sql.append("        hogi, ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        regtime, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
		sql.append("    FROM tb_out_log ");
		sql.append("    WHERE input_gb = 'W' AND hogi = 6 ");
		sql.append(") AS tb_out_log ");
		sql.append("JOIN ( ");
		sql.append("    SELECT ");
		sql.append("        pname, ");
		sql.append("        pnum, ");
		sql.append("        ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY pnum) AS rn ");
		sql.append("    FROM tb_recipe_auto6 ");
		sql.append(") AS tb_recipe_auto6 ");
		sql.append("ON tb_out_log.pnum = tb_recipe_auto6.pnum AND tb_recipe_auto6.rn = 1 ");
		sql.append("WHERE tb_out_log.num = 1 ");

		sql.append("ORDER BY hogi;");



		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			JSONObject mapObj = new JSONObject();			
			//1호기
			//생산능력
			mapObj.put("after_pname",rs.getString("recipe_pname"));
			mapObj.put("hogi",rs.getString("hogi"));
			mapArray.add(mapObj);
			
		}
		
	     result = mainObj.toJSONString();
	     mainObj.put("status", String.valueOf("ok"));			       
	     mainObj.put("rows",mapArray);
		       
		       
//		       conn.commit();
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
