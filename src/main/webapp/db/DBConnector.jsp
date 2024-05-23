<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
// conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jinhap?autoReconnect=true", "root", "jinhap2023");
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jinhap?autoReconnect=true", "root", "ezat6695");
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jinhap?autoReconnect=true&useUnicode=true&characterEncoding=utf8", "root", "ezat6695");
conn = DriverManager.getConnection("jdbc:mysql://10.10.225.100:3306/jinhap?autoReconnect=true&useUnicode=true&characterEncoding=utf8", "root", "jinhap2023");
//conn = DriverManager.getConnection("jdbc:mysql://192.168.1.62:3306/jinhap?autoReconnect=true&useUnicode=true&characterEncoding=utf8", "root", "ezat6695");
conn.setAutoCommit(false);


%>