
<%@page import="org.artofsolving.jodconverter.document.DefaultDocumentFormatRegistry"%>
<%@page import="org.artofsolving.jodconverter.OfficeDocumentConverter"%>
<%@page import="org.artofsolving.jodconverter.document.DocumentFormatRegistry"%>
<%@page import="org.artofsolving.jodconverter.office.OfficeManager"%>
<%@page import="org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.poi.ss.usermodel.CellType"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.ss.examples.CellStyleDetails"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
org.apache.poi.hssf.usermodel.HSSFCell,
org.apache.poi.hssf.usermodel.HSSFRow,
org.apache.poi.hssf.usermodel.HSSFSheet,
org.apache.poi.hssf.usermodel.HSSFWorkbook ,
java.io.FileOutputStream,
java.util.List,
org.apache.poi.hssf.usermodel.HSSFCellStyle ,
org.apache.poi.hssf.usermodel.HSSFFont,
org.apache.poi.hssf.util.HSSFColor,
java.util.*,
    java.io.*" %>
<%@ include file="DBConnector.jsp" %>
<%@ include file="ppk_calc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엑셀 POI 테스트 완료</title>
</head>
<body>

<%   
	Ppk_Calc ppk_calc = new Ppk_Calc();

 String savePath = request.getRealPath("/")+"upload"; // 저장할 디렉토리   
 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
 Date now = new Date();
 
 int sizeLimit = 30 * 1024 * 1024 ; // 용량제한   
 String formName = "";   
 String fileName2 = "";
 String version = "";
 String pdfName = "";
 
 Vector vFileName = new Vector();   
 Vector vFileSize = new Vector();   
 String[] aFileName = null;   
 String[] aFileSize = null;   
 long fileSize = 0;   
 
 MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());   
 
 Enumeration formNames = multi.getFileNames(); 
// System.out.println(formNames);

 while (formNames.hasMoreElements()) 
 {    
  formName = (String)formNames.nextElement();
  String tempName = multi.getFilesystemName(formName);
  String originName = multi.getOriginalFileName(formName);
  
  File oldFile = new File(savePath+"/"+tempName);
  
  version = tempName.substring(tempName.lastIndexOf(".")+1,tempName.length());
  pdfName = originName.substring(0,originName.lastIndexOf("."))+"_"+sdf.format(now);
  fileName2 = originName.substring(0,originName.lastIndexOf("."))+"_"+sdf.format(now)+"."+version;
  File newFile = new File(savePath+"/"+fileName2);
  
  
  oldFile.renameTo(newFile);
  
  if(fileName2 != null)  // 파일이 업로드 되면
  {
   	  fileSize = multi.getFile(formName).length();   
   	  vFileName.addElement(fileName2);   
      vFileSize.addElement(String.valueOf(fileSize));    
  }    
 
 }
    
 aFileName = (String[])vFileName.toArray(new String[vFileName.size()]);   
 aFileSize = (String[])vFileSize.toArray(new String[vFileSize.size()]);
 PreparedStatement u_pstmt = null;
 PreparedStatement u_pstmt2 = null;
 PreparedStatement u_pstmt3 = null;
 
//String excelfile = "D:\\파일관리\\03.작업문서\\설비코드_import테스트\\설비CODE_EZ18204_20180905.xls";
%> 

