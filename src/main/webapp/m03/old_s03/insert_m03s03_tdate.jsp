<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdate = request.getParameter("tdate");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int gb = Integer.parseInt(request.getParameter("gb"));
	
	
	StringBuffer u_sql = new StringBuffer();

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		switch(gb){
			case 1 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 2 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 3 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 4 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 5 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 6 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 7 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 8 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 9 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 10 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 11:
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 12 :
				u_sql.append("UPDATE tb_sat_file SET tdate_"+gb+" = '"+tdate+"' ");
				u_sql.append("WHERE cnt = "+cnt+" ");
			break;			
		}
		

		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.executeUpdate();
		
		
		conn.commit();	

		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>