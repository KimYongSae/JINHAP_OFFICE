<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector.jsp" %>
<%@include file="DBConnector_Oracle_pop.jsp" %>

<%

		String hogi = request.getParameter("hogi");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		
		
		

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 StringBuffer qtySql = new StringBuffer();
		 StringBuffer popSql = new StringBuffer();
		 
		 StringBuffer weightSql = new StringBuffer();
		 
		 StringBuffer whereSql = new StringBuffer();
		 
		 
		 
		 if(!"".equals(hogi) && hogi != null){
		 	whereSql.append(" AND hogi = '"+hogi+"' ");
		 }
		 
		 if(!"".equals(sdate) && sdate != null && !"".equals(edate) && edate != null){
			 whereSql.append(" AND (LEFT(process_code,6) BETWEEN '"+sdate.replace("-","").substring(2,8)+"' AND '"+edate.replace("-","").substring(2,8)+"') ");
		 }
		 
		 
		 sql.append("SELECT cnt, hogi, process_code, '' AS pno, model, spec, '0' AS qty, ");
		 sql.append("'0' AS weight, '비고' AS bigo, LEFT(work_start,10) AS wdate, lotno, ");
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
					rowObj.put("hogi","3호기");
				}else if("QT002".equals(rs.getString("hogi"))){
					rowObj.put("hogi","4호기");	
				}else if("QT003".equals(rs.getString("hogi"))){
					rowObj.put("hogi","5호기");	
				}else if("QT004".equals(rs.getString("hogi"))){
					rowObj.put("hogi","6호기");	
				}else if("QT011".equals(rs.getString("hogi"))){
					rowObj.put("hogi","7호기");	
				}else if("QT012".equals(rs.getString("hogi"))){
					rowObj.put("hogi","8호기");	
				}
				
				rowObj.put("cnt",rs.getInt("cnt"));
				rowObj.put("wdate",rs.getString("wdate"));
				rowObj.put("hogi2",rs.getString("hogi"));
				rowObj.put("process_code",rs.getString("process_code"));
				
				rowObj.put("model",rs.getString("model"));
				rowObj.put("spec",rs.getString("spec"));
				
				
				rowObj.put("file_yn",rs.getString("file_yn"));
				
				popSql.append("SELECT A.BUBUN AS BUBUN, B.MODEL_NAME AS MODEL_NAME, ");
				popSql.append("B.MODEL_DESC AS MODEL_DESC, ");			
				popSql.append("MAX(TO_CHAR(A.e_work_date,'yyyy-MM-dd HH24:MI:ss')) AS edate, ");
				popSql.append("MAX(TSM.IN_QTY) AS IN_QTY, MAX(TSM.IN_WEIGHT) AS IN_WEIGHT ");
			    popSql.append("FROM WORK_PROCESS_MST A, PM_MODEL_MST B, ");
			    popSql.append("PS_LOT_MST C, TS_STOCK_MST TSM, WORK_PROC_MST_SCAN WS ");
				popSql.append("WHERE A.LOT_NO = C.LOT_NO ");
			    popSql.append("AND C.MODEL_CODE = B.MODEL_CODE ");
			    popSql.append("AND A.LOT_NO = TSM.WORK_LOT_NO ");
			    popSql.append("AND A.JUST_PROCESS_CODE = TSM.PROCESS_CODE1 ");
			    popSql.append("AND A.BOX_NO = TSM.BOX_NO ");
			    popSql.append("AND A.LOT_NO = WS.LOT_NO ");
			    popSql.append("AND A.PROCESS_CODE = WS.PROCESS_CODE ");
			    popSql.append("AND A.BOX_NO = WS.BOX_NO ");
			    popSql.append("AND WS.REWORK_FLAG = (SELECT REWORK_FLAG FROM WORK_PROC_MST_SCAN WPS WHERE WPS.LOT_NO =A.LOT_NO AND WPS.PROCESS_CODE = A.PROCESS_CODE AND WPS.BOX_NO = A.BOX_NO AND ROWNUM = 1) ");
			    popSql.append("AND A.facility_code = '"+hogi+"' ");
			    popSql.append("AND A.PROCESS_CODE = '0100' ");
			    popSql.append("AND A.process_lot_no = '"+rs.getString("process_code")+"'");
//			    popSql.append("AND A.work_date = '"+t_format.format(time)+"' ");
			    popSql.append("GROUP BY A.BUBUN, B.MODEL_NAME, B.MODEL_DESC ");				
				
				
				qtySql.append("SELECT model_code, input_qty ");
				qtySql.append("FROM PS_LOT_MST ");
				qtySql.append("WHERE lot_no = '"+rs.getString("lotno")+"' ");
				stmt_pop = conn_pop.createStatement();
				rs_pop = stmt_pop.executeQuery(qtySql.toString());
				while(rs_pop.next()){
					rowObj.put("pno",rs_pop.getString("model_code"));
					rowObj.put("qty",rs_pop.getString("input_qty"));
					
					weightSql.append("SELECT model_code, model_name, model_desc, weight ");
					weightSql.append("FROM PM_MODEL_MST ");
					weightSql.append("WHERE model_code = '"+rs_pop.getString("modeL_code")+"' ");
					stmt_pop2 = conn_pop.createStatement();
					rs_pop2 = stmt_pop2.executeQuery(weightSql.toString());
					while(rs_pop2.next()){
						rowObj.put("weight",Math.round(rs_pop.getInt("input_qty") * (rs_pop2.getDouble("weight")/100) )+"");
					}
					

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
		
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		if(conn_pop != null) try {conn_pop.close();}catch(SQLException sqle){}
	}
		 
%>
