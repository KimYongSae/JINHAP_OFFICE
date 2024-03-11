<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="DBConnector_Oracle_erp.jsp" %>
<%@include file="DBConnector_Oracle_pop.jsp" %>
<%@include file="DBConnector.jsp" %>

<%

		String sdate = request.getParameter("sdate");
//		String edate = request.getParameter("edate");
		String hogi = request.getParameter("hogi");
		String lotno = request.getParameter("lotno");
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		
		String r_now = sdf.format(now);
		
		
		 String result = "";
		 StringBuffer sql = new StringBuffer();
		 StringBuffer lot_qty = new StringBuffer();
		 StringBuffer lot_weight = new StringBuffer();

		 StringBuffer w_start = new StringBuffer();
		 
		 
		 StringBuffer whereSql = new StringBuffer();
		 
		 JSONObject mainObj = new JSONObject();  
//		 System.out.println(sdate+", "+edate);
		 /*
		 if(!"".equals(sdate) && sdate != null && !"".equals(edate) && edate != null){
			 
			 whereSql.append(" and substr(work_lot_no,1,8) between '"+sdate.replace("-","")+"' and '"+edate.replace("-","")+"' ");
		 }
		 */
		 
		 if(!"".equals(sdate) && sdate != null){
//			whereSql.append(" and REPLACE(END_TIME,'/') = SUBSTR('"+sdate.replace("-","")+"',3,6) ");
//			whereSql.append(" AND TO_CHAR(END_TIME,'yyyy-MM-dd') BETWEEN '"+sdate+"' AND '"+edate+"' ");
		 }
		 
		 
		 
		 if(!"".equals(hogi) && hogi != null){
			// if("QT013".equals(hogi)){
			//	 whereSql.append(" and facility_code = 'QT012' ");
			 //}else{
				 whereSql.append(" and facility_code = '"+hogi+"' ");	 
			 //}
			 
		 }
		 		 
		 /*
		 		rCnt.append(" AND (TO_CHAR(e_work_date,'yyyy-MM-dd HH24:MI:ss') BETWEEN  ");
		rCnt.append("TO_CHAR(TO_DATE('"+date+"','yyyy-MM-dd')-1,'yyyy-MM-dd')||' '||'08:30:00' AND '"+date+"'||' '||'08:29:59') ");
		 */
		sql.append("SELECT A.FACILITY_CODE, C.FACILITY_NAME, A.WORK_LOT_NO ");
        sql.append(", A.MODEL_CODE, E.MODEL_NAME, E.MODEL_DESC, A.WORK_FLAG ");
        sql.append(", A.QT_LOT_NO, A.ROLL_LOT_NO ");
        sql.append(", DECODE(A.WORK_FLAG, '0', '대기', '1', '작업중', '2', '작업완료', '4', '보류') AS WORK_FLAG_NM ");
        sql.append(", B.PROCESS_CODE1, NVL(B.BOX_CNT, 0) AS BOX_CNT, NVL(B.OUT_QTY,0) AS OUT_QTY, ");
        sql.append("A.IN_QTY, A.IN_WEIGHT, D.JIJIL_HT , D.TEMPER, D.CP_MID ");
        sql.append(",TO_CHAR(A.END_TIME,'yyyy-MM-dd HH24:MI:SS') AS END_TIME ");
        sql.append("FROM ");
        sql.append("( ");
        sql.append("SELECT A.FACILITY_CODE, A.PROCESS_CODE1, A.WORK_LOT_NO ");
        sql.append(", A.MODEL_CODE, A.WORK_FLAG, A.QT_LOT_NO, A.ROLL_LOT_NO ");
        sql.append(", MAX(A.END_TIME) END_TIME, SUM(IN_QTY) IN_QTY, SUM(IN_WEIGHT) IN_WEIGHT ");
        sql.append("FROM POP.TS_STOCK_MST@POP_LINK A ");
        sql.append("WHERE A.PROCESS_CODE1 = '0100' ");
	    sql.append("AND A.END_TIME BETWEEN SYSDATE -7 AND SYSDATE+1 ");
