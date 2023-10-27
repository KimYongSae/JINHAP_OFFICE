<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%
	String checkname = "";
	String chkLevel = "";
	String chkID = "";
	
	checkname = (String)session.getAttribute("sname");
	if (checkname == null){
		checkname = "";
	}
	
	chkLevel = (String)session.getAttribute("slevel");
	if (chkLevel == null){
		chkLevel = "";
	}

	chkID = (String)session.getAttribute("sid");
	if (chkID == null){
		chkID = "";
	}


%>

<%@include file="../db/DBConnector.jsp" %>

<%

JSONObject root = new JSONObject();

//오늘날짜에서 한달 전
Date now = new Date();

Calendar cal = Calendar.getInstance();	//전

cal.setTime(now);
//cal.add(Calendar.MONTH, -1);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

String n_time = sdf.format(cal.getTime());

//열전대
StringBuffer sql = new StringBuffer();
StringBuffer sql2 = new StringBuffer();

Statement stmt2 = null;
ResultSet rs2 = null;


//O2센서
StringBuffer o2_sql = new StringBuffer();
StringBuffer o2_sql2 = new StringBuffer();

Statement o2_stmt = null;
Statement o2_stmt2 = null;

ResultSet o2_rs = null;
ResultSet o2_rs2 = null;

Statement stmt = null;
ResultSet rs = null;


try {
	sql.append("SELECT cnt, change_ndate, hogi, seolbi ");
	sql.append("FROM tb_theomor ");
	sql.append("WHERE LEFT(DATE_ADD(concat(change_ndate,'-01'), INTERVAL -1 MONTH),7) = '"+n_time+"' ");
	
	
	o2_sql.append("SELECT cnt, change_ndate, hogi ");
	o2_sql.append("FROM tb_o2sensor ");
	o2_sql.append("WHERE LEFT(DATE_ADD(CONCAT(change_ndate,'-01'), INTERVAL -1 MONTH),7) = '"+n_time+"' ");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql.toString());
	JSONArray mainArray = new JSONArray();
	while(rs.next()){
		sql2.setLength(0);
		sql2.append("SELECT cnt, change_date, change_ndate, hogi, seolbi, buy_date ");
		sql2.append("FROM tb_theomor ");
		sql2.append("WHERE year1 = LEFT('"+n_time+"',4) AND hogi = '"+rs.getString("hogi")+"' ");
		sql2.append("AND seolbi = '"+rs.getString("seolbi")+"' ");
		sql2.append("AND change_date = '' ");		
		sql2.append("AND buy_date = '' ");		
		sql2.append("ORDER BY hogi, cnt ");
		
		stmt2 = conn.createStatement();
		rs2 = stmt2.executeQuery(sql2.toString());
		while(rs2.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("ndate",rs.getString("change_ndate").replace("-","년")+"월");
			rowObj.put("hogi",rs2.getString("hogi"));
			rowObj.put("seolbi",rs2.getString("seolbi"));
			rowObj.put("cnt",rs2.getInt("cnt"));
			rowObj.put("buy_date",rs2.getString("buy_date"));
			
			mainArray.add(rowObj);
		}
		
	}
	
	o2_stmt = conn.createStatement();
	o2_rs = o2_stmt.executeQuery(o2_sql.toString());
	JSONArray o2_mainArray = new JSONArray();
	
	while(o2_rs.next()){
		o2_sql2.setLength(0);
		o2_sql2.append("SELECT cnt, change_date, change_ndate, hogi, buy_date ");
		o2_sql2.append("FROM tb_o2sensor ");
		o2_sql2.append("WHERE year1 = LEFT('"+n_time+"',4) AND hogi = '"+o2_rs.getString("hogi")+"' ");
		o2_sql2.append("AND change_date = '' AND buy_date = '' ");
//		o2_sql2.append("AND buy_date = '' ");
		o2_sql2.append("ORDER BY hogi, cnt ");
//		System.out.println(o2_sql2.toString());
		
		o2_stmt2 = conn.createStatement();
		o2_rs2 = o2_stmt2.executeQuery(o2_sql2.toString());
		
		while(o2_rs2.next()){
			JSONObject o2_rowObj = new JSONObject();
			o2_rowObj.put("ndate",o2_rs.getString("change_ndate").replace("-","년")+"월");
			o2_rowObj.put("hogi",o2_rs2.getString("hogi"));
			o2_rowObj.put("cnt",o2_rs2.getInt("cnt"));
			o2_rowObj.put("buy_date",o2_rs2.getString("buy_date"));
			
			o2_mainArray.add(o2_rowObj);
				
		}
	}
	
//	System.out.println(mainArray);
	
	
	root.put("pop",mainArray);
	root.put("o2_pop",o2_mainArray);
	
	JSONArray children = new JSONArray();
	root.put("data", children);
	
		JSONObject obj = new JSONObject();
		obj.put("sec", checkname);
		obj.put("lev", chkLevel);
		obj.put("id", chkID);
		children.add(obj);

	
} catch (Exception e) {
	
	root.put("data", null);
	root.put("isSuccess", false);	
	root.put("message", e.getMessage());
	
} finally {
	// 개발중 테스트용
	root.clear();
	
	out.print(root);
	out.flush();
	
}

%>