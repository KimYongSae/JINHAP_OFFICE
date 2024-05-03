<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String cnt = request.getParameter("cnt");
		String seolbi = request.getParameter("seolbi");
		String componentName = request.getParameter("component_name");
		String usageLocation = request.getParameter("usage_location");
		String specifications = request.getParameter("specifications");
		String manufacturer = request.getParameter("manufacturer");
		String replacementFrequency = request.getParameter("replacement_frequency");
		String purchaseCycle = request.getParameter("purchase_cycle");
		String currentStock = request.getParameter("current_stock");
		String safetyStock = request.getParameter("safety_stock");
		String shortageStock = request.getParameter("shortage_stock");
		String unit = request.getParameter("unit");
		String storageLocation = request.getParameter("storage_location");
		String rackNumber = request.getParameter("rack_number");
		String purchaseRequest = request.getParameter("purchase_request");
		String remarks = request.getParameter("remarks");

	    	
		PreparedStatement pstmt = null;  
	    String sql = "UPDATE tb_spare SET seolbi = ?, component_name = ?, usage_location = ?, specifications = ?, manufacturer = ?, replacement_frequency = ?, purchase_cycle = ?, current_stock = ?, safety_stock = ?, shortage_stock = ?, unit = ?, storage_location = ?, rack_number = ?, purchase_request = ?, remarks = ? WHERE cnt = ?";

	     
	    try {  
	       
	    	pstmt = conn.prepareStatement(sql);
	       
	    	pstmt.setString(1, seolbi);
	    	pstmt.setString(2, componentName);
	    	pstmt.setString(3, usageLocation);
	    	pstmt.setString(4, specifications);
	    	pstmt.setString(5, manufacturer);
	    	pstmt.setString(6, replacementFrequency);
	    	pstmt.setString(7, purchaseCycle);
	    	pstmt.setString(8, currentStock);
	    	pstmt.setString(9, safetyStock);
	    	pstmt.setString(10, shortageStock);
	    	pstmt.setString(11, unit);
	    	pstmt.setString(12, storageLocation);
	    	pstmt.setString(13, rackNumber);
	    	pstmt.setString(14, purchaseRequest);
	    	pstmt.setString(15, remarks);
	    	pstmt.setString(16, cnt);

	        
	        pstmt.executeUpdate();
	        
	        conn.commit();
	     }	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		//out.flush();
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>
