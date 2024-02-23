<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>

<%		
		
		String b_code = request.getParameter("b_code");
		String bd_code = request.getParameter("bd_code");
		String bd_type = request.getParameter("bd_type");
		String bd_memo = request.getParameter("bd_memo");
		String bd_date = request.getParameter("bd_date");

		
		CallableStatement csmt = null;
		
		try
		{
			csmt = conn.prepareCall("{call sp_detail_set(?,?,?,?,?)}");
			csmt.setString(1,b_code);
			csmt.setString(2,bd_date);
			csmt.setString(3,bd_type);
			csmt.setString(4,bd_memo);
			csmt.setString(5,bd_code);
			
			csmt.executeUpdate();
	    	
			//System.out.println(csmt.toString());

	    	conn.commit();
			//System.out.println(b_code);
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