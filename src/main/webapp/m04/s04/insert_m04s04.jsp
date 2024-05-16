<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");


	Enumeration<String> parameterNames = request.getParameterNames();
	String hogi = request.getParameter("hogi");
	String date = request.getParameter("date");

	String[] inspectionItems = {"rf-chain", "top-gear", "top-sprocket", "top-bearing", "bottom-sprocket", "bottom-gear", "bottom-bearing", "chain"};
     
	String query = 
	        "INSERT INTO tb_inspection (hogi, inspection_date, inspection_item, oil_value, oil_bigo, a_value, a_bigo) " +
	        "VALUES (?, ?, ?, ?, ?, ?, ?) " +
	        "ON DUPLICATE KEY UPDATE " +
	        "oil_value = VALUES(oil_value), " +
	        "oil_bigo = VALUES(oil_bigo), " +
	        "a_value = VALUES(a_value), " +
	        "a_bigo = VALUES(a_bigo)";

	PreparedStatement pstmt = null;
	try{
		pstmt = conn.prepareStatement(query);
		
		for (String item : inspectionItems) {
            String oilValue = request.getParameter(item + "_oil");
            String oilBigo = request.getParameter(item + "_oil_bigo");
            String aValue = request.getParameter(item + "_a");
            String aBigo = request.getParameter(item + "_a_bigo");

            pstmt.setInt(1, Integer.parseInt(hogi));
            pstmt.setDate(2, java.sql.Date.valueOf(date));
            pstmt.setString(3, item);
         // oilValue가 null이거나 빈 문자열인 경우 0으로 설정
            pstmt.setFloat(4, (oilValue != null && !oilValue.isEmpty()) ? Float.parseFloat(oilValue) : 0);
            pstmt.setString(5, oilBigo);

            // aValue가 null이거나 빈 문자열인 경우 0으로 설정
            pstmt.setFloat(6, (aValue != null && !aValue.isEmpty()) ? Float.parseFloat(aValue) : 0);
            pstmt.setString(7, aBigo);
			
            pstmt.executeUpdate();
        }
		conn.commit();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>