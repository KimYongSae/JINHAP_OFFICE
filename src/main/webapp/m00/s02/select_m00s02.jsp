<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		int hogi = Integer.parseInt(request.getParameter("hogi"));
		String sdate = request.getParameter("s_date");
		String edate = request.getParameter("e_date");

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
		 
		 if(!"".equals(sdate) && sdate != null){
			 whereSql.append(" and tdate between '"+sdate+"' and '"+edate+"' ");
		 }
		 
		 //푸시알림 받기 Y한 이력만 전송
		 sql.append("SELECT COUNT(*) AS cnt, descstring, areamask ");
		 sql.append("from v_ae ");
		 sql.append("where 1=1 ");
		 sql.append(whereSql.toString());
		 sql.append("GROUP BY descstring ");
		 sql.append("order by cnt desc ");
		 
		 
		 
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
				

			    switch (rs.getString("areamask")) {
			        case "1":
			            rowObj.put("hogi", "Q01-HN01");
			            break;
			        case "2":
			            rowObj.put("hogi", "Q01-HN02");
			            break;
			        case "4":
			            rowObj.put("hogi", "Q01-HN03");
			            break;
			        case "8":
			            rowObj.put("hogi", "Q01-HN04");
			            break;
			        case "16":
			            rowObj.put("hogi", "Q01-HN05");
			            break;
			        case "32":
			            rowObj.put("hogi", "Q01-HN06");
			            break;
			        default:
			            rowObj.put("hogi", "시스템 알람");
			            break;
			    }
				
				rowObj.put("descstring",rs.getString("descstring"));	//알람내용
				rowObj.put("cnt",rs.getString("cnt"));					//발생횟수
				
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
