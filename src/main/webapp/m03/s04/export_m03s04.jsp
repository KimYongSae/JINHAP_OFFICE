<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFFontFormatting"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFFont"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCellStyle"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 
<%@page import="java.util.Date"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엑셀 POI 테스트 완료</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	Statement stmt = null;
	ResultSet rs = null;


	String export_hogi = request.getParameter("export_hogi");
	int cnt = Integer.parseInt(request.getParameter("ppk_cnt"));
	String proname = request.getParameter("ppk_proname");
	String pno = request.getParameter("ppk_pno");
	String pname = request.getParameter("ppk_pname");
	String writer = request.getParameter("ppk_writer");
	String date = request.getParameter("ppk_date");
	String sampleN = request.getParameter("ppk_sampleN");
	String item = request.getParameter("ppk_item");
	String measure = request.getParameter("ppk_measure");
	String unit = request.getParameter("ppk_unit");
	String spec = request.getParameter("ppk_spec");
	String uppTol = request.getParameter("ppk_uppTol");
	String lowTol = request.getParameter("ppk_lowTol");
	String tolType = request.getParameter("ppk_tolType");
	String kg_hr = request.getParameter("ppk_kg_hr");
	
	String[] export_ppk = request.getParameterValues("export_ppk");
	
//	System.out.println(proname+", "+pno+", "+spec);

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	
	FileOutputStream fos = null;
	FileInputStream fis = null;
	
	//불러올 디렉토리
	String openPath = request.getRealPath("/")+"reports";
	
	//저장할 디렉토리
	String savePath = request.getRealPath("/")+"upload";
	
	
	PreparedStatement pstmt = null;
	StringBuffer u_sql = new StringBuffer();
	try
	{	
		fis = new FileInputStream(openPath+"/"+"ppk_"+export_hogi+".xlsx");
		
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
		CellStyle style = workbook.createCellStyle();
		
		
		XSSFSheet sheet = workbook.getSheetAt(0);
		
//getCell	
//		sheet.getRow(6).createCell(4).setCellValue(proname);
		sheet.getRow(6).getCell(4).setCellValue(proname);
//		sheet.getRow(6).createCell(8).setCellValue(pno);
		sheet.getRow(6).getCell(8).setCellValue(pno);
		
		String r_pname = "";
		/*
		if(pname.length() >= 12){
			String temp = pname;
			r_pname = temp.substring(0,12)+"\n"+pname.substring(12,pname.length());
		}else{
			r_pname = pname;
		}
		*/
		if(pname.length() != 0){
			if(pname.indexOf(" ") != -1){
				r_pname = pname.replaceFirst(" ", "\n");
			}
		}
		
//		sheet.getRow(6).createCell(14).setCellValue(r_pname);
		sheet.getRow(6).getCell(14).setCellValue(r_pname);
		
		if(!"".equals(kg_hr)){
			sheet.getRow(6).getCell(17).setCellValue(kg_hr+" kg/hr");	
		}else{
			sheet.getRow(6).getCell(17).setCellValue(kg_hr);
		}
		
		
		
//		sheet.getRow(7).createCell(4).setCellValue(writer);
		sheet.getRow(7).getCell(4).setCellValue(writer);
		
//		sheet.getRow(7).createCell(11).setCellValue(date);
		sheet.getRow(7).getCell(11).setCellValue(date);
		
//		sheet.getRow(7).createCell(16).setCellValue(sampleN);
		sheet.getRow(7).getCell(16).setCellValue(sampleN);
		
//		sheet.getRow(8).createCell(4).setCellValue(item);
		sheet.getRow(8).getCell(4).setCellValue(item);

//		sheet.getRow(8).createCell(11).setCellValue(measure);
		sheet.getRow(8).getCell(11).setCellValue(measure);
		
//		sheet.getRow(8).createCell(16).setCellValue(unit);
		sheet.getRow(8).getCell(16).setCellValue(unit);	
		
		
		
//		sheet.getRow(9).createCell(4).setCellValue(spec);
//		sheet.getRow(9).createCell(8).setCellValue(uppTol);
		if(!"".equals(uppTol) && uppTol != null){
			sheet.getRow(9).getCell(8).setCellValue(Float.parseFloat(uppTol));	
		}else{
			sheet.getRow(9).getCell(8).setCellValue(uppTol);
		}
		

//		sheet.getRow(9).createCell(12).setCellValue(lowTol);
		if(!"".equals(lowTol) && lowTol != null){
			sheet.getRow(9).getCell(12).setCellValue(Float.parseFloat(lowTol));	
		}else{
			sheet.getRow(9).getCell(12).setCellValue(lowTol);
		}
		
		sheet.getRow(9).getCell(16).setCellValue(tolType);	
		
//		sheet.get
		
		//측정값 등록
		if(export_ppk.length != 0){
			int array_chk = 0;
			for(int i=12; i<22; i++){			
				for(int j=4; j<14; j++){
	//				sheet.getRow(i).createCell(j).setCellValue(export_ppk[array_chk]);
					if(export_ppk[array_chk] != ""){
						sheet.getRow(i).getCell(j).setCellValue(Float.parseFloat(export_ppk[array_chk]));
					}
					
					array_chk++;
				}
			}
		}
		
		workbook.setForceFormulaRecalculation(true);

//		evaluator.
		
//		evaluator.evaluate(sheet.getRow(9).getCell(4));
		
		
		//엑셀 수식 재계산
//		workbook.setForceFormulaRecalculation(true);
		
		
		
		
		fos = new FileOutputStream(savePath+"/"+proname+"_"+sdf.format(now)+".xlsx");
		workbook.write(fos);
		workbook.close();
		
		u_sql.append("UPDATE tb_ppk SET filename = '"+proname+"_"+sdf.format(now)+".xlsx"+"' ");
		u_sql.append("WHERE cnt = "+cnt+" ");
		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.executeUpdate();
		
		conn.commit();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(fis != null){fis.close();}
		if(fos != null){fos.close();}
		if(pstmt != null){pstmt.close();}
		if(conn != null){conn.close();}
		
	}
	
%>
</body>
</html>
