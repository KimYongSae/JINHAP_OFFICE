 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.ss.usermodel.Row" %>
<%@page import="org.apache.poi.ss.usermodel.Cell" %>
<%@page import="org.apache.poi.ss.usermodel.DateUtil" %>
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
<%@page import="java.util.*,java.io.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>

<%   
request.setCharacterEncoding("UTF-8");
 String savePath = request.getRealPath("/")+"upload"; // 저장할 디렉토리   
 int sizeLimit = 30 * 1024 * 1024 ; // 용량제한   
 String formName = "";   
 String fileName2 = "";
 Vector vFileName = new Vector();   
 Vector vFileSize = new Vector();   
 String[] aFileName = null;   
 String[] aFileSize = null;   
 long fileSize = 0;   
 
 MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
 String b_code = multi.getParameter("b_code");
 String hogiCode = multi.getParameter("hogi");
 /* String u_id = (String)request.getSession().getAttribute("sid"); */
 Enumeration formNames = multi.getFileNames();    
 while (formNames.hasMoreElements()) 
 {
  formName = (String)formNames.nextElement();    
  fileName2 = multi.getFilesystemName(formName);    
  
  if(fileName2 != null)  // 파일이 업로드 되면
  {      
   	  fileSize = multi.getFile(formName).length();   
   	  vFileName.addElement(fileName2);   
      vFileSize.addElement(String.valueOf(fileSize));    
  }    
 
 }
 
 
    
 aFileName = (String[])vFileName.toArray(new String[vFileName.size()]);   
 aFileSize = (String[])vFileSize.toArray(new String[vFileSize.size()]);
 String excelFilePath = savePath + File.separator + fileName2;

 try {
	 
	 ResultSet rs = null;
	 PreparedStatement pstmt = null;
	 
     FileInputStream fis = new FileInputStream(excelFilePath);
     XSSFWorkbook workbook = new XSSFWorkbook(fis); // XLSX 파일용

     XSSFSheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 가져오기
        	 System.out.println(b_code);

     // 두 번째 행부터 마지막 행까지 데이터를 읽어옵니다.
     for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
         XSSFRow row = sheet.getRow(rowIndex);
         if (row != null && row.getCell(0).toString() != "") {
        	//String sql = "{call sp_recipe_auto(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        	String sql = "{call sp_bupum_set(?,?,?,?,?)}";
        	pstmt = conn.prepareStatement(sql);
        	
        	pstmt.setString(1, b_code);
        	
        	int[] pstmtIndices = {2, 5, 3, 4};
            // 각 셀을 순회하면서 데이터를 가져옵니다.
            for (int i = 0; i <= 3; i++) {
            	XSSFCell cell = row.getCell(i);
            	
            	System.out.println(row.getCell(i));
            	int pstmtIndex = pstmtIndices[i];
            	if (cell != null) {
	            	switch(cell.getCellType()){
	            		case NUMERIC:
	            			if(cell.getNumericCellValue() % 1 == 0){
	            				pstmt.setInt(pstmtIndex, (int) cell.getNumericCellValue());
	            			} else{
	            				pstmt.setDouble(pstmtIndex, cell.getNumericCellValue());
	            			}
	            			break;
	            		case STRING:
	            			pstmt.setString(pstmtIndex, cell.toString());
	            			break;
	            		default:
	            			pstmt.setString(pstmtIndex, cell.toString());
	            			break;
	            	}
            	}else {
                    pstmt.setString(pstmtIndex, "");
                }
            	
            	
            }
            
            int numberPart = Integer.parseInt(b_code.substring(1));
            numberPart++;
            String formattedNumber = String.format("%05d", numberPart);
            
            b_code = "b" + formattedNumber;
            
            //out.println(pstmt.toString());
            pstmt.executeUpdate();
            
         }
     }
     conn.commit();

     // 스트림을 닫습니다.
     fis.close();
     
     File fileToDelete = new File(excelFilePath);
     fileToDelete.delete();

     
 } catch (Exception e) {
     e.printStackTrace();
     %>
     <script language=javascript>
      alert("처리중 오류가 발생하였습니다\n잠시후 다시 시도하세요!!");
      history.back();
     </script>
     <%
 }
 finally
 {
  if(conn != null)
  {
   conn.close();   
  }
  %>
  	<script>
/* 		window.close();
		opener.getSelect();
		opener.getConditionList(); */
  	</script>
  	
  <%
 }
 
%> 


 
 
<HTML>  
<HEAD>  
<TITLE>Excel Document Reader</TITLE>  
</HEAD>  
<BODY>  
<br><br><br>
  
  	
</BODY>  
</HTML>