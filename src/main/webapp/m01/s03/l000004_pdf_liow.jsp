<%@page import="org.apache.pdfbox.multipdf.PDFMergerUtility"%>
<%-- <%@page import="com.sun.scenario.effect.Merge"%> --%>
<%@page import="com.lowagie.text.pdf.PdfDocument"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.sf.jasperreports.engine.export.JRPdfExporterParameter"%>
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
<%@include file="l000004_ReportVo.jsp" %>

  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String lno = request.getParameter("lno");
	String stime = request.getParameter("stime");
	String etime = request.getParameter("etime");
	String jdate = request.getParameter("jdate");
			
//	System.out.println("stime : "+stime+", etime : "+etime);
	
	
	StringBuffer alarmSql = new StringBuffer();
	StringBuffer chartSql = new StringBuffer();
	StringBuffer generalSql = new StringBuffer();
	StringBuffer workingSql = new StringBuffer();
	StringBuffer timeSql = new StringBuffer();
	
	StringBuffer whereSql = new StringBuffer();
	StringBuffer whereSql2 = new StringBuffer();
	StringBuffer whereSql3 = new StringBuffer();
	StringBuffer whereSql4 = new StringBuffer();
	StringBuffer whereSql5 = new StringBuffer();
	
//	String machine = lno.substring(11,lno.length());
	String machine = lno.substring(8,11);
	
 	String table = "";
 	if("001".equals(machine)){
 		table = "m1";
 	}else{
 		table = "m2";
 	}
 	//2019-05-18 10
// 	System.out.println("테이블 : "+table+", 이거는 : "+machine);
 	 	
	//리포트
	alarmSql.append("select a_name, tdate, ttime from tb_alarm_"+table+" where tdate = '"+jdate+"' and ttime between '"+stime.substring(11,stime.length())+"' and '"+etime.substring(11,etime.length())+"' ");
	alarmSql.append("order by tdate desc, ttime desc "); 
	
//	sql.append("");

//	System.out.println(alarmSql.toString());
	//그래프
/*
	 if(!"".equals(lno) && lno != null){
 		whereSql2.append(" and lotno = '"+lno+"' ");
 	}
	*/
	
 	whereSql2.append(" and tdatetime between '"+stime+"' and '"+etime+"' group by tdatetime1 ");

 	if(!"".equals(lno) && lno != null){
 		whereSql3.append(" and lotno = '"+lno+"' ");
 	}
 	
 	if(!"".equals(lno) && lno != null){
 		whereSql4.append(" and lotno = '"+lno+"' ");
 	}
 	
 	if(!"".equals(lno) && lno != null){
 		whereSql5.append(" and lotno = '"+lno+"' ");
 	}
 	
 	
// 	System.out.println(table);
 	
 	chartSql.append("select left(tdatetime,13) as tdatetime1, ");
 	chartSql.append("hf1, hf2, hf3, hf4, hf5, tf1, tf2, tf3, tf4, tf5, tf6 ");
 	chartSql.append("from tb_datalog_"+table+" where 1=1 ");
 	chartSql.append(whereSql2.toString());
 	
 //	System.out.println(chartSql.toString());
 	
 	
 	//제네널ㄹ
 	generalSql.append("select lotno, yaw_lot, machine, start_time, end_time, timestampdiff(MINUTE, start_time, end_time) duration, ");
 	generalSql.append("cl_lot, remark, total, count, pattn ");
 	generalSql.append("from tb_lotmng where 1=1  ");
 	generalSql.append(whereSql3.toString());

 	//온도 셋팅값
 	workingSql.append("select hf1, hf2, hf3, hf4, hf5, qt, dipp, shower, ");
 	workingSql.append("tf1, tf2, tf3, tf4, tf5, tf6, ");
 	workingSql.append("(select pr_name from tb_process_m1 where pr_code = (select pattn from tb_lotmng where lotno = '"+lno+"')) as pattn_name ");
 	workingSql.append("from tb_sp_"+table+" where 1=1 ");
 	workingSql.append(whereSql4.toString());
 	
 	
// 	System.out.println(workingSql.toString());
 	
 	//존별 출입시간
 	timeSql.append("select hf_stime, dipp_stime, tf_stime, qt_stime, ");
 	timeSql.append("sh_stime ");
 	timeSql.append("from tb_pass_"+table+" where 1=1 ");
 	timeSql.append(whereSql5.toString());
 	
	SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
	Date time = new Date();
	
	String now = format.format(time);
	Map<String,Object> reportMap = new HashMap<String,Object>(); 
		
	
	
	String outFileName = "";	
	String fileName = "Treatment_Report2"; //마스터
//	String fileName2 = "Treatment_Graph2"; //서브
	String fileName2 = "Treatment_Graph4"; //서브
	
	
	PreparedStatement pstmt = null;
	Statement stmt2 = null;
	ResultSet rs2 = null;
	
	Statement stmt3 = null;
	ResultSet rs3 = null;
	
	Statement stmt4 = null;
	ResultSet rs4 = null;
	
	Statement stmt5 = null;
	ResultSet rs5 = null;
	
	
	try{
		String path = application.getRealPath("/reports");
//		System.out.println(path);
		
		String abPath = request.getServletContext().getRealPath("/reports/"+fileName+".jrxml");
		String abPath2 = request.getServletContext().getRealPath("/reports/"+fileName2+".jrxml");
//		System.out.println(abPath2);
		
		
		String savePath = request.getServletContext().getRealPath("/reports");
		
		File file = new File(abPath);
			//리포트
		 stmt = conn.createStatement();  
	     rs = stmt.executeQuery(alarmSql.toString());  
	     int rowCount = rs.last() ? rs.getRow() : 0;  
	     rs.beforeFirst(); 
	     
	     List<ReportVo> rList = new ArrayList<ReportVo>();
	    
	     // 그래프 : 서브리포트
	     stmt2 = conn.createStatement();  
	     rs2 = stmt2.executeQuery(chartSql.toString());  
	     int rowCount2 = rs2.last() ? rs2.getRow() : 0;  
	     rs2.beforeFirst();  
	     int index2 = 0;
	     
	     List<GraphicVo> gList = new ArrayList<GraphicVo>();
	     
	     int index = 0;
	     while(rs.next()){
	    	
	    	 ReportVo rvo = new ReportVo();
	    	 String a_name = rs.getString("a_name");
	    	 String before_a_name = a_name.substring(0,a_name.indexOf(" "));
	    	
	    	 if(before_a_name.indexOf("HF") != -1){
	    		 rvo.setAlarm_qf(rs.getString("ttime")+"-"+rs.getString("a_name"));
	    	 }else if(before_a_name.indexOf("TF") != -1){
	    		 rvo.setAlarm_tf(rs.getString("ttime")+"-"+rs.getString("a_name"));
	    	 }else{
	    		 rvo.setAlarm_other(rs.getString("ttime")+"-"+rs.getString("a_name"));
	    	 }
	    	 rList.add(rvo);
	    	index++;
	     }
	     
	    	 while(rs2.next()){
//	 	     	 System.out.println("시간 : "+rs.getString("tdatetime")+", 온도 : "+rs.getDouble("hf1"));
	 	    	 index2++;
//	 	    	 gList = graphList.getDataBeanList(rs.getString("tdatetime"), rs.getDouble("hf1"));

	 			 GraphicVo gvo = new GraphicVo(); 
	 			 gvo.setQ1(rs2.getDouble("hf1"));
	 			 gvo.setQ2(rs2.getDouble("hf2"));
	 			 gvo.setQ3(rs2.getDouble("hf3"));
	 			 gvo.setQ4(rs2.getDouble("hf4"));
	 			 gvo.setQ5(rs2.getDouble("hf5"));
	 			 gvo.setT1(rs2.getDouble("tf1"));
	 			 gvo.setT2(rs2.getDouble("tf2"));
	 			 gvo.setT3(rs2.getDouble("tf3"));
	 			 gvo.setT4(rs2.getDouble("tf4"));
	 			 gvo.setTdatetime(rs2.getString("tdatetime1")+":00:00"); 
	 			 
	 			 
	 			 gList.add(gvo);
	 	     }	 
	    	 
	    	 stmt3 = conn.createStatement();  
		     rs3 = stmt3.executeQuery(generalSql.toString());  
		     int rowCount3 = rs3.last() ? rs3.getRow() : 0;  
		     rs3.beforeFirst();  
		     int index3 = 0;
	   		 
		     
		     while(rs3.next()){
		    	 reportMap.put("order_no",rs3.getString("lotno"));
		    	 reportMap.put("charge_no",rs3.getString("yaw_lot"));
		    	 reportMap.put("line",rs3.getString("machine"));
		    	 reportMap.put("start_date",rs3.getString("start_time"));
		    	 reportMap.put("end_date",rs3.getString("end_time"));
		    	 reportMap.put("duration",rs3.getString("duration"));
		    	 reportMap.put("part_number",rs3.getString("cl_lot"));
		    	 reportMap.put("description",rs3.getString("remark"));
		    	 reportMap.put("index","");
		    	 reportMap.put("weight",rs3.getString("total"));
		    	 reportMap.put("processed_weight",rs3.getString("count"));
		    	 reportMap.put("process_type",rs3.getString("pattn"));
		     }
		     
		     stmt4 = conn.createStatement();  
		     rs4 = stmt4.executeQuery(workingSql.toString());  
		     int rowCount4 = rs4.last() ? rs4.getRow() : 0;  
		     rs4.beforeFirst();  
		     int index4 = 0;
		     
		     
		     while(rs4.next()){
		    	 reportMap.put("hf1",rs4.getString("hf1"));
		    	 reportMap.put("hf2",rs4.getString("hf2"));
		    	 reportMap.put("hf3",rs4.getString("hf3"));
		    	 reportMap.put("hf4",rs4.getString("hf4"));
		    	 reportMap.put("hf5",rs4.getString("hf5"));
		    	 reportMap.put("qt",rs4.getString("qt"));
		    	 reportMap.put("dipp",rs4.getString("dipp"));
		    	 reportMap.put("shower",rs4.getString("shower"));
		    	 reportMap.put("tf1",rs4.getString("tf1"));
		    	 reportMap.put("tf2",rs4.getString("tf2"));
		    	 reportMap.put("tf3",rs4.getString("tf3"));
		    	 reportMap.put("tf4",rs4.getString("tf4"));
		    	 reportMap.put("tf5",rs4.getString("tf5"));
		    	 reportMap.put("tf6",rs4.getString("tf6"));
		    	 reportMap.put("recipe",rs4.getString("pattn_name"));
		     }
		     
		     stmt5 = conn.createStatement();  
		     rs5 = stmt5.executeQuery(timeSql.toString());  
		     int rowCount5 = rs5.last() ? rs5.getRow() : 0;  
		     rs5.beforeFirst();  
		     int index5 = 0;
		     
		     
		     while(rs5.next()){
		    	 reportMap.put("hf_stime",rs5.getString("hf_stime"));
		    	 reportMap.put("tf_stime",rs5.getString("tf_stime"));
		    	 reportMap.put("qt_stime",rs5.getString("qt_stime"));
		    	 reportMap.put("dipp_stime",rs5.getString("dipp_stime"));
		    	 reportMap.put("sh_stime",rs5.getString("sh_stime"));
		     }
		     
		     
	     JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(rList);
	     JRBeanCollectionDataSource dataSource2 = new JRBeanCollectionDataSource(gList);
		
//	     System.out.println(alarmSql.toString());
//	     System.out.println(chartSql.toString());
//	     System.out.println(generalSql.toString());
//	     System.out.println(workingSql.toString());
//	     System.out.println(timeSql.toString());


	     
		boolean isExists = file.exists();

		if (isExists) {
			
			JasperReportsContext jasperReportsContext = new SimpleJasperReportsContext();
			JasperCompileManager compileManager = JasperCompileManager.getInstance(jasperReportsContext);
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
			
			try{
				String updateSql = "update tb_lotmng set print_filename = '"+fileName+"_"+now+".pdf"+"'  where 1=1 and lotno = '"+lno+"' ";
				pstmt = conn.prepareStatement(updateSql);
			//	System.out.println("로트넘버 : "+lno);
				
			//	System.out.println(pstmt.toString());
				
				pstmt.executeUpdate(updateSql);
				conn.commit();
			}catch(SQLException e){
				e.printStackTrace();	
			}finally{				
				if(pstmt != null){pstmt.close();}
				if(stmt2 != null){stmt2.close();}
				if(rs2 != null){rs2.close();}
				if(conn != null){conn.close();}
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
	}
	
	
	
%>