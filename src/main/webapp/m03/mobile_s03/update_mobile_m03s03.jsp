<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");


	Enumeration<String> parameterNames = request.getParameterNames();
	int hogi = Integer.parseInt(request.getParameter("hogi"));
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));

	
	
	StringBuffer u_sql = new StringBuffer();
	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
	
		conn.setAutoCommit(false);
		while (parameterNames.hasMoreElements()) {
			
			String param = parameterNames.nextElement();
			if(!param.equals("hogi") && !param.equals("year") && !param.equals("month") 
					&& !param.equals("day") && !param.equals("special") && !param.equals("sat_special")){
				String value = request.getParameter(param);
				
				String[] paramArray = param.split("_");
				
				String zone = paramArray[0];
				String category = "";
				String whereSql = "";
				switch(paramArray[1]){
				case "sh" :
					category = "과승";
					whereSql = "tb_fproof";
					break;
				case "sc" :
					category = "과냉";
					whereSql = "tb_fproof";
					break;
				case "min" :
					category = "하한";
					whereSql = "tb_fproof";
					break;
				case "max" :
					category = "상한";
					whereSql = "tb_fproof";
					break;
				case "set" :
					category = "설정";
					whereSql = "tb_sat";
					break;
				case "instructions" :
					category = "지시";
					whereSql = "tb_sat";
					break;
				case "measurements" :
					category = "측정";
					whereSql = "tb_sat";
					break;
				}
				
				u_sql.append("UPDATE "+whereSql+" SET day"+day+" = ? WHERE year1 = ? AND month1 = ? AND hogi = ? AND zone = ? AND category = ?");
				pstmt = conn.prepareStatement(u_sql.toString());
				if(category.equals("과승") || category.equals("과냉")){
					if(value.equals("on")){
						value = "O";
					} else{
						value = "X";
					}
				}
				pstmt.setString(1, value);
				pstmt.setInt(2, year);
				pstmt.setInt(3, month);
				pstmt.setInt(4, hogi);
				pstmt.setString(5, zone);
				pstmt.setString(6, category);
				
				pstmt.executeUpdate();
				u_sql = new StringBuffer();
			} else if(param.equals("special") || param.equals("sat_special")){
				String value = request.getParameter(param);
				String whereSql = "";
				if(param.equals("special")){
					whereSql = "tb_fproof";
				} else{
					whereSql = "tb_sat";
				}
				
				u_sql.append("UPDATE "+whereSql+" SET day"+day+" = ? WHERE year1 = ? AND month1 = ? AND hogi = ? AND zone = ?");
				pstmt = conn.prepareStatement(u_sql.toString());
				pstmt.setString(1, value);
				pstmt.setInt(2, year);
				pstmt.setInt(3, month);
				pstmt.setInt(4, hogi);
				pstmt.setString(5, "special");
				
				pstmt.executeUpdate();
				u_sql = new StringBuffer();
			}
		
		}
		
		conn.commit();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>