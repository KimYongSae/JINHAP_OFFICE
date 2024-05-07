<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*, java.io.*, java.sql.*" %>
<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="org.apache.poi.xssf.usermodel.*" %>
<%@page import="org.apache.poi.hssf.usermodel.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@include file="../../db/DBConnector.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
String savePath = request.getServletContext().getRealPath("/upload/spare");
int sizeLimit = 30 * 1024 * 1024; // 30MB
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
String fileName = multi.getFilesystemName("file1");
String excelFilePath = savePath + File.separator + fileName;

if (fileName == null) {
    out.println("<script>alert('파일이 업로드 되지 않았습니다.'); history.back();</script>");
    return;
}
System.out.println("asdf");

PreparedStatement pstmt = null;
FileInputStream fis = null;

try {
    conn.setAutoCommit(false);

    // 기존 데이터 삭제
    pstmt = conn.prepareStatement(" TRUNCATE TABLE tb_spare ");
    pstmt.executeUpdate();

    // 파일 처리
    fis = new FileInputStream(excelFilePath);
    XSSFWorkbook workbook = new XSSFWorkbook(fis);
    XSSFSheet sheet = workbook.getSheetAt(0);

    String insertSql = "INSERT INTO tb_spare (seolbi, component_name, usage_location, specifications, manufacturer, replacement_frequency, purchase_cycle, current_stock, safety_stock, shortage_stock, unit, storage_location, rack_number, purchase_request, remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(insertSql);
	
    
    System.out.println(sheet.getLastRowNum());
    
    for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
        XSSFRow row = sheet.getRow(rowIndex);
            for (int colIndex = 1; colIndex < 16; colIndex++) {
                XSSFCell cell = row.getCell(colIndex, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                pstmt.setString(colIndex, cell.toString());
            }
            pstmt.addBatch();
    }

    pstmt.executeBatch();
    conn.commit();

} catch (Exception e) {
    if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
    out.println("<script>alert('처리 중 오류가 발생했습니다. 잠시 후 다시 시도하세요.'); history.back();</script>");
} finally {
    if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    if (fis != null) try { fis.close(); } catch (IOException ex) { ex.printStackTrace(); }
    new File(excelFilePath).delete(); // 파일 삭제
}
%>

<HTML>
<HEAD>
<TITLE>Excel Document Reader</TITLE>
</HEAD>
<BODY>
<center><h2>업로드 완료</h2></center>
</BODY>
</HTML>
