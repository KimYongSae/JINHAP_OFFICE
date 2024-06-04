<%@page import="org.apache.poi.ss.usermodel.CellType"%>
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
<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="org.apache.commons.math3.linear.RealMatrix"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@include file="../../db/DBConnector_MSSQL.jsp" %>
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
    SimpleDateFormat timestampFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
	Date now = new Date();

	String sFileName = hogi+"호기_작업일보_" +sdf.format(now)+".xlsx";
	String fileName = URLEncoder.encode(sFileName, "UTF-8").replaceAll("\\+", "%20");
	
	out.clear();
	out = pageContext.pushBody();
	response.reset(); 

	OutputStream fileOut = null;	
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sql2 = new StringBuffer();
	StringBuffer delaySql = new StringBuffer();
	
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	Statement stmt_ms = null;
	ResultSet rs_ms = null;
	StringBuffer sql_ms = new StringBuffer();
	
	FileInputStream fis = null;
	XSSFWorkbook objWorkBook = null;
	
	try
	{	
		sql.append("SELECT ");
		sql.append("	SUM(CASE WHEN lot_group != @prev_lot_group THEN 1 ELSE 0 END) OVER (ORDER BY STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') ASC) AS new_lot_group, ");
		sql.append("   @prev_lot_group := lot_group, ");
		sql.append("  sub.*,");
		sql.append("  first_datetiem1_in_group,");
		sql.append("  tra_filtered.*,");
		sql.append("  wrk_filtered.stime, wrk_filtered.etime, wrk_filtered.in_min, wrk_filtered.in_cnt, wrk_filtered.lot_weight AS work_weight,  ");
		sql.append(" lot_group_count ");
		sql.append("FROM (");
		sql.append("  SELECT ");
		sql.append("    main.*,");
		sql.append("    MIN(STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s')) OVER (PARTITION BY lot_group) AS first_datetiem1_in_group, ");
		sql.append("    COUNT(*) OVER (PARTITION BY lot_group) AS lot_group_count ");
		sql.append("  FROM (");
		sql.append("    SELECT ");
		sql.append("      t.*,");
		sql.append("      @group_num := IF(@prev_gubun = '1', @group_num + 1, @group_num) AS lot_group,");
		sql.append("      @prev_gubun := gubun ");
		sql.append("    FROM tb_tong_log t");
		sql.append("    CROSS JOIN (SELECT @group_num := 0,  @prev_gubun := '', @prev_lot_group := NULL) AS init");
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
		sql.append("    ROW_NUMBER() OVER (PARTITION BY s_bar_time ORDER BY STR_TO_DATE(stime, '%Y-%m-%d %H:%i:%s')) AS rn");
		sql.append("  FROM v_work"+hogi+"");
		sql.append(" ) AS wrk_filtered ON STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') = wrk_filtered.s_bar_time AND wrk_filtered.rn = 1");
		sql.append(" WHERE STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00'");
		sql.append(" ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') asc;");

//		System.out.println(sql.toString());
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		
		//=======================
		fis = new FileInputStream(request.getRealPath("/")+"upload/work_log.xlsx");
	    objWorkBook = new XSSFWorkbook(fis); // XLSX 파일용

	    FormulaEvaluator evaluator = objWorkBook.getCreationHelper().createFormulaEvaluator();

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
		XSSFRow rowA1 = objSheet.getRow(0);
		XSSFCell cellA1 = rowA1.getCell(0);
		cellA1.setCellValue(hogi+"호기 작업일보");

		// A3 셀에 sdate 값 설정
		XSSFRow rowA3 = objSheet.getRow(2);
		XSSFCell cellA3 = rowA3.getCell(0);
		cellA3.setCellValue("작업일자 : "+sdate);

		
		
		int rsIdx = 7;
		//int rsIdx = 0;
		int cIdx = 1;
		String beforeLot = null;
        Date startDate = null;
        Date endDate = null;
        String formattedDate = "";
        Map<String, int[]> barcodeMap = new HashMap<>();
        StringBuilder barcodeStringBuilder = new StringBuilder();
        
        //2024-04-19 임시계산으로 추가
        Date t_startDate = null;
        Date t_endDate = null;
        // db조회 후 엑셀매핑
		while(rs.next()){			
			objRow = objSheet.getRow(rsIdx+rs.getInt("new_lot_group"));
			 
			objCell = objRow.getCell(1);
			
			startDate = timestampFormat.parse(rs.getString("first_datetiem1_in_group"));
			
			//보여지는 값(2024-04-19 수정)
			t_startDate = timestampFormat.parse(rs.getString("first_datetiem1_in_group"));
			Calendar stime_calendar = Calendar.getInstance();			
			stime_calendar.setTime(startDate);
//			stime_calendar.add(Calendar.SECOND, +45);
			stime_calendar.add(Calendar.SECOND, +30);
			t_startDate = stime_calendar.getTime();			
			formattedDate = sdfDisplay.format(t_startDate);
			objCell.setCellValue(formattedDate);
			
			// 종료시간
			objCell = objRow.getCell(2);
			if(rs.getString("since_counter") != null){
				endDate = timestampFormat.parse(rs.getString("check_time"));
//				endDate = sdf.parse(rs.getString("datetiem1"));
				t_endDate = timestampFormat.parse(rs.getString("check_time"));
				
				Calendar calendar = Calendar.getInstance();
				
				//2024-04-19 임시 계산
				Calendar etime_calendar = Calendar.getInstance();				
				etime_calendar.setTime(t_endDate);
//				etime_calendar.add(Calendar.SECOND, -90);
				etime_calendar.add(Calendar.SECOND, -60);
				t_endDate = etime_calendar.getTime();
				
	            calendar.setTime(endDate);
//	            calendar.add(Calendar.SECOND, +((rs.getInt("since_counter")/10)+120));
				calendar.add(Calendar.SECOND, +150);
				
				
	            endDate = calendar.getTime();
	            formattedDate = sdfDisplay.format(t_endDate);
	            objCell.setCellValue(formattedDate);
			} else{
				endDate = sdf.parse(rs.getString("datetiem1"));
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate);
				calendar.add(Calendar.MINUTE, 15);
				endDate = calendar.getTime();
				
				//2024-04-20 추가
				t_endDate = sdf.parse(rs.getString("datetiem1"));
				Calendar etime_calendar = Calendar.getInstance();				
				etime_calendar.setTime(t_endDate);
//				etime_calendar.add(Calendar.SECOND, -90);
				etime_calendar.add(Calendar.SECOND, -60);
				t_endDate = etime_calendar.getTime();
				
				
				formattedDate = sdfDisplay.format(t_endDate);
				objCell.setCellValue(formattedDate);
			}

			long differenceInMinutes = 0;
			long t_differenceInMinutes = 0;
			if (startDate != null && endDate != null) {
			    long differenceInMillis = endDate.getTime() - startDate.getTime();
			    
			    long t_differenceInMillis = t_endDate.getTime() - t_startDate.getTime();
	            differenceInMinutes = differenceInMillis / (1000 * 60);
	            t_differenceInMinutes = t_differenceInMillis / (1000 * 60);
				objCell = objRow.getCell(3);
				objCell.setCellValue(t_differenceInMinutes);
			} // 투입시간
			
			objCell = objRow.getCell(4);
			if(rs.getString("lot_group_count") != null){
				objCell.setCellValue(rs.getString("lot_group_count"));
			} else{
				objCell.setCellValue(rs.getString("tcnt"));
				
			}
			
			objCell = objRow.getCell(5);
			if(rs.getInt("tra_filtered.weight") == 0){
				if(hogi == "2" || hogi == "3"){
					objCell.setCellValue(500 * (differenceInMinutes / 60.0 ));
				} else{
					objCell.setCellValue(1000 * (differenceInMinutes / 60.0 ));
				}
			} else{
				objCell.setCellValue(rs.getInt("tra_filtered.weight") * (differenceInMinutes / 60.0 ));
			}
			
			objCell = objRow.getCell(6);
			if(rs.getString("lot_weight") != null){
				objCell.setCellValue(rs.getInt("lot_weight")*0.01);
			} else{
				objCell.setCellValue(rs.getInt("work_weight")*0.01);
			}
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
			
			//beforeLot = lot;

			int group = rs.getInt("new_lot_group");
		    String barcode = rs.getString("up_barcode");

		    if (!barcodeMap.containsKey(barcode)) {
		        int maxIndex = 0;
		        
		        for (int[] meta : barcodeMap.values()) {
		            if (meta[0] == group) {
		                maxIndex = Math.max(maxIndex, meta[1]);
		            }
		        }
		        //키 : 바코드, meta[0] : 로트 순번, meta[1] : 로트별 갯수
		        barcodeMap.put(barcode, new int[]{group, maxIndex + 1});
		    }
		    if (barcodeStringBuilder.length() > 0) {
		        barcodeStringBuilder.append(",");
		    }
		    barcodeStringBuilder.append("'").append(barcode).append("'");
		    
			
		    
		} // db조회 후 엑셀매핑
		
		for (Map.Entry<String, int[]> entry : barcodeMap.entrySet()) {
		    String barcode = entry.getKey();
		    int[] meta = entry.getValue();
		    if (meta != null) {
		    }
		}
		String barcodeString = barcodeStringBuilder.length() > 0 ? barcodeStringBuilder.toString() : "";

		if(barcodeString.length() > 0){
			// 바코드별 강도
			
			sql_ms.setLength(0);
			sql_ms.append("SELECT barcode, inspvalue1, inspvalue2, inspvalue3, insprange ");
			sql_ms.append("FROM jqis_if_spc_heat ");
			sql_ms.append("WHERE 1=1 ");
			sql_ms.append("AND barcode IN ("+barcodeString+") ");
			
			
			stmt_mssql = conn_mssql.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,//커서이동방법
					ResultSet.CONCUR_UPDATABLE //수정가능한 모드
		    	);
			rs_mssql = stmt_mssql.executeQuery(sql_ms.toString());
	
	//		System.out.println("barcodeString : "+barcodeString);
	
		
			while(rs_mssql.next()){
			    String barcode = rs_mssql.getString("barcode");
			    if (barcode != null) {
			        int[] meta = barcodeMap.get(barcode);
			        if (meta != null) {
			            objRow = objSheet.getRow(meta[0]+7);
			            if (objRow != null) {
			                objCell = objRow.getCell(15);
			                //경도기준
			                if (objCell == null) {
			                    objCell = objRow.createCell(15);
			                }
			                objCell.setCellValue(rs_mssql.getString("insprange"));
	
	//		               System.out.println("barcode : "+barcode+"// meta[0] : "+meta[0]+"// meta[1] : "+meta[1]);
	
							String value1 = rs_mssql.getString("inspvalue1");
							String value2 = rs_mssql.getString("inspvalue2");
							String value3 = rs_mssql.getString("inspvalue3");
							
							int rowCnt = 0;
							if(value1 != null && !"".equals(value1)){
				                objCell = objRow.getCell((meta[1]+rowCnt)+15);
				                if (objCell == null) {
				                    objCell = objRow.createCell((meta[1]+rowCnt)+15);
				                }
				                objCell.setCellValue(Double.parseDouble(rs_mssql.getString("inspvalue1")));							
							}
	
							if(value2 != null && !"".equals(value2)){
								rowCnt++;
				                objCell = objRow.getCell((meta[1]+rowCnt)+15);
				                if (objCell == null) {
				                    objCell = objRow.createCell((meta[1]+rowCnt)+15);
				                }
				                objCell.setCellValue(Double.parseDouble(rs_mssql.getString("inspvalue2")));							
							}
	
							if(value3 != null && !"".equals(value3)){
								rowCnt++;
				                objCell = objRow.getCell((meta[1]+rowCnt)+15);
				                if (objCell == null) {
				                    objCell = objRow.createCell((meta[1]+rowCnt)+15);
				                }
				                objCell.setCellValue(Double.parseDouble(rs_mssql.getString("inspvalue3")));							
							}
							
							
							
			            }
			        }
			    }
			    
			}
		}
			
			
		for(int i = 7; i < 57; i ++){
			objRow = objSheet.getRow(i);
			objCell = objRow.getCell(7);
		    if (objCell.getCellType() == CellType.FORMULA) {
		        evaluator.evaluateFormulaCell(objCell);
		    }
			objCell = objRow.getCell(31);
		    if (objCell.getCellType() == CellType.FORMULA) {
		        evaluator.evaluateFormulaCell(objCell);
		    }
			objCell = objRow.getCell(32);
		    if (objCell.getCellType() == CellType.FORMULA) {
		        evaluator.evaluateFormulaCell(objCell);
		    }
			objCell = objRow.getCell(33);
		    if (objCell.getCellType() == CellType.FORMULA) {
		        evaluator.evaluateFormulaCell(objCell);
		    }
		}
		// 비가동
		delaySql.setLength(0);
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
		if(conn_mssql != null) try {conn_mssql.close();}catch(SQLException sqle){}
		if (objWorkBook != null) try {objWorkBook.close();} catch (IOException e){}
	    if (fis != null) try {fis.close();} catch (IOException e) {}
	    if (fileOut != null) try {fileOut.close();} catch (IOException e) {}
	}
	
%>
</body>
</html>