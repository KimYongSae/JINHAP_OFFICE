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
		 
		 
		 
		 if(!"".equals(hogi) && hogi != null){
		 	whereSql.append(" AND hogi = '"+hogi+"' ");
		 }
		 
		 if(!"".equals(sdate) && sdate != null){
			 whereSql.append(" AND LEFT(process_code,6) = DATE_FORMAT(DATE_ADD('"+sdate+"',INTERVAL -1 DAY),'%y%m%d') ");
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
				}
				
				rowObj.put("cnt",rs.getInt("cnt"));
				rowObj.put("wdate",rs.getString("wdate"));
				rowObj.put("hogi2",rs.getString("hogi"));
				rowObj.put("process_code",rs.getString("process_code"));
				
				rowObj.put("model",rs.getString("model"));
				rowObj.put("spec",rs.getString("spec"));
				
				
				rowObj.put("file_yn",rs.getString("file_yn"));
				
				popSql.setLength(0);
				popSql.append("SELECT A.BUBUN AS BUBUN, B.MODEL_NAME AS MODEL_NAME, ");
				popSql.append("B.MODEL_DESC AS MODEL_DESC, ");			
				popSql.append("MAX(TO_CHAR(A.e_work_date,'yyyy-MM-dd HH24:MI:ss')) AS edate, ");
				popSql.append("SUM(TSM.IN_QTY) AS IN_QTY, SUM(TSM.IN_WEIGHT) AS IN_WEIGHT ");
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
//			    popSql.append("AND A.facility_code = '"+hogi+"' ");
			    popSql.append("AND A.PROCESS_CODE = '0100' ");
			    popSql.append("AND A.process_lot_no = '"+rs.getString("process_code")+"' ");
//			    popSql.append("AND A.work_date = '"+t_format.format(time)+"' ");
			    popSql.append("GROUP BY A.BUBUN, B.MODEL_NAME, B.MODEL_DESC ");				
	
			    
				
				stmt_pop = conn_pop.createStatement();
				rs_pop = stmt_pop.executeQuery(popSql.toString());
				while(rs_pop.next()){
					rowObj.put("pno",rs_pop.getString("bubun"));
				}
				
				erpSql.setLength(0);
				erpSql.append("SELECT A.FACILITY_CODE, C.FACILITY_NAME, A.WORK_LOT_NO, A.MODEL_CODE, ");
				erpSql.append("E.MODEL_NAME, E.MODEL_DESC, A.ROLL_LOT_NO, A.QT_LOT_NO, A.WORK_FLAG, ");
				erpSql.append("DECODE(A.WORK_FLAG, '0', '대기', '1', '작업중', '2', '작업완료', '4', '보류') AS WORK_FLAG_NM, ");
				erpSql.append("B.PROCESS_CODE1, B.BOX_CNT, B.OUT_QTY, A.IN_QTY, A.IN_WEIGHT AS IN_WEIGHT, D.JIJIL_HT, ");
				erpSql.append("D.TEMPER, D.CP_MID, B.ROLL_LOT_CNT, ");
				erpSql.append("TO_CHAR(A.END_TIME,'yyyy-MM-dd HH24:MI:SS') AS end_time  ");
				erpSql.append("FROM ( ");
				erpSql.append("	SELECT A.FACILITY_CODE, A.PROCESS_CODE1, A.WORK_LOT_NO, A.MODEL_CODE, ");
				erpSql.append("	A.WORK_FLAG, A.ROLL_LOT_NO, A.QT_LOT_NO, MAX(A.END_TIME) END_TIME, ");
				erpSql.append("	SUM(IN_QTY) IN_QTY, SUM(IN_WEIGHT) IN_WEIGHT ");
				erpSql.append("	FROM POP.TS_STOCK_MST@POP_LINK A ");
				erpSql.append("	WHERE A.PROCESS_CODE1 = '0100' ");
				erpSql.append("	AND A.END_TIME BETWEEN SYSDATE -8 AND SYSDATE+1 ");
//				erpSql.append(" AND A.FACILITY_CODE LIKE '' ");
				erpSql.append("	GROUP BY A.FACILITY_CODE, ");
				erpSql.append("	A.PROCESS_CODE1, ");
				erpSql.append("	A.WORK_LOT_NO, ");
				erpSql.append("	A.MODEL_CODE, ");
				erpSql.append("	A.WORK_FLAG, ");
				erpSql.append("	A.ROLL_LOT_NO, ");
				erpSql.append("	A.QT_LOT_NO ");
				erpSql.append(") A ");
				erpSql.append("LEFT OUTER JOIN ");
				erpSql.append("( ");
				erpSql.append("	SELECT A.WORK_LOT_NO, A.PROCESS_CODE1, SUM(A.OUT_QTY) OUT_QTY, ");
				erpSql.append("	COUNT(DISTINCT A.BOX_NO) AS BOX_CNT, ");
				erpSql.append("	COUNT(DISTINCT A.ROLL_LOT_NO) AS ROLL_LOT_CNT ");
				erpSql.append("	FROM POP.TS_STOCK_BUFFER_MST@POP_LINK A, POP.LOT_ROUNTING_MST@POP_LINK C ");
				erpSql.append("	WHERE A.PROCESS_CODE1 = C.PROCESS_CODE ");
				erpSql.append("	AND A.WORK_LOT_NO = C.LOT_NO ");
				erpSql.append("	AND C.DEST_PROCESS = '0100' ");
				erpSql.append("	AND A.OUT_QTY <> 0 ");
				erpSql.append("	GROUP BY A.WORK_LOT_NO, A.PROCESS_CODE1 ");
				erpSql.append(") B ON (A.WORK_LOT_NO = B.WORK_LOT_NO) ");
				erpSql.append("LEFT OUTER JOIN POP.SF_FACILITY_MST@POP_LINK C ON (A.FACILITY_CODE = C.FACILITY_CODE) ");
				erpSql.append("LEFT OUTER JOIN QT_CM D ON (A.MODEL_CODE = D.ITNBR) ");
				erpSql.append("LEFT OUTER JOIN POP.PM_MODEL_MST@POP_LINK E ON (A.MODEL_CODE = E.MODEL_CODE) ");
				erpSql.append("WHERE qt_lot_no = '"+rs.getString("process_code")+"' ");
//				erpSql.append("AND end_time  ");
				erpSql.append("ORDER BY A.QT_LOT_NO ");
				
				stmt_erp = conn_erp.createStatement();
				rs_erp = stmt_erp.executeQuery(erpSql.toString());
				
				while(rs_erp.next()){
					rowObj.put("qty",String.format("%,d",rs_erp.getInt("in_qty")));
					rowObj.put("weight",String.format("%,d",Integer.parseInt(Math.round(rs_erp.getDouble("in_weight"))+"")) );
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
