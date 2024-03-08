<%@page import="java.net.URLEncoder"%>
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
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업일보</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

/* 	int hogi = Integer.parseInt(request.getParameter("hogi"));
	String pnum = request.getParameter("pnum");
	String gang = request.getParameter("gang");
	String t_gb = request.getParameter("t_gb"); */
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();

	//String sFileName = hogi+"호기_작업일보_" +sdf.format(now)+".xlsx";
	String sFileName = "1호기_작업일보_" +sdf.format(now)+".xlsx";
	String fileName = URLEncoder.encode(sFileName, "UTF-8").replaceAll("\\+", "%20");
	
	out.clear();
	out = pageContext.pushBody();
	response.reset(); 

	response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	String headerValue = String.format("attachment; filename*=UTF-8''%s", fileName);
	response.setHeader("Content-Disposition", headerValue);


	OutputStream fileOut = null;	
	
	
	StringBuffer sql = new StringBuffer();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	FileInputStream fis = null;
	XSSFWorkbook objWorkBook = null;
	
	try
	{	
		 
		// 엑셀에 담을 데이터 db에서 조회
		
		/* stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString()); */
		
		fis = new FileInputStream(request.getRealPath("/")+"upload/work_log.xlsx");
	    objWorkBook = new XSSFWorkbook(fis); // XLSX 파일용

	    XSSFSheet objSheet = objWorkBook.getSheetAt(0); // 첫 번째 시트 가져오기
		
		XSSFRow objRow = null;
		XSSFCell objCell = null;
		
		CellStyle styleHd = objWorkBook.createCellStyle();   //제목 스타일
		
		Font font = objWorkBook.createFont();
		font.setFontHeightInPoints((short)10);
		font.setFontName("맑은 고딕");
		//font.setBold(true);
		styleHd.setFont(font);
		
			
		//테스트 코드
		//while (rs.next()){
		for(int rsIdx = 7; rsIdx < 11; rsIdx ++){
			
			objRow = objSheet.getRow((short)rsIdx);
		
			for(int j = 1; j < 32; j ++){
				objCell = objRow.getCell((short)j);
				objCell.setCellValue(rsIdx);
			}
			
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
		if (objWorkBook != null) try {objWorkBook.close();} catch (IOException e){}
	    if (fis != null) try {fis.close();} catch (IOException e) {}
	    if (fileOut != null) try {fileOut.close();} catch (IOException e) {}
	}
	
%>
</body>
</html>