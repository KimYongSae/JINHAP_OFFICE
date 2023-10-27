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

	int hogi = Integer.parseInt(request.getParameter("m_hogi"));
	String ymonth = request.getParameter("m_date");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	

	String sFileName = "알람목록_" +ymonth+"_"+sdf.format(now)+".xlsx";
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
	
	
	StringBuffer s_sql = new StringBuffer();
	StringBuffer whereSql = new StringBuffer();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{	
		switch(hogi){
			case 0: whereSql.append(" AND AreaMask IN (0, 1, 2, 4, 8, 16, 32) "); break;
			case 1: whereSql.append(" AND AreaMask = 1 "); break;
			case 2: whereSql.append(" AND AreaMask = 2 "); break;
			case 3: whereSql.append(" AND AreaMask = 4 "); break;
			case 4: whereSql.append(" AND AreaMask = 8 "); break;
			case 5: whereSql.append(" AND AreaMask = 16 "); break;
			case 6: whereSql.append(" AND AreaMask = 32 "); break;
		}
		 
		whereSql.append(" AND date1 = '"+ymonth+"' ");
		
		s_sql.append("SELECT AreaMask, descString,  ");
		s_sql.append("date1, cnt ");
		s_sql.append("FROM v_ae_rank_m ");
		s_sql.append("WHERE 1=1 ");
		s_sql.append(whereSql.toString());
		s_sql.append("ORDER BY Areamask, cnt DESC ");
		
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		
		
		XSSFWorkbook objWorkBook = new XSSFWorkbook();
		XSSFSheet objSheet = objWorkBook.createSheet();
		XSSFRow objRow = null;
		XSSFCell objCell = null;
		
		CellStyle styleHd = objWorkBook.createCellStyle();   //제목 스타일
		
		Font font = objWorkBook.createFont();
		font.setFontHeightInPoints((short)20);
		font.setFontName("헤드라인M");
		font.setBold(true);
		styleHd.setFont(font);
		
		objRow = objSheet.createRow((short)0);
		objRow.setHeight((short) 0x200);

		objCell = objRow.createCell((short)0);
		objCell.setCellValue("발생년월"); objCell.setCellStyle(styleHd);		

		objCell = objRow.createCell((short)1);
		objCell.setCellValue(ymonth.replace("-","년")+"월"); objCell.setCellStyle(styleHd);			
		
		objRow = objSheet.createRow((short)1);
		objRow.setHeight((short) 0x200);
		
		objCell = objRow.createCell((short)0);
		objCell.setCellValue("No."); objCell.setCellStyle(styleHd);

		objCell = objRow.createCell((short)1);
		objCell.setCellValue("설비명"); objCell.setCellStyle(styleHd);

		objCell = objRow.createCell((short)2);
		objCell.setCellValue("알람내용"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)3);
		objCell.setCellValue("발생 수"); objCell.setCellStyle(styleHd);		
		
		
		//길이 설정
		objSheet.setColumnWidth((short)0,(short)5000);
		objSheet.setColumnWidth((short)1,(short)8000);
		objSheet.setColumnWidth((short)2,(short)16000);
		objSheet.setColumnWidth((short)3,(short)8000);	
	
		
		int rsIdx = 1;
		while (rs.next()){
			
			//int rowCount = rs.last() ? rs.getRow() : 0;
			rsIdx++;
			//값 출력 행
			objRow = objSheet.createRow((short)rsIdx);
			objRow.setHeight ((short) 0x200);
		
			objCell = objRow.createCell((short)0);
			objCell.setCellValue((rsIdx-1)); objCell.setCellStyle(styleHd);
			
			String r_hogi = "";
			switch(rs.getInt("AreaMask")){
				case 1: r_hogi = "Q01-HN01"; break;
				case 2: r_hogi = "Q01-HN02"; break;
				case 4: r_hogi = "Q01-HN03"; break;
				case 8: r_hogi = "Q01-HN04"; break;
				case 16: r_hogi = "Q01-HN05"; break;
				case 32: r_hogi = "Q01-HN06"; break;
				case 0: r_hogi = "시스템 알람"; break;
			}				
			
			objCell = objRow.createCell((short)1);
			objCell.setCellValue(r_hogi); objCell.setCellStyle(styleHd);
		
			objCell = objRow.createCell((short)2);
			objCell.setCellValue(rs.getString("descString")); objCell.setCellStyle(styleHd);
			
//			System.out.println(rsIdx+" : "+rs.getString("descString"));
			
			
			objCell = objRow.createCell((short)3);
			objCell.setCellValue(rs.getInt("cnt")); objCell.setCellStyle(styleHd);				
			
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