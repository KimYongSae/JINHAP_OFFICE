<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>


<%
		 String result = "";
		 
		 JSONObject mainObj = new JSONObject();  
		Date now = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Calendar b_cal = Calendar.getInstance();	//전
		Calendar a_cal = Calendar.getInstance();	//후
		Calendar n_cal = Calendar.getInstance();	//현재
		Calendar y_cal = Calendar.getInstance();	//어제날짜
		Calendar bw_cal = Calendar.getInstance();	//1주전
		Calendar lastYearCal = Calendar.getInstance();	//1년전
		
		n_cal.setTime(now);
		
		b_cal.setTime(now);
		b_cal.add(Calendar.HOUR, -1);
		
//		System.out.println("1시간  전 : "+b_cal.getTime());
//		System.out.println("1시간  전 : "+sdf.format(b_cal.getTime()));

//		System.out.println("1시간  전(날짜만) : "+sdf.format(b_cal.getTime()).substring(0,10));
//		System.out.println("1시간  전(시간만) : "+sdf.format(b_cal.getTime()).substring(11,19));
		

		a_cal.setTime(now);
		a_cal.add(Calendar.HOUR, 1);
		
		y_cal.setTime(now);
		y_cal.add(Calendar.DATE, -1);
		
		bw_cal.setTime(now);
		bw_cal.add(Calendar.DATE, -7);
		
		lastYearCal.setTime(now);
		lastYearCal.add(Calendar.YEAR, -1);

//		System.out.println("1시간  후 : "+a_cal.getTime());
//		System.out.println("1시간  후 : "+sdf.format(a_cal.getTime()));
		
		JSONArray mainArray = new JSONArray();
		JSONObject rowObj = new JSONObject();
		
		rowObj.put("n_date",sdf.format(n_cal.getTime()).substring(0,10));
		rowObj.put("n_time",sdf.format(n_cal.getTime()).substring(11,19));
		
		rowObj.put("b_date",sdf.format(b_cal.getTime()).substring(0,10));
		rowObj.put("b_time",sdf.format(b_cal.getTime()).substring(11,19));
		
		rowObj.put("a_date",sdf.format(a_cal.getTime()).substring(0,10));
		rowObj.put("a_time",sdf.format(a_cal.getTime()).substring(11,19));		

		rowObj.put("y_date",sdf.format(y_cal.getTime()).substring(0,10));
		
		rowObj.put("bw_date",sdf.format(bw_cal.getTime()).substring(0,10));

		rowObj.put("lastYear",sdf.format(lastYearCal.getTime()).substring(0,10));
		
		mainArray.add(rowObj);
		
		
       result = mainObj.toJSONString();
       mainObj.put("status", String.valueOf("ok"));			       
       mainObj.put("rows",mainArray);		
       
		out.print(mainObj);
		out.flush(); 
%>
