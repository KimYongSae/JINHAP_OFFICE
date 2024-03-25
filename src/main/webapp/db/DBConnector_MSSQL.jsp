<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//Class.forName("com.jdbc.sqlserver.SQLServerDriver");


	String DB_URL = "jdbc:sqlserver://10.10.10.103:1433;DataBaseName=GERPDB";
	String DB_USER = "EZ"; 
	String DB_PASSWORD= "jinhap";
	Connection conn_mssql = null;
	Statement stmt_mssql = null;
	ResultSet rs_mssql = null;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn_mssql = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		
		stmt_mssql = conn_mssql.createStatement();
		conn_mssql.setAutoCommit(false);
//		System.out.println("MsSql jdbc test: connect ok!!");
	} catch(Exception e) {
//		System.out.println("[ERROR] "+e.getMessage());
	}

%>