//	    sql.append("AND A.END_TIME BETWEEN SYSDATE -32 AND SYSDATE+1 ");
		sql.append("AND TO_CHAR(A.END_TIME,'yyyy-MM-dd HH24:MI:SS') BETWEEN ");
		sql.append("'"+sdate+"'||' '||'08:30:00' ");
		sql.append("AND TO_CHAR(TO_DATE('"+sdate+"','yyyy-MM-dd')+1,'yyyy-MM-dd')||' '||'08:29:59' ");
	    sql.append("GROUP BY A.FACILITY_CODE, A.PROCESS_CODE1 ");
        sql.append(", A.WORK_LOT_NO, A.MODEL_CODE, A.WORK_FLAG ");
        sql.append(", A.QT_LOT_NO, A.ROLL_LOT_NO ");
        sql.append(") A ");
        sql.append("LEFT OUTER JOIN ");
		sql.append("( ");
		sql.append("SELECT  A.WORK_LOT_NO, A.PROCESS_CODE1, SUM(A.OUT_QTY) OUT_QTY ");
		sql.append(", COUNT(DISTINCT A.BOX_NO) AS BOX_CNT ");
		sql.append(", COUNT(DISTINCT A.ROLL_LOT_NO) AS ROLL_LOT_CNT ");
		sql.append("FROM POP.TS_STOCK_BUFFER_MST@POP_LINK A, POP.LOT_ROUNTING_MST@POP_LINK C ");
        sql.append("WHERE A.PROCESS_CODE1 = C.PROCESS_CODE ");
        sql.append("AND A.WORK_LOT_NO = C.LOT_NO ");
        sql.append("AND C.DEST_PROCESS = '0100' ");
        sql.append("AND A.OUT_QTY <> 0 ");
        sql.append("GROUP BY A.WORK_LOT_NO, A.PROCESS_CODE1 ");
        sql.append(") B ON (A.WORK_LOT_NO = B.WORK_LOT_NO) ");
        sql.append("LEFT OUTER JOIN POP.SF_FACILITY_MST@POP_LINK C ON (A.FACILITY_CODE = C.FACILITY_CODE) ");
        sql.append("LEFT OUTER JOIN QT_CM D ON (A.MODEL_CODE = D.ITNBR) ");
    	sql.append("LEFT OUTER JOIN POP.PM_MODEL_MST@POP_LINK E    ON (A.MODEL_CODE = E.MODEL_CODE) ");
		sql.append("WHERE  ");
	//	if("QT013".equals(hogi)){
	//		sql.append("FACILITY_CODE = 'QT012' ");
	//	}else{
			sql.append("FACILITY_CODE = '"+hogi+"' ");
	//	}
		
		sql.append("AND TO_CHAR(A.END_TIME,'yyyy-MM-dd HH24:MI:SS') BETWEEN ");
		sql.append("'"+sdate+"'||' '||'08:30:00' ");
		sql.append("AND TO_CHAR(TO_DATE('"+sdate+"','yyyy-MM-dd')+1,'yyyy-MM-dd')||' '||'08:29:59' ");

		sql.append("ORDER BY qt_lot_no ");
		
		
		/*
		
	sql.append("AND TO_CHAR(A.END_TIME,'yyyy-MM-dd HH24:MI:SS') BETWEEN ");
		sql.append("TO_CHAR(TO_DATE('"+sdate+"','yyyy-MM-dd')-1,'yyyy-MM-dd')||' '||'08:30:00' ");
		sql.append("AND '"+sdate+"'||' '||'08:29:59' ");
    		
		
		*/
	//TO_CHAR(END_TIME,'yyyy-MM-dd') BETWEEN '"+sdate+"' AND '"+edate+"'
		 
		Statement stmt_pop2 = null;
		ResultSet rs_pop2 = null;
