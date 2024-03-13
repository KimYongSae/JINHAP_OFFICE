<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.pdfbox.multipdf.PDFMergerUtility"%>
<%-- <%@page import="com.sun.scenario.effect.Merge"%> --%>
<%@page import="com.lowagie.text.pdf.PdfDocument"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.jasperreports.export.SimpleXlsxReportConfiguration"%>
<%@page import="net.sf.jasperreports.export.SimpleOutputStreamExporterOutput"%>
<%@page import="net.sf.jasperreports.export.SimpleExporterInput"%>
<%@page import="net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter"%>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="net.sf.jasperreports.engine.design.*"%>
<%@page import="net.sf.jasperreports.engine.xml.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.jasper.servlet.JasperLoader"%>
<%@page import="org.apache.jasper.el.JasperELResolver"%>
<%@page import="org.apache.commons.digester.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@page import="net.sf.jasperreports.data.*" %>
<%@page import="net.sf.jasperreports.repo.*" %>
<%@page import="net.sf.jasperreports.engine.data.*" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="net.sourceforge.barbecue.*" %>
<%@include file="DBConnector.jsp" %>
<%@include file="DBConnector_Oracle_pop.jsp" %>
<%@include file="DBConnector_Oracle_erp.jsp" %>
<%@include file="DBConnector_MSSQL_spc.jsp" %>
<%@include file="l000004_ReportVo.jsp" %>

  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


	
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	String hogi = request.getParameter("hogi");

	int type1 = 0;
	
	int pro_qt = 0;
	if("QT001".equals(hogi)){
		pro_qt = 1;
	}else if("QT002".equals(hogi)){
		pro_qt = 2;
	}else if("QT003".equals(hogi)){
		pro_qt = 3;
	}else if("QT004".equals(hogi)){
		pro_qt = 4;
	}else if("QT011".equals(hogi)){
		pro_qt = 11;
	}else if("QT012".equals(hogi)){
		pro_qt = 12;
	}
	
	//cnt와 hogi로 선택한 LOT의 정보 가져오기
	//lotno와 작업시작, 종료시간
	StringBuffer lotSql = new StringBuffer();
	lotSql.append("SELECT lotno, LEFT(work_start,19) work_start, LEFT(work_end,19) work_end,  ");
	lotSql.append("qun1, qun2, qun3, qun4, qun5, temper1, temper2, temper3, temper4, ");
	lotSql.append("pre, oil, post, cp, q_inv, t_inv, model, spec, ");
	lotSql.append("(SELECT type1 FROM tb_process_qt"+pro_qt+" a  ");
	lotSql.append("WHERE a.process_code = process_code LIMIT 1) type1, ");
	lotSql.append("SUBSTR(quen_start,12,5) quen_start, ");
	lotSql.append("SUBSTR(quen_end,12,5) quen_end, ");
	lotSql.append("SUBSTR(oil_start,12,5) oil_start, ");
	lotSql.append("SUBSTR(oil_end,12,5) oil_end, ");
	lotSql.append("SUBSTR(temper_start,12,5) temper_start, ");
	lotSql.append("SUBSTR(temper_end,12,5) temper_end, ");
	lotSql.append("SUBSTR(work_start,12,5) w_stime, ");
	lotSql.append("TIMESTAMPDIFF(MINUTE, work_start, input_end) AS hr, ");
	lotSql.append("process_code AS heatno, TIMESTAMPDIFF(MINUTE, work_start,work_end) AS duration ");
	lotSql.append("FROM tb_worker_time ");
	lotSql.append("WHERE cnt = "+cnt+" ");
	
	StringBuffer alarmSql = new StringBuffer();
	
	StringBuffer chartSql = new StringBuffer();
	
	StringBuffer erpSql = new StringBuffer();
	
	StringBuffer popSql = new StringBuffer();
	StringBuffer popSql2 = new StringBuffer();
	
	StringBuffer spcSql = new StringBuffer();
	StringBuffer spcSql2 = new StringBuffer();
	
	StringBuffer u_sql = new StringBuffer();
	
	StringBuffer timerSql = new StringBuffer();
	StringBuffer lotTemper = new StringBuffer();
	
	SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
	SimpleDateFormat t_format = new SimpleDateFormat("yyyyMMdd");
	
	Date time = new Date();
	
	String now = format.format(time);
	Map<String,Object> reportMap = new HashMap<String,Object>(); 
		
	DecimalFormat df = new DecimalFormat("#,###");
	
	String outFileName = "";	
	String fileName = "Treatment_Report2"; //마스터
	String fileName2 = "Treatment_Graph4"; //서브
	
	Statement stmt_pop2 = null;
	ResultSet rs_pop2 = null;
	
	Statement stmt2 = null;
	ResultSet rs2 = null;
	Statement stmt3 = null;
	ResultSet rs3 = null;
	
	Statement stmt4 = null;
	ResultSet rs4 = null;
	Statement stmt5 = null;
	ResultSet rs5 = null;

	
	
	Statement stmt_spc2 = null;
	ResultSet rs_spc2 = null;
	
	PreparedStatement pstmt = null;
