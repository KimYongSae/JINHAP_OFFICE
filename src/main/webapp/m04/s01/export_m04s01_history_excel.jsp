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
	String name = null;
	String sdate = request.getParameter("s_sdate");
	String edate = request.getParameter("s_edate");
	String b_hogi = request.getParameter("bd_hogi");
	String b_name = request.getParameter("b_name");
	
	if(request.getParameter("bd_hogi") != null && request.getParameter("bd_hogi").equals("")){
		hogi = "";
	} else{
		hogi = request.getParameter("bd_hogi") + "_";
	}
	
	if(request.getParameter("b_name") != null && request.getParameter("b_name").equals("")){
		name = "";
	} else{
		name = request.getParameter("b_name") + "_";
	}
	System.out.println(hogi);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	

	String sFileName = sdate + "~" + edate + "_" + hogi + name + "이력등록_리스트" + sdf.format(now)+".xlsx";
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
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	JSONObject mainObj = new JSONObject();  
	
	if (sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)) {
		whereSql.append(" AND tbd.bd_date BETWEEN '" + sdate + "' AND '" + edate + "'" );
	}if (b_hogi != null && !"".equals(b_hogi)) {
		whereSql.append(" AND tb.b_hogi = '" + b_hogi + "'" );
	}if (b_name != null && !"".equals(b_name)) {
		whereSql.append(" AND tb.b_name = '" + b_name + "'" );
    }
	
	sql.append("SELECT tb.b_name, tb.b_hogi,tb.b_loc, tbd.bd_date, tbd.bd_type, tbd.bd_memo, tb.b_code, tbd.bd_code ");
	sql.append( "FROM tb_bupum tb ");
	sql.append("INNER JOIN tb_bupum_detail tbd ON tb.b_code = tbd.b_code ");
	sql.append("WHERE 1=1 ");
	sql.append("AND tb.yn = 'Y' ");
	sql.append("AND tbd.yn = 'Y' ");
	sql.append(whereSql.toString());
	
	
           
	   //System.out.println("SQL query: " + sql.toString());
	
	
	Statement stmt = null;
	ResultSet rs = null;
	try
	{	
		 
		stmt = conn.createStatement();  
	    rs = stmt.executeQuery(sql.toString());
	    
		FileInputStream fis = new FileInputStream(request.getRealPath("/")+"upload/m04s01_history.xlsx");
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
			objCell.setCellValue(rs.getString("bd_code")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)1);
			objCell.setCellValue(rs.getString("b_loc")); objCell.setCellStyle(styleHd);			

			objCell = objRow.createCell((short)2);
			objCell.setCellValue(rs.getString("b_name")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)3);
			objCell.setCellValue(rs.getString("b_hogi")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)4);
			objCell.setCellValue(rs.getString("bd_date")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)5);
			objCell.setCellValue(rs.getString("bd_type")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)6);
			objCell.setCellValue(rs.getString("bd_memo")); objCell.setCellStyle(styleHd);
			
			
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