<%
try{
	System.out.println(savePath);
//	System.out.println(fileName2);
//	System.out.println(multi.getParameter("import_date")+", "+multi.getParameter("import_cnt"));
	JSONArray valueArray = new JSONArray();
	
	SimpleDateFormat sdf_date1 = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	StringBuffer u_sql = new StringBuffer();
	StringBuffer u_sql2 = new StringBuffer();
	StringBuffer u_sql3 = new StringBuffer();
	
	
	
	String import_date = multi.getParameter("import_date");
	int import_cnt = Integer.parseInt(multi.getParameter("import_cnt"));
	Workbook workBook = null;
	
	if("xls".equals(version)){
		workBook = new HSSFWorkbook(new FileInputStream(savePath+"/"+fileName2));
		
	}else if("xlsx".equals(version)){
		workBook = new XSSFWorkbook(new FileInputStream(savePath+"/"+fileName2));
	}

	
	Sheet sheet = workBook.getSheetAt(0);
	int idx = 0;
	
	/*pdf파일 생성*/
	File inputFile = new File(savePath+"/"+fileName2);	//실제 파일위치
	File outputFile = new File(savePath+"/"+pdfName+".pdf");
	
	DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();
	
	
	configuration.setPortNumber(8100);
	configuration.setOfficeHome(new File("C:/Program Files (x86)/OpenOffice.org 3"));
	
	OfficeManager officeManager = configuration.buildOfficeManager();
	officeManager.start();
	DocumentFormatRegistry formatRegistry = new DefaultDocumentFormatRegistry();
	OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager, formatRegistry);
	 
	converter.convert(inputFile, outputFile);
	
	officeManager.stop();
	//상단 입력내용 업데이트
	//공정명, 측정항목, 품명
	Row row6 = sheet.getRow(6);
	Cell cell6_4 = row6.getCell(4);
	String processName = cell6_4.getStringCellValue();
	
	Cell cell6_8 = row6.getCell(8);
	String partNo = cell6_8.getStringCellValue();
	
	Cell cell6_14 = row6.getCell(14);
	String partName = cell6_14.getStringCellValue();
	
	//평가자, 평가일자, 샘플링 수
	Row row7 = sheet.getRow(7);
	Cell cell7_4 = row7.getCell(4);
	String evaluator = cell7_4.getStringCellValue();
	
	Cell cell7_11 = row7.getCell(11);
	String date1 = sdf_date1.format(cell7_11.getDateCellValue());
	
	Cell cell7_16 = row7.getCell(16);
	String sampleN = cell7_16.getStringCellValue();
	
	
	//검사항목, 계측기명, 측정단위
	Row row8 = sheet.getRow(8);
	Cell cell8_4 = row8.getCell(4);
	String item = cell8_4.getStringCellValue();
	
	Cell cell8_11 = row8.getCell(11);
	String measure = cell8_11.getStringCellValue();
	
	Cell cell8_16 = row8.getCell(16);
	String unit = cell8_16.getStringCellValue();
	
	//규격, 규격상한, 규격하한, 공차유형, 유형2
	Row row9 = sheet.getRow(9);
	Cell cell9_4 = row9.getCell(4);
	String spec = cell9_4.getStringCellValue();
	
	Cell cell9_8 = row9.getCell(8);
	double uppTol = cell9_8.getNumericCellValue();
	
	Cell cell9_12 = row9.getCell(12);
	double lowTol = cell9_12.getNumericCellValue();
	
	Cell cell9_16 = row9.getCell(16);
	String tolType = cell9_16.getStringCellValue();
	
	Cell cell9_18 = row9.getCell(18);
	String type2 = cell9_18.getStringCellValue();
	
	
	u_sql.append("update tb_ppk set proname = '"+processName+"', pno = '"+partNo+"', ");
	u_sql.append("pname = '"+partName+"', writer = '"+evaluator+"', date1 = '"+date1+"', ");
	u_sql.append("sampleN = '"+sampleN+"', item = '"+item+"', measure = '"+measure+"', ");
	u_sql.append("unit = '"+unit+"', spec = '"+spec+"', upp = '"+uppTol+"', low = '"+lowTol+"', ");
	u_sql.append("type = '"+tolType+"', file_yn = 'Y', filename = '"+pdfName+".pdf"+"' ");
	
	u_sql.append("where cnt = "+import_cnt+" ");
	
	
	u_pstmt = conn.prepareStatement(u_sql.toString());
	u_pstmt.executeUpdate();
	int chkIdx = 0;
	//측정값 업데이트
	for(int i=12; i<22; i++){
		Row row = sheet.getRow(i);
		for(int j=4; j<14; j++){
			u_sql2.setLength(0);
			Cell cell = row.getCell(j);
			if(cell.getCellTypeEnum() == CellType.STRING){
				System.out.println("문자 : "+cell.getStringCellValue());	
			}else if(cell.getCellTypeEnum() == CellType.NUMERIC){
//				System.out.println("숫자 : "+cell.getNumericCellValue());
//				System.out.println("["+(chkIdx+1)+"]"+cell.getNumericCellValue());
//				chkIdx++;

				if(cell.getNumericCellValue() != 0.0){
//					System.out.println("숫자O : "+cell.getNumericCellValue());
					u_sql2.append("update tb_ppk set val"+(idx+1)+" = "+cell.getNumericCellValue()+" ");
					valueArray.add(cell.getNumericCellValue());
				}else{
//					System.out.println("숫자X");
					u_sql2.append("update tb_ppk set val"+(idx+1)+" = '' ");
				}
				u_sql2.append("where cnt = "+import_cnt+" ");
				u_pstmt2 = conn.prepareStatement(u_sql2.toString());
				u_pstmt2.executeUpdate();
			}

		
			idx++;
		}
	}
	
	for(int x = valueArray.size(); x<100; x++){
		valueArray.add("");
	}
	
	
	u_sql3.append("update tb_ppk set ");
	u_sql3.append("m_ppk = '"+ppk_calc.ppk_ppk(valueArray, uppTol+"", lowTol+"")+"' ");
	u_sql3.append("where cnt = "+import_cnt+" ");
	
	u_pstmt3 = conn.prepareStatement(u_sql3.toString());
	u_pstmt3.executeUpdate();
	
	conn.commit();
	workBook.close();
	response.sendRedirect("s003002.jsp");
}catch(SQLException e){
	e.printStackTrace();
}finally{
	if(u_pstmt != null){u_pstmt.close();}
	if(u_pstmt2 != null){u_pstmt2.close();}
	if(conn != null){
		conn.close();
	}
	
}
%>
</body>
</html>
