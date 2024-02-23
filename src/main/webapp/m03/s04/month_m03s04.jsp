<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 
<%@ include file="ppk_calc.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	Ppk_Calc ppk_calc = new Ppk_Calc();

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	StringBuffer s_sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		
		s_sql.append("select cnt, hogi, year1, month1, proname, pno, pname, sampleN, ");
		s_sql.append("writer, item, date1, measure, unit, spec, upp, low, type, kg_hr ");
		for(int i=0; i<100; i++){
			s_sql.append(",val"+(i+1)+" ");
		}
		s_sql.append("from tb_ppk ");
		s_sql.append("where cnt = "+cnt+" ");
//		System.out.println(s_sql.toString());
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst();  		
		
		mainObj.put("total", String.valueOf(rowCount));
		mainObj.put("status", String.valueOf("ok"));
		JSONArray mainArray = new JSONArray();
		JSONArray valueArray = new JSONArray();
		
		String uppTol = "";
		String lowTol = "";
		
		String ppk_min = "";
		String ppk_max = "";
		String ppk_average = "";
		String ppk_dev = "";
		String ppk_pp = "";
		String ppk_tolType = "";
		String ppk_ppu = "";
		String ppk_ppl = "";
		String ppk_ppk = "";
		String ppk_tolType2 = "";
		String ppk_totalPPm = "";
		
		while(rs.next()){
			JSONObject rowObj = new JSONObject();
			rowObj.put("cnt",rs.getInt("cnt"));
			rowObj.put("hogi",rs.getString("hogi"));
			rowObj.put("year1",rs.getString("year1"));
			rowObj.put("month1",rs.getString("month1").replace("월",""));
			rowObj.put("proname",rs.getString("proname"));
			rowObj.put("pno",rs.getString("pno"));
			rowObj.put("pname",rs.getString("pname"));
			rowObj.put("writer",rs.getString("writer"));
			rowObj.put("date1",rs.getString("date1"));
			rowObj.put("sampleN",rs.getString("sampleN"));
			rowObj.put("item",rs.getString("item"));
			rowObj.put("measure",rs.getString("measure"));
			rowObj.put("unit",rs.getString("unit"));
			rowObj.put("spec",rs.getString("spec"));
			rowObj.put("upp",rs.getString("upp"));
			rowObj.put("low",rs.getString("low"));
			rowObj.put("type",rs.getString("type"));
			rowObj.put("kg_hr",rs.getString("kg_hr"));
			
			uppTol = rs.getString("upp");
			lowTol = rs.getString("low");
			
			for(int j=0; j<100; j++){
				valueArray.add(rs.getString("val"+(j+1)));
			}
			
//			rowObj.put("ppk_val"+(val_idx+1),rs.getString("val"+(val_idx+1)));
			
//			rowObj.put("ppk_val1",rs.getString("val1"));
//			rowObj.put("ppk_val2",rs.getString("val2"));
//			rowObj.put("ppk_val3",rs.getString("val3"));
			
			mainArray.add(rowObj);
		}
	
		
//		System.out.println(Double.parseDouble("∞"));
//		System.out.println(Double.isInfinite(2.0/0.0));
		
		

		//입력한 값들 중 최솟값 구하기
		ppk_min = ppk_calc.ppk_min(valueArray,uppTol, lowTol);
//		System.out.println("최소 : "+ppk_min);
		
		//입력한 값들 중 최댓값 구하기
		ppk_max = ppk_calc.ppk_max(valueArray,uppTol, lowTol);
//		System.out.println("최대 : "+ppk_max);
		
		//입력한 값들의 평균값 구하기
		ppk_average = ppk_calc.ppk_average(valueArray,uppTol, lowTol);
//		System.out.println("평균 : "+ppk_average);
		
		
		//입력한 값들의 표준편차값 구하기
		ppk_dev = ppk_calc.ppk_dev(valueArray, uppTol, lowTol);
//		System.out.println("표준편차 : "+ppk_dev);
		
		//입력한 값들의 pp값 구하기
		ppk_pp = ppk_calc.ppk_pp(valueArray, uppTol, lowTol);
//		System.out.println("pp : "+ppk_pp);
		
		//공차유형
		ppk_tolType = ppk_calc.tolType(uppTol, lowTol);
		
		//입력한 값들의 ppu값 구하기
		ppk_ppu = ppk_calc.ppk_ppu(valueArray, uppTol, lowTol);
		
		//입력한 값들의 ppl값 구하기
		ppk_ppl = ppk_calc.ppk_ppl(valueArray, uppTol, lowTol);
		
		//입력한 값들의 ppk값 구하기
		ppk_ppk = ppk_calc.ppk_ppk(valueArray, uppTol, lowTol);
		
		//tolType2구하기 Both, ...
		ppk_tolType2 = ppk_calc.tolType2(uppTol, lowTol);
		
		//ppk_UpPPm 추정불량율 구하기 위한 1단계
//		ppk_UpPPm = ppk_calc.upPPm(valueArray, uppTol, lowTol);
//		System.out.println("1단계 : "+ppk_UpPPm);
		ppk_totalPPm = ppk_calc.totalPPm(valueArray, uppTol, lowTol); 
		
		JSONObject ppkObj = new JSONObject();
		ppkObj.put("min",ppk_min);
		ppkObj.put("max",ppk_max);
		ppkObj.put("average",String.format("%.1f",Double.parseDouble(ppk_average)));
		ppkObj.put("dev",ppk_dev);
		ppkObj.put("pp",ppk_pp);
		ppkObj.put("tolType",ppk_tolType);
		if("".equals(uppTol) && "".equals(lowTol)){
			ppkObj.put("spec",String.format("%.3f",Double.parseDouble("0.0"))+"-"+String.format("%.3f",Double.parseDouble("0.0")));
		}else if("".equals(uppTol)){			
			ppkObj.put("spec",String.format("%.3f",Double.parseDouble(lowTol))+"-"+String.format("%.3f",Double.parseDouble("0.0")));
		}else if("".equals(lowTol)){
			ppkObj.put("spec",String.format("%.3f",Double.parseDouble("0.0"))+"-"+String.format("%.3f",Double.parseDouble(uppTol)));
		}else{
			ppkObj.put("spec",String.format("%.3f",Double.parseDouble(lowTol))+"-"+String.format("%.3f",Double.parseDouble(uppTol)));
		}
		
		ppkObj.put("ppu",ppk_ppu);
		ppkObj.put("ppl",ppk_ppl);
		ppkObj.put("ppk",ppk_ppk);
		ppkObj.put("tolType2",ppk_tolType2);
		ppkObj.put("totalPPm",ppk_totalPPm);
		
		
		mainObj.put("rows",mainArray);
		mainObj.put("values",valueArray);
		mainObj.put("ppk",ppkObj);
		
		
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