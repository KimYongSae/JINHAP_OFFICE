<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		int hogi = Integer.parseInt(request.getParameter("hogi"));
		String pname = request.getParameter("pname");
		String gang = request.getParameter("gang");
		String t_gb = request.getParameter("t_gb");

		 
		 StringBuffer sql = new StringBuffer();

		 sql.append("SELECT COALESCE(hogi, '') AS hogi,");
		 sql.append("       COALESCE(pnum, '') AS pnum,");
		 sql.append("       COALESCE(pname, '') AS pname,");
		 sql.append("       COALESCE(gang, '') AS gang,");
		 sql.append("       COALESCE(t_gb, '') AS t_gb,");
		 sql.append("       COALESCE(lot, '') AS lot,");
		 sql.append("       COALESCE(q_temp_jin, '') AS q_temp_jin,");
		 sql.append("       COALESCE(t_temp_jin, '') AS t_temp_jin,");
		 sql.append("       COALESCE(t_temp_jin2, '') AS t_temp_jin2,");
		 sql.append("       COALESCE(cp_jin, '') AS cp_jin,");
		 sql.append("       COALESCE(q_temp_ez, '') AS q_temp_ez,");
		 sql.append("       COALESCE(t_temp_ez, '') AS t_temp_ez,");
		 sql.append("       COALESCE(cp_ez, '') AS cp_ez,");
		 sql.append("       COALESCE(weight, '') AS weight,");
		 sql.append("       COALESCE(hardness, '') AS hardness ");
		 sql.append("FROM ");
		 sql.append("tb_recipe_auto");
		 sql.append(hogi);
		 sql.append(" WHERE 1=1");
		 //if (!"0".equals(pname)) {
		 if (pname != null && !pname.isEmpty() && !pname.equals("0")) {
		    sql.append(" AND pname = '" +pname+ "'");
		}

			//if (!"0".equals(gang)) {
		if (gang != null && !gang.isEmpty() && !gang.equals("0")) {
		    sql.append(" AND gang = '" +gang+ "'");
		}

		//if (!"0".equals(t_gb)) {
		if (t_gb != null && !t_gb.isEmpty() && !t_gb.equals("0")) {
		    sql.append(" AND t_gb = '" +t_gb+ "'");
		}

		 
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 mainObj.put("sql", sql.toString());
		 Statement stmt = null;
		 ResultSet rs = null;
		 
	     try {
	    	 
			stmt = conn.createStatement();
 			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				String hogiValue = rs.getString("hogi");
				if (hogiValue != null) {
				    switch (hogiValue) {
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
				            rowObj.put("hogi", "시스템 알람");
				            break;
				    }
				}
				
				/* rowObj.put("hogi",rs.getString("hogi")); */
				rowObj.put("pnum",rs.getString("pnum"));
				rowObj.put("pname",rs.getString("pname"));
				rowObj.put("gang",rs.getString("gang"));
				rowObj.put("t_gb",rs.getString("t_gb"));
				rowObj.put("lot",rs.getString("lot"));
				rowObj.put("q_temp_jin",rs.getString("q_temp_jin"));
				rowObj.put("t_temp_jin",rs.getString("t_temp_jin"));
				rowObj.put("cp_jin",rs.getString("cp_jin"));
				rowObj.put("q_temp_ez",rs.getString("q_temp_ez"));
				rowObj.put("t_temp_ez",rs.getString("t_temp_ez"));
				rowObj.put("cp_ez",rs.getString("cp_ez"));
				rowObj.put("weight",rs.getString("weight"));
				rowObj.put("hardness",rs.getString("hardness"));
				
				mainArray.add(rowObj);
				
			}
			
			mainObj.put("rows",mainArray);
	       
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
		 
%>
