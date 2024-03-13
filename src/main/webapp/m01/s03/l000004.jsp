<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector.jsp" %>
<%@include file="DBConnector_Oracle_pop.jsp" %>
<%@include file="DBConnector_Oracle_erp.jsp" %>

<%

		String hogi = request.getParameter("hogi");
		String sdate = request.getParameter("sdate");
//		String edate = request.getParameter("edate");
		
		
		

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer qtySql = new StringBuffer();
		 StringBuffer popSql = new StringBuffer();
		 
		 StringBuffer erpSql = new StringBuffer();
		 
		 StringBuffer weightSql = new StringBuffer();
		 
		 StringBuffer whereSql = new StringBuffer();
		 
		 DecimalFormat df = new DecimalFormat("#,###");
		 
		 
		 if(!"".equals(hogi) && hogi != null){
			 whereSql.append(" AND hogi = '"+hogi+"' ");
		 }
//		 System.out.println(hogi+", "+whereSql.toString());
		 
		 if(!"".equals(sdate) && sdate != null){
//			 whereSql.append(" AND LEFT(process_code,6) = DATE_FORMAT(DATE_ADD('"+sdate+"',INTERVAL -1 DAY),'%y%m%d') ");
			 whereSql.append(" AND LEFT(process_code,6) = DATE_FORMAT('"+sdate+"','%y%m%d') ");
		 }
		 
		 
		 sql.append("SELECT cnt, hogi, process_code, '' AS pno, model, spec, '0' AS qty, ");
		 sql.append("'0' AS weight, '비고' AS bigo, LEFT(work_start,10) AS wdate, lotno, ");
		 sql.append("ROUND(IFNULL((TIMESTAMPDIFF(SECOND, work_start, input_end)/60),0)) AS hr, ");
		 sql.append("file_yn ");
		 sql.append("FROM tb_worker_time ");
		 sql.append("WHERE 1=1 ");
		 sql.append(whereSql.toString());
		 
//		 System.out.println(sql.toString());
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 Statement stmt_pop2 = null;
		 ResultSet rs_pop2 = null;
		 
	     try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
						
			while(rs.next()){
				qtySql.setLength(0);
				weightSql.setLength(0);
				
				
				JSONObject rowObj = new JSONObject();
				
				if("QT001".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT3");
				}else if("QT002".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT4");	
				}else if("QT003".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT5");	
				}else if("QT004".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT6");	
				}else if("QT011".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT7");	
				}else if("QT012".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT8");	
				}else if("QT013".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT9");	
				}
				
				rowObj.put("cnt",rs.getInt("cnt"));
				rowObj.put("wdate",rs.getString("wdate"));
				rowObj.put("hogi2",rs.getString("hogi"));
				rowObj.put("process_code",rs.getString("process_code"));
				
				rowObj.put("model",rs.getString("model"));
				rowObj.put("spec",rs.getString("spec"));
				
				
				rowObj.put("file_yn",rs.getString("file_yn"));
				
				
				rowObj.put("pno",null);
				rowObj.put("qty",null);
				rowObj.put("weight",null );
				rowObj.put("kghr",null );
				
					
				//pop에서 품번, 투입수량, 중량 가져오기
				popSql.setLength(0);
				popSql.append("SELECT facility_code, work_lot_no, model_code, ");
				popSql.append("roll_lot_no, qt_lot_no, customer_code, ");
				popSql.append("MAX(TO_CHAR(end_time,'yyyy-MM-dd HH24:MI:ss')) AS edate, ");
				popSql.append("SUM(in_qty) AS in_qty, SUM(in_weight) AS in_weight ");
				popSql.append("FROM TS_STOCK_MST ");
				popSql.append("WHERE qt_lot_no = '"+rs.getString("process_code")+"' ");
				popSql.append("AND FACILITY_CODE = '"+hogi+"' ");
				popSql.append("GROUP BY facility_code, work_lot_no, model_code, ");
				popSql.append("roll_lot_no, qt_lot_no, customer_code ");
				popSql.append("ORDER BY qt_lot_no, edate ");
				
				stmt_pop = conn_pop.createStatement();
				rs_pop = stmt_pop.executeQuery(popSql.toString());
				while(rs_pop.next()){
					rowObj.put("pno",rs_pop.getString("model_code"));
					rowObj.put("qty",String.format("%,d",rs_pop.getInt("in_qty")));
					rowObj.put("weight",String.format("%,d",Integer.parseInt(Math.round(rs_pop.getDouble("in_weight"))+"")) );
					rowObj.put("kghr",df.format(Math.round(rs_pop.getDouble("in_weight"))/rs.getDouble("hr")*60));

				}
				
				
				mainArray.add(rowObj);
				
			}	
			
				
//			System.out.println(mainArray);
	

			
			mainObj.put("rows",mainArray);
	       
	       conn.commit();
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
		
		if(stmt_pop != null) try {stmt_pop.close();}catch(SQLException sqle){}
		if(rs_pop != null) try {rs_pop.close();}catch(SQLException sqle){}		

		if(stmt_pop2 != null) try {stmt_pop2.close();}catch(SQLException sqle){}
		if(rs_pop2 != null) try {rs_pop2.close();}catch(SQLException sqle){}		

		if(stmt_erp != null) try {stmt_erp.close();}catch(SQLException sqle){}
		if(rs_erp != null) try {rs_erp.close();}catch(SQLException sqle){}		
		
		
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		if(conn_pop != null) try {conn_pop.close();}catch(SQLException sqle){}
		if(conn_erp != null) try {conn_erp.close();}catch(SQLException sqle){}
	}
		 
%>
