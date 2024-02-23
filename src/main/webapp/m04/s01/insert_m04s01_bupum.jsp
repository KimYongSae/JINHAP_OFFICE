<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>

<%		
		String b_name = request.getParameter("b_name");
		String b_detail = request.getParameter("b_detail");
		String b_hogi = request.getParameter("b_hogi");
		String b_code = request.getParameter("b_code");
		String b_loc = request.getParameter("b_loc");
		
		CallableStatement csmt = null;
		
		try
		{
					
			csmt = conn.prepareCall("{call sp_bupum_set(?,?,?,?,?)}");
			csmt.setString(1,b_code);
			csmt.setString(2,b_hogi);
			csmt.setString(3,b_name);
			csmt.setString(4,b_detail);
			csmt.setString(5,b_loc);
			
			csmt.executeUpdate();
	    	
			System.out.println(csmt.toString());

	    	conn.commit();
			System.out.println(b_code);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(csmt != null) try {csmt.close();}catch(SQLException sqle){}
			if(conn != null) try {conn.close();}catch(SQLException sqle){}
		}
		
	%>


<script language=javascript>
	self.window.alert("저장되었습니다.");
</script>