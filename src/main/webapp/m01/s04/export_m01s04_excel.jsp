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

	String hogi = (request.getParameter("hogi"));
	String sdate = request.getParameter("date");
	String edate = request.getParameter("edate");
	String cnt = request.getParameter("cnt");
	
	switch (hogi) {
    case "Q01-HN01":
        hogi = "1";
        break;
    case "Q01-HN02":
    	hogi = "2";
        break;
    case "Q01-HN03":
    	hogi = "3";
        break;
    case "Q01-HN04":
    	hogi = "4";
        break;
    case "Q01-HN05":
    	hogi = "5";
        break;
    case "Q01-HN06":
    	hogi = "6";
        break;
	}
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    SimpleDateFormat sdfDisplay = new SimpleDateFormat("HH:mm:ss");
	
    //Date lastDate = sdf.parse(edate);
    
	Date now = new Date();

	String sFileName = hogi+"호기_작업일보_" +sdf.format(now)+".xlsx";
	//String sFileName = "1호기_작업일보_" +sdf.format(now)+".xlsx";
	String fileName = URLEncoder.encode(sFileName, "UTF-8").replaceAll("\\+", "%20");
	
	out.clear();
	out = pageContext.pushBody();
	response.reset(); 

	/* response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	String headerValue = String.format("attachment; filename*=UTF-8''%s", fileName);
	response.setHeader("Content-Disposition", headerValue); */


	OutputStream fileOut = null;	
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	StringBuffer delaySql = new StringBuffer();
	
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	FileInputStream fis = null;
	XSSFWorkbook objWorkBook = null;
	
	try
	{	
		 
		// 엑셀에 담을 데이터 db에서 조회
		
		/* sql.append(" select * from tb_tong_log WHERE ");
		sql.append(" STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '2024-02-07 08:00:00' AND '2024-02-08 01:00:00' ");
		//sql.append(" STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 01:00:00' ");
		sql.append(" and hogi = "+hogi+" "); */
		
		/* sql.append("SELECT tb_tong_log.*, tb_recipe_auto1_filtered.* ");
		sql.append("FROM tb_tong_log ");
		sql.append("LEFT JOIN ( ");
		sql.append("    SELECT *, ROW_NUMBER() OVER(PARTITION BY pnum ORDER BY (SELECT NULL)) AS rn ");
		sql.append("    FROM tb_recipe_auto"+hogi);
		sql.append(") AS tb_recipe_auto1_filtered ON tb_tong_log.item_cd = tb_recipe_auto1_filtered.pnum AND tb_recipe_auto1_filtered.rn = 1 ");
		sql.append("WHERE STR_TO_DATE(tb_tong_log.datetiem1, '%Y%m%d%H%i%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 12:00:00' ");
		sql.append("AND tb_tong_log.hogi = "+hogi+" ");
		sql.append("ORDER BY tb_tong_log.datetiem1 ASC;"); */
		
/* 		sql.append(" SELECT * FROM v_work"+hogi);
		sql.append(" WHERE 1=1 ");
		sql.append(" AND stime BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00'"); */
		
		sql.append("SELECT ");
		sql.append("  sub.*,");
		sql.append("  first_datetiem1_in_group,");
		sql.append("  tra_filtered.*,");
		sql.append("  wrk_filtered.stime, wrk_filtered.etime, wrk_filtered.in_min, wrk_filtered.in_cnt, wrk_filtered.lot_weight  ");
		sql.append("FROM (");
		sql.append("  SELECT ");
		sql.append("    main.*,");
		sql.append("    MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY item_cd_group) AS first_datetiem1_in_group");
		sql.append("  FROM (");
		sql.append("    SELECT ");
		sql.append("      t.*,");
		sql.append("      SUM(CASE WHEN item_cd != @prev_item_cd THEN 1 ELSE 0 END) OVER (ORDER BY STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') ASC) AS item_cd_group,");
		sql.append("      @prev_item_cd := item_cd");
		sql.append("    FROM tb_tong_log t");
		sql.append("    CROSS JOIN (SELECT @prev_item_cd := NULL) as init");
		sql.append("    WHERE hogi = '"+hogi+"' ");
		sql.append("    AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '"+sdate+" 07:00:00' AND '"+edate+" 12:00:00'");
		sql.append("  ) AS main");
		sql.append(" ) AS sub");
		sql.append(" LEFT OUTER JOIN (");
		sql.append("  SELECT *,");
		sql.append("    ROW_NUMBER() OVER (PARTITION BY pnum ORDER BY pname) AS rn");
		sql.append("  FROM tb_recipe_auto"+hogi+"");
		sql.append(" ) AS tra_filtered ON sub.item_cd = tra_filtered.pnum AND tra_filtered.rn = 1");
		sql.append(" LEFT OUTER JOIN (");
		sql.append("  SELECT *,");
		sql.append("    ROW_NUMBER() OVER (PARTITION BY s_bar_time ORDER BY STR_TO_DATE(stime, '%Y%m%d%H%i%s')) AS rn");
		sql.append("  FROM v_work"+hogi+"");
		sql.append(" ) AS wrk_filtered ON STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') = wrk_filtered.s_bar_time AND wrk_filtered.rn = 1");
		sql.append(" WHERE STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00'");
		sql.append(" ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') asc;");



		
		
		
		System.out.println(sql.toString());
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		
		//=======================
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
		
	
		// A1 셀에 hogi 값 설정
		XSSFRow rowA1 = objSheet.getRow(0); // 0은 첫 번째 행을 의미
		XSSFCell cellA1 = rowA1.getCell(0); // 0은 첫 번째 열(A열)을 의미
		cellA1.setCellValue(hogi+"호기 작업일보"); // hogi 값 설정

		// A3 셀에 sdate 값 설정
		XSSFRow rowA3 = objSheet.getRow(2); // 2는 세 번째 행을 의미
		XSSFCell cellA3 = rowA3.getCell(0); // 0은 첫 번째 열(A열)을 의미
		cellA3.setCellValue("작업일자 : "+sdate); // sdate 값 설정

		
		
		int rsIdx = 7;
		int cIdx = 1;
		String beforeLot = null;
        Date startDate = null;
        Date endDate = null;
        String formattedDate = "";
        // db조회 후 엑셀매핑
		while(rs.next()){
			String lot = rs.getString("lot");

			if(beforeLot != null && !lot.equals(beforeLot)){
				rsIdx++;
			}
			objRow = objSheet.getRow((short)rsIdx);
			String stimeValue = rs.getString("stime");
			String stimeResult = stimeValue != null && stimeValue.length() >= 8 ? stimeValue.substring(stimeValue.length() - 8) : "0";
			String etimeValue = rs.getString("etime");
			String etimeResult = etimeValue != null && etimeValue.length() >= 8 ? etimeValue.substring(etimeValue.length() - 8) : "0";

			objCell = objRow.getCell(1);
			objCell.setCellValue(stimeResult);
			objCell = objRow.getCell(2);
			objCell.setCellValue(etimeResult);
			objCell = objRow.getCell(3);
			objCell.setCellValue(rs.getString("in_min"));
			objCell = objRow.getCell(4);
			objCell.setCellValue(rs.getString("in_cnt"));
			objCell = objRow.getCell(5);
			objCell.setCellValue(rs.getInt("weight") * (rs.getInt("in_min") / 60.0 ));
			objCell = objRow.getCell(6);
			objCell.setCellValue(rs.getInt("lot_weight")*0.01);
			objCell = objRow.getCell(8);
			objCell.setCellValue(rs.getInt("lot_weight")*0.01);
			objCell = objRow.getCell(8);
			objCell.setCellValue(rs.getString("pname"));
			
			objCell = objRow.getCell(9);
			objCell.setCellValue(rs.getString("item_cd"));
			
			objCell = objRow.getCell(10);
			objCell.setCellValue(rs.getString("gang"));
			
			objCell = objRow.getCell(11);
			objCell.setCellValue(rs.getDouble("cp_ez"));
			
			objCell = objRow.getCell(12);
			objCell.setCellValue(rs.getString("q_temp_ez"));
			
			objCell = objRow.getCell(13);
			objCell.setCellValue(rs.getString("t_temp_ez"));
			
			objCell = objRow.getCell(14);
			objCell.setCellValue(rs.getString("t_gb"));
			
			beforeLot = lot;

			
/* 			objRow = objSheet.getRow((short)rsIdx);
			
			objCell = objRow.getCell(1);
			objCell.setCellValue(rs.getString("stime").substring(rs.getString("stime").length() - 8));
			
			objCell = objRow.getCell(2);
			objCell.setCellValue(rs.getString("etime").substring(rs.getString("etime").length() - 8));
			
			objCell = objRow.getCell(3);
			objCell.setCellValue(rs.getString("in_min"));
			
			objCell = objRow.getCell(4);
			objCell.setCellValue(rs.getString("in_cnt"));
			
			objCell = objRow.getCell(5);
			objCell.setCellValue(rs.getInt("weight") * (rs.getInt("in_min") / 60.0 ));
			System.out.println(rs.getInt("weight"));
			System.out.println(rs.getInt("in_min"));
			System.out.println(rs.getInt("weight") * (rs.getInt("in_min") / 60.0 ));
			
			objCell = objRow.getCell(6);
			objCell.setCellValue(rs.getInt("lot_weight")*0.01);
			
			objCell = objRow.getCell(8);
			objCell.setCellValue(rs.getString("pname"));
			
			objCell = objRow.getCell(9);
			objCell.setCellValue(rs.getString("item_cd"));
			
			objCell = objRow.getCell(10);
			objCell.setCellValue(rs.getString("gang"));
			
			objCell = objRow.getCell(11);
			objCell.setCellValue(rs.getDouble("cp_ez"));
			
			objCell = objRow.getCell(12);
			objCell.setCellValue(rs.getString("q_temp_ez"));
			
			objCell = objRow.getCell(13);
			objCell.setCellValue(rs.getString("t_temp_ez"));
			
			objCell = objRow.getCell(14);
			objCell.setCellValue(rs.getString("t_gb"));
			
			rsIdx++; */
			
			/* 
			String lot = rs.getString("lot");
			int tcnt = rs.getInt("tcnt");
			
			if(beforeLot != null && !lot.equals(beforeLot)){
				rsIdx++;
			}
			objRow = objSheet.getRow((short)rsIdx);
			
			
			
			
			if((beforeLot != null && !lot.equals(beforeLot)) || beforeLot == null){
				// 시작시간
				objCell = objRow.getCell(1);
				startDate = sdf.parse(rs.getString("datetiem1"));
			    if (lastDate.after(startDate)) {
			        break;
			    }

	            String formattedDate = sdfDisplay.format(startDate);
				objCell.setCellValue(formattedDate);
								
				// 장입기준량
				objCell = objRow.getCell(5);
				objCell.setCellValue(rs.getInt("weight"));
				
				// 품명
				objCell = objRow.getCell(8);
				objCell.setCellValue(rs.getString("pname"));
				// 품번
				objCell = objRow.getCell(9);
				objCell.setCellValue(rs.getString("pnum"));

				// 강종
				objCell = objRow.getCell(10);
				objCell.setCellValue(rs.getString("gang"));
				
				// CP
				objCell = objRow.getCell(11);
				objCell.setCellValue(rs.getString("cp_jin"));
				
				// 소입온도
				objCell = objRow.getCell(12);
				objCell.setCellValue(rs.getString("q_temp_jin"));
				
				// 소려온도
				objCell = objRow.getCell(13);
				objCell.setCellValue(rs.getString("t_temp_jin"));
				
				// T급
				objCell = objRow.getCell(14);
				objCell.setCellValue(rs.getString("t_gb"));
				
				// 경도규격 조인한 데이터 사용
				
				
				
			}
			
			// 종료시간
				objCell = objRow.getCell(2);
				endDate = sdf.parse(rs.getString("datetiem1"));
	            String formattedDate = sdfDisplay.format(endDate);
				objCell.setCellValue(formattedDate);
				
			// 투입시간(분)
			
 	           if (startDate != null && endDate != null) {
				    long differenceInMillis = endDate.getTime() - startDate.getTime();
		            long differenceInMinutes = differenceInMillis / (1000 * 60);
					objCell = objRow.getCell(3);
					objCell.setCellValue(differenceInMinutes);
				} // 투입시간
			
			// 투입 통수
			objCell = objRow.getCell(4);
			objCell.setCellValue(rs.getInt("tcnt"));
			
			// LOT 작업중량
			objCell = objRow.getCell(6);
			objCell.setCellValue(rs.getInt("weight_sum"));
			
			
			
			if(tcnt ==1){
				beforeLot = lot;
				
			} */
			
		} // db조회 후 엑셀매핑
		
		
		
		delaySql.append(" SELECT hogi, tdatetime, prev_tdatetime, type, detail, ");
		delaySql.append(" TIME(tdatetime) AS ttime, ");
		delaySql.append(" TIME(prev_tdatetime) AS prev_ttime, ");
		delaySql.append(" TIMESTAMPDIFF(MINUTE, tdatetime, prev_tdatetime) AS time_difference ");
		delaySql.append(" FROM tb_delay_manual AS manual ");
		delaySql.append(" LEFT OUTER JOIN tb_delay_type_detail AS detail ");
		delaySql.append(" ON manual.value_detail = detail.idx ");
		delaySql.append(" LEFT OUTER JOIN tb_delay_type AS dtype ");
		delaySql.append(" ON manual.value = dtype.value ");
		delaySql.append(" WHERE ((tdatetime BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00') ");
		delaySql.append(" OR ('"+sdate+" 08:00:00' BETWEEN tdatetime AND prev_tdatetime)) ");
		delaySql.append(" AND  hogi = "+hogi);
		delaySql.append(" ORDER BY tdatetime asc");

		
		stmt3 = conn.createStatement();
		rs2 = stmt3.executeQuery(delaySql.toString());
		
		StringBuffer delayBuffer = new StringBuffer();
		int rsCounter = 0;
		int delayIndex = 57;
		
		while(rs2.next()){
			if(rsCounter == 4){
				rsCounter = 1;
				delayBuffer.setLength(0);
				delayIndex++;
			} else{
				rsCounter++;
			}
			XSSFRow rowDelay = objSheet.getRow(delayIndex);
			XSSFCell cellDelay = rowDelay.getCell(1);
			
			String type = rs2.getString("type");
			String detail = rs2.getString("detail");
			String tdatetime = rs2.getString("tdatetime");
			tdatetime = tdatetime.endsWith(".0") ? tdatetime.substring(0, tdatetime.length() - 2) : tdatetime;
			String ttime = rs2.getString("ttime");
			String prev_tdatetime = rs2.getString("prev_tdatetime");
			prev_tdatetime = prev_tdatetime.endsWith(".0") ? prev_tdatetime.substring(0, prev_tdatetime.length() - 2) : prev_tdatetime;
			String prev_ttime = rs2.getString("prev_ttime");
			String timeDiff = rs2.getString("time_difference");
						
			delayBuffer.append(tdatetime+" ~ "+prev_tdatetime+" "+timeDiff+"분"+" "+type+" "+detail+"        ");
			cellDelay.setCellValue(delayBuffer.toString()); 
		}
		
		
		out.clear();

		out = pageContext.pushBody();

		/* fileOut = response.getOutputStream(); */
	    String saveDirectory = request.getRealPath("/") + "upload/";
	    File outputFile = new File(saveDirectory + sFileName); // 저장할 파일 경로 및 이름
	    if (!outputFile.getParentFile().exists()) {
	        outputFile.getParentFile().mkdirs(); // 저장 경로가 없으면 생성
	    }
	    fileOut = new FileOutputStream(outputFile);
	
		
		
		objWorkBook.write(fileOut);
		objWorkBook.close();
		fileOut.close();
		
		
		sql2.append(" UPDATE tb_work_log SET filename = '"+sFileName+"' ");
		sql2.append(" WHERE cnt = "+cnt);
		
		stmt2 = conn.createStatement();
		stmt2.executeUpdate(sql2.toString());
		
		conn.commit();	
		
		response.setContentType("application/json");
		PrintWriter printOut = response.getWriter();
		printOut.print("{\"status\":\"ok\"}");
		printOut.flush();

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(stmt2 != null) try {stmt2.close();}catch(SQLException sqle){}
		if(stmt3 != null) try {stmt3.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(rs2 != null) try {rs2.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		if (objWorkBook != null) try {objWorkBook.close();} catch (IOException e){}
	    if (fis != null) try {fis.close();} catch (IOException e) {}
	    if (fileOut != null) try {fileOut.close();} catch (IOException e) {}
	}
	
%>
</body>
</html>