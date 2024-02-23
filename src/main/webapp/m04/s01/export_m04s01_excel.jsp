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
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 
<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONObject"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엑셀 POI 테스트 완료</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String hogi = null;
	String zone = null;
	
	if(request.getParameter("b_hogi") != null && request.getParameter("b_hogi").equals("")){
		hogi = "";
	} else{
		hogi = request.getParameter("b_hogi") + "_";
	}
	
	if(request.getParameter("b_zone") != null && request.getParameter("b_zone").equals("")){
		zone = "";
	} else{
		zone = request.getParameter("b_zone") + "_";
	}
	System.out.println(hogi);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	

	String sFileName = hogi + zone + "부품등록_리스트" + sdf.format(now)+".xlsx";
	sFileName = new String ( sFileName.getBytes("KSC5601"), "8859_1");	
	
	out.clear();
	out = pageContext.pushBody();
	response.reset();  // 이 문장이 없으면 excel 등의 파일에서 한글이 깨지는 문제 발생.

	
	
	 

	String strClient = request.getHeader("User-Agent");

	String fileName = sFileName;

	if (strClient.indexOf("MSIE 5.5") > -1) {
	 //response.setContentType("application/vnd.ms-excel");
	 response.setHeader("Content-Disposition", "filename=" + fileName + ";");
	} else {
	 response.setContentType("application/vnd.ms-excel");
	 response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
	}


	OutputStream fileOut = null;	
	
	//-----------------------
	String b_hogi = request.getParameter("b_hogi");
	String b_zone = request.getParameter("b_zone");
	

	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	
	if(b_hogi != null && !"".equals(b_hogi)){
		whereSql.append(" AND b_hogi = '"+b_hogi+"' ");
	}
	if(b_zone != null && !"".equals(b_zone)){
		whereSql.append(" AND b_loc = '"+b_zone+"' ");
	}
	
	sql.append("SELECT * ");
	sql.append("FROM tb_bupum ");
	sql.append("WHERE 1=1 ");
	sql.append("AND yn = 'Y' ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY regtime DESC LIMIT 20 ");
	
	Statement stmt = null;
	ResultSet rs = null;
	try
	{	
		 
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());
	    
		FileInputStream fis = new FileInputStream(request.getRealPath("/")+"upload/m04s01.xlsx");
	    XSSFWorkbook objWorkBook = new XSSFWorkbook(fis); // XLSX 파일용
	    
	    XSSFSheet objSheet = objWorkBook.getSheetAt(0); // 첫 번째 시트 가져오기
		
		XSSFRow objRow = null;
		XSSFCell objCell = null;
		
		CellStyle styleHd = objWorkBook.createCellStyle();   //제목 스타일
		
		Font font = objWorkBook.createFont();
		font.setFontHeightInPoints((short)10);
		font.setFontName("헤드라인M");
		font.setBold(true);
		styleHd.setFont(font);
		
		
	
		
		int rsIdx = 0;
		while (rs.next()){
			
			rsIdx++;
			//값 출력 행
			objRow = objSheet.createRow((short)rsIdx);
			objRow.setHeight ((short) 0x200);
		
			objCell = objRow.createCell((short)0);
			
			
			objCell = objRow.createCell((short)0);
			objCell.setCellValue(rs.getString("b_hogi")); objCell.setCellStyle(styleHd);
		
			objCell = objRow.createCell((short)1);
			objCell.setCellValue(rs.getString("b_loc")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)2);
			objCell.setCellValue(rs.getString("b_name")); objCell.setCellStyle(styleHd);			

			objCell = objRow.createCell((short)3);
			objCell.setCellValue(rs.getString("b_detail")); objCell.setCellStyle(styleHd);
			
			
		}
		
		
		out.clear();

		out = pageContext.pushBody();

		fileOut = response.getOutputStream(); 
		objWorkBook.write(fileOut);
		objWorkBook.close();
		fileOut.close();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>
</body>
</html>