//		System.out.println(sql.toString());
	


		Statement stmt2 = null;		
		ResultSet rs2 = null;
		Statement stmt3 = null;
		ResultSet rs3 = null;		
		String table = "";
			     try {
					stmt_erp = conn_erp.createStatement();
					rs_erp = stmt_erp.executeQuery(sql.toString());
//					System.out.println("==========================");

					JSONArray mainArray = new JSONArray();
					String work_flag = "";
					while(rs_erp.next()){
						lot_qty.setLength(0);
						
						JSONObject rowObj = new JSONObject();
					
						switch (rs_erp.getInt("work_flag")){
							case 0 : work_flag = "대기"; break;
							case 1 : work_flag = "작업중"; break;
							case 2 : work_flag = "작업완료"; break;
							case 3 : work_flag = "보류"; break;
						}

						
						//설비코드
						if("QT001".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT3");		
							table = "1";
						}else if("QT002".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT4");
							table = "2";
						}else if("QT003".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT5");
							table = "3";
						}else if("QT004".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT6");
							table = "4";
						}else if("QT011".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT7");
							table = "11";
						}else if("QT012".equals(rs_erp.getString("facility_code")) && !"QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT8");
							table = "12";
						}else if("QT012".equals(rs_erp.getString("facility_code")) && "QT013".equals(hogi)){
							rowObj.put("facility_code", "HT-QT9");
							table = "12";
						}
						
						rowObj.put("qt_lot_no",rs_erp.getString("QT_LOT_NO"));
						
						String kg_hr = "";
						
						rowObj.put("work_lot_no",rs_erp.getString("work_lot_no"));		//작업지시번호

						//END_TIME 완료시간
						rowObj.put("work_end",rs_erp.getString("END_TIME").substring(11,16));

						//LOT별 수량
						rowObj.put("lot_qty",rs_erp.getString("in_qty"));
						//LOT별 중량
						rowObj.put("lot_weight",rs_erp.getString("in_weight"));
							
//							System.out.println(rs_pop.getString("reg_date"));
							lot_weight.setLength(0);
							lot_weight.append("SELECT qt_type ");
							lot_weight.append("FROM PM_MODEL_MST ");
							lot_weight.append("WHERE model_code = '"+rs_erp.getString("model_code")+"' ");
							
							stmt_pop2 = conn_pop.createStatement();
							rs_pop2 = stmt_pop2.executeQuery(lot_weight.toString());
							while(rs_pop2.next()){
								rowObj.put("qt_type",rs_pop2.getString("qt_type").replace("-","</br>"));
//								System.out.println(rs_pop2.getString("qt_type"));
//								System.out.println(rs_erp.getString("in_weight"));
								
								
								kg_hr = Math.round((rs_erp.getDouble("in_weight")) )+"";
							}
							
						

						w_start.setLength(0);
//						System.out.println(rs_erp.getString("work_lot_no"));
						//process_code1 ==> LOT NO로 tb_worker_time에서 조회
						//작업시작, 퀜칭투입, 템퍼링 투입, 작업종료 가져오기
						w_start.append("SELECT SUBSTRING(IFNULL(work_start,''),11,6) AS work_start, ");
						w_start.append("SUBSTRING(IFNULL(input_end,''),11,6) AS input_end, ");
						w_start.append("SUBSTRING(IFNULL(temper_start,''),11,6) AS temper_start, ");
						w_start.append("SUBSTRING(IFNULL(quen_end,''),11,6) AS quen_end, ");
						w_start.append("SUBSTRING(IFNULL(work_end,''),11,6) AS work_end, speed, ");
//						w_start.append("TIMESTAMPDIFF(MINUTE, work_start,input_end) AS hr, ");
						w_start.append("ROUND((TIMESTAMPDIFF(SECOND, work_start, input_end)/60)) AS hr ");

						w_start.append("FROM tb_worker_time ");
						w_start.append("WHERE process_code = '"+rs_erp.getString("qt_lot_no")+"' ");
						
						// AND LEFT(work_start,10) = '"+r_now+"'
								
								
						
//						System.out.println(r_now.replace("-","").substring(2,8));
						stmt2 = conn.createStatement();
						rs2 = stmt2.executeQuery(w_start.toString());
//						System.out.println(w_start.toString());
						
						int row2Count = rs2.last() ? rs2.getRow() : 0;  
						rs2.beforeFirst();
						
						int kghr_gb = 0;
						
						if(row2Count != 0){
							while(rs2.next()){
	//							System.out.println("==========================================");
								rowObj.put("work_start",rs2.getString("work_start"));
	//							rowObj.put("input_end",rs2.getString("input_end").substring(11,16));
								rowObj.put("input_end",rs2.getString("input_end"));
								//rs2.getString("quen_end").substring(11,16)
								rowObj.put("quen_end",rs2.getString("quen_end"));
								rowObj.put("temper_start",rs2.getString("temper_start"));
//								rowObj.put("work_end",rs2.getString("work_end"));
								
//								System.out.println(rs2.getInt("hr"));
								
								

								if(rs2.getString("hr") != null){
									
									double a = rs2.getDouble("hr") / 60;
									
									double r_a = (Math.round(rs2.getDouble("hr")*10) / 10.0);
									
//									System.out.println(r_a);

									//(Math.round((rs_pop.getDouble("in_weight"))  / r_a * 60))+"";

									rowObj.put("kg_hr",df.format(((Double.parseDouble(kg_hr) / rs2.getDouble("hr") * 60) )  ));
//									rowObj.put("kg_hr",df.format((Math.round((Double.parseDouble(kg_hr) / rs2.getInt("hr") * 60) ) ) ));
//									rowObj.put("kg_hr",rs2.getString("kghr"));									
//									kg_hr = rs2.getString("kghr");
									kg_hr = ((Double.parseDouble(kg_hr) / (rs2.getDouble("hr") / 60)) )+"";
									if("QT001".equals(hogi)){
										if((Double.parseDouble(kg_hr)) > 700){
											kghr_gb = 1;	
										}
									}else if("QT002".equals(hogi)){
										if((Double.parseDouble(kg_hr)) > 770){
											kghr_gb = 1;	
										}										
									}else{
										if((Double.parseDouble(kg_hr)) > 1100){
											kghr_gb = 1;	
										}
									}

								}else{
									rowObj.put("kg_hr","");
								}
								
	//							System.out.println(rs2.getString("process_code"));
								
	
							}							
						}else{
							rowObj.put("work_start","");
//							rowObj.put("input_end",rs2.getString("input_end").substring(11,16));
							rowObj.put("input_end","");
							//rs2.getString("quen_end").substring(11,16)
							rowObj.put("quen_end","");
							rowObj.put("temper_start","");
//							rowObj.put("work_end","");
							rowObj.put("roll","");
							rowObj.put("kg_hr","");
						}
						
						
						rowObj.put("model_code",rs_erp.getString("model_code"));		//제품코드(품번)
						rowObj.put("model_name",rs_erp.getString("model_name"));		//제품명
						rowObj.put("model_desc",rs_erp.getString("model_desc"));		//규격
						rowObj.put("work_flag",work_flag);			//작업구분(0:대기,1:작업중,2:작업완료,3:보류)
						rowObj.put("process_code1",rs_erp.getString("process_code1"));	//전공정
						rowObj.put("box_cnt",rs_erp.getString("box_cnt"));				//재공 철통수
						rowObj.put("out_qty",rs_erp.getString("out_qty"));				//재공수량
						rowObj.put("in_qty",rs_erp.getString("in_qty"));				//실적
						rowObj.put("jijil_ht",rs_erp.getString("jijil_ht"));			//재질 경도
						rowObj.put("temper",rs_erp.getString("temper"));				//템퍼링 온도
						rowObj.put("cp_mid",rs_erp.getString("cp_mid"));				//CP
						rowObj.put("roll",rs_erp.getString("roll_lot_no"));
//						System.out.println(rs_erp.getString("work_lot_no"));
//						System.out.println(rs_erp.getString("end_time"));
						if(kghr_gb == 0){
							rowObj.put("color","white;");
						}else{
							rowObj.put("color","#FF3636;");
						}
						
						mainArray.add(rowObj);
					}
			       
			       result = mainObj.toJSONString();
			       mainObj.put("status", String.valueOf("ok"));			       
			       mainObj.put("rows",mainArray);
			       
			       
