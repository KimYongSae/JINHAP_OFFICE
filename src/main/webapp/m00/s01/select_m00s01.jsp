<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		int hogi = Integer.parseInt(request.getParameter("hogi"));
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer whereSql = new StringBuffer();
		 
		 
		 switch(hogi){
			 case 0: whereSql.append(" AND AreaMask IN (0, 1, 2, 4, 8, 16, 32) "); break;
			 case 1: whereSql.append(" AND AreaMask = 1 "); break;
			 case 2: whereSql.append(" AND AreaMask = 2 "); break;
			 case 3: whereSql.append(" AND AreaMask = 4 "); break;
			 case 4: whereSql.append(" AND AreaMask = 8 "); break;
			 case 5: whereSql.append(" AND AreaMask = 16 "); break;
			 case 6: whereSql.append(" AND AreaMask = 32 "); break;
		 }
		 
		 if(!"".equals(sdate) && sdate != null && !"".equals(edate) && edate != null ){
			 whereSql.append(" and timeact between '"+sdate+"' and '"+edate+"' ");
		 }else if(!"".equals(sdate) && sdate != null){
			 whereSql.append(" and timertn = '"+sdate+"' ");
		 }else if(!"".equals(edate) && edate != null){
			 whereSql.append(" and timertn = '"+edate+"' ");
		 }
		 
		 //푸시알림 받기 Y한 이력만 전송
		 sql.append("select hogi, descstring, ");
		 //sql.append("timeact, ifnull(timertn,\"\") as timertn ");
		 sql.append("ifnull(timeact,\"\") as timeact , ifnull(timertn,\"\") as timertn ");
		 sql.append("from v_ae ");
		 sql.append("where 1=1 ");
		 sql.append(whereSql.toString());
		 sql.append("ORDER BY timeact desc ");

		 
		 
		 
//		 System.out.println(sql.toString());
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

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
				        case "MBF1":
				            rowObj.put("hogi", "Q01-HN01");
				            break;
				        case "MBF2":
				            rowObj.put("hogi", "Q01-HN02");
				            break;
				        case "MBF3":
				            rowObj.put("hogi", "Q01-HN03");
				            break;
				        case "MBF4":
				            rowObj.put("hogi", "Q01-HN04");
				            break;
				        case "MBF5":
				            rowObj.put("hogi", "Q01-HN05");
				            break;
				        case "MBF6":
				            rowObj.put("hogi", "Q01-HN06");
				            break;
				        default:
				            rowObj.put("hogi", "시스템 알람");
				            break;
				    }
				}
				
				rowObj.put("comment",rs.getString("descstring"));
				rowObj.put("time_h",rs.getString("timeact"));
				rowObj.put("time_r",rs.getString("timertn"));
				
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
