<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector.jsp" %>

<%

		String wdate = request.getParameter("wdate");
		String hogi = request.getParameter("hogi");
//		System.out.println("sdate : "+sdate+", edate : "+edate+", stime : "+stime+", etime : "+etime);
		
		
		 String result = "";
		 StringBuffer sql = new StringBuffer();
		 
		 StringBuffer whereSql = new StringBuffer();
		 if(!"".equals(wdate) && wdate != null){
			 whereSql.append(" and wdate = '"+wdate+"' ");
		 }
		 
			 whereSql.append(" and hogi = "+hogi+" ");
		 
		 
		JSONObject mainObj = new JSONObject();  
		 
		sql.append("select count(*) as ccnt ");
		sql.append("from tb_lotlist ");
		sql.append("where 1=1 ");
		sql.append(whereSql.toString());
		 
		 
//		 System.out.println(sql.toString());		 
		 


			     try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql.toString());
				    int rowCount = rs.last() ? rs.getRow() : 0;	
				    rs.beforeFirst(); 				    
					JSONArray mainArray = new JSONArray();
					
					while(rs.next()){
						JSONObject rowObj = new JSONObject();
						rowObj.put("lotno",wdate.replace("-","")+"-QT"+String.format("%03d",hogi)+"-"+String.format("%03d",(rs.getInt("ccnt")+1)));
							
						
						
						mainArray.add(rowObj);
					}
			       
			       result = mainObj.toJSONString();
			       mainObj.put("status", String.valueOf("ok"));			       
			       mainObj.put("rows",mainArray);
			       
			       
//			       System.out.println(mainArray);
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
