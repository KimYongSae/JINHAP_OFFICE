<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String hogi = (request.getParameter("hogi"));
		String sdate = request.getParameter("date");
		String edate = request.getParameter("edate");
		
		
		

		 String result = "";
		 
		 StringBuffer sql = new StringBuffer();
		 sql.append("SELECT ");
			sql.append("	SUM(CASE WHEN lot_group != @prev_lot_group THEN 1 ELSE 0 END) OVER (ORDER BY STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') ASC) AS new_lot_group, ");
			sql.append("   @prev_lot_group := lot_group, ");
			sql.append("  sub.*,");
			sql.append("  first_datetiem1_in_group,");
			sql.append("  tra_filtered.*,");
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
			sql.append(" WHERE STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') BETWEEN '"+sdate+" 08:00:00' AND '"+edate+" 08:00:00'");
			sql.append(" ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') asc;");		 
		 
		 
		 JSONObject mainObj = new JSONObject();
		 JSONArray mainArray = new JSONArray();
		 
		 mainObj.put("status", String.valueOf("ok"));

		 Statement stmt_pop2 = null;
		 ResultSet rs_pop2 = null;
		 
	     try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
						
			while(rs.next()){
				qtySql.setLength(0);
				weightSql.setLength(0);
				
				
				JSONObject rowObj = new JSONObject();
				
				if("QT001".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT3");
				}else if("QT002".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT4");	
				}else if("QT003".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT5");	
				}else if("QT004".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT6");	
				}else if("QT011".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT7");	
				}else if("QT012".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT8");	
				}else if("QT013".equals(rs.getString("hogi"))){
					rowObj.put("hogi","HT-QT9");	
				}
				
				rowObj.put("cnt",rs.getInt("cnt"));
				rowObj.put("wdate",rs.getString("wdate"));
				rowObj.put("hogi2",rs.getString("hogi"));
				rowObj.put("process_code",rs.getString("process_code"));
				
				rowObj.put("model",rs.getString("model"));
				rowObj.put("spec",rs.getString("spec"));
				
				
				rowObj.put("file_yn",rs.getString("file_yn"));
				
				
				rowObj.put("pno",null);
				rowObj.put("qty",null);
				rowObj.put("weight",null );
				rowObj.put("kghr",null );
				
					
				//pop에서 품번, 투입수량, 중량 가져오기
				popSql.setLength(0);
				popSql.append("SELECT facility_code, work_lot_no, model_code, ");
				popSql.append("roll_lot_no, qt_lot_no, customer_code, ");
				popSql.append("MAX(TO_CHAR(end_time,'yyyy-MM-dd HH24:MI:ss')) AS edate, ");
				popSql.append("SUM(in_qty) AS in_qty, SUM(in_weight) AS in_weight ");
				popSql.append("FROM TS_STOCK_MST ");
				popSql.append("WHERE qt_lot_no = '"+rs.getString("process_code")+"' ");
				popSql.append("AND FACILITY_CODE = '"+hogi+"' ");
				popSql.append("GROUP BY facility_code, work_lot_no, model_code, ");
				popSql.append("roll_lot_no, qt_lot_no, customer_code ");
				popSql.append("ORDER BY qt_lot_no, edate ");
				
				stmt_pop = conn_pop.createStatement();
				rs_pop = stmt_pop.executeQuery(popSql.toString());
				while(rs_pop.next()){
					rowObj.put("pno",rs_pop.getString("model_code"));
					rowObj.put("qty",String.format("%,d",rs_pop.getInt("in_qty")));
					rowObj.put("weight",String.format("%,d",Integer.parseInt(Math.round(rs_pop.getDouble("in_weight"))+"")) );
					rowObj.put("kghr",df.format(Math.round(rs_pop.getDouble("in_weight"))/rs.getDouble("hr")*60));

				}
				
				
				mainArray.add(rowObj);
				
			}	
			
				
//			System.out.println(mainArray);
	

			
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
		
		if(stmt_pop != null) try {stmt_pop.close();}catch(SQLException sqle){}
		if(rs_pop != null) try {rs_pop.close();}catch(SQLException sqle){}		

		if(stmt_pop2 != null) try {stmt_pop2.close();}catch(SQLException sqle){}
		if(rs_pop2 != null) try {rs_pop2.close();}catch(SQLException sqle){}		

		if(stmt_erp != null) try {stmt_erp.close();}catch(SQLException sqle){}
		if(rs_erp != null) try {rs_erp.close();}catch(SQLException sqle){}		
		
		
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
		if(conn_pop != null) try {conn_pop.close();}catch(SQLException sqle){}
		if(conn_erp != null) try {conn_erp.close();}catch(SQLException sqle){}
	}
		 
%>
