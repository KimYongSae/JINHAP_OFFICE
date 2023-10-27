<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn_erp = null;
Statement stmt_erp = null;
ResultSet rs_erp = null;
//외부 erp
conn_erp = DriverManager.getConnection("jdbc:oracle:thin:@150.200.10.20:1521/sunil", "erpman", "erpman");

conn_erp.setAutoCommit(false);
stmt_erp = conn_erp.createStatement();

%>