<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../db/DBConnector.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    String hogi = request.getParameter("hogi");
    String date = request.getParameter("date");
    String[] inspectionItems = {"rf-chain", "top-gear", "top-sprocket", "top-bearing", "bottom-sprocket", "bottom-gear", "bottom-bearing", "chain"};

    String query = 
        "SELECT inspection_item, oil_value, oil_bigo, a_value, a_bigo " +
        "FROM tb_inspection " +
        "WHERE hogi = ? AND inspection_date = ?";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    JSONObject mainObj = new JSONObject();
    JSONArray mainArray = new JSONArray();

    try {

        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(hogi));
        pstmt.setDate(2, java.sql.Date.valueOf(date));
        rs = pstmt.executeQuery();
        boolean hasResults = false;
        while (rs.next()) {
        	hasResults = true;
            JSONObject rowObj = new JSONObject();
            String item = rs.getString("inspection_item");
            rowObj.put("inspection_item", item);
            rowObj.put("oil_value", rs.getString("oil_value") != null ? rs.getString("oil_value") : "");
            rowObj.put("oil_bigo", rs.getString("oil_bigo") != null ? rs.getString("oil_bigo") : "");
            rowObj.put("a_value", rs.getString("a_value") != null ? rs.getString("a_value") : "");
            rowObj.put("a_bigo", rs.getString("a_bigo") != null ? rs.getString("a_bigo") : "");
            mainArray.add(rowObj);
        }
        if (!hasResults) {
            for (String item : inspectionItems) {
                JSONObject emptyObj = new JSONObject();
                emptyObj.put("inspection_item", item);
                emptyObj.put("oil_value", "");
                emptyObj.put("oil_bigo", "");
                emptyObj.put("a_value", "");
                emptyObj.put("a_bigo", "");
                mainArray.add(emptyObj);
            }
        }

        mainObj.put("status", "ok");
        mainObj.put("rows", mainArray);

    } catch (SQLException e) {
        e.printStackTrace();
        mainObj.put("status", "error");
        mainObj.put("message", e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    out.print(mainObj.toJSONString());
    out.flush();
%>
