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


	String whereSql = "";
	int seolbi = Integer.parseInt(request.getParameter("s_seolbi"));
	switch(seolbi){
	case 1:
		whereSql = "AND seolbi = '연속로'";
		break;
	case 2:
		whereSql = "AND seolbi = '소입로'";
		break;
	case 3:
		whereSql = "AND seolbi = '배치로'";
		break;
	case 4:
		whereSql = "AND seolbi = '변성로'";
		break;
}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	

	String sFileName = "SPARE관리대장" +sdf.format(now)+".xlsx";
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
	
	
	StringBuffer sql = new StringBuffer();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{	
		 

		sql.append(" SELECT * FROM tb_spare WHERE 1=1 ");
		sql.append(whereSql);
		
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		FileInputStream fis = new FileInputStream(request.getRealPath("/")+"upload/m04s03_spare.xlsx");
	    XSSFWorkbook objWorkBook = new XSSFWorkbook(fis); // XLSX 파일용

	    XSSFSheet objSheet = objWorkBook.getSheetAt(0); // 첫 번째 시트 가져오기
		
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
		while (rs.next()) {
		    rsIdx++;

		    // 행이 존재하지 않을 경우 새로운 행을 생성합니다.
		    objRow = objSheet.getRow(rsIdx);
		    if (objRow == null) {
		        objRow = objSheet.createRow(rsIdx);
		    }

		    // 각 셀에 데이터를 설정하기 전에 셀이 존재하는지 확인하고, 존재하지 않을 경우 새로운 셀을 생성합니다.
		    for (int cellIndex = 0; cellIndex < 16; cellIndex++) {
		        objCell = objRow.getCell(cellIndex, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
		        switch (cellIndex) {
		            case 0:
		                objCell.setCellValue(rs.getString("cnt"));
		                break;
		            case 1:
		                objCell.setCellValue(rs.getString("seolbi"));
		                break;
		            case 2:
		                objCell.setCellValue(rs.getString("component_name"));
		                break;
		            case 3:
		                objCell.setCellValue(rs.getString("usage_location"));
		                break;
		            case 4:
		                objCell.setCellValue(rs.getString("specifications"));
		                break;
		            case 5:
		                objCell.setCellValue(rs.getString("manufacturer"));
		                break;
		            case 6:
		                objCell.setCellValue(rs.getString("replacement_frequency"));
		                break;
		            case 7:
		                objCell.setCellValue(rs.getString("purchase_cycle"));
		                break;
		            case 8:
		                objCell.setCellValue(rs.getString("current_stock"));
		                break;
		            case 9:
		                objCell.setCellValue(rs.getString("safety_stock"));
		                break;
		            case 10:
		                objCell.setCellValue(rs.getString("shortage_stock"));
		                break;
		            case 11:
		                objCell.setCellValue(rs.getString("unit"));
		                break;
		            case 12:
		                objCell.setCellValue(rs.getString("storage_location"));
		                break;
		            case 13:
		                objCell.setCellValue(rs.getString("rack_number"));
		                break;
		            case 14:
		                objCell.setCellValue(rs.getString("purchase_request"));
		                break;
		            case 15:
		                objCell.setCellValue(rs.getString("remarks"));
		                break;
		        }
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
	}
	
%>
</body>
</html>