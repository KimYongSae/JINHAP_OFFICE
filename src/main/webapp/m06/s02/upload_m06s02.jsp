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
    String uploadPath = request.getRealPath("/") + "upload";
	//String uploadPath = "D:/file/m05s02";
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
    // 데이터베이스 저장
    try {
        SimpleDateFormat sdf_date1 = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = sdf_date1.format(currentDate);
        
        callableStatement = conn.prepareCall("{call sp_auth_file_set (?,?)}");
        callableStatement.setString(1, formattedDate);
        callableStatement.setString(2, renamedFileName);
        callableStatement.executeUpdate();

        conn.commit();

    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        if(callableStatement != null) { callableStatement.close(); }
        if(conn != null) { conn.close(); }
    }
%>

</body>
</html>
