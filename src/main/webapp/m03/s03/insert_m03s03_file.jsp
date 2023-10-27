<%@page import="java.nio.charset.Charset"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileOutputStream, java.util.List, java.util.*, java.io.*" %>
<%@include file="../../db/DBConnector.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>엑셀 POI 테스트 완료</title>
</head>
<body>

<%   
    // 설정값
    //String uploadPath = request.getRealPath("/") + "upload";
    String uploadPath = "D:/file/m03s03";
    int maxSize = 30 * 1024 * 1024 ;
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    Date currentDate = new Date();

    // 파일 업로드 및 이름 변경
    MultipartRequest multiRequest = new MultipartRequest(
        request, 
        uploadPath, 
        maxSize, 
        "utf-8", 
        new DefaultFileRenamePolicy()
    );
    
    String formName = (String) multiRequest.getFileNames().nextElement();
    String temporaryName = multiRequest.getFilesystemName(formName);
    String originalName = multiRequest.getOriginalFileName(formName);

    String fileExtension = temporaryName.substring(temporaryName.lastIndexOf(".") + 1);
    String renamedFileName = originalName.substring(0, originalName.lastIndexOf("."))
                            + "_" + dateFormat.format(currentDate)
                            + "." + fileExtension;

    File oldFile = new File(uploadPath + "/" + temporaryName);
    File newFile = new File(uploadPath + "/" + renamedFileName);
    oldFile.renameTo(newFile);

    CallableStatement callableStatement = null;
%> 

<%
	 PreparedStatement pstmt = null;
	StringBuffer u_sql = new StringBuffer();
try{

	JSONArray valueArray = new JSONArray();
	
	int import_cnt = Integer.parseInt(multiRequest.getParameter("import_cnt"));
	int gb = Integer.parseInt(multiRequest.getParameter("import_gb"));
	
	SimpleDateFormat sdf_date1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdate = sdf_date1.format(currentDate);
	String filename = renamedFileName;

	switch(gb){
		case 1: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 2: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 3: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 4: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 5: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 6: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 7: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 8: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 9: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 10: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 11: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;
		case 12: 
			u_sql.append("UPDATE tb_sat_file SET filename_"+gb+" = '"+filename+"', file_yn_"+gb+"='Y' ");
			u_sql.append("WHERE cnt = "+import_cnt+" ");
		break;		
	}
	
	
	pstmt = conn.prepareStatement(u_sql.toString());
	pstmt.executeUpdate();
	
	conn.commit();

}catch(SQLException e){
	e.printStackTrace();
}finally{
	if(pstmt != null){pstmt.close();}
	if(conn != null){
		conn.close();
	}
	
}
%>
</body>
</html>
