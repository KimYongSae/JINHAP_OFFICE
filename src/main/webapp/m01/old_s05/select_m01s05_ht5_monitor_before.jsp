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
	sql.append("	AND hogi = '5' ");
	sql.append("	ORDER BY regtime DESC ");	
	sql.append(") AS b ");
	sql.append("WHERE 1=1 ");
	sql.append("AND num = 2 ");
	
	


	//가장 최근 온도값
	sql1.append("SELECT (q1_sp*0.1) AS q1_sp, (q2_sp*0.1) AS q2_sp, ");
	sql1.append("(q3_sp*0.1) AS q3_sp, (q4_sp*0.1) AS q4_sp, ");
	sql1.append("(q5_sp*0.1) AS q5_sp, (oil_sp*0.1) AS oil_sp, ");
	sql1.append("(t1_sp*0.1) AS t1_sp, (t2_sp*0.1) AS t2_sp, ");
	sql1.append("(t3_sp*0.1) AS t3_sp, (t4_sp*0.1) AS t4_sp, ");
	sql1.append("(a_sp*0.1) AS a_sp, ");
	sql1.append("inv1_sp, inv2_sp, cp_sp, cp_sp ");
	sql1.append("FROM tb_temp5_log ");
	sql1.append("ORDER BY datetime1 DESC ");
	sql1.append("LIMIT 1 ");

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
		
//		System.out.println(sql.toString());
		
		JSONObject bObj = new JSONObject();
		while(rs.next()){
			//이전정보
			bObj.put("b_lot", rs.getString("lot"));
			bObj.put("b_pnum", rs.getString("pnum"));
			bObj.put("b_gangjong", rs.getString("gang"));
			bObj.put("b_pname", rs.getString("pname"));
			bObj.put("b_t_gb", rs.getString("t_gb"));
			
			bObj.put("b_weight", rs.getString("weight"));
			bObj.put("b_stime", rs.getString("regtime"));	

			bObj.put("b_q1", rs.getString("q_temp"));
			bObj.put("b_q2", rs.getString("q_temp"));
			bObj.put("b_q3", rs.getString("q_temp"));
			bObj.put("b_q4", rs.getString("q_temp"));
			bObj.put("b_q5", rs.getString("q_temp"));
			
			bObj.put("b_t1", rs.getString("t_temp"));
			bObj.put("b_t2", rs.getString("t_temp"));
			bObj.put("b_t3", rs.getString("t_temp"));
			bObj.put("b_t4", rs.getString("t_temp"));
			
			bObj.put("b_cp", rs.getFloat("cp")*1000);
			
			//투입 통 수
			String datetime = rs.getString("regtime").replace("-","").replace(":","").replace(" ","");
			String b_regtime = rs.getString("b_regtime").replace("-","").replace(":","").replace(" ","");
			
			sql2.setLength(0);
			sql2.append("SELECT COUNT(*) AS t_cnt ");
			sql2.append("FROM tb_tong_in ");
			sql2.append("WHERE 1=1 ");
			sql2.append("AND hogi = '5' ");
			sql2.append("AND datetiem1 >= '"+datetime+"' ");
			sql2.append("AND datetiem1 <= '"+b_regtime+"' ");
			
			stmt2 = conn.createStatement();
			rs2 = stmt2.executeQuery(sql2.toString());
			
			while(rs2.next()){
				bObj.put("b_tong_cnt", rs2.getInt("t_cnt"));
			}
		}
		
		
		stmt1 = conn.createStatement();
		rs1 = stmt1.executeQuery(sql1.toString());
		
		
		while(rs1.next()){

			
			bObj.put("b_oil", rs1.getString("oil_sp"));

			
			bObj.put("b_a", rs1.getString("a_sp"));
			
			bObj.put("b_q_inv", "5000");
			bObj.put("b_t_inv", "4500");

		}
		
			
			mainObj.put("status", "OK");
			
			bObj.put("b_lot_space", 8);		
		
		
		mainObj.put("rows", bObj);
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
