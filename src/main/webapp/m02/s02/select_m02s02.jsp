<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
	String tdate = request.getParameter("tdate");
	String hogi = request.getParameter("hogi");
	
	
	String result = "";
	StringBuffer sql = new StringBuffer();	 
	 
	StringBuffer whereSql = new StringBuffer();
	 
	if(!"".equals(tdate) && tdate != null){
		whereSql.append(" and year1 = '"+tdate+"' ");
	}
	
	if(!"".equals(hogi) && hogi != null){
/*		
		if("c".equals(hogi)){
			whereSql.append(" AND hogi = '침탄로' ");
		}else if("p".equals(hogi)){
			whereSql.append(" AND hogi = '풀림로' ");
		}else{
			whereSql.append(" AND hogi = '"+hogi+"호기' ");	
		}
*/
		if("q".equals(hogi)){
			//whereSql.append(" AND seolbi IN ('퀜칭로','침탄로','풀림로') ");	
			whereSql.append(" AND seolbi = '소입로' ");	
		}else if("t".equals(hogi)){
			whereSql.append(" AND seolbi = '소려로' ");	
		}
		
	}
	
	JSONObject mainObj = new JSONObject();  
	 
	 
	sql.append("SELECT hogi, seolbi, IFNULL(change_bdate,'') AS change_bdate, ");
	sql.append("change_ndate, change_date, ");
	sql.append("filename, file_yn, bigo1, ");
	sql.append("year1, cnt ");
	sql.append("FROM tb_theomor ");
	sql.append("WHERE 1=1 ");
	sql.append(whereSql.toString());
	sql.append("ORDER BY hogi, seolbi ");

	
	Statement stmt = null;
	ResultSet rs = null;
	
		     try {
		    	 
		    	 stmt = conn.createStatement();
		    	 rs = stmt.executeQuery(sql.toString());
		    	 String work_flag = "";
		    	 JSONArray mainArray = new JSONArray();
		    	 
		    	 while(rs.next()){
		    		 JSONObject rowObj = new JSONObject();
//		    		 rowObj.put("hogi",rs.getString("hogi"));					//호기 
		    		 /* if("3호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT3");	    			 
		    		 }else if("4호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT4");	    			 
		    		 }else if("5호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT5");	    			 
		    		 }else if("6호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT6");	    			 
		    		 }else if("7호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT7");	    			 
		    		 }else if("8호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT8");	    			 
		    		 }else if("9호기".equals(rs.getString("hogi"))){
						rowObj.put("hogi","HT-QT9");	    			 
		    		 }else{
		    			 rowObj.put("hogi",rs.getString("hogi"));
		    		 } */
		    		 
		    		String hogiValue = rs.getString("hogi");
					if (hogiValue != null) {
					    switch (hogiValue) {
					        case "1호기":
					            rowObj.put("hogi", "Q01-HN01");
					            break;
					        case "2호기":
					            rowObj.put("hogi", "Q01-HN02");
					            break;
					        case "3호기":
					            rowObj.put("hogi", "Q01-HN03");
					            break;
					        case "4호기":
					            rowObj.put("hogi", "Q01-HN04");
					            break;
					        case "5호기":
					            rowObj.put("hogi", "Q01-HN05");
					            break;
					        case "6호기":
					            rowObj.put("hogi", "Q01-HN06");
					            break;
					    }
					}
		    		 
					
					rowObj.put("seolbi",rs.getString("seolbi"));				//설비[퀜칭 1...]
					rowObj.put("change_bdate",rs.getString("change_bdate"));	//이전 교체일
					rowObj.put("change_ndate",rs.getString("change_ndate"));	//차기 교체일
					rowObj.put("change_date",rs.getString("change_date"));		//교체일
					rowObj.put("filename",rs.getString("filename"));			//파일명
					rowObj.put("file_yn",rs.getString("file_yn"));				//파일 사용구분
					rowObj.put("cnt",rs.getInt("cnt"));							//cnt
					rowObj.put("bigo1",rs.getString("bigo1"));							//cnt
					
					
					rowObj.put("year1",rs.getString("year1"));
		    		 
					mainArray.add(rowObj);
						
		    	 }
		    	 
				
		       
		       mainObj.put("status", String.valueOf("ok"));			       
		       mainObj.put("rows",mainArray);
		       
		       
		       result = mainObj.toJSONString();
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
			/*
				//유니크 값이 없을 경우
				out.print(mainObj);
				out.flush();
			*/
%>