//	System.out.println("ASDASD");

	
	
	
	 JSONObject mainObj = new JSONObject();
	 JSONArray mainArray = new JSONArray();
	 
	 mainObj.put("status", String.valueOf("ok"));

	try{
		String path = application.getRealPath("/reports");
		
		String abPath = request.getServletContext().getRealPath("/reports/"+fileName+".jrxml");
		String abPath2 = request.getServletContext().getRealPath("/reports/"+fileName2+".jrxml");
		
		
		String savePath = request.getServletContext().getRealPath("/reports");
		
		String heat_lot = "";
		
		File file = new File(abPath);
		
		String work_start = "";
		String work_end = "";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(lotSql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst(); 		
		while(rs.next()){
			String r_hogi = "";
			if("QT001".equals(hogi)){
				r_hogi = "HT-QT3";
			}else if("QT002".equals(hogi)){
				r_hogi = "HT-QT4";
			}else if("QT003".equals(hogi)){
				r_hogi = "HT-QT5";
			}else if("QT004".equals(hogi)){
				r_hogi = "HT-QT6";
			}else if("QT011".equals(hogi)){
				r_hogi = "HT-QT7";
			}else if("QT012".equals(hogi)){
				r_hogi = "HT-QT8";
			}
			heat_lot = rs.getString("heatno");
			reportMap.put("lotno",rs.getString("lotno"));
			String[] heatno_array = rs.getString("heatno").split("-");
			heatno_array[1] = r_hogi;
			reportMap.put("heatno",heatno_array[0]+"-"+heatno_array[1]+"-"+heatno_array[2]);
//			reportMap.put("heatno",rs.getString("heatno"));
			reportMap.put("hogi",r_hogi);
			reportMap.put("work_start",rs.getString("work_start"));
			
			reportMap.put("duration",rs.getString("hr")+"분");
			
			reportMap.put("model_name",rs.getString("model"));
			reportMap.put("model_desc",rs.getString("spec"));
			
			type1 = rs.getInt("type1");
			
			
			
			reportMap.put("cp",String.format("%.2f",((Math.round((rs.getDouble("cp") * 0.001)*100)/100.0))));
					
			double a = rs.getDouble("hr") / 60 ;
			double r_a = (Math.round(a*10) / 10.0);
			
			reportMap.put("q_inv",String.format("%.2f",(rs.getDouble("q_inv") * 0.01)));
			reportMap.put("t_inv",String.format("%.2f",(rs.getDouble("t_inv") * 0.01)));

			reportMap.put("w_stime",rs.getString("w_stime"));
			reportMap.put("q_stime",rs.getString("quen_start"));
			reportMap.put("q_etime",rs.getString("quen_end"));
			reportMap.put("oil_stime",rs.getString("oil_start"));
			reportMap.put("oil_etime",rs.getString("oil_end"));
			reportMap.put("t_stime",rs.getString("temper_start"));
			reportMap.put("t_etime",rs.getString("temper_end"));
			
						
			popSql.append("SELECT facility_code, work_lot_no, ");
			popSql.append("model_code, roll_lot_no, qt_lot_no, customer_code, ");			
			popSql.append("MAX(TO_CHAR(end_time,'yyyy-MM-dd HH24:MI:ss')) AS edate, ");
			popSql.append("SUM(in_qty) AS in_qty, SUM(in_weight) AS in_weight ");
		    popSql.append("FROM TS_STOCK_MST ");
		    popSql.append("WHERE facility_code = '"+hogi+"' ");
		    popSql.append("AND qt_lot_no = '"+rs.getString("heatno")+"' ");
		    popSql.append("GROUP BY facility_code, work_lot_no, model_code, ");
		    popSql.append("roll_lot_no, qt_lot_no, customer_code ");
		    popSql.append("ORDER BY qt_lot_no, edate ");
		    		   
		    work_start = rs.getString("work_start");		   
				stmt_pop = conn_pop.createStatement();
				rs_pop = stmt_pop.executeQuery(popSql.toString());
				while(rs_pop.next()){
					
					work_end = rs_pop.getString("edate");
					
					reportMap.put("work_end",rs_pop.getString("edate"));
					
					
					reportMap.put("model_code",rs_pop.getString("model_code"));
					
					reportMap.put("w_etime",rs_pop.getString("edate").substring(11,16));
					
					reportMap.put("qty",String.format("%,d",rs_pop.getInt("in_qty")));
					reportMap.put("weight",df.format( Integer.parseInt((Math.round(rs_pop.getDouble("in_weight"))+"")) ));
					

					
					reportMap.put("kg_hr",df.format(Math.round((rs_pop.getDouble("in_weight")) ) / r_a ));
					
					
//					reportMap.put("kg_hr",df.format(Math.round(rs_pop.getDouble("in_weight"))/rs.getInt("hr")*60));
				}
				
				
				
				//초물
				spcSql.setLength(0);
				spcSql.append("SELECT x1, x2, spec_desc ");
				spcSql.append("FROM prd_keyin_data_first ");
				spcSql.append("WHERE process_code = '0100' ");
				spcSql.append("AND facility_code = '"+hogi+"' ");
				spcSql.append("AND CONVERT(VARCHAR(10), CREATE_DATE, 120 ) = '"+t_format.format(time)+"' ");
				spcSql.append("AND work_lot_no = '"+rs.getString("lotno")+"' ");
//				System.out.println(spcSql.toString());
//				System.out.println("============================");
				stmt_spc = conn_spc.createStatement();
				rs_spc = stmt_spc.executeQuery(spcSql.toString());
				
				while(rs_spc.next()){
					if("심부경도".equals(rs_spc.getString("spec_desc"))){				
						reportMap.put("s_m1",rs_spc.getDouble("x1"));					
						reportMap.put("s_m2",rs_spc.getDouble("x2"));								
					}else{
						reportMap.put("p_m1",rs_spc.getDouble("x1"));					
						reportMap.put("p_m2",rs_spc.getDouble("x2"));				
					}

				}		
					
				//자주
				spcSql2.setLength(0);
				spcSql2.append("SELECT x1, x2, spec_desc ");
				spcSql2.append("FROM prd_keyin_data ");
				spcSql2.append("WHERE process_code = '0100' ");
				spcSql2.append("AND facility_code = '"+hogi+"' ");
				spcSql2.append("AND fdate = '"+t_format.format(time)+"' ");
				spcSql2.append("AND work_lot_no = '"+rs.getString("lotno")+"' ");
				
				stmt_spc2 = conn_spc.createStatement();
				rs_spc2 = stmt_spc2.executeQuery(spcSql2.toString());
//				System.out.println(spcSql2.toString());
//				System.out.println("============================");
				while(rs_spc2.next()){
					if("심부경도".equals(rs_spc2.getString("spec_desc"))){				
						reportMap.put("s_m3",rs_spc2.getDouble("x1"));					
						reportMap.put("s_m4",rs_spc2.getDouble("x2"));								
					}else{
						reportMap.put("p_m3",rs_spc2.getDouble("x1"));					
						reportMap.put("p_m4",rs_spc2.getDouble("x2"));				
					}				
					if("심부경도".equals(rs_spc2.getString("spec_desc"))){				
						reportMap.put("s_m5",rs_spc2.getDouble("x1"));					
						reportMap.put("s_m6",rs_spc2.getDouble("x2"));								
					}else{
						reportMap.put("p_m5",rs_spc2.getDouble("x1"));					
						reportMap.put("p_m6",rs_spc2.getDouble("x2"));				
					}				


				}				
			
		}
		
		
		
		
		int areaMask = 0;
		int table_gb = 0;
		
		String g_table = "";
		String g_qun = "";
		
		
		if("QT001".equals(hogi)){
			areaMask = 4;
			table_gb = 3;
			g_table = "v_mash3";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, '0' AS q5";
		}else if("QT002".equals(hogi)){
			areaMask = 8;
			table_gb = 4;
			g_table = "v_mash4";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, q_5 AS q5";
		}else if("QT003".equals(hogi)){
			areaMask = 16;
			table_gb = 5;
			g_table = "v_mash5";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, q_5 AS q5";
		}else if("QT004".equals(hogi)){
			areaMask = 32;
			table_gb = 6;
			g_table = "v_mash6";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, q_5 AS q5";
		}else if("QT011".equals(hogi)){
			areaMask = 64;
			table_gb = 7;
			g_table = "v_mash7";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, '0' AS q5";
		}else if("QT012".equals(hogi)){
			areaMask = 128;
			table_gb = 8;
			g_table = "v_mash8";
			g_qun = "q_1 AS q1, q_2 AS q2, q_3 AS q3, q_4 AS q4, '0' AS q5";
		}
//		System.out.println("호기 : "+hogi);
//		System.out.println("areamask : "+areaMask);
//		System.out.println("g_table : "+g_table);
//		System.out.println("g_qun : "+g_qun);
		
		alarmSql.append("SELECT LEFT(time_h,19) AS time_h, descString ");
		alarmSql.append("FROM v_ae ");
		alarmSql.append("WHERE areamask = "+areaMask+" ");
		alarmSql.append("AND time_h BETWEEN '"+work_start+"' AND '"+work_end+"'  ");
		alarmSql.append("ORDER BY time_h DESC ");
		
		
		List<ReportVo> rList = new ArrayList<ReportVo>();
		
		int r_idx = 0;
		stmt2 = conn.createStatement();
		rs2 = stmt2.executeQuery(alarmSql.toString());
		while(rs2.next()){
			ReportVo rvo = new ReportVo();
			if(r_idx < 18){
				rvo.setAlarm_qf(rs2.getString("time_h")+rs2.getString("descString"));
			}else if(r_idx < 36){
				rvo.setAlarm_tf(rs2.getString("time_h")+rs2.getString("descString"));
			}else if(r_idx < 54){
				rvo.setAlarm_other(rs2.getString("time_h")+rs2.getString("descString"));
			}
			
			
			
			rList.add(rvo);
			r_idx++;
		}
		
		
		
		List<GraphicVo> gList = new ArrayList<GraphicVo>();
		
		/*
				sql.append("(SELECT CONCAT(LEFT(process_code,6),'-',RIGHT(process_code,3),' ',LEFT(RIGHT(quen_start,8),5)) FROM tb_worker_time WHERE hogi ='QT003' ");
				sql.append("AND LEFT(datadate,16) = LEFT(quen_start,16)) AS q_lot1, ");
				sql.append("(SELECT CONCAT(LEFT(process_code,6),'-',RIGHT(process_code,3),' ',LEFT(RIGHT(temper_start,8),5)) FROM tb_worker_time WHERE hogi ='QT003' ");
				sql.append("AND LEFT(datadate,16) = LEFT(temper_start,16)) AS t_lot1, ");

		*/
		
		chartSql.append("SELECT "+g_qun+", ");
		chartSql.append("t_1 AS t1, t_2 AS t2, t_3 AS t3, t_4 AS t4, ");
		chartSql.append("f_w AS fw, m_w AS mw, oil, (cp*1000) AS cp, ");
		chartSql.append("datadate AS datadate2, ");
		chartSql.append("(SELECT IF(quen_start IS NULL,null,(q_1-15)) FROM tb_worker_time ");
		chartSql.append(" WHERE process_code = '"+heat_lot+"' ");
		chartSql.append(" AND LEFT(datadate,16) = LEFT(quen_start,16) ");
		chartSql.append(") AS qun, ");
		chartSql.append("(SELECT IF(temper_start IS NULL,null,(t_1-15)) FROM tb_worker_time ");
		chartSql.append(" WHERE process_code = '"+heat_lot+"' ");
		chartSql.append(" AND LEFT(datadate,16) = LEFT(temper_start,16) ");
		chartSql.append(") AS tem, ");
		chartSql.append("(SELECT CONCAT(LEFT(process_code,6),'-',RIGHT(process_code,3),' ',LEFT(RIGHT(quen_start,8),5)) FROM tb_worker_time WHERE hogi ='"+hogi+"' ");
		chartSql.append("AND LEFT(datadate,16) = LEFT(quen_start,16)) AS q_lot1, ");
		chartSql.append("(SELECT CONCAT(LEFT(process_code,6),'-',RIGHT(process_code,3),' ',LEFT(RIGHT(temper_start,8),5)) FROM tb_worker_time WHERE hogi ='"+hogi+"' ");
		chartSql.append("AND LEFT(datadate,16) = LEFT(temper_start,16)) AS t_lot1, ");
		chartSql.append("(SELECT CONCAT(sname,' ',LEFT(RIGHT(sign_time,8),5)) FROM tb_trend_sign WHERE hogi ='"+table_gb+"' ");
		chartSql.append("AND LEFT(datadate,16) = LEFT(sign_time,16) AND sname <> '' LIMIT 1 ) AS s_sign1, ");				
		
		
		chartSql.append("(SELECT IF(sign_time IS NULL,null,200) FROM tb_trend_sign WHERE hogi = '"+table_gb+"' ");
		chartSql.append("AND LEFT(datadate,16) = LEFT(sign_time,16) GROUP BY LEFT(sign_time,16) ) AS sign, ");		
				
		chartSql.append("LEFT(datadate,15) AS datadate ");
		chartSql.append("FROM "+g_table+" ");
		chartSql.append("WHERE datadate BETWEEN '"+work_start+"' AND '"+work_end+"' ");
		chartSql.append("ORDER BY datadate DESC ");
//		System.out.println(chartSql.toString());
		stmt3 = conn.createStatement();
		rs3 = stmt3.executeQuery(chartSql.toString());
		
		int chart_idx = 0;
		while(rs3.next()){
			
			 
			 GraphicVo gvo = new GraphicVo(); 
			 gvo.setQ1(rs3.getDouble("q1"));
			 gvo.setQ2(rs3.getDouble("q2"));
			 gvo.setQ3(rs3.getDouble("q3"));
			 gvo.setQ4(rs3.getDouble("q4"));
			 gvo.setQ5(rs3.getDouble("q5"));
			 gvo.setT1(rs3.getDouble("t1"));
			 gvo.setT2(rs3.getDouble("t2"));
			 gvo.setT3(rs3.getDouble("t3"));
			 gvo.setT4(rs3.getDouble("t4"));
			 gvo.setFw(rs3.getDouble("fw"));
			 gvo.setMw(rs3.getDouble("mw"));
			 gvo.setOil(rs3.getDouble("oil"));
			 gvo.setCp(rs3.getDouble("cp"));
			 
			 gvo.setQun(rs3.getDouble("qun"));
			 gvo.setTem(rs3.getDouble("tem"));
			 gvo.setSign(rs3.getDouble("sign"));
			 
			 gvo.setChartIdx(chart_idx);
			 
			 
			 gvo.setTdatetime(rs3.getString("datadate")+"0");
//			 gvo.setTdatetime(rs3.getString("datadate2"));

			 if(chart_idx == 0){
				reportMap.put("pre",rs3.getString("fw"));
				reportMap.put("oil",rs3.getString("oil"));
				reportMap.put("post",rs3.getString("mw"));			 
			 }

			 if(rs3.getInt("qun") != 0){
				reportMap.put("q_lot",rs3.getString("q_lot1"));
			 }

			 if(rs3.getInt("tem") != 0){
				 reportMap.put("t_lot",rs3.getString("t_lot1")); 
			 }
			 
			 if(rs3.getInt("sign") != 0 ){
				 reportMap.put("s_sign",rs3.getString("s_sign1"));				 
			 }
			 
			 gList.add(gvo);			 
			 
			 
			 chart_idx++;
		}
		//(SELECT SUM(pre+q_fast+up_conv+post) FROM tb_timer WHERE facility = 'QT001')
		
		
		String p_type = "";

		if(type1 == 0){
			p_type = "q_slow";
		}else if(type1 == 1){
			p_type = "q_stand";			
		}else if(type1 == 2){
			p_type = "q_fast";
		}
		
		if("QT001".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/4)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*3) AS q3_t, ");
			timerSql.append("(pre + "+p_type+") AS q4_t, ");
			timerSql.append("0 AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}else if("QT002".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/5)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*3) AS q3_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*4) AS q4_t, ");
			timerSql.append("(pre + "+p_type+") AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}else if("QT003".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/5)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*3) AS q3_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*4) AS q4_t, ");
			timerSql.append("(pre + "+p_type+") AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}else if("QT004".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/5)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*3) AS q3_t, ");
			timerSql.append("(pre + ("+p_type+"/5)*4) AS q4_t, ");
			timerSql.append("(pre + "+p_type+") AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}else if("QT011".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/4)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*3) AS q3_t, ");
			timerSql.append("(pre + "+p_type+") AS q4_t, ");
			timerSql.append("0 AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}else if("QT012".equals(hogi)){
			timerSql.append("SELECT ");
			timerSql.append("(pre + ("+p_type+"/4)) AS q1_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*2) AS q2_t, ");
			timerSql.append("(pre + ("+p_type+"/4)*3) AS q3_t, ");
			timerSql.append("(pre + "+p_type+") AS q4_t, ");
			timerSql.append("0 AS q5_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (53*60)) AS t1_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (87*60)) AS t2_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (108*60)) AS t3_t, ");
			timerSql.append("(pre + "+p_type+" + up_conv + post + (132*60)) AS t4_t ");
			timerSql.append("FROM tb_timer ");
			timerSql.append("WHERE facility = '"+hogi+"' ");
			
		}
		
		
		stmt4 = conn.createStatement();
		rs4 = stmt4.executeQuery(timerSql.toString());
		
		
		/*
		
	SELECT 
		(
			SELECT t_1
			FROM v_mash3
			WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('2020-07-21 12:04:35', INTERVAL '14780' SECOND)),16)		
		) AS t1,
		(
			SELECT t_2
			FROM v_mash3
			WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('2020-07-21 12:04:35', INTERVAL '14780' SECOND)),16)		
		) AS t2		
	FROM v_mash3
	WHERE datadate BETWEEN '2020-07-21 12:04:35' AND '2020-07-21 19:17:1		
		
		*/
		while(rs4.next()){
			lotTemper.append("SELECT ");
			
			lotTemper.append("( ");
			lotTemper.append("SELECT q_1 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("q1_t")+"' SECOND)),16) ");
			lotTemper.append(") AS q1, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT q_2 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("q2_t")+"' SECOND)),16) ");
			lotTemper.append(") AS q2, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT q_3 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("q3_t")+"' SECOND)),16) ");
			lotTemper.append(") AS q3, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT q_4 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("q4_t")+"' SECOND)),16) ");
			lotTemper.append(") AS q4, ");
			
			if("QT001".equals(hogi) || "QT011".equals(hogi) || "QT012".equals(hogi)){
				lotTemper.append("0 AS q5, ");
			}else{
				lotTemper.append("( ");
				lotTemper.append("SELECT q_5 ");
				lotTemper.append("FROM "+g_table+" ");
				lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("q5_t")+"' SECOND)),16) ");
				lotTemper.append(") AS q5, ");
			}
			
			lotTemper.append("( ");
			lotTemper.append("SELECT t_1 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("t1_t")+"' SECOND)),16) ");
			lotTemper.append(") AS t1, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT t_2 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("t2_t")+"' SECOND)),16) ");
			lotTemper.append(") AS t2, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT t_3 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("t3_t")+"' SECOND)),16) ");
			lotTemper.append(") AS t3, ");
			lotTemper.append("( ");
			lotTemper.append("SELECT t_4 ");
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE LEFT(datadate,16) = LEFT((SELECT DATE_ADD('"+work_start+"', INTERVAL '"+rs4.getInt("t4_t")+"' SECOND)),16) ");
			lotTemper.append(") AS t4 ");
			
			lotTemper.append("FROM "+g_table+" ");
			lotTemper.append("WHERE datadate BETWEEN '"+work_start+"' AND '"+work_end+"' ");
			lotTemper.append("ORDER BY datadate DESC ");
			lotTemper.append("LIMIT 1 ");
			
			
			stmt5 = conn.createStatement();
			rs5 = stmt5.executeQuery(lotTemper.toString());
			
			while(rs5.next()){

				reportMap.put("q1",rs5.getString("q1"));
				reportMap.put("q2",rs5.getString("q2"));
				reportMap.put("q3",rs5.getString("q3"));
				reportMap.put("q4",rs5.getString("q4"));
				reportMap.put("q5",rs5.getString("q5"));
				
				reportMap.put("t1",rs5.getString("t1"));
				reportMap.put("t2",rs5.getString("t2"));
				reportMap.put("t3",rs5.getString("t3"));
				reportMap.put("t4",rs5.getString("t4"));

			}
		}

		
		
		//임시
//		reportMap.put("hf_stime","");
//		reportMap.put("tf_stime","");
		reportMap.put("qt_stime","");
		reportMap.put("dipp_stime","");
		reportMap.put("sh_stime","");
		
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(rList);
		JRBeanCollectionDataSource dataSource2 = new JRBeanCollectionDataSource(gList);		
		
		
			//리포트
		boolean isExists = file.exists();

		if (isExists) {
			
			JasperReportsContext jasperReportsContext = new SimpleJasperReportsContext();
			
			JasperCompileManager compileManager = 
						JasperCompileManager.getInstance(jasperReportsContext);
			
			
			JasperReport report = JasperCompileManager.compileReport(abPath);
			JasperReport subReport = JasperCompileManager.compileReport(abPath2);
			
			
			
			reportMap.put("a_list",rList);
			
			JasperFillManager fillManager = JasperFillManager.getInstance(jasperReportsContext);
			
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, reportMap,dataSource);
			JasperPrint jasperPrint2 = JasperFillManager.fillReport(subReport, reportMap,dataSource2);
			
			
			
			List<InputStream> pdfs = new ArrayList<InputStream>();
            FileOutputStream output = null;
			 	//파일 프리뷰용
			JasperExportManager.exportReportToPdfFile(jasperPrint,savePath+"/"+fileName+"_"+now+".pdf");
            JasperExportManager.exportReportToPdfFile(jasperPrint2,savePath+"/"+fileName2+"_"+now+".pdf");
            
            
			//파일 저장용
			JasperExportManager.exportReportToPdfFile(jasperPrint,"D:/Job/report_bak/"+fileName+"_"+now+".pdf");
			JasperExportManager.exportReportToPdfFile(jasperPrint2,"D:/Job/graph_bak/"+fileName2+"_"+now+".pdf");
			
			//PC 저장용 병합본
			PDFMergerUtility ut = new PDFMergerUtility();
			
			ut.addSource("D:/Job/report_bak/"+fileName+"_"+now+".pdf");
			ut.addSource("D:/Job/graph_bak/"+fileName2+"_"+now+".pdf");
			ut.setDestinationFileName("D:/Job/"+fileName+"_"+now+".pdf");			
			ut.mergeDocuments();
			
			//프리뷰용 병합본
			PDFMergerUtility ut2 = new PDFMergerUtility();
			
			ut2.addSource(savePath+"/"+fileName+"_"+now+".pdf");
			ut2.addSource(savePath+"/"+fileName2+"_"+now+".pdf");
			ut2.setDestinationFileName(savePath+"/"+fileName+"_"+now+".pdf");			
			ut2.mergeDocuments();
			
			//경로와 파일명을 세션 또는 쿠키에 저장.
			
			//세션에 올린 값을 pdf_preview.jsp에서 값을 받은다음 pdf파일을 보여주는 방법
//			request.getSession().setAttribute("pdfPath", fileName+"_"+now+".pdf");
			
//			request.getSession().setMaxInactiveInterval(60);
			
			//프린트 자동출력 코드
		//	JasperPrintManager.printReport(jasperPrint, false);
			// 출력할파일, 프린트 다이얼로그 보이게/ 안보이게
			
			u_sql.append("UPDATE tb_worker_time SET filename = '"+fileName+"_"+now+".pdf"+"', ");
			u_sql.append("file_yn = 'Y' ");
			u_sql.append("WHERE cnt = "+cnt+" ");
			pstmt = conn.prepareStatement(u_sql.toString());
			pstmt.executeUpdate();
			
			
			
			try{
				conn.commit();
			}catch(SQLException e){
				e.printStackTrace();	
			}finally{				
				
				if(rs3 != null){rs3.close();}
				if(rs2 != null){rs2.close();}
				if(rs != null){rs.close();}
				
				if(rs_pop2 != null){rs_pop2.close();}
				if(rs_pop != null){rs_pop.close();}
				
				if(rs_erp != null){rs_erp.close();}
				
				if(rs_spc2 != null){rs_spc2.close();}
				if(rs_spc != null){rs_spc.close();}
				
				if(stmt3 != null){stmt3.close();}
				if(stmt2 != null){stmt2.close();}
				if(stmt != null){stmt.close();}
				if(stmt_pop2 != null){stmt_pop2.close();}
				if(stmt_pop != null){stmt_pop.close();}
				
				if(stmt_erp != null){stmt_erp.close();}
				
				if(stmt_spc2 != null){stmt_spc2.close();}
				if(stmt_spc != null){stmt_spc.close();}
				
				if(conn != null){conn.close();}
				if(conn_pop != null){conn_pop.close();}
				if(conn_erp != null){conn_erp.close();}
				if(conn_spc != null){conn_spc.close();}
				
			}
			
			
			/* JRXlsxExporter xlsxExporter = new JRXlsxExporter();
			xlsxExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			
			xlsxExporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("D:/Job/"+fileName+"_"+now+".xlsx")));
			SimpleXlsxReportConfiguration xlsxConfiguration = new SimpleXlsxReportConfiguration();
			
			xlsxConfiguration.setOnePagePerSheet(true);
			//xlsxConfiguration.setAutoFitPageHeight(true); ?
			xlsxConfiguration.setCellHidden(true); //?
			
					
			xlsxExporter.setConfiguration(xlsxConfiguration);
			xlsxExporter.exportReport(); */	
			
		} else {
		//	System.out.println("파일없음");
		}
	}catch (JRException e) {
		e.printStackTrace();
	}finally{
		out.print(mainObj);
		out.flush();
	}
	
	
	
%>