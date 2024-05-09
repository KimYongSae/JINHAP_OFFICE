<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn_oracle = null;
//oracle
//conn_oracle = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.124:1521/JQIS", "PWO_ADM", "PWO_ADM");
conn_oracle = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.59:1521/ORCL", "EZ_USER", "ezat6695");
conn_oracle.setAutoCommit(false);

%>