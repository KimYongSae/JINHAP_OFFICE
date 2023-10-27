<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//Class.forName("com.jdbc.sqlserver.SQLServerDriver");


	String DB_URL = "jdbc:sqlserver://58.180.177.207:1433;DataBaseName=sunilqms";
	String DB_USER = "spc"; 
	String DB_PASSWORD= "spc";
	Connection conn_spc = null;
	Statement stmt_spc = null;
	ResultSet rs_spc = null;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn_spc = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		
		stmt_spc = conn_spc.createStatement();
		conn_spc.setAutoCommit(false);
//		System.out.println("MsSql jdbc test: connect ok!!");
	} catch(Exception e) {
//		System.out.println("[ERROR] "+e.getMessage());
	}

%>