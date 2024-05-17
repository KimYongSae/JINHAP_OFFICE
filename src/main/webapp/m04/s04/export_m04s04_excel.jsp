<%@ page import="org.apache.poi.ss.usermodel.*"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엑셀 POI 테스트 완료</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String sdate = request.getParameter("t_sdate");
    String edate = request.getParameter("t_edate");

    String excelFilePath = request.getRealPath("/") + "upload/m04s04_excel.xlsx";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    Date now = new Date();
    String sFileName = "예방보전" + sdf.format(now) + ".xlsx";
    sFileName = new String(sFileName.getBytes("KSC5601"), "8859_1");

    out.clear();
	out = pageContext.pushBody();
    response.reset();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=" + sFileName + ";");

    OutputStream fileOut = null;
    FileInputStream fis = null;

    // SQL 쿼리
    String query =
        "SELECT hogi, inspection_item, oil_value, a_value, inspection_date, cnt " +
        "FROM ( " +
        "    SELECT hogi, inspection_item, oil_value, a_value, inspection_date, cnt, " +
        "           ROW_NUMBER() OVER (PARTITION BY hogi ORDER BY cnt ASC) as rn " +
        "    FROM tb_inspection " +
        "    WHERE inspection_date BETWEEN ? AND ? " +
        ") sub " +
        "WHERE rn <= 48 " +
        "ORDER BY hogi, inspection_date DESC, cnt ";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        fis = new FileInputStream(excelFilePath);
        Workbook workbook = new XSSFWorkbook(fis);

        workbook.setForceFormulaRecalculation(true);
        pstmt = conn.prepareStatement(query);
        pstmt.setDate(1, java.sql.Date.valueOf(sdate));
        pstmt.setDate(2, java.sql.Date.valueOf(edate));
        rs = pstmt.executeQuery();

        Map<Integer, Sheet> sheetMap = new HashMap<>();
        for (int i = 1; i <= 6; i++) {
            sheetMap.put(i, workbook.getSheetAt(i - 1));
        }

        Map<String, Integer[]> rowMap = new HashMap<>();
        rowMap.put("rf-chain", new Integer[]{8, 9});
        rowMap.put("top-gear", new Integer[]{10, 11});
        rowMap.put("top-sprocket", new Integer[]{12, 13});
        rowMap.put("top-bearing", new Integer[]{14, 15});
        rowMap.put("bottom-sprocket", new Integer[]{16, 17});
        rowMap.put("bottom-gear", new Integer[]{18, 19});
        rowMap.put("bottom-bearing", new Integer[]{20, 21});
        rowMap.put("chain", new Integer[]{22, 23});

        int[] cellOffsets = {17, 18, 19, 20, 21, 22};
        Map<String, Integer> dateCellOffsetMap = new HashMap<>();

        while (rs.next()) {
            int hogi = rs.getInt("hogi");
            String inspectionItem = rs.getString("inspection_item");
            String oilValue = rs.getString("oil_value");
            String aValue = rs.getString("a_value");
            String inspectionDate = rs.getDate("inspection_date").toString();

            Sheet sheet = sheetMap.get(hogi);
            Integer[] baseRows = rowMap.get(inspectionItem);

            Integer cellOffset = dateCellOffsetMap.get(inspectionDate);
            if (cellOffset == null) {
                cellOffset = cellOffsets[dateCellOffsetMap.size() % cellOffsets.length];
                dateCellOffsetMap.put(inspectionDate, cellOffset);
            }

            // 오일 값 작성
            Row oilRow = sheet.getRow(baseRows[0]);
            if (oilRow == null) {
                oilRow = sheet.createRow(baseRows[0]);
            }
            Cell oilCell = oilRow.getCell(cellOffset);
            if (oilCell == null) {
                oilCell = oilRow.createCell(cellOffset);
            }
            oilCell.setCellValue(oilValue);

            // a 값 작성
            Row aRow = sheet.getRow(baseRows[1]);
            if (aRow == null) {
                aRow = sheet.createRow(baseRows[1]);
            }
            Cell aCell = aRow.getCell(cellOffset);
            if (aCell == null) {
                aCell = aRow.createCell(cellOffset);
            }
            aCell.setCellValue(aValue);

            // 검사 날짜 작성 (5번 셀에 입력)
            Row dateRow = sheet.getRow(5);
            if (dateRow == null) {
                dateRow = sheet.createRow(5);
            }
            Cell dateCell = dateRow.getCell(cellOffset);
            if (dateCell == null) {
                dateCell = dateRow.createCell(cellOffset);
            }
            dateCell.setCellValue(inspectionDate);
        }

        fileOut = response.getOutputStream();
        workbook.write(fileOut);
        workbook.close();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException sqle) { }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException sqle) { }
        if (fis != null) try { fis.close(); } catch (IOException ioe) { }
        if (fileOut != null) try { fileOut.close(); } catch (IOException ioe) { }
        if (conn != null) try { conn.close(); } catch (SQLException sqle) { }
    }
%>
</body>
</html>
