<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer sql1 = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	StringBuffer sql3 = new StringBuffer();	
	
	
	StringBuffer whereSql = new StringBuffer();
	 
	JSONObject mainObj = new JSONObject();  

	//이전 작업
	sql.append("SELECT * ");
	sql.append("FROM ( ");
	sql.append("	SELECT *, ");
	sql.append("		LAG(regtime) OVER(ORDER BY regtime DESC) AS b_regtime ");
	sql.append("	FROM ( ");
	sql.append("		SELECT hogi, CASE WHEN num = 1 THEN '현재작업' ");
	sql.append("						WHEN num = 2 THEN '이전작업' END work_gb, ");
	sql.append("				lot, pnum, pname, gang, t_gb, num, ");
	sql.append("				LEFT(regtime,19) AS regtime  ");
	sql.append("		FROM ( ");
	sql.append("			SELECT lot, pnum, pname, gang, t_gb, hogi, regtime, ");
	sql.append("					ROW_NUMBER() OVER(PARTITION BY hogi ORDER BY regtime DESC) AS num ");
	sql.append("			FROM tb_out_log ");
	sql.append("			WHERE input_gb = 'W' ");
	sql.append("			ORDER BY hogi, regtime DESC ");
	sql.append("		) AS aa ");
	sql.append("		ORDER BY regtime DESC ");
	sql.append("	) AS outs ");
	sql.append("	LEFT OUTER JOIN ");
	sql.append("		tb_recipe rep ");
	sql.append("	ON outs.pnum = rep.item_cd ");
	sql.append("	WHERE 1=1 ");
	sql.append("	AND hogi = '1' ");
	sql.append("	ORDER BY regtime DESC ");	
	sql.append(") AS b ");
	sql.append("WHERE 1=1 ");
	
	

	//오라클(MariaDB) 이력테이블에서 해당 제품의 장입량 조회
	

	//호기, 품번, 로트별 통 수

	Statement stmt = null;
	ResultSet rs = null;
	Statement stmt1 = null;
	ResultSet rs1 = null;
	Statement stmt2 = null;
	ResultSet rs2 = null;
	 
	try {
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		JSONArray bArray = new JSONArray();
		
		
		while(rs.next()){
			JSONObject bObj = new JSONObject();
			bObj.put("pname", rs.getString("pname"));
			bArray.add(bObj);
		}		
			
			
		mainObj.put("status", "OK");		
		mainObj.put("rows", bArray);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		out.print(mainObj);
		out.flush();
			
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		
		if(stmt1 != null) try {stmt1.close();}catch(SQLException sqle){}
		if(rs1 != null) try {rs1.close();}catch(SQLException sqle){}

		
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
%>
