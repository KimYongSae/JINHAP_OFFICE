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
<%@page import="org.apache.poi.ss.usermodel.Row"%>
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
<title>엑셀 POI 테스트 완료</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int year = Integer.parseInt(request.getParameter("s_year"));
	int month = Integer.parseInt(request.getParameter("s_month"));
	int lastYear = year-1;

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	

	sql.append("SELECT ");
	sql.append("COALESCE(year1, 0) AS year1, ");
	sql.append("COALESCE(month1, 0) AS month1, ");
	sql.append("COALESCE(hogi, 0) AS hogi, ");
	sql.append("COALESCE(dongjeomdo, '') AS dongjeomdo, ");
	sql.append("COALESCE(moisture_content, '') AS moisture_content, ");
	sql.append("COALESCE(max_cooling_rate, '') AS max_cooling_rate, ");
	sql.append("COALESCE(jeonsanga, '') AS jeonsanga, ");
	sql.append("COALESCE(ivf, '') AS ivf, ");
	sql.append("COALESCE(bigo, '') AS bigo ");
	sql.append(" FROM tb_oil ");
	sql.append(" WHERE (year1 = " +  lastYear  + " AND month1 > "+month+") OR (year1 = "+year+" AND month1 <= "+month+") ");
	sql.append(" order by hogi asc, year1 desc,  month1 desc ");

	Statement stmt = null;
	ResultSet rs = null;
	

	String sFileName = "소입유_경향_분석" +sdf.format(now)+".xlsx";
	sFileName = new String ( sFileName.getBytes("KSC5601"), "8859_1");	
	
	out.clear();
	out = pageContext.pushBody();
	response.reset();  // 이 문장이 없으면 excel 등의 파일에서 한글이 깨지는 문제 발생.

	
	
	

	String strClient = request.getHeader("User-Agent");

	String fileName = sFileName;

	if (strClient.indexOf("MSIE 5.5") > -1) {
	 response.setHeader("Content-Disposition", "filename=" + fileName + ";");
	} else {
	 response.setContentType("application/vnd.ms-excel");
	 response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
	}


	OutputStream fileOut = null;	
	
	try
	{	
		 

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		FileInputStream fis = new FileInputStream(request.getRealPath("/")+"upload/m02s04_excel.xlsx");
	    XSSFWorkbook objWorkBook = new XSSFWorkbook(fis); // XLSX 파일용
	    objWorkBook.setForceFormulaRecalculation(true); // 파일을 저장할 때 모든 수식을 다시 계산하도록 설정

	    XSSFSheet objSheet = objWorkBook.getSheetAt(1); // 두 번째 시트 가져오기
		
		/* XSSFWorkbook objWorkBook = new XSSFWorkbook();
		XSSFSheet objSheet = objWorkBook.createSheet(); */
		XSSFRow objRow = null;
		XSSFCell objCell = null;
		
		CellStyle styleHd = objWorkBook.createCellStyle();   //제목 스타일
		
		Font font = objWorkBook.createFont();
		font.setFontHeightInPoints((short)10);
		font.setFontName("헤드라인M");
		font.setBold(true);
		styleHd.setFont(font);
		
		
	
		
		int rsIdx = 0;
   		int cellIdx = 0;
		while (rs.next()) {

			
		    switch (rs.getInt("hogi")) {
		    	case 1:
		    		rsIdx = 2;
		    		break;
		    	case 2:
		    		rsIdx = 9;
		    		break;
		    	case 3:
		    		rsIdx = 16;
		    		break;
		    	case 4:
		    		rsIdx = 23;
		    		break;
		    	case 5:
		    		rsIdx = 30;
		    		break;
		    	case 6:
		    		rsIdx = 37;
		    		break;
		    }
	    		cellIdx = (rs.getInt("month1") - month + 15) <= 15 ? (rs.getInt("month1") - month + 15) : (rs.getInt("month1") - month + 15)-12; 
	    		System.out.println(cellIdx + "+" + rs.getInt("month1"));
	    		
	    		objRow = objSheet.getRow(rsIdx);
			    if (objRow == null) {
			        objRow = objSheet.createRow(rsIdx);
			    }
	    		objCell = objRow.getCell(cellIdx, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
	    		objCell.setCellValue(rs.getString("year1") + "년" + rs.getString("month1") + "월");
	    		
	    		objRow = objSheet.getRow(rsIdx+1);
			    if (objRow == null) {
			        objRow = objSheet.createRow(rsIdx+1);
			    }
	    		objCell = objRow.getCell(cellIdx, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
	    		objCell.setCellValue(rs.getDouble("dongjeomdo"));
	    		
	    		objRow = objSheet.getRow(rsIdx+2);
			    if (objRow == null) {
			        objRow = objSheet.createRow(rsIdx+2);
			    }
	    		objCell = objRow.getCell(cellIdx, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
	    		objCell.setCellValue(rs.getDouble("moisture_content"));
	    		
	    		objRow = objSheet.getRow(rsIdx+3);
			    if (objRow == null) {
			        objRow = objSheet.createRow(rsIdx+3);
			    }
	    		objCell = objRow.getCell(cellIdx, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
	    		objCell.setCellValue(rs.getDouble("max_cooling_rate"));
	    		
	    		objRow = objSheet.getRow(rsIdx+4);
			    if (objRow == null) {
			        objRow = objSheet.createRow(rsIdx+4);
			    }
	    		objCell = objRow.getCell(cellIdx, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
	    		objCell.setCellValue(rs.getDouble("jeonsanga"));
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