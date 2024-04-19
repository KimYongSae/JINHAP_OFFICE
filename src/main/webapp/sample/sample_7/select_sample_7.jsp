<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	
	String result = "";
	StringBuilder sql = new StringBuilder();	 
	 
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.q1_pv, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 1) AS hj cross JOIN tb_temp1_now AS tn ");
	sql.append("UNION ");
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.q1_pv, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 2) AS hj cross JOIN tb_temp2_now AS tn ");
	sql.append("UNION ");
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.q1_pv, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 3) AS hj cross JOIN tb_temp3_now AS tn ");
	sql.append("UNION ");
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.qt12, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 4) AS hj cross JOIN tb_temp4_now AS tn ");
	sql.append("UNION ");
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.qt12, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 5) AS hj cross JOIN tb_temp5_now AS tn ");
	sql.append("UNION ");
	sql.append("SELECT hj.hogi, hj.proc_gb, tn.q1_pv, tn.q2_pv, tn.q3_pv, tn.q4_pv, tn.q5_pv, tn.t1_pv, tn.t2_pv, tn.t3_pv, tn.t4_pv, tn.oil_pv, tn.a_pv, tn.cp_pv ");
	sql.append("FROM (SELECT * from tb_hogi_job WHERE hogi = 6) AS hj cross JOIN tb_temp6_now AS tn ");
	
	JSONObject mainObj = new JSONObject();  

	Statement stmt = null;
	ResultSet rs = null;

		     try {
		    	 
		    	stmt = conn.createStatement();
		    	rs = stmt.executeQuery(sql.toString());
		 		int rowCount = rs.last() ? rs.getRow() : 0;  
				rs.beforeFirst();  		
				
				mainObj.put("total", String.valueOf(rowCount));
				mainObj.put("status", String.valueOf("ok"));		    	 
		 		JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 
		 			JSONObject rowObj = new JSONObject();
					rowObj.put("hogi",rs.getInt("hogi"));
					rowObj.put("autoChk",rs.getInt("proc_gb"));
					rowObj.put("q1",rs.getInt("q1_pv"));
					rowObj.put("q2",rs.getInt("q2_pv"));
					rowObj.put("q3",rs.getInt("q3_pv"));
					rowObj.put("q4",rs.getInt("q4_pv"));
					rowObj.put("q5",rs.getInt("q5_pv"));
					rowObj.put("t1",rs.getInt("t1_pv"));
					rowObj.put("t2",rs.getInt("t2_pv"));
					rowObj.put("t3",rs.getInt("t3_pv"));
					rowObj.put("t4",rs.getInt("t4_pv"));
					rowObj.put("oil",rs.getInt("oil_pv"));
					rowObj.put("a",rs.getInt("a_pv"));
					rowObj.put("cp",rs.getInt("cp_pv"));
					
					mainArray.add(rowObj);
		    	 }
		       
		    	mainObj.put("rows",mainArray);
		    	 
		       result = mainObj.toJSONString();
		     }	
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				out.print(mainObj);
				out.flush();
				if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
				if(rs != null) try {rs.close();}catch(SQLException sqle){}
				if(conn != null) try {conn.close();}catch(SQLException sqle){}		
			}
			/*
				//유니크 값이 없을 경우
				out.print(mainObj);
				out.flush();
			*/
%>
