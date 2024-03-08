<%@page import="java.util.Calendar"%>
<%@page import="org.apache.pdfbox.multipdf.PDFMergerUtility"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="net.sf.jasperreports.export.SimpleXlsxExporterConfiguration"%>
<%@page import="net.sf.jasperreports.export.DocxReportConfiguration"%>
<%@page import="net.sf.jasperreports.export.SimpleDocxReportConfiguration"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.ooxml.JRDocxExporter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.jasperreports.export.SimpleXlsxReportConfiguration"%>
<%@page import="net.sf.jasperreports.export.SimpleOutputStreamExporterOutput"%>
<%@page import="net.sf.jasperreports.export.SimpleExporterInput"%>
<%@page import="net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter"%>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="net.sf.jasperreports.engine.design.*"%>
<%@page import="net.sf.jasperreports.engine.xml.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.jasper.servlet.JasperLoader"%>
<%@page import="org.apache.jasper.el.JasperELResolver"%>
<%@page import="org.apache.commons.digester.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@page import="net.sf.jasperreports.data.*" %>
<%@page import="net.sf.jasperreports.repo.*" %>
<%@page import="net.sf.jasperreports.engine.data.*" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="net.sourceforge.barbecue.*" %>

<%@include file="DBConnector_Oracle_erp.jsp" %>
<%@include file="DBConnector_Oracle_pop.jsp" %>
<%@include file="DBConnector_MSSQL_spc.jsp" %>
<%@include file="DBConnector.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%!
	public class WorkReport{
		
		public String fMethod(String value){
			String result = "";
			if("0.0".equals(value)){
				result = "";
			}else{
				result = value;
			}
			
			return result;
		}
	}
%>

<%
	request.setCharacterEncoding("UTF-8");

//	String tdate = request.getParameter("tdate"); 	//파일명에 날짜
	String temp_hogi = request.getParameter("hogi");		//설비명
	String date = request.getParameter("date");		//작업일자
	
//	System.out.println("설비 : "+temp_hogi);
//	System.out.println("설비 : "+temp_hogi.substring(5)+", date : "+date);
	
	WorkReport wr = new WorkReport();
	
	String hogi = "";
	
	if("HT-QT3".equals(temp_hogi)){
		hogi = "QT001";
	}else if("HT-QT4".equals(temp_hogi)){
		hogi = "QT002";
	}else if("HT-QT5".equals(temp_hogi)){
		hogi = "QT003";
	}else if("HT-QT6".equals(temp_hogi)){
		hogi = "QT004";
	}else if("HT-QT7".equals(temp_hogi)){
		hogi = "QT011";
	}else if("HT-QT8".equals(temp_hogi)){
		hogi = "QT012";
	}else if("HT-QT9".equals(temp_hogi)){
		hogi = "QT013";
	}
	
%>

<%
	JSONObject mainObj = new JSONObject();
	mainObj.put("status", String.valueOf("ok"));
	
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat format3 = new SimpleDateFormat("HHmmss");
	
	Date time = new Date();
	Date time2 = new Date();
	Date time3 = new Date();
	
	String now = format.format(time);
	String now2 = format2.format(time2);
	String now3 = format3.format(time3);
	
//	Date signDate_temp = new Date();
	
	SimpleDateFormat workDate_format = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat signDate_format = new SimpleDateFormat("M/d");
//	System.out.println(date);
	Date workDate = workDate_format.parse(date);
	
	Date signDate_temp = workDate_format.parse(date);
	
	String signDate = signDate_format.format(signDate_temp);
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(workDate);
	cal.add(Calendar.DATE, -1);
//	System.out.println(workDate_format.format(cal.getTime()));
	

	
	Map<String,Object> reportMap = new HashMap<String,Object>();
	int file_no = 0;
	int table_no = 0;
	
	if("QT001".equals(hogi)){
		file_no = 3;
		table_no = 1;
	}else if("QT002".equals(hogi)){
		file_no = 4;
		table_no = 2;
	}else if("QT003".equals(hogi)){
		file_no = 5;
		table_no = 3;
	}else if("QT004".equals(hogi)){
		file_no = 6;
		table_no = 4;
	}else if("QT011".equals(hogi)){
		file_no = 7;
		table_no = 11;
	}else if("QT012".equals(hogi)){
		file_no = 8;
		table_no = 12;
	}else if("QT013".equals(hogi)){
		file_no = 9;
		table_no = 13;
	}
	
	
	String fileName = "work_LotManage"+file_no;
	
	String path = application.getRealPath("/reports");
	String uploadPath = application.getRealPath("/upload");
	
	String abPath = request.getServletContext().getRealPath("/reports/"+fileName+".jrxml");
	String savePath = request.getServletContext().getRealPath("/reports");
	String previewPath = request.getServletContext().getRealPath("/reports/preview");
	
	//파일생성 업데이트
	PreparedStatement pstmt = null;
	StringBuffer u_sql = new StringBuffer();
		
	//0.날짜-시간을 기준으로 총 갯수 구하기
	//14이하일 경우 1장, 초과일 경우 2장
	StringBuffer countSql = new StringBuffer();
	Statement stmt_count = null;
	ResultSet rs_count = null;
	
	//1.표준저울, 설비저울 중량 
	StringBuffer sql = new StringBuffer();
	
	//2.일일 생산실적
	StringBuffer erpSql = new StringBuffer();
	
	//3.Mariadb에서 report+table_no 테이블
	StringBuffer sql2 = new StringBuffer();
	Statement stmt2 = null;
	ResultSet rs2 = null;
	
	//4.co2값 가져오기 v_mash+file_no 테이블
	StringBuffer sql3 = new StringBuffer();
	Statement stmt3 = null;
	ResultSet rs3 = null;

	//5. RX유량 값
	StringBuffer sql4 = new StringBuffer();
	Statement stmt4 = null;
	ResultSet rs4 = null;

	//3.Mariadb에서 report+table_no 테이블 (2페이지)
	StringBuffer sql5 = new StringBuffer();
	Statement stmt5 = null;
	ResultSet rs5 = null;

	//4.co2값 가져오기 v_mash+file_no 테이블 (2페이지)
	StringBuffer sql6 = new StringBuffer();
	Statement stmt6 = null;
	ResultSet rs6 = null;
	
	//5. RX유량 값 (2페이지)
	StringBuffer sql7 = new StringBuffer();
	Statement stmt7 = null;
	ResultSet rs7 = null;
	
	//6.혼입개소
	StringBuffer popSql = new StringBuffer();
	
	//6.혼입개소 (2페이지)
	StringBuffer popSql2 = new StringBuffer();
	Statement stmt_pop2 = null;
	ResultSet rs_pop2 = null;
	
	
	//
	StringBuffer sql8 = new StringBuffer();
	Statement stmt8 = null;
	ResultSet rs8 = null;
	

	StringBuffer sql9 = new StringBuffer();
	Statement stmt9 = null;
	ResultSet rs9 = null;

	//퀜칭경도값
	StringBuffer popSql3 = new StringBuffer();
	Statement stmt_pop3 = null;
	ResultSet rs_pop3 = null;

	
	//작업일지 : 이상발생 조치내용
	StringBuffer sql10 = new StringBuffer();
	Statement stmt10 = null;
	ResultSet rs10 = null;

	//작업일지 : 일상보고사항
	StringBuffer sql11 = new StringBuffer();
	Statement stmt11 = null;
	ResultSet rs11 = null;
	
	
	//파일 병합용
	PreparedStatement pstmt3 = null;
	StringBuffer u_sql3 = new StringBuffer();

	PreparedStatement pstmt4 = null;
	
	
	//14이후
	PreparedStatement pstmt2 = null;
	StringBuffer u_sql2 = new StringBuffer();	
	
	//작업일지 상단의 이미지표시에 사용.
	StringBuffer sql12 = new StringBuffer();
	Statement stmt12 = null;
	ResultSet rs12 = null;
	
	//작업일지 상단의 이미지표시에 사용.(두번째 장)
	StringBuffer sql13 = new StringBuffer();
	Statement stmt13 = null;
	ResultSet rs13 = null;
	
	//1장, 2장 구분
	int pageCount = 0;
	
	//페이지별 시작시간 조건 (14개 초과일경우)
	String page_time = "";
	
	//혼입개소에서 사용할 로트의 시작 - 종료시간
	String stime_mix = "";
	String etime_mix = "";
	String row_time = "";

		
	String fileName2 = "";
		
	try{
		
		//0번 시작
		//어제 08:30:00 ~ 오늘 08:29:59
		countSql.append("SELECT COUNT(*) AS ccnt ");
		countSql.append("FROM v_report"+table_no+" ");
		countSql.append("WHERE w_end BETWEEN CONCAT('"+date+"',' ','08:30:00') ");
		countSql.append("AND CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','08:29:59') ");
		
		stmt_count = conn.createStatement();
		rs_count = stmt_count.executeQuery(countSql.toString());
		
		while(rs_count.next()){
			pageCount = rs_count.getInt("ccnt");
//			System.out.println("처음부분 pageCount : "+rs_count.getInt("ccnt"));
		}
		

		//1번 시작 
		sql.append("SELECT ds_weight, ns_weight, dg_weight, ng_weight, d_diff, n_diff, ");
		sql.append("LEFT(d_time,5) AS d_time, LEFT(n_time,5) AS n_time ");
		sql.append("FROM tb_pop_weight ");
//		sql.append("WHERE workdate = '"+workDate_format.format(cal.getTime())+"' ");
		sql.append("WHERE workdate = '"+date+"' ");
		sql.append("AND hogi = '"+file_no+"' ");
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		while(rs.next()){
			reportMap.put("s_weight",rs.getString("ds_weight"));
			reportMap.put("s_weight2",rs.getString("ns_weight"));
			reportMap.put("g_weight",rs.getString("dg_weight"));
			reportMap.put("g_weight2",rs.getString("ng_weight"));
			reportMap.put("diff",rs.getString("d_diff"));
			reportMap.put("diff2",rs.getString("n_diff"));
			reportMap.put("t_measure",rs.getString("d_time"));
			reportMap.put("t_measure2",rs.getString("n_time"));
		}
		
		
		//2번 시작
			 erpSql.append("SELECT A.WKCTR, WCDSC, A.MCHNO AS mchno, A.MCHNAM, A.JOCOD, A.JONAM, A.RFNA5, ");
			 erpSql.append("A.PURGC, A.STIME, A.DTIME,A.TTIME, ");
			 erpSql.append("A.PDQTY, A.DQTY, A.NQTY, ");
			 erpSql.append("ROUND(A.PDKG) AS PDKG, ");	//누계실적
			 erpSql.append("ROUND(A.DKG) AS DKG, ");	//주간실적
			 erpSql.append("ROUND(A.NKG) AS NKG, ");	//야간실적
			 erpSql.append("A.MQTY, A.MKG, A.COQTY, ");
			 erpSql.append("ROUND(decode(A.PURGC,'N',A.SUMBUHA, (DTIME/TTIME) * ");		
			 erpSql.append("decode( RFNA5, 'EA', a.MQTY, a.MKG ))) SUMBUHA, ");		//일목표
			 erpSql.append("ROUND(decode(A.PURGC,'N',A.SUMBUHA_T, (STIME/TTIME) * ");	
			 erpSql.append("decode( RFNA5, 'EA', a.MQTY, a.MKG ))) SUMBUHA_T ");	//누계일목표
			 erpSql.append("FROM ");
			 erpSql.append("(SELECT WKCTR,  FUN_GET_WKCTRNM(WKCTR) WCDSC, MCHNO, FUN_GET_MCHNAM(MCHNO) MCHNAM, ");
			 erpSql.append("JOCOD, FUN_GET_JONAM(JOCOD) JONAM, RFNA5, PURGC, ");
			 erpSql.append("(SELECT SUM(P.WKMIN1+P.WKMIN2)/60 FROM PDTCAL_MCH P WHERE P.CALNDR BETWEEN ");
			 erpSql.append("SUBSTR('"+date.replace("-","")+"',1,6)||'01' AND '"+date.replace("-","")+"'  AND P.MCHNO = X.MCHNO) AS STIME, ");
			 erpSql.append("(SELECT SUM(P.WKMIN1+P.WKMIN2)/60 FROM PDTCAL_MCH P WHERE P.CALNDR = '"+date.replace("-","")+"' ");
			 erpSql.append("AND P.MCHNO = X.MCHNO) AS DTIME, ");
			 erpSql.append("(SELECT SUM(P.WKMIN1+P.WKMIN2)/60 FROM PDTCAL_MCH P WHERE SUBSTR(P.CALNDR,1,6) LIKE ");
			 erpSql.append("SUBSTR('"+date.replace("-","")+"',1,6)  AND P.MCHNO = X.MCHNO) AS TTIME, ");
			 erpSql.append("SUM(PDQTY) AS PDQTY, SUM(DQTY) AS DQTY, SUM(NQTY) AS NQTY, ");
			 erpSql.append("SUM(PDKG) AS PDKG, SUM(DKG) AS DKG, SUM(NKG) AS NKG, ");
			 erpSql.append("CASE WHEN '0100' = '8888' THEN ");
			 erpSql.append("(SELECT SUM(BALQTY) FROM PU04_MONPLAN WHERE YYMM = LPAD('"+date.replace("-","")+"', 6) AND GCVCOD = X.MCHNO ) ");
			 erpSql.append("ELSE ");
			 erpSql.append("FUN_GET_PM_MCHQTY('"+date.replace("-","")+"', MCHNO, '0100', 'PM', 7)  ");
			 erpSql.append("END AS MQTY, ");
			 erpSql.append("CASE WHEN '0100' = '8888' THEN ");
			 erpSql.append("(SELECT SUM(WEIGHT) ");
			 erpSql.append("FROM (SELECT GCVCOD, SUM(ROUND(BALQTY *(SELECT SUMST FROM ROUTNG WHERE ITNBR = A.ITNBR AND ROSLT = '8888') / 1000, 0)) WEIGHT ");
			 erpSql.append("FROM PU04_MONPLAN A ");
			 erpSql.append("WHERE YYMM = LPAD('"+date.replace("-","")+"', 6) ");
			 erpSql.append("GROUP BY GCVCOD) ");
			 erpSql.append("WHERE GCVCOD = X.MCHNO) ");
			 erpSql.append("ELSE ");
			 erpSql.append("FUN_GET_PM_MCHQTY('"+date.replace("-","")+"', MCHNO, '0100', 'KPM', 7) ");
			 erpSql.append("END  AS MKG , ");
			 erpSql.append("SUM(COQTY) AS COQTY, ");
			 erpSql.append("FUN_GET_MCH_BUHA('"+date.replace("-","")+"', MCHNO) AS SUMBUHA, ");
			 erpSql.append("FUN_GET_MCH_BUHA_T('"+date.replace("-","")+"', MCHNO) AS SUMBUHA_T ");
			 erpSql.append("FROM ");
			 erpSql.append("( ");
			 erpSql.append("SELECT /*+ LEADING(a) INDEX(a SHPACT_IDX100) use_nl(a b c d r)*/ ");
			 erpSql.append("C.WKCTR,A.MCHCOD MCHNO, DECODE(B.ROSLT,'0430', 'EA', R.RFNA5) RFNA5, D.PURGC, ");
			 erpSql.append("D.JOCOD,A.COQTY AS PDQTY,ROUND(FUN_GET_MOROU_WAGHT(A.PORDNO,A.OPSNO)*NVL(A.COQTY,0)/1000,0) PDKG, ");
			 erpSql.append("CASE WHEN (SIDAT = '"+date.replace("-","")+"' AND  A.PE_BIGO <> 'N') THEN A.COQTY ELSE 0 END DQTY, ");
			 erpSql.append("CASE WHEN (SIDAT = '"+date.replace("-","")+"' AND  A.PE_BIGO <> 'N') THEN ROUND(FUN_GET_MOROU_WAGHT(A.PORDNO,A.OPSNO)*NVL(A.COQTY,0)/1000,0) ELSE 0 END DKG, ");
			 erpSql.append("CASE WHEN (SIDAT = '"+date.replace("-","")+"' AND  A.PE_BIGO = 'N') THEN A.COQTY ELSE 0 END NQTY, ");
			 erpSql.append("CASE WHEN (SIDAT = '"+date.replace("-","")+"' AND  A.PE_BIGO = 'N') THEN ROUND(FUN_GET_MOROU_WAGHT(A.PORDNO,A.OPSNO)*NVL(A.COQTY,0)/1000,0) ELSE 0 END NKG,0 COQTY, ");
			 erpSql.append("A.ITNBR ");
			 erpSql.append("FROM SHPACT A, MOROUT B, MCHMST C,WRKCTR D,REFFPF R ");
			 erpSql.append("WHERE A.SABU ='1' AND A.SIDAT BETWEEN SUBSTR('"+date.replace("-","")+"',1,6)||'01' AND '"+date.replace("-","")+"' AND ");
			 erpSql.append("A.PORDNO = B.PORDNO AND ");
			 erpSql.append("A.OPSNO = B.OPSEQ AND ");
			 erpSql.append("B.ROSLT LIKE '0100'  AND ");
			 erpSql.append("A.MCHCOD = C.MCHNO  AND ");
			 erpSql.append("C.WKCTR = D.WKCTR AND ");
			 erpSql.append("R.RFCOD = '21' AND ");
			 erpSql.append("B.ROSLT = R.RFGUB AND ");
			 erpSql.append("A.MCHCOD = '"+hogi+"' ");
			 erpSql.append("UNION ALL ");
			 erpSql.append("SELECT /*+ LEADING(a) index(a PM01_CAPA_DTL_MCH_IDX01) use_nl(a b r) */ ");
			 erpSql.append("DISTINCT B.WKCTR, A.MCHNO, DECODE(A.ROSLT,'0430', 'EA', R.RFNA5) RFNA5, B.PURGC, B.JOCOD, 0 AS PDQTY,0 PDKG, ");
			 erpSql.append("0 DQTY, ");
			 erpSql.append("0 DKG, ");
			 erpSql.append("0 NQTY, ");
			 erpSql.append("0 NKG,0 COQTY, ");
			 erpSql.append("A.ITNBR ");
			 erpSql.append("FROM PM01_CAPA_DTL_MCH A, WRKCTR B,REFFPF R ");
			 erpSql.append("WHERE A.YYMM = SUBSTR('"+date.replace("-","")+"',1,6) AND A.ROSLT LIKE '0100' AND ");
			 erpSql.append("A.WKCTR = B.WKCTR AND ");
			 erpSql.append("R.RFCOD = '21' AND ");
			 erpSql.append("A.ROSLT = R.RFGUB AND ");
			 erpSql.append("A.MCHNO = '"+hogi+"' ");
			 erpSql.append(") X ");
			 erpSql.append("GROUP BY WKCTR, MCHNO, JOCOD, RFNA5, PURGC ) A ");
//			 erpSql.append("HAVING MCHNO = '"+hogi+"' ");
			 erpSql.append("order by a.JOCOD, A.WKCTR, A.MCHNO ");		
			
//			 System.out.println(erpSql.toString());
			 stmt_erp = conn_erp.createStatement();
			 rs_erp = stmt_erp.executeQuery(erpSql.toString());
			 while(rs_erp.next()){
				 if(hogi.equals(rs_erp.getString("mchno"))){
//					 System.out.println("dkg : "+rs_erp.getInt("dkg")+", nkg : "+rs_erp.getInt("nkg")+" pdkg : "+rs_erp.getInt("pdkg"));
					 reportMap.put("daysum",String.format("%,d",(rs_erp.getInt("dkg")+rs_erp.getInt("nkg")))+"kg");
					 reportMap.put("daytotal",String.format("%,d",rs_erp.getInt("pdkg"))+"kg");
				 }
			 }
			 
			 
			 //작업일자
			 reportMap.put("workdate",workDate_format.format(workDate));

			 /*2021-03-31 추가*/
			 //작업일지 상단 싸인이미지
			 sql12.setLength(0);
			 sql12.append("SELECT u_level, u_id, u_pw, u_name, ");
			 sql12.append("	regdate, img_path, num ");
			 sql12.append("FROM ( ");
			 sql12.append("	SELECT ");
			 sql12.append("		si.id_level AS u_level, us.u_id AS u_id, ");
			 sql12.append("		us.u_pw AS u_pw, us.u_name AS u_name, ");
			 sql12.append("		si.regdate AS regdate, si.img_path AS img_path, ");
			 sql12.append("		ROW_NUMBER() OVER(PARTITION BY si.id_level ORDER BY si.regdate DESC) AS num ");
			 sql12.append("	FROM tb_user_signimg si ");
			 sql12.append("	INNER JOIN tb_user us ");
			 sql12.append("	ON si.id = us.u_id ");
			 sql12.append(") AS aadd ");
			 sql12.append("WHERE num = 1 ");
			 sql12.append("ORDER BY u_level ");
			 
			stmt12 = conn.createStatement();
			rs12 = stmt12.executeQuery(sql12.toString());
			int rowCount12 = rs12.last() ? rs12.getRow() : 0;	
			rs12.beforeFirst(); 				    
			
			while(rs12.next()){
				if("img1".equals(rs12.getString("u_level"))){
//					reportMap.put("img1","http://150.200.50.191:9090/sunil/upload/"+rs12.getString("img_path"));
					reportMap.put("img1","http://150.200.50.191/sunil/upload/"+rs12.getString("img_path"));
					if(!"".equals(rs12.getString("img_path"))){
						reportMap.put("sign_date1",signDate);	
					}else{
						reportMap.put("sign_date1","/");
					}

				}else if("img2".equals(rs12.getString("u_level"))){
//					reportMap.put("img2","http://150.200.50.191:9090/sunil/upload/"+rs12.getString("img_path"));
					reportMap.put("img2","http://150.200.50.191/sunil/upload/"+rs12.getString("img_path"));
					if(!"".equals(rs12.getString("img_path"))){
						reportMap.put("sign_date2",signDate);	
					}else{
						reportMap.put("sign_date2","/");
					}

				}else if("img3".equals(rs12.getString("u_level"))){
//					reportMap.put("img3","http://150.200.50.191:9090/sunil/upload/"+rs12.getString("img_path"));
					reportMap.put("img3","http://150.200.50.191/sunil/upload/"+rs12.getString("img_path"));
					if(!"".equals(rs12.getString("img_path"))){
						reportMap.put("sign_date3",signDate);	
					}else{
						reportMap.put("sign_date3","/");
					}
					
				}else if("img4".equals(rs12.getString("u_level"))){
//					reportMap.put("img4","http://150.200.50.191:9090/sunil/upload/"+rs12.getString("img_path"));
					reportMap.put("img4","http://150.200.50.191/sunil/upload/"+rs12.getString("img_path"));
					if(!"".equals(rs12.getString("img_path"))){
						reportMap.put("sign_date4",signDate);	
					}else{
						reportMap.put("sign_date4","/");
					}
					
				}else if("img5".equals(rs12.getString("u_level"))){
//					reportMap.put("img5","http://150.200.50.191:9090/sunil/upload/"+rs12.getString("img_path"));
					reportMap.put("img5","http://150.200.50.191/sunil/upload/"+rs12.getString("img_path"));
					if(!"".equals(rs12.getString("img_path"))){
						reportMap.put("sign_date5",signDate);	
					}else{
						reportMap.put("sign_date5","/");
					}
					
				}
			}
			 
			 /*2021-01-25 추가
			 2021-02-01 수정(1개의 항목에만 표시)
			 이상발생 조치내용, 일상보고사항*/
			 
			 //이상발생 조치내용
			 sql10.setLength(0);
			 sql10.append("SELECT ");
			 sql10.append("lot1, iss1, cmt1 ");
			 sql10.append("FROM tb_mark_abnormal"+file_no+" ");
			 sql10.append("WHERE date1 = '"+date+"' ");
			 
			 
			 stmt10 = conn.createStatement();
			 rs10 = stmt10.executeQuery(sql10.toString());
			 
			 while(rs10.next()){
				 reportMap.put("ab_heatno",rs10.getString("lot1"));
				 reportMap.put("ab_cmt",rs10.getString("cmt1"));
				 reportMap.put("ab_suc",rs10.getString("iss1"));
				 
			 }
//System.out.println("======");			 
			 //일상보고사항
			 sql11.setLength(0);
			 sql11.append("SELECT ");
			 sql11.append("bogo1, cmt1 ");
			 sql11.append("FROM tb_mark_daily"+file_no+" ");
			 sql11.append("WHERE date1 = '"+date+"' ");
			 
			 
			 stmt11 = conn.createStatement();
			 rs11 = stmt11.executeQuery(sql11.toString());
			 
//			 System.out.println(sql11.toString());
			 while(rs11.next()){
				 reportMap.put("da_heatno",rs11.getString("bogo1"));
				 reportMap.put("da_suc",rs11.getString("cmt1"));
				 
			 }

			 
			 
	if(pageCount != 0){
		
		for(int i=1; i<=6; i++){
			sql4.setLength(0);
			sql4.append("SELECT rx_val ");
			sql4.append("FROM tb_rx"+table_no+" ");					
			switch(i){
				case 1: 
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT('"+date+"',' ','07:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT('"+date+"',' ','11:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");

				break;
				case 2:
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT('"+date+"',' ','11:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT('"+date+"',' ','15:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");
					
				break;
				case 3:
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT('"+date+"',' ','15:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT('"+date+"',' ','19:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");
					
				break;
				case 4:
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT('"+date+"',' ','19:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT('"+date+"',' ','23:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");
					
				break;
				case 5:
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT('"+date+"',' ','23:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','03:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");
				
				break;
				case 6:
					sql4.append("WHERE datadate BETWEEN ");
					sql4.append("CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','03:00:00') ");
					sql4.append("AND ");
					sql4.append("CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','07:00:00') ");
					sql4.append("ORDER BY datadate DESC ");
					sql4.append("LIMIT 1 ");
					
				break;
			}
			
			stmt4 = conn.createStatement();
			rs4 = stmt4.executeQuery(sql4.toString());
			
			while(rs4.next()){
				switch(i){
					case 1: reportMap.put("m16_1",rs4.getString("rx_val")); break;
					case 2: reportMap.put("m16_2",rs4.getString("rx_val")); break;
					case 3: reportMap.put("m16_3",rs4.getString("rx_val")); break;
					case 4: reportMap.put("m16_4",rs4.getString("rx_val")); break;
					case 5: reportMap.put("m16_5",rs4.getString("rx_val")); break;
					case 6: reportMap.put("m16_6",rs4.getString("rx_val")); break;
				}
			}					
			
		}
		
		/*2021-01-22 추가
		퀜칭경도값*/
		/*
SELECT *
FROM (
	SELECT *
	FROM QT_QC_INDATA qqi 
	WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN '2021-01-20 07:00:00' AND '2021-01-20 11:00:00'
	AND FACILITY_CODE  LIKE '%QT001%'
	ORDER BY crt_date DESC 
)
WHERE rownum <=1;
		*/
		for(int j=1; j<=6; j++){
			popSql3.setLength(0);
			popSql3.append("SELECT facility_code, x1_d, x1_s, x2_d, x2_s ");
			popSql3.append("FROM QT_QC_INDATA ");					
			switch(j){
				case 1: 
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("'"+date+"'||' '||'07:00:00' ");
					popSql3.append("AND ");
					popSql3.append("'"+date+"'||' '||'11:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");

				break;
				case 2:
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("'"+date+"'||' '||'11:00:00' ");
					popSql3.append("AND ");
					popSql3.append("'"+date+"'||' '||'15:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");
					
				break;
				case 3:
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("'"+date+"'||' '||'15:00:00' ");
					popSql3.append("AND ");
					popSql3.append("'"+date+"'||' '||'19:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");
					
				break;
				case 4:
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("'"+date+"'||' '||'19:00:00' ");
					popSql3.append("AND ");
					popSql3.append("'"+date+"'||' '||'23:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");
					
				break;
				case 5:
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("'"+date+"'||' '||'23:00:00' ");
					popSql3.append("AND ");
					popSql3.append("TO_CHAR(TO_DATE('"+date+"','yyyy-MM-dd')+1,'yyyy-MM-dd')||' '||'03:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");
				
				break;
				case 6:
					popSql3.append("WHERE TO_CHAR(CRT_DATE ,'yyyy-MM-dd HH24:MI:ss') BETWEEN ");
					popSql3.append("TO_CHAR(TO_DATE('"+date+"','yyyy-MM-dd')+1,'yyyy-MM-dd')||' '||'03:00:00' ");
					popSql3.append("AND ");
					popSql3.append("TO_CHAR(TO_DATE('"+date+"','yyyy-MM-dd')+1,'yyyy-MM-dd')||' '||'07:00:00' ");
					popSql3.append("AND facility_code LIKE '%"+hogi+"%' ");
					popSql3.append("ORDER BY crt_date DESC ");
					
				break;
			}
			
			stmt_pop3 = conn_pop.createStatement();
			rs_pop3 = stmt_pop3.executeQuery(popSql3.toString());
			
			while(rs_pop3.next()){
				reportMap.put("m17_"+j+"_1",rs_pop3.getString("x1_d"));
				reportMap.put("m17_"+j+"_2",rs_pop3.getString("x1_s"));
				reportMap.put("m17_"+j+"_3",rs_pop3.getString("x2_d"));
				reportMap.put("m17_"+j+"_4",rs_pop3.getString("x2_s"));
			}
			
		}
		//퀜칭경도 끝
		
//	System.out.println("pageCount : "+pageCount);
	
	//항목작성   시작 
	
		int index = 1;
		int mix_odd = 1;
		int mix_even = 2;
		
		File file = new File(abPath);
		String mix1 = "";
		String mix2 = "";
		
		sql2.setLength(0);
		sql2.append("SELECT pcode, cname, lotno, pname, pspec, pno, ");
		sql2.append("roll, weight, box_cnt, w_start, kg_hr, speed, IF(qun3='null',0,qun3) AS qun3, ");
		sql2.append("IF(oil='null',0,oil) AS oil, (q_inv*0.01) AS q_inv, ");
		sql2.append("IF(co2='null',0,co2) AS co2, (t_inv*0.01) AS t_inv, ");
		sql2.append("IF(tem4='null',0,tem4) AS tem4, w_end, qt_type, ");
		sql2.append("IF(s_cp='null',0,LEFT(s_cp,4)) AS s_cp, IF(p_cp='null',0,LEFT(p_cp,4)) AS p_cp, ");
		sql2.append("spc_s1, spc_s2, spc_s3, spc_s4, spc_s5, ");
		sql2.append("spc_s6, spc_s7, spc_s8, spc_s9, spc_s10, ");
		sql2.append("spc_p1, spc_p2, spc_p3, spc_p4, spc_p5, ");
		sql2.append("spc_p6, spc_p7, spc_p8, spc_p9, spc_p10, ");
		sql2.append("DATE_ADD(w_start,INTERVAL 2 MINUTE) AS mix_1, ");
		sql2.append("(SELECT temper_start FROM tb_worker_time a WHERE a.work_start = w_start AND a.hogi='"+hogi+"' LIMIT 1 ) AS tem_start, ");
		sql2.append("worker, n_factory, search_pcode, tem_change ");
		sql2.append("FROM v_report"+table_no+" ");
		sql2.append("WHERE w_end BETWEEN CONCAT('"+date+"',' ','08:30:00') ");
		sql2.append("AND CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','08:29:59') ");
//		System.out.println(sql2.toString());
		
		stmt2 = conn.createStatement();
		rs2 = stmt2.executeQuery(sql2.toString());
		while(rs2.next()){
			if(!"".equals(rs2.getString("tem_start")) && rs2.getString("tem_start") != null){
				mix2 = rs2.getString("tem_start").substring(11,16);
			}else{
				mix2 = "";
			}
			
			if(!"".equals(rs2.getString("mix_1")) && rs2.getString("mix_1") != null){
				mix1 = rs2.getString("mix_1").substring(11,16);
			}else{
				mix1 = "";
			}

			//여기서 열처리 LOT No를 비교해서 투입시간 '전일', 장입량 ''
			//조건 : 열처리 LOT No와 투입시간
//			System.out.println("열처리LOT : "+rs2.getString("search_pcode"));
			sql8.setLength(0);
			sql8.append("SELECT COUNT(*) AS ccnt ");
			sql8.append("FROM v_report"+table_no+" ");
			sql8.append("WHERE search_pcode = '"+rs2.getString("search_pcode")+"' ");
			sql8.append("AND w_start = '"+rs2.getString("w_start")+"' ");
//			System.out.println(sql8.toString());
			
			stmt8 = conn.createStatement();
			rs8 = stmt8.executeQuery(sql8.toString());
			int rs8Count = rs8.last() ? rs8.getRow() : 0;  
			rs8.beforeFirst(); 		

			while(rs8.next()){
				if(rs8.getInt("ccnt") == 1){
					//전일연속이 없는 경우
					reportMap.put("start_time"+index,rs2.getString("w_start").substring(11,16));
					reportMap.put("m10_"+index,rs2.getString("kg_hr"));
				}else if(rs8.getInt("ccnt") == 0){
					reportMap.put("start_time"+index,"");
					reportMap.put("m10_"+index,rs2.getString("kg_hr"));
				}else{
					//전일연속이 있는 경우
					reportMap.put("start_time"+index,"전일");
					reportMap.put("m10_"+index,"");
					
				}
			}

			
			//.replace("-","\n")
			
			reportMap.put("box_cnt"+index,rs2.getString("box_cnt"));
			reportMap.put("work_no"+index,rs2.getString("lotno").replace("_","\n"));
			reportMap.put("lot_no"+index,rs2.getString("roll"));
			reportMap.put("no"+index,rs2.getString("pcode"));
			reportMap.put("pno"+index,rs2.getString("pno"));
			reportMap.put("m24_"+index,rs2.getString("w_end").substring(11,16));
			reportMap.put("weight"+index,Math.round(rs2.getDouble("weight"))+"");
			reportMap.put("client"+index,rs2.getString("cname"));
			reportMap.put("pname"+index,rs2.getString("pname"));
			reportMap.put("spec"+index,rs2.getString("pspec"));
			reportMap.put("m25_"+index,rs2.getString("qt_type").replace("-","\n"));
			
			reportMap.put("m11_"+index,rs2.getString("speed"));
			reportMap.put("m14_"+index,rs2.getString("oil"));
			reportMap.put("m15_"+index,String.format("%.2f",rs2.getDouble("q_inv")));
			reportMap.put("m18_"+index,rs2.getString("s_cp"));
			reportMap.put("m19_"+index,rs2.getString("s_cp"));
			
//			reportMap.put("m18_"+index,String.format("%.2f",((Math.round((rs2.getDouble("s_cp") * 0.001)*100)/100.0))));
//			reportMap.put("m19_"+index,String.format("%.2f",((Math.round((rs2.getDouble("p_cp") * 0.001)*100)/100.0))));				
			reportMap.put("m22_"+index,String.format("%.2f",rs2.getDouble("t_inv")));	
			reportMap.put("m13_"+index,rs2.getString("qun3"));
			reportMap.put("m23_"+index,rs2.getString("tem4"));
			reportMap.put("m20_"+index,String.format("%.3f",rs2.getDouble("co2")));
			
			
			//심부경도 (초물)
			reportMap.put("l"+index+"_1",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s1"))));
			reportMap.put("l"+index+"_2",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s2"))));					
				
			//심부경도 (자주)
			reportMap.put("l"+index+"_3",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s3"))));
			reportMap.put("l"+index+"_4",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s4"))));					
			reportMap.put("l"+index+"_5",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s5"))));
			reportMap.put("l"+index+"_6",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s6"))));					
			reportMap.put("l"+index+"_7",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s7"))));
			reportMap.put("l"+index+"_8",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s8"))));					
			reportMap.put("l"+index+"_9",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s9"))));
			reportMap.put("l"+index+"_10",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_s10"))));					
			
			//표면경도 (초물)
//			reportMap.put("lf"+index+"_1",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_p1"))));
//			reportMap.put("lf"+index+"_2",wr.fMethod(String.format("%.1f",rs2.getFloat("spc_p2"))));					
			reportMap.put("lf"+index+"_1",rs2.getString("spc_p1"));
			reportMap.put("lf"+index+"_2",rs2.getString("spc_p2"));
			
			//표면경도 (자주)
			reportMap.put("lf"+index+"_3",rs2.getString("spc_p3"));
			reportMap.put("lf"+index+"_4",rs2.getString("spc_p4"));					
			reportMap.put("lf"+index+"_5",rs2.getString("spc_p5"));
			reportMap.put("lf"+index+"_6",rs2.getString("spc_p6"));					
			reportMap.put("lf"+index+"_7",rs2.getString("spc_p7"));
			reportMap.put("lf"+index+"_8",rs2.getString("spc_p8"));					
			reportMap.put("lf"+index+"_9",rs2.getString("spc_p9"));
			reportMap.put("lf"+index+"_10",rs2.getString("spc_p10"));

			// //rs5.getString("w_start").substring(11,16)
			
			reportMap.put("m32_"+index,rs2.getString("n_factory"));
			reportMap.put("m33_"+index,rs2.getString("worker"));
			
			//2021-01-19
			//온도변경표시
			reportMap.put("tem_change"+index,rs2.getString("tem_change"));
					
			
			stime_mix = rs2.getString("w_start");
			
			
			etime_mix = rs2.getString("w_end");
			
			if(index == 15){
				//두번째 장은 15번 부터 조회
				row_time = rs2.getString("w_end");
			}
			
			String work_end = rs2.getString("w_end").substring(0,10);
			
			
			//각 구간별 오차범위가 생기면
			//이 쿼리를 2번, 4번, 5번 구간조회하는걸 생성해서 각 오차범위 안에 있는거만 표현
			//stime_mix, etime_mix를 변경
			popSql.setLength(0);
			popSql.append("SELECT a.facility_code, a.facility_mix_loc, ");					
			popSql.append("MAX(TO_CHAR(a.create_date,'yyyy-MM-dd HH24:MI:ss')) AS  wdate, ");
			popSql.append("MAX(TO_CHAR(a.create_date,'HH24:MI')) AS homi, ");
			popSql.append("MAX(a.facility_mix_qty) AS qty, MAX(b.worker_name) AS wname ");				
			popSql.append("FROM prd_qt_mixconfirm a, sf_worker_mst b ");
			popSql.append("WHERE TO_CHAR(a.create_date,'yyyy-MM-dd HH24:MI:ss') BETWEEN '"+stime_mix+"' AND '"+etime_mix+"' ");
			popSql.append("AND a.worker_no = b.emp_code ");
			popSql.append("AND facility_code = '"+hogi+"' ");
			popSql.append("AND (facility_mix_loc IN ('002','004','005') ) ");
			popSql.append("GROUP BY a.facility_code, a.facility_mix_loc ");
			
			stmt_pop = conn_pop.createStatement();
			rs_pop = stmt_pop.executeQuery(popSql.toString());

			while(rs_pop.next()){
				
				if("002".equals(rs_pop.getString("facility_mix_loc"))){
					reportMap.put("m12_"+mix_odd,rs_pop.getString("wname"));
					reportMap.put("m12_"+mix_even,mix1);
					
				}else if("004".equals(rs_pop.getString("facility_mix_loc"))){
					reportMap.put("m21_"+mix_odd,rs_pop.getString("wname"));
					reportMap.put("m21_"+mix_even,mix2);

				}else if("005".equals(rs_pop.getString("facility_mix_loc"))){
					reportMap.put("m26_"+mix_odd,rs_pop.getString("wname"));
					reportMap.put("m26_"+mix_even,etime_mix.substring(11,16));
				}

			}
			mix_odd +=2;
			mix_even +=2;				
			
			index++;

		}	
		
		
		boolean isExists = file.exists();
		if (isExists) {
			//reportMap.put("tem_change"+i,"승온 ");
			
			
			
		
			JasperReportsContext jasperReportsContext = new SimpleJasperReportsContext();
			JasperCompileManager compileManager = JasperCompileManager.getInstance(jasperReportsContext);
			JasperReport report = JasperCompileManager.compileReport(abPath);
			
			JasperFillManager fillManager = JasperFillManager.getInstance(jasperReportsContext);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, reportMap,conn);
			
			 JasperExportManager exportManager = JasperExportManager.getInstance(jasperReportsContext); 
			 JasperExportManager.exportReportToPdfFile(jasperPrint,uploadPath+"/"+now2+"_"+file_no+"호기_작업일보1_"+now3+".pdf");
			
			 u_sql.append("INSERT INTO tb_work_printlist ");
			 u_sql.append("(print_time, wdate, hogi, seq_no, filename) VALUES ");
			 u_sql.append("(now(), '"+workDate_format.format(workDate)+"', '"+hogi+"', 1, ");
			 u_sql.append("CONCAT('"+now2+"','_','"+file_no+"','호기_작업일보1_','"+now3+"','.pdf' ) ) ");
			 
			 pstmt = conn.prepareStatement(u_sql.toString());
			 pstmt.executeUpdate();
			 
			 
			 
			 
			 fileName2 = now2+"_"+file_no+"호기_작업일보1_";
			 
			 JasperExportManager.exportReportToPdfFile(jasperPrint,"D:/Job/report1_bak/"+fileName2+now3+".pdf");
			 
			 String fm = now2+"_"+file_no+"호기_작업일보_";
			 
			 u_sql3.append("INSERT INTO tb_report_file ");
			 u_sql3.append("(print_time, wdate, hogi, filename) VALUES ");
			 u_sql3.append("(now(), '"+workDate_format.format(workDate)+"', '"+hogi+"', CONCAT('"+fm+"','"+now3+"','.pdf') ) ");
			 
			 pstmt3 = conn.prepareStatement(u_sql3.toString());
			 pstmt3.executeUpdate();
			 
				//PC 저장용 병합본
				PDFMergerUtility ut = new PDFMergerUtility();
				
				ut.addSource("D:/Job/report1_bak/"+fileName2+now3+".pdf");
				ut.setDestinationFileName("D:/Job/"+fm+now3+".pdf");			
				ut.mergeDocuments();
//				ut.mergeDocuments(MemoryUsageSetting.setupTempFileOnly());
				
				//프리뷰용 병합본
				PDFMergerUtility ut2 = new PDFMergerUtility();
				
				ut2.addSource(uploadPath+"/"+fileName2+now3+".pdf");
				ut2.setDestinationFileName(uploadPath+"/"+fm+now3+".pdf");			
				ut2.mergeDocuments();
//				ut.mergeDocuments(MemoryUsageSetting.setupTempFileOnly());										
			 
			 conn.commit();
		
			}	
		
		}
		
	if(pageCount > 14){
		reportMap.clear();
		 //작업일자 (하루 전)
		 reportMap.put("workdate",workDate_format.format(workDate));

		 /*2021-05-04 추가(2번째 장)*/
		 //작업일지 상단 싸인이미지
		 sql13.setLength(0);
		 sql13.append("SELECT u_level, u_id, u_pw, u_name, ");
		 sql13.append("	regdate, img_path, num ");
		 sql13.append("FROM ( ");
		 sql13.append("	SELECT ");
		 sql13.append("		si.id_level AS u_level, us.u_id AS u_id, ");
		 sql13.append("		us.u_pw AS u_pw, us.u_name AS u_name, ");
		 sql13.append("		si.regdate AS regdate, si.img_path AS img_path, ");
		 sql13.append("		ROW_NUMBER() OVER(PARTITION BY si.id_level ORDER BY si.regdate DESC) AS num ");
		 sql13.append("	FROM tb_user_signimg si ");
		 sql13.append("	INNER JOIN tb_user us ");
		 sql13.append("	ON si.id = us.u_id ");
		 sql13.append(") AS aadd ");
		 sql13.append("WHERE num = 1 ");
		 sql13.append("ORDER BY u_level ");
		 
		stmt13 = conn.createStatement();
		rs13 = stmt13.executeQuery(sql13.toString());
		int rowCount13 = rs13.last() ? rs13.getRow() : 0;	
		rs13.beforeFirst(); 				    
		
		while(rs13.next()){
			if("img1".equals(rs13.getString("u_level"))){
				reportMap.put("img1","http://150.200.50.191/sunil/upload/"+rs13.getString("img_path"));
				if(!"".equals(rs13.getString("img_path"))){
					reportMap.put("sign_date1",signDate);	
				}else{
					reportMap.put("sign_date1","/");
				}

				
			}else if("img2".equals(rs13.getString("u_level"))){
				reportMap.put("img2","http://150.200.50.191/sunil/upload/"+rs13.getString("img_path"));
				if(!"".equals(rs13.getString("img_path"))){
					reportMap.put("sign_date2",signDate);	
				}else{
					reportMap.put("sign_date2","/");
				}

				
			}else if("img3".equals(rs13.getString("u_level"))){
				reportMap.put("img3","http://150.200.50.191/sunil/upload/"+rs13.getString("img_path"));
				if(!"".equals(rs13.getString("img_path"))){
					reportMap.put("sign_date3",signDate);	
				}else{
					reportMap.put("sign_date3","/");
				}

				
			}else if("img4".equals(rs13.getString("u_level"))){
				reportMap.put("img4","http://150.200.50.191/sunil/upload/"+rs13.getString("img_path"));
				if(!"".equals(rs13.getString("img_path"))){
					reportMap.put("sign_date4",signDate);	
				}else{
					reportMap.put("sign_date4","/");
				}

				
			}else if("img5".equals(rs13.getString("u_level"))){
				reportMap.put("img5","http://150.200.50.191/sunil/upload/"+rs13.getString("img_path"));
				if(!"".equals(rs13.getString("img_path"))){
					reportMap.put("sign_date5",signDate);	
				}else{
					reportMap.put("sign_date5","/");
				}

				
			}
		}


		
		int index = 1;
		int mix_odd = 1;
		int mix_even = 2;
		
		File file = new File(abPath);
		String mix1 = "";
		String mix2 = "";
		
		sql5.setLength(0);
		sql5.append("SELECT pcode, cname, lotno, pname, pspec, pno, ");
		sql5.append("roll, weight, box_cnt, w_start, kg_hr, speed, IF(qun3='null',0,qun3) AS qun3, ");
		sql5.append("IF(oil='null',0,oil) AS oil, (q_inv*0.01) AS q_inv, ");
		sql5.append("IF(co2='null',0,co2) AS co2, (t_inv*0.01) AS t_inv, ");
		sql5.append("IF(tem4='null',0,tem4) AS tem4, w_end, qt_type, ");
		sql5.append("IF(s_cp='null',0,LEFT(s_cp,4)) AS s_cp, IF(p_cp='null',0,LEFT(p_cp,4)) AS p_cp, ");
		sql5.append("spc_s1, spc_s2, spc_s3, spc_s4, spc_s5, ");
		sql5.append("spc_s6, spc_s7, spc_s8, spc_s9, spc_s10, ");
		sql5.append("spc_p1, spc_p2, spc_p3, spc_p4, spc_p5, ");
		sql5.append("spc_p6, spc_p7, spc_p8, spc_p9, spc_p10, ");
		sql5.append("DATE_ADD(w_start,INTERVAL 2 MINUTE) AS mix_1, ");
		sql5.append("(SELECT temper_start FROM tb_worker_time a WHERE a.work_start = w_start AND a.hogi='"+hogi+"' LIMIT 1 ) AS tem_start, ");
		sql5.append("worker, n_factory, search_pcode, IF(tem_change='null','',tem_change) AS tem_change ");
		sql5.append("FROM v_report"+table_no+" ");
		sql5.append("WHERE w_end BETWEEN '"+row_time+"' ");
		sql5.append("AND CONCAT(DATE_ADD('"+date+"',INTERVAL 1 DAY),' ','08:29:59') ");
		
		
		stmt5 = conn.createStatement();
		rs5 = stmt5.executeQuery(sql5.toString());
		while(rs5.next()){
			if(!"".equals(rs5.getString("tem_start")) && rs5.getString("tem_start") != null){
				mix2 = rs5.getString("tem_start").substring(11,16);
			}else{
				mix2 = "";
			}
			
			if(!"".equals(rs5.getString("mix_1")) && rs5.getString("mix_1") != null){
				mix1 = rs5.getString("mix_1").substring(11,16);
			}else{
				mix1 = "";
			}
			
			sql9.setLength(0);
			sql9.append("SELECT COUNT(*) AS ccnt ");
			sql9.append("FROM v_report"+table_no+" ");
			sql9.append("WHERE search_pcode = '"+rs5.getString("search_pcode")+"' ");
			sql9.append("AND w_start = '"+rs5.getString("w_start")+"' ");
//			System.out.println(sql8.toString());
			
			stmt9 = conn.createStatement();
			rs9 = stmt9.executeQuery(sql9.toString());
			int rs9Count = rs9.last() ? rs9.getRow() : 0;  
			rs9.beforeFirst(); 		

			while(rs9.next()){
				if(rs9.getInt("ccnt") == 1){
					//전일연속이 없는 경우
					reportMap.put("start_time"+index,rs5.getString("w_start").substring(11,16));
					reportMap.put("m10_"+index,rs5.getString("kg_hr"));
				}else if(rs9.getInt("ccnt") == 0){
					reportMap.put("start_time"+index,"");
					reportMap.put("m10_"+index,rs5.getString("kg_hr"));
				}
			}
			
			
			
			
			reportMap.put("box_cnt"+index,rs5.getString("box_cnt"));
			reportMap.put("work_no"+index,rs5.getString("lotno").replace("_","\n"));
			reportMap.put("lot_no"+index,rs5.getString("roll"));
			reportMap.put("no"+index,rs5.getString("pcode"));
			reportMap.put("pno"+index,rs5.getString("pno"));
			reportMap.put("m24_"+index,rs5.getString("w_end").substring(11,16));
			reportMap.put("weight"+index,Math.round(rs5.getDouble("weight"))+"");
			reportMap.put("client"+index,rs5.getString("cname"));
			reportMap.put("pname"+index,rs5.getString("pname"));
			reportMap.put("spec"+index,rs5.getString("pspec"));
			reportMap.put("m25_"+index,rs5.getString("qt_type").replace("-","\n"));
			reportMap.put("start_time"+index,rs5.getString("w_start").substring(11,16));
			reportMap.put("m11_"+index,rs5.getString("speed"));
			reportMap.put("m14_"+index,rs5.getString("oil"));
			reportMap.put("m15_"+index,String.format("%.2f",rs5.getDouble("q_inv")));
//			reportMap.put("m18_"+index,String.format("%.2f",((Math.round((rs5.getDouble("s_cp") * 0.001)*100)/100.0))));
//			reportMap.put("m19_"+index,String.format("%.2f",((Math.round((rs5.getDouble("p_cp") * 0.001)*100)/100.0))));
			
			reportMap.put("m18_"+index,rs5.getString("s_cp"));
			reportMap.put("m19_"+index,rs5.getString("s_cp"));
			
			
			reportMap.put("m22_"+index,String.format("%.2f",rs5.getDouble("t_inv")));	
			reportMap.put("m13_"+index,rs5.getString("qun3"));
			reportMap.put("m23_"+index,rs5.getString("tem4"));
			reportMap.put("m20_"+index,String.format("%.3f",rs5.getDouble("co2")));
			reportMap.put("m10_"+index,rs5.getString("kg_hr").replace("-"," "));
			
			//심부경도 (초물)
			reportMap.put("l"+index+"_1",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s1"))));
			reportMap.put("l"+index+"_2",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s2"))));					
				
			//심부경도 (자주)
			reportMap.put("l"+index+"_3",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s3"))));
			reportMap.put("l"+index+"_4",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s4"))));					
			reportMap.put("l"+index+"_5",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s5"))));
			reportMap.put("l"+index+"_6",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s6"))));					
			reportMap.put("l"+index+"_7",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s7"))));
			reportMap.put("l"+index+"_8",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s8"))));					
			reportMap.put("l"+index+"_9",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s9"))));
			reportMap.put("l"+index+"_10",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_s10"))));					
			
			//표면경도 (초물)
			reportMap.put("lf"+index+"_1",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p1"))));
			reportMap.put("lf"+index+"_2",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p2"))));					
			
			//표면경도 (자주)
			reportMap.put("lf"+index+"_3",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p3"))));
			reportMap.put("lf"+index+"_4",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p4"))));					
			reportMap.put("lf"+index+"_5",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p5"))));
			reportMap.put("lf"+index+"_6",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p6"))));					
			reportMap.put("lf"+index+"_7",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p7"))));
			reportMap.put("lf"+index+"_8",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p8"))));					
			reportMap.put("lf"+index+"_9",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p9"))));
			reportMap.put("lf"+index+"_10",wr.fMethod(String.format("%.1f",rs5.getFloat("spc_p10"))));					

			reportMap.put("m32_"+index,rs5.getString("n_factory"));
			reportMap.put("m33_"+index,rs5.getString("worker"));
			
			reportMap.put("tem_change"+index,rs5.getString("tem_change"));
			
			stime_mix = rs5.getString("w_start");
			
//			reportMap.put("m10_"+index,"" );					
			
			
			etime_mix = rs5.getString("w_end");
			
			
			String work_end = rs5.getString("w_end").substring(0,10);
			
			
			popSql2.setLength(0);
			popSql2.append("SELECT a.facility_code, a.facility_mix_loc, ");					
			popSql2.append("MAX(TO_CHAR(a.create_date,'yyyy-MM-dd HH24:MI:ss')) AS  wdate, ");
			popSql2.append("MAX(TO_CHAR(a.create_date,'HH24:MI')) AS homi, ");
			popSql2.append("MAX(a.facility_mix_qty) AS qty, MAX(b.worker_name) AS wname ");				
			popSql2.append("FROM prd_qt_mixconfirm a, sf_worker_mst b ");
			popSql2.append("WHERE TO_CHAR(a.create_date,'yyyy-MM-dd HH24:MI:ss') BETWEEN '"+stime_mix+"' AND '"+etime_mix+"' ");
			popSql2.append("AND a.worker_no = b.emp_code ");
			popSql2.append("AND facility_code = '"+hogi+"' ");
			popSql2.append("AND (facility_mix_loc IN ('002','004','005') ) ");
			popSql2.append("GROUP BY a.facility_code, a.facility_mix_loc ");
			
			stmt_pop2 = conn_pop.createStatement();
			rs_pop2 = stmt_pop2.executeQuery(popSql2.toString());

			while(rs_pop2.next()){
				
				if("002".equals(rs_pop2.getString("facility_mix_loc"))){
					reportMap.put("m12_"+mix_odd,rs_pop2.getString("wname"));
					reportMap.put("m12_"+mix_even,mix1);
					
				}else if("004".equals(rs_pop2.getString("facility_mix_loc"))){
					reportMap.put("m21_"+mix_odd,rs_pop2.getString("wname"));
					reportMap.put("m21_"+mix_even,mix2);

				}else if("005".equals(rs_pop2.getString("facility_mix_loc"))){
					reportMap.put("m26_"+mix_odd,rs_pop2.getString("wname"));
					reportMap.put("m26_"+mix_even,etime_mix.substring(11,16));
				}

			}
			mix_odd +=2;
			mix_even +=2;				
			
			index++;
		}
		
		boolean isExists = file.exists();
		if (isExists) {

			
			
			JasperReportsContext jasperReportsContext = new SimpleJasperReportsContext();
			JasperCompileManager compileManager = JasperCompileManager.getInstance(jasperReportsContext);
			JasperReport report = JasperCompileManager.compileReport(abPath);
			
			JasperFillManager fillManager = JasperFillManager.getInstance(jasperReportsContext);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, reportMap,conn);
			
			 JasperExportManager exportManager = JasperExportManager.getInstance(jasperReportsContext); 
			 JasperExportManager.exportReportToPdfFile(jasperPrint,uploadPath+"/"+now2+"_"+file_no+"호기_작업일보2_"+now3+".pdf");
			 

				//파일 저장용
				JasperExportManager.exportReportToPdfFile(jasperPrint,"D:/Job/report2_bak/"+now2+"_"+file_no+"호기_작업일보2_"+now3+".pdf");
				
				//PC 저장용 병합본
				PDFMergerUtility ut = new PDFMergerUtility();
				
				String fm = now2+"_"+file_no+"호기_작업일보_";
				
				ut.addSource("D:/Job/report1_bak/"+fileName2+now3+".pdf");
				ut.addSource("D:/Job/report2_bak/"+now2+"_"+file_no+"호기_작업일보2_"+now3+".pdf");
				ut.setDestinationFileName("D:/Job/"+fm+now3+".pdf");			
				ut.mergeDocuments();
				
				//프리뷰용 병합본
				PDFMergerUtility ut2 = new PDFMergerUtility();
				
				ut2.addSource(uploadPath+"/"+fileName2+now3+".pdf");
				ut2.addSource(uploadPath+"/"+now2+"_"+file_no+"호기_작업일보2_"+now3+".pdf");
				ut2.setDestinationFileName(uploadPath+"/"+fm+now3+".pdf");			
				ut2.mergeDocuments();
							 
			 
			 
			 u_sql2.append("INSERT INTO tb_work_printlist ");
			 u_sql2.append("(print_time, wdate, hogi, seq_no, filename) VALUES ");
			 u_sql2.append("(now(), '"+workDate_format.format(workDate)+"', '"+hogi+"', 2, ");
			 u_sql2.append("CONCAT('"+now2+"','_','"+file_no+"','호기_작업일보2_','"+now3+"','.pdf' ) ) ");
			 
			 pstmt2 = conn.prepareStatement(u_sql2.toString());
			 pstmt2.executeUpdate();

			
			 
			 u_sql3.setLength(0);
			 u_sql3.append("INSERT INTO tb_report_file ");
			 u_sql3.append("(print_time, wdate, hogi, filename) VALUES ");
			 u_sql3.append("(now(), '"+workDate_format.format(workDate)+"', '"+hogi+"', CONCAT('"+fm+"','"+now3+"','.pdf') ) ");
			 
			 pstmt4 = conn.prepareStatement(u_sql3.toString());
			 pstmt4.executeUpdate();
			 
			 conn.commit();
		
			}	
		
			
	}
			
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		out.print(mainObj);
		out.flush();

		if (rs != null)try {rs.close();}catch(SQLException sqle){}
		if (rs2 != null)try {rs2.close();}catch(SQLException sqle){}
		if (rs3 != null)try {rs3.close();}catch(SQLException sqle){}
		if (rs4 != null)try {rs4.close();}catch(SQLException sqle){}
		if (rs5 != null)try {rs5.close();}catch(SQLException sqle){}
		if (rs6 != null)try {rs6.close();}catch(SQLException sqle){}
		if (rs8 != null)try {rs8.close();}catch(SQLException sqle){}
		if (rs9 != null)try {rs9.close();}catch(SQLException sqle){}
		
		
		if (rs_pop != null)try {rs_pop.close();}catch(SQLException sqle){}
		if (rs_pop2 != null)try {rs_pop2.close();}catch(SQLException sqle){}
		if (rs_pop3 != null)try {rs_pop3.close();}catch(SQLException sqle){}
		
		
		if (rs_erp != null)try {rs_erp.close();}catch(SQLException sqle){}

		
		
		if(rs_spc != null)try{rs_spc.close();}catch(SQLException slqe){}

		
		if(stmt != null)try {stmt.close();}catch(SQLException sqle){}
		if(stmt2 != null)try {stmt2.close();}catch(SQLException sqle){}
		if(stmt3 != null)try {stmt3.close();}catch(SQLException sqle){}
		if(stmt4 != null)try {stmt4.close();}catch(SQLException sqle){}
		if(stmt5 != null)try {stmt5.close();}catch(SQLException sqle){}
		if(stmt6 != null)try {stmt6.close();}catch(SQLException sqle){}
		if(stmt8 != null)try {stmt8.close();}catch(SQLException sqle){}
		if(stmt9 != null)try {stmt9.close();}catch(SQLException sqle){}
		
		if(stmt_pop != null)try {stmt_pop.close();}catch(SQLException sqle){}
		if(stmt_pop2 != null)try {stmt_pop2.close();}catch(SQLException sqle){}
		if(stmt_pop3 != null)try {stmt_pop3.close();}catch(SQLException sqle){}
		
		if(stmt_erp != null)try {stmt_erp.close();}catch(SQLException sqle){}
		
		if(stmt_spc != null)try {stmt_spc.close();}catch(SQLException sqle){}
		
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null)try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null)try{pstmt3.close();}catch(SQLException sqle){}
		if(pstmt4 != null)try{pstmt4.close();}catch(SQLException sqle){}
		
		
		if(conn != null)try {conn.close();}catch(SQLException sqle){}
		if(conn_pop != null)try {conn_pop.close();}catch(SQLException sqle){}
		if(conn_erp != null)try {conn_erp.close();}catch(SQLException sqle){}
	}
	
	
%>