//			       System.out.println(mainArray);
			       conn_erp.commit();
			     }	
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				out.print(mainObj);
				out.flush();
				
				if(rs != null) try {rs.close();}catch(SQLException sqle){}
				if(rs2 != null) try {rs2.close();}catch(SQLException sqle){}
				if(rs3 != null) try {rs3.close();}catch(SQLException sqle){}
				
				if(rs_erp != null) try {rs_erp.close();}catch(SQLException sqle){}
				
				if(rs_pop != null) try {rs_pop.close();}catch(SQLException sqle){}
				if(rs_pop2 != null) try {rs_pop2.close();}catch(SQLException sqle){}
				
				
				if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
				if(stmt2 != null) try {stmt2.close();}catch(SQLException sqle){}
				if(stmt3 != null) try {stmt3.close();}catch(SQLException sqle){}				
				
				if(stmt_erp != null) try {stmt_erp.close();}catch(SQLException sqle){}				
				
				if(stmt_pop != null) try {stmt_pop.close();}catch(SQLException sqle){}
				if(stmt_pop2 != null) try {stmt_pop2.close();}catch(SQLException sqle){}
				


				
				if(conn != null) try {conn.close();}catch(SQLException sqle){}
				if(conn_erp != null) try {conn_erp.close();}catch(SQLException sqle){}
				if(conn_pop != null) try {conn_pop.close();}catch(SQLException sqle){}
				
			}
%>
