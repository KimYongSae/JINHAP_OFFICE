<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String query = 
	        "SELECT t1.hogi, t1.inspection_item, t1.oil_value, t1.a_value " +
	        "FROM tb_inspection t1 " +
	        "JOIN ( " +
	        "    SELECT hogi, MAX(inspection_date) AS max_date " +
	        "    FROM tb_inspection " +
	        "    WHERE inspection_date BETWEEN ? AND ? " +
	        "    GROUP BY hogi " +
	        ") t2 " +
	        "ON t1.hogi = t2.hogi AND t1.inspection_date = t2.max_date";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	JSONObject mainObj = new JSONObject();
	JSONArray mainArray = new JSONArray();
	
	try {
		pstmt = conn.prepareStatement(query);
        pstmt.setDate(1, java.sql.Date.valueOf(sdate));
        pstmt.setDate(2, java.sql.Date.valueOf(edate));
        rs = pstmt.executeQuery();
        boolean hasResults = false;
	while (rs.next()) {
		hasResults = true;
	    JSONObject rowObj = new JSONObject();
	    rowObj.put("hogi", rs.getInt("hogi"));
        rowObj.put("inspection_item", rs.getString("inspection_item"));
        rowObj.put("oil_value", rs.getString("oil_value") != null ? rs.getString("oil_value") : "");
        rowObj.put("a_value", rs.getString("a_value") != null ? rs.getString("a_value") : "");
        mainArray.add(rowObj);
	}
	
	mainObj.put("status", "ok");
	mainObj.put("rows", mainArray);
	
	} catch (SQLException e) {
	e.printStackTrace();
	mainObj.put("status", "error");
	mainObj.put("message", e.getMessage());
	} finally {
	if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	}
	
	out.print(mainObj.toJSONString());
	out.flush();
%>
