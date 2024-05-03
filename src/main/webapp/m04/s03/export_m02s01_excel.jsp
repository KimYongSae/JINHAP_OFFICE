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
<title>엑셀 POI 테스트 완료</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	/* int hogi = Integer.parseInt(request.getParameter("s_hogi"));
	String sdate = request.getParameter("s_sdate");
	String edate = request.getParameter("s_edate"); */ 

	int hogi = Integer.parseInt(request.getParameter("hogi"));
	String pnum = request.getParameter("pnum");
	String gang = request.getParameter("gang");
	String t_gb = request.getParameter("t_gb");
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	

	String sFileName = hogi+"호기_기준정보_" +sdf.format(now)+".xlsx";
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
	
	
	StringBuffer sql = new StringBuffer();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{	
		 
		 sql.append("SELECT * FROM ");
		 sql.append("tb_recipe_auto");
		 sql.append(hogi);
		 sql.append(" WHERE 1=1");
		 if (!"0".equals(pnum)) {
			    sql.append(" AND pnum = '" +pnum+ "'");
			}

			if (!"0".equals(gang)) {
			    sql.append(" AND gang = '" +gang+ "'");
			}

			if (!"0".equals(t_gb)) {
			    sql.append(" AND t_gb = '" +t_gb+ "'");
			}
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		FileInputStream fis = new FileInputStream(request.getRealPath("/")+"upload/m02s01_recipe.xlsx");
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
		
		
		/* objRow = objSheet.createRow((short)0);
		objRow.setHeight((short) 0x200);
		
		objCell = objRow.createCell((short)0);
		objCell.setCellValue("설비명"); objCell.setCellStyle(styleHd);

		objCell = objRow.createCell((short)1);
		objCell.setCellValue("품번"); objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell((short)2);
		objCell.setCellValue("품명"); objCell.setCellStyle(styleHd);

		objCell = objRow.createCell((short)3);
		objCell.setCellValue("강종"); objCell.setCellStyle(styleHd);		

		objCell = objRow.createCell((short)4);
		objCell.setCellValue("T급"); objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell((short)5);
		objCell.setCellValue("진합로트"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)6);
		objCell.setCellValue("소입온도"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)7);
		objCell.setCellValue("소려온도"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)8);
		objCell.setCellValue("CP"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)9);
		objCell.setCellValue("소입온도"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)10);
		objCell.setCellValue("소려온도"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)11);
		objCell.setCellValue("CP"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)12);
		objCell.setCellValue("장입량1"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)13);
		objCell.setCellValue("장입량2"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)14);
		objCell.setCellValue("장입량3"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)15);
		objCell.setCellValue("기준 장입량"); objCell.setCellStyle(styleHd);		
		
		objCell = objRow.createCell((short)16);
		objCell.setCellValue("요구경도"); objCell.setCellStyle(styleHd);		
		
		//길이 설정
		objSheet.setColumnWidth((short)0,(short)3000);
		objSheet.setColumnWidth((short)1,(short)8000);
		objSheet.setColumnWidth((short)2,(short)8000);
		objSheet.setColumnWidth((short)3,(short)3000);
		objSheet.setColumnWidth((short)4,(short)3000);		
		objSheet.setColumnWidth((short)5,(short)3000);		
		objSheet.setColumnWidth((short)6,(short)3000);		
		objSheet.setColumnWidth((short)7,(short)3000);		
		objSheet.setColumnWidth((short)8,(short)3000);		
		objSheet.setColumnWidth((short)9,(short)3000);		
		objSheet.setColumnWidth((short)10,(short)3000);		
		objSheet.setColumnWidth((short)11,(short)3000);		
		objSheet.setColumnWidth((short)12,(short)3000);		
		objSheet.setColumnWidth((short)13,(short)3000);		
		objSheet.setColumnWidth((short)14,(short)3000);		
		objSheet.setColumnWidth((short)15,(short)3000);		
		objSheet.setColumnWidth((short)16,(short)3000);	 */	
	
		
		int rsIdx = 1;
		while (rs.next()){
			
			//int rowCount = rs.last() ? rs.getRow() : 0;
			rsIdx++;
			//값 출력 행
			objRow = objSheet.createRow((short)rsIdx);
			objRow.setHeight ((short) 0x200);
		
			objCell = objRow.createCell((short)0);
			
			String r_hogi = "";
			String hogiValue = rs.getString("hogi");
				if (hogiValue != null) {
				    switch (hogiValue) {
				        case "1":
				        	r_hogi = "Q01-HN01";
				            break;
				        case "2":
				        	r_hogi = "Q01-HN02";
				            break;
				        case "3":
				        	r_hogi = "Q01-HN03";
				            break;
				        case "4":
				        	r_hogi = "Q01-HN04";
				            break;
				        case "5":
				        	r_hogi = "Q01-HN05";
				            break;
				        case "6":
				        	r_hogi = "Q01-HN06";
				            break;
				        default:
				        	r_hogi = "없음";
				            break;
				    }
				}
			
			objCell = objRow.createCell((short)0);
			objCell.setCellValue(r_hogi); objCell.setCellStyle(styleHd);
		
			objCell = objRow.createCell((short)1);
			objCell.setCellValue(rs.getString("pnum")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)2);
			objCell.setCellValue(rs.getString("pname")); objCell.setCellStyle(styleHd);			

			objCell = objRow.createCell((short)3);
			objCell.setCellValue(rs.getString("gang")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)4);
			objCell.setCellValue(rs.getString("t_gb")); objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell((short)5);
			objCell.setCellValue(rs.getString("lot")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)6);
			objCell.setCellValue(rs.getString("q_temp_jin")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)7);
			objCell.setCellValue(rs.getString("t_temp_jin")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)8);
			objCell.setCellValue(rs.getString("cp_jin")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)9);
			objCell.setCellValue(rs.getString("q_temp_ez")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)10);
			objCell.setCellValue(rs.getString("t_temp_ez")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)11);
			objCell.setCellValue(rs.getString("cp_ez")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)12);
			objCell.setCellValue(""); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)13);
			objCell.setCellValue(""); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)14);
			objCell.setCellValue(""); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)15);
			objCell.setCellValue(rs.getString("weight")); objCell.setCellStyle(styleHd);			
			
			objCell = objRow.createCell((short)16);
			objCell.setCellValue(rs.getString("hardness")); objCell.setCellStyle(styleHd);			
			
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