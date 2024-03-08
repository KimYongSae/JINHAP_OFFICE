<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String hogi = request.getParameter("hogi");
		String sdate = request.getParameter("sdate");
//		String edate = request.getParameter("edate");

		String result = "";
		 
		StringBuffer sql = new StringBuffer();
		StringBuffer whereSql = new StringBuffer();
		Statement stmt = null;
		ResultSet rs = null;
		if(!"".equals(hogi) && hogi != null){
			whereSql.append(" AND hogi = '"+hogi+"' ");
		}
		
		/*
SELECT wdate2, hogi, IFNULL(f,'') AS f
FROM (
SELECT LEFT(work_start,10) wdate2, a.hogi AS hogi, RIGHT(b.filename,10) f
FROM tb_worker_time a LEFT OUTER JOIN tb_work_printlist b
ON a.hogi = b.hogi AND LEFT(work_start,10) = b.wdate 
GROUP BY LEFT(work_start,10), a.hogi, f
) a
WHERE wdate2 BETWEEN '2020-06-10' AND '2020-06-10'
GROUP BY wdate2, hogi		
		*/
/*		
		sql.append("SELECT wdate2, hogi, IFNULL(f,'') AS f ");
		sql.append("FROM ( ");
		sql.append("SELECT LEFT(work_start,10) wdate2, a.hogi AS hogi, RIGHT(b.filename,10) f ");
		sql.append("FROM tb_worker_time a LEFT OUTER JOIN tb_report_file b ");
		sql.append("ON a.hogi = b.hogi AND LEFT(work_start,10) = b.wdate AND yn='Y' ");
		sql.append("GROUP BY LEFT(work_start,10), a.hogi, f ");
		sql.append(") a ");
		sql.append("WHERE wdate2 = '"+sdate+"' ");
		sql.append(whereSql.toString());
		sql.append("GROUP BY wdate2, hogi ");
		sql.append("ORDER BY hogi ");
*/
		//2021-06-11 목록 수정(작업완료시간 업데이트한다음 추가 수정필요.)
		sql.append("SELECT wdate AS wdate2, hogi, IFNULL(f,'') AS f ");
		sql.append("FROM ( ");
		sql.append("	SELECT works.hogi, works.wdate, RIGHT(reports.filename,10) AS f ");
		sql.append("	FROM ( ");
		sql.append("		SELECT hogi, work_end, ");
		sql.append("				CASE WHEN ");
		sql.append("				(work_end >= CONCAT('"+sdate+"',' ','08:30:00') AND ");
		sql.append("				work_end < CONCAT(DATE_ADD('"+sdate+"',INTERVAL 1 DAY),' ','08:30:00')) ");
		sql.append("				THEN '"+sdate+"' ");
		sql.append("				ELSE DATE_ADD('"+sdate+"',INTERVAL 1 DAY) END AS wdate ");
		sql.append("		FROM tb_worker_time ");
		sql.append("	) AS works ");
		sql.append("LEFT OUTER JOIN ");
		sql.append(" 	( ");
		sql.append("		SELECT * ");
		sql.append("		FROM tb_report_file ");
		sql.append("		WHERE yn = 'Y' ");
		sql.append("	) AS reports ");
		sql.append("	ON works.hogi = reports.hogi AND works.wdate = reports.wdate ");
		sql.append(") AS aa ");
		sql.append("WHERE wdate = '"+sdate+"' ");
		sql.append("GROUP BY wdate, hogi  ");
		sql.append("ORDER BY hogi  ");
		
		/*
		sql.append("SELECT LEFT(work_start,10) wdate, hogi ");
		sql.append("FROM tb_worker_time ");
		sql.append("WHERE  ");
		sql.append("LEFT(work_start,10) BETWEEN '"+sdate+"' AND '"+edate+"'  ");
		sql.append(whereSql.toString());
		sql.append("GROUP BY LEFT(work_start,10), hogi ");
		sql.append("ORDER BY hogi ");
		*/
		
		
//		System.out.println(sql.toString());
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 JSONArray hogiArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

	     try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
			
			while(rs.next()){
				JSONObject rowObj = new JSONObject();
				
				String r_hogi = "";
				if("QT001".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT3");
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+3);
					rowObj.put("seq",3);
					hogiArray.add("HT-QT3");
					
				}else if("QT002".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT4");
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+4);
					rowObj.put("seq",4);
					hogiArray.add("HT-QT4");
					
				}else if("QT003".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT5");	
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+5);
					rowObj.put("seq",5);
					hogiArray.add("HT-QT5");
					
				}else if("QT004".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT6");	
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+6);
					rowObj.put("seq",6);
					hogiArray.add("HT-QT6");
					
				}else if("QT011".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT7");	
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+7);
					rowObj.put("seq",7);
					hogiArray.add("HT-QT7");
					
				}else if("QT012".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT8");	
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+8);
					rowObj.put("seq",8);
					hogiArray.add("HT-QT8");
										
				}else if("QT013".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT9");	
					rowObj.put("gb",rs.getString("wdate2").replace("-","")+9);
					rowObj.put("seq",9);
					hogiArray.add("HT-QT9");
										
				}
				
				
//				rowObj.put("hogi",rs.getString("hogi"));
				
				rowObj.put("wdate",rs.getString("wdate2"));
				rowObj.put("f",rs.getString("f"));
				
				rowObj.put("r_gb",0);
				
				mainArray.add(rowObj);
				
			}
			
			JSONArray tempArray = new JSONArray();
			
			tempArray.add("HT-QT3"); tempArray.add("HT-QT4"); 
			tempArray.add("HT-QT5"); tempArray.add("HT-QT6"); 
			tempArray.add("HT-QT7"); tempArray.add("HT-QT8"); tempArray.add("HT-QT9");
			
			
			if(hogiArray.size() != 6){
				for(int i=0; i<tempArray.size(); i++){

					for(int j=0; j<hogiArray.size(); j++){
						if(tempArray.get(i).equals(hogiArray.get(j))){
							tempArray.remove(i);
						}					
					}
				}
				
				for(int i=0; i<tempArray.size(); i++){
//					System.out.println(tempArray.get(i));
					JSONObject rowObj2 = new JSONObject();
					rowObj2.put("hogi",tempArray.get(i));	
					rowObj2.put("gb",sdate.replace("-","")+tempArray.get(i).toString().substring(5,6));
					rowObj2.put("seq",Integer.parseInt(tempArray.get(i).toString().substring(5,6)));				
					rowObj2.put("wdate",sdate);
					rowObj2.put("f","");
					
					rowObj2.put("r_gb",1);
					mainArray.add(rowObj2);
				}
			}
			
			
			
			mainObj.put("rows",mainArray);
	       
	       conn.commit();
	     }	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		out.print(mainObj);
		out.flush();
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
		 
%>
