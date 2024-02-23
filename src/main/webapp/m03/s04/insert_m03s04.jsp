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
	Statement stmt = null;
	ResultSet rs = null;
	
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	String tdate = request.getParameter("tdate");
	String[] ppkArray = null;
//	System.out.println(request.getParameterValues("ppkArray"));
	
	if(request.getParameterValues("ppkArray") != null){
		ppkArray = request.getParameterValues("ppkArray");		//ppk값 배열
	}
	
	String proname = request.getParameter("proname");				//공정명
	String pno = request.getParameter("pno");						//측정항목
	String pname = request.getParameter("pname");					//품명
	String writer = request.getParameter("writer");					//측정자
	String date = request.getParameter("date");						//평가일자
	String sampleN = request.getParameter("sampleN");				//샘플링 수
	String item = request.getParameter("item");						//검사항목
	String measure = request.getParameter("measure");				//계측기명
	String unit = request.getParameter("unit");						//측정단위
	String spec = request.getParameter("spec");						//규격
	String upp = request.getParameter("upp");						//규격상한
	String low = request.getParameter("low");						//규격하한
	String type = request.getParameter("type");						//공차유형
	String kg_hr = request.getParameter("kg_hr");					//시간당 장입량
	
	
	double ssum = 0.0;
	StringBuffer u_sql = new StringBuffer();
	
	PreparedStatement pstmt = null;
//	System.out.println(ppkArray.length);
	try
	{
		
		u_sql.append("update tb_ppk set m_date = '"+tdate+"', ");
		u_sql.append("proname = '"+proname+"', pno = '"+pno+"', pname = '"+pname+"', ");
		u_sql.append("writer = '"+writer+"', date1 = '"+date+"', sampleN = '"+sampleN+"', item = '"+item+"', ");
		u_sql.append("unit = '"+unit+"', measure = '"+measure+"', unit = '"+unit+"', ");
		u_sql.append("spec = '"+spec+"', upp = '"+upp+"', low = '"+low+"', type = '"+type+"', ");
		u_sql.append("kg_hr = '"+kg_hr+"' ");
		
		if(ppkArray != null){
			JSONArray ppkJson = new JSONArray();
			for(int i=0; i<ppkArray.length; i++){
				if(!"".equals(ppkArray[i])){
					ssum += Double.parseDouble(ppkArray[i]);
					
				}
				ppkJson.add(ppkArray[i]);
				u_sql.append(",val"+(i+1)+" = '"+ppkArray[i]+"' ");
			}
			
			u_sql.append(",m_ppk = "+ppk_calc.ppk_ppk(ppkJson, upp, low)+" ");
		}
//		u_sql.append("val1 = '"+ppk_val1+"', val2 = '"+ppk_val2+"', val3 = '"+ppk_val3+"', ");
//		u_sql.append("m_ppk = ('"+ppk_val1+"'+'"+ppk_val2+"'+'"+ppk_val3+"')/3 ");
		u_sql.append("where cnt = "+cnt+" ");
		
		pstmt = conn.prepareStatement(u_sql.toString());
		pstmt.executeUpdate();
		
		conn.commit();	
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>