<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%

		String hogi = (request.getParameter("hogi"));
		String sdateStr = request.getParameter("sdate");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date sdate = sdf.parse(sdateStr);
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(sdate);
	    cal.add(Calendar.DAY_OF_MONTH, 1);
	    String edateStr = sdf.format(cal.getTime());

		 String result = "";
		 
		StringBuffer sql = new StringBuffer();
	 	sql.append("SELECT ");
		sql.append("	SUM(CASE WHEN lot_group != @prev_lot_group THEN 1 ELSE 0 END) OVER (ORDER BY STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') ASC) AS new_lot_group, ");
		sql.append("   @prev_lot_group := lot_group, ");
		sql.append("  sub.*,");
		sql.append("  first_datetiem1_in_group,");
		sql.append("  tra_filtered.*,");
		sql.append(" lot_group_count, ");
		sql.append(" filename ");
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
		sql.append("    AND STR_TO_DATE(datetiem1, '%Y%m%d%H%i%s') BETWEEN '"+sdateStr+" 07:00:00' AND '"+edateStr+" 12:00:00'");
		sql.append("  ) AS main");
		sql.append(" ) AS sub");
		sql.append(" LEFT OUTER JOIN (");
		sql.append("  SELECT *,");
		sql.append("    ROW_NUMBER() OVER (PARTITION BY pnum ORDER BY pname) AS rn");
		sql.append("  FROM tb_recipe_auto"+hogi+"");
		sql.append(" ) AS tra_filtered ON sub.item_cd = tra_filtered.pnum AND tra_filtered.rn = 1");
		sql.append(" LEFT OUTER JOIN (");
		sql.append(" SELECT * FROM tb_lot_report");
		sql.append(" ) AS tlr ON sub.hogi = tlr.hogi AND sub.item_cd = tlr.item_cd AND sub.first_datetiem1_in_group = tlr.first_datetiem1 ");
		sql.append(" WHERE STR_TO_DATE(sub.first_datetiem1_in_group, '%Y-%m-%d %H:%i:%s') BETWEEN '"+sdateStr+" 08:00:00' AND '"+edateStr+" 08:00:00'");
		sql.append(" ORDER BY STR_TO_DATE(sub.datetiem1, '%Y%m%d%H%i%s') asc;");		 
		 
		 
		JSONObject mainObj = new JSONObject();
		JSONArray mainArray = new JSONArray();
		 
        JSONObject groupedData = new JSONObject();

        
		mainObj.put("status", String.valueOf("ok"));
		Statement stmt = null;
		ResultSet rs = null;
		 
	    try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
		    int rowCount = rs.last() ? rs.getRow() : 0;	
		    rs.beforeFirst(); 				    
						
		    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			while(rs.next()){
				
				
				
				
				int newLotGroup = rs.getInt("new_lot_group");
				JSONObject rowObj = new JSONObject();
				rowObj.put("hogi", rs.getInt("tcnt"));
                rowObj.put("lot", rs.getString("lot"));
                rowObj.put("item_cd", rs.getString("item_cd"));
                rowObj.put("pname", rs.getString("pname"));
                rowObj.put("barcode", rs.getString("up_barcode"));
                rowObj.put("gang", rs.getString("gang"));
                rowObj.put("t_gb", rs.getString("t_gb"));
                rowObj.put("q_temp", rs.getString("q_temp_jin"));
                rowObj.put("t_temp", rs.getString("t_temp_jin"));
                rowObj.put("cp", rs.getString("cp_jin"));
                
                rowObj.put("lot_count", rs.getInt("lot_group_count"));
                Timestamp timestamp = rs.getTimestamp("first_datetiem1_in_group");
                String formattedDate = sdf2.format(timestamp);
                rowObj.put("first_datetiem1_in_group", formattedDate);
                rowObj.put("filename", rs.getString("filename"));
                
                Timestamp timestamp2 = rs.getTimestamp("check_time");
                String formattedDate2 = "";
                if (timestamp2 != null) {
                    formattedDate2 = sdf2.format(timestamp2);
                }
                rowObj.put("check_time", formattedDate2);

                rowObj.put("lot_weight", rs.getInt("lot_weight"));
				
                if (!groupedData.containsKey(String.valueOf(newLotGroup))) {
                    groupedData.put(String.valueOf(newLotGroup), new JSONArray());
                }
                ((JSONArray) groupedData.get(String.valueOf(newLotGroup))).add(rowObj);
            
				
			}	
			
				
	

			
			mainObj.put("rows",groupedData);
	       
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
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
		 
%>
