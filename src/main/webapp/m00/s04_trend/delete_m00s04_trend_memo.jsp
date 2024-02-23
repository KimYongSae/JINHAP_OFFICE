<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String tdatetime = request.getParameter("tdatetime2"); // 선택된 시간 값
	String memo = request.getParameter("memoText");  
	String memoC = request.getParameter("memoC");
	String hogi = request.getParameter("hogi");
	
	StringBuffer sql = new StringBuffer();
	StringBuffer fromSql = new StringBuffer();
	StringBuffer updateSql = new StringBuffer();
	
	
	switch (hogi) {
    case "1":
    	fromSql.append(" tb_temp1_memo ");
        break;
    case "2":
    	fromSql.append(" tb_temp2_memo ");
        break;
    case "3":
    	fromSql.append(" tb_temp3_memo ");
        break;
    case "4":
    	fromSql.append(" tb_temp4_memo ");
        break;
    case "5":
    	fromSql.append(" tb_temp5_memo ");
        break;
    case "6":
    	fromSql.append(" tb_temp6_memo ");
        break;
}
	
	
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet existCheck = null;
	ResultSet rs = null;
	try
	{

		sql.append(" SELECT EXISTS(SELECT 1 FROM ");
		sql.append(fromSql);
		sql.append(" WHERE 1 = 1 ");
		sql.append(" AND datetime1 = '"+tdatetime+"') ");
		
		stmt = conn.createStatement();
		existCheck = stmt.executeQuery(sql.toString());
		existCheck.next();
		int exists = existCheck.getInt(1); // getInt를 사용하여 결과 값(1 또는 0)을 가져옴

		if (exists == 1) {
		    updateSql.append(" UPDATE "+fromSql+" SET ");
			switch(memoC){
			case "소입1로":
			case "q1 메모":
				updateSql.append(" q1_memo = ''");
				
				break;
			case "소입2로":
			case "q2 메모":
				updateSql.append(" q2_memo = ''");
				
				break;
			case "소입3로":
			case "q3 메모":
				updateSql.append(" q3_memo = ''");
				
				break;
			case "소입4로":
			case "q4 메모":
				updateSql.append(" q4_memo = ''");
				
				break;
			case "소입5로":
			case "q5 메모":
				updateSql.append(" q5_memo = ''");
				
				break;
			case "소려1로":
			case "t1 메모":
				updateSql.append(" t1_memo = ''");
				
				break;
			case "소려2로":
			case "t2 메모":
				updateSql.append(" t2_memo = ''");
				
				break;
			case "소려3로":
			case "t3 메모":
				updateSql.append(" t3_memo = ''");
				
				break;
			case "소려4로":
			case "t4 메모":
				updateSql.append(" t4_memo = ''");
				
				break;
			case "유조":
			case "oil 메모":
				updateSql.append(" oil_memo = ''");
				
				break;
			case "세정기":
			case "a 메모":
				updateSql.append(" a_memo = ''");
				
				break;
			case "CP":
			case "cp 메모":
				updateSql.append(" cp_memo = ''");
				
				break;
			
			}
			
		    updateSql.append(" WHERE datetime1 = '"+tdatetime+"' ");
		} else {
			response.setStatus(500);
			
		}

	    stmt2 = conn.createStatement();
	    int affectedRows = stmt.executeUpdate(updateSql.toString());

	    conn.commit();

		
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		out.print(sql.toString());
		out.print(updateSql.toString());
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(stmt2 != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		
	}
	
%>