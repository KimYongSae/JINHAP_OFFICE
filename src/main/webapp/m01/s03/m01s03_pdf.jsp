<%@page import="org.jfree.chart.plot.CategoryPlot"%>
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
<%@ page import="java.util.Iterator"%>
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
<%@page import="java.util.Objects"%>
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
<%@page import="java.util.Locale" %>
<%@page import="net.sourceforge.barbecue.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@include file="../../db/DBConnector_MSSQL.jsp" %>
<%@include file="m01s03_GraphicVo.jsp" %>
  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


	
	String jsonData = request.getParameter("json");



	Map<String,Object> reportMap = new HashMap<String,Object>();
	StringBuilder barcodeStringBuilder = new StringBuilder();
	String sdate;
	String edate;
	String item_cd;
            JSONArray jsonArray = new JSONArray(jsonData);

            JSONObject jsonindex0 = jsonArray.getJSONObject(jsonArray.length() - 1);
            String hogi = jsonindex0.getString("hogi");
            switch(hogi){
            case "1" :
             reportMap.put("hogi", "Q01-HN01");
            	break;	
            case "2" :
             reportMap.put("hogi", "Q01-HN02");
            	break;	
            case "3" :
             reportMap.put("hogi", "Q01-HN03");
            	break;	
            case "4" :
             reportMap.put("hogi", "Q01-HN04");
            	break;	
            case "5" :
             reportMap.put("hogi", "Q01-HN05");
            	break;	
            case "6" :
             reportMap.put("hogi", "Q01-HN06");
            	break;	
            }
            
            reportMap.put("lotno", jsonindex0.get("lot"));
            reportMap.put("item_cd", jsonindex0.get("item_cd"));
            item_cd = jsonindex0.getString("item_cd");
            reportMap.put("pname", jsonindex0.get("pname"));
            reportMap.put("gang", jsonindex0.get("gang"));
            reportMap.put("t_gb", jsonindex0.get("t_gb"));
            reportMap.put("sdate", jsonindex0.get("first_datetiem1_in_group"));
            sdate = jsonindex0.getString("first_datetiem1_in_group");
            reportMap.put("edate", jsonindex0.get("check_time"));
            edate = jsonindex0.getString("check_time");
            Timestamp sdateTimestamp = Timestamp.valueOf(jsonindex0.getString("first_datetiem1_in_group"));
            Timestamp edateTimestamp = Timestamp.valueOf(jsonindex0.getString("check_time"));

            long millisecondsDifference = edateTimestamp.getTime() - sdateTimestamp.getTime();
            long minutesDifference = millisecondsDifference / (1000 * 60);
            String timeDifference = String.valueOf(minutesDifference);
            reportMap.put("input_duration", timeDifference);
            
            int lotWeight = (int) Math.round(jsonindex0.getInt("lot_weight") * 0.01);
            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
            String formattedWeight = numberFormat.format(lotWeight);
            int weight2;
            if (Objects.equals(hogi, "2") || Objects.equals(hogi, "3")) {
            	weight2 = (int) (500 * ((double) minutesDifference / 60));
            	reportMap.put("weight2", String.valueOf(weight2));
			} else{
            	weight2 = (int) (1000 * ((double) minutesDifference / 60));
            	reportMap.put("weight2", String.valueOf(weight2));
			}
            
            reportMap.put("weight", formattedWeight);
            double weight3 = ((double)lotWeight / weight2) * 100;
            DecimalFormat decimalFormat = new DecimalFormat("0.00");
            String formattedWeight3 = decimalFormat.format(weight3);
            reportMap.put("weight3", formattedWeight3);
            
            
            reportMap.put("q1", jsonindex0.get("q_temp"));
            reportMap.put("cp", jsonindex0.get("cp"));
            reportMap.put("t1", jsonindex0.get("t_temp"));
            
        
        // JSON 배열을 순회하면서 각 객체 처리
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);

            String barcode = jsonObject.get("barcode").toString();
            
            if (barcodeStringBuilder.length() > 0) {
		        barcodeStringBuilder.append(",");
		    }
		    barcodeStringBuilder.append("'").append(barcode).append("'");
        }
        

        /* // 바코드
       StringBuffer sql_ms = new StringBuffer();
        
        sql_ms.append("SELECT barcode, inspvalue1, inspvalue2, inspvalue3, insprange ");
		sql_ms.append("FROM jqis_if_spc_heat ");
		sql_ms.append("WHERE 1=1 ");
		sql_ms.append("AND barcode IN ("+barcodeStringBuilder+") ");
		
		stmt_mssql = conn_mssql.createStatement(
				ResultSet.TYPE_SCROLL_SENSITIVE,//커서이동방법
				ResultSet.CONCUR_UPDATABLE //수정가능한 모드
	    	);
		rs_mssql = stmt_mssql.executeQuery(sql_ms.toString());

		int count = 1;
		while(rs_mssql.next()){
			String insp1 = rs_mssql.getString("inspvalue1");
			String insp2 = rs_mssql.getString("inspvalue2");
			String insp3 = rs_mssql.getString("inspvalue3");
			if (insp1 != null && !insp1.isEmpty()) {
		        reportMap.put("x" + count, insp1);
		        count++;
		        if (count > 15) {
		            break;
		        }
		    }
		    
		    if (insp2 != null && !insp2.isEmpty()) {
		        reportMap.put("x" + count, insp2);
		        count++;
		        if (count > 15) {
		            break;
		        }
		    }
		    
		    if (insp3 != null && !insp3.isEmpty()) {
		        reportMap.put("x" + count, insp3);
		        count++;
		        if (count > 15) {
		            break;
		        }
		    }
			
		}
		for(; count <= 15; count ++){
			reportMap.put("x" + count, "");
		}
		// 바코드 끝
		 */
	StringBuffer graphSql = new StringBuffer();
	List<GraphicVo> gList = new ArrayList<GraphicVo>();
		
	graphSql.append("SELECT * FROM tb_temp"+hogi+"_log WHERE datetime1 BETWEEN ");
	graphSql.append("'"+sdate+"' AND '"+edate+"'");
	
	Statement stmt = null;
	ResultSet rs = null;	
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(graphSql.toString());
	
	while(rs.next()){
		
		  
		 GraphicVo gvo = new GraphicVo(); 
		 gvo.setTdatetime(rs.getString("datetime1"));
		 gvo.setQ1(rs.getDouble("q1_pv"));
		 gvo.setQ2(rs.getDouble("q2_pv"));
		 gvo.setQ3(rs.getDouble("q3_pv"));
		 gvo.setQ4(rs.getDouble("q4_pv"));
		 gvo.setQ5(rs.getDouble("q5_pv"));
		 gvo.setCp(rs.getDouble("cp_pv"));
		 gvo.setOil(rs.getDouble("oil_pv"));
		 gvo.setMw(rs.getDouble("a_pv"));
		 gvo.setT1(rs.getDouble("t1_pv"));
		 gvo.setT2(rs.getDouble("t2_pv"));
		 gvo.setT3(rs.getDouble("t3_pv"));
		 gvo.setT4(rs.getDouble("t4_pv"));
		 
		 gList.add(gvo);
	}
	
	
	
	SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
	SimpleDateFormat t_format = new SimpleDateFormat("yyyyMMdd");
	
	Date time = new Date();
	
	String now = format.format(time);
		
	DecimalFormat df = new DecimalFormat("#,###");
	
	String outFileName = "";	
	String fileName = "lot_report"; //마스터
	String fileName2 = "lot_report_graph"; //서브
	
	
	 JSONObject mainObj = new JSONObject();
	 JSONArray mainArray = new JSONArray();
	 
	 mainObj.put("status", String.valueOf("ok"));

	try{
		String path = application.getRealPath("/reports");
		
		String abPath = request.getServletContext().getRealPath("/reports/"+fileName+".jrxml");
		String abPath2 = request.getServletContext().getRealPath("/reports/"+fileName2+".jrxml");
		
		String savePath = request.getServletContext().getRealPath("/reports/lot");
		
		String heat_lot = "";
		
		File file = new File(abPath);
		
		String work_start = "";
		String work_end = "";
		String num_hogi = "";
		
		
		String work_lot_no = "";
		String model_code = "";
		int box_cnt = 0;
		

		
		
		//임시
//		reportMap.put("hf_stime","");
//		reportMap.put("tf_stime","");
		reportMap.put("qt_stime","");
		reportMap.put("dipp_stime","");
		reportMap.put("sh_stime","");
		
		
		JRBeanCollectionDataSource dataSource2 = new JRBeanCollectionDataSource(gList);		
		
//		CategoryPlot categoryPlot = (CategoryPlot)
		
			//리포트
		boolean isExists = file.exists();

		if (isExists) {
			
			JasperReportsContext jasperReportsContext = new SimpleJasperReportsContext();
			
			JasperCompileManager compileManager = 
						JasperCompileManager.getInstance(jasperReportsContext);
			
			
			JasperReport report = JasperCompileManager.compileReport(abPath);
			JasperReport subReport = JasperCompileManager.compileReport(abPath2);
			
			
			
			JasperFillManager fillManager = JasperFillManager.getInstance(jasperReportsContext);
			
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, reportMap);
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
			
			StringBuffer u_sql = new StringBuffer();
			/* u_sql.append("UPDATE tb_lot_report SET filename = '"+fileName+"_"+now+".pdf"+"', ");
			u_sql.append("file_yn = 'Y' ");
			u_sql.append("WHERE  = "+cnt+" "); */
			u_sql.append(" INSERT INTO tb_lot_report (hogi, first_datetiem1, item_cd, filename, yn)");
			u_sql.append(" VALUES ("+hogi+", '"+sdate+"', '"+item_cd+"', '"+fileName+"_"+now+".pdf"+"', 'Y')");
			u_sql.append(" ON DUPLICATE KEY UPDATE");
			u_sql.append("    filename = VALUES(filename),");
			u_sql.append("    yn = VALUES(yn)");

			System.out.println(u_sql.toString());
			stmt = conn.createStatement();
			stmt.executeUpdate(u_sql.toString());
			
			
			
			try{
				conn.commit();
			}catch(SQLException e){
				e.printStackTrace();	
			}finally{				
				
				
			}
			
		} else {
		System.out.println("파일없음");
		} 
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		out.print(mainObj);
		out.flush();
		 try {
		        if (rs != null) rs.close();
		        if (stmt != null) stmt.close();
		        if (conn != null) conn.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
	}
	
	
	
%>