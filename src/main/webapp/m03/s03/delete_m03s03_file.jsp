<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int gb = Integer.parseInt(request.getParameter("gb"));
	
	StringBuffer u_sql = new StringBuffer();
	StringBuffer s_sql = new StringBuffer();
	
	PreparedStatement pstmt = null;
	
	String fileName = "";
	//String realPath = request.getRealPath("/")+"upload";
	String realPath = "D:/file/m03s03";
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		
		switch(gb){
			case 1:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 2:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 3:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 4:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 5:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 6:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 7:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 8:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 9:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 10:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 11:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;
			case 12:
				s_sql.append("SELECT filename_"+gb+" AS filename ");
				s_sql.append("FROM tb_sat_file ");
				s_sql.append("WHERE cnt = "+cnt+" ");
			break;			
		
		}
		

		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		while(rs.next()){
			fileName = rs.getString("filename");
		}
		
		File file = new File(realPath+"/"+fileName);
		
		if(file.exists()){
			file.delete();
		}
		
		switch(gb){
			case 1:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 2:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 3:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 4:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 5:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 6:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 7:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 8:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 9:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 10:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 11:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;
			case 12:
				u_sql.append("update tb_sat_file set filename_"+gb+" = '', file_yn_"+gb+" = 'N' ");
				u_sql.append("where cnt = "+cnt+" ");
			break;			
		}
		
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
		if(pstmt != null) try {pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>