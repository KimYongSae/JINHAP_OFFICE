<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="java.io.*" %>

<%@page import="java.util.*" %>

<%@page import="java.text.*" %>
	
<%@include file="../db/DBConnector.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String u_id = request.getParameter("pid");
	String u_pw = request.getParameter("pw");
//	System.out.println("아이디 : "+u_id+", 암호 : "+u_pw);
	
	String name1 = "";
	String level1 = "";
	
	Statement stmt = null;
	ResultSet rs = null;
	
	PreparedStatement ptmt1 = null;
 try{
  	StringBuffer sql = new StringBuffer();
  	
  	sql.append("select u_id, u_pw, u_name, u_level, u_group from tb_user where u_id = '"+u_id+"' AND yn='Y' ");
	System.out.println("sql=" + sql.toString());
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql.toString());
	
	//System.out.println(p1v.toString());
	 //System.out.println(stmt);
	int rowCount = rs.last() ? rs.getRow() : 0;	
	rs.beforeFirst(); 	
	
	if(rowCount == 0){
		%>
		 <script language=javascript>
			self.window.alert("ID / PW를 확인하여 주십시요!");
			location.href="index.jsp";
		</script>
	
		<%		
	}else{
		while (rs.next()) {
			
			String userPWD = rs.getString("u_pw");
			String userName = rs.getString("u_name");
			String userLevel = rs.getString("u_level");
			String userGroup = rs.getString("u_group");
			String userId = rs.getString("u_id");
			
			level1 = rs.getString("u_level");
			name1 = rs.getString("u_name");
			
			
			
			if (userPWD.equals(u_pw)){
				session.setAttribute("sname", userName);
				session.setAttribute("slevel", userLevel);		
				session.setAttribute("sgroup", userGroup);
				session.setAttribute("sid",userId);
				session.setMaxInactiveInterval(1*60*60*10);			
				//1*60*30

				
				  
				
				 // Date cTime = new Date();
				  	
				  	StringBuffer query1 = new StringBuffer();
				  	query1.append("INSERT INTO tb_login (u_id, u_name, u_time) ");
				  	query1.append("VALUES('"+userId+"','"+userName+"',now()) ");
//					System.out.println("sql=" + sql.toString());
					
					ptmt1 = conn.prepareStatement(query1.toString());

					ptmt1.executeUpdate();
					
					conn.commit();
					
					response.sendRedirect("m01s01.jsp");	
					
					
			}else{
				%>
				 <script language=javascript>
					self.window.alert("ID / PW를 확인하여 주십시요!");
					location.href="index.jsp";
				</script>
			
				<%
				//response.sendRedirect("index.html");

				//System.out.println("로그인 오류!!");

			}
			
			

		}		
	}
	

	

		
		//rs.close();
		
		

 }catch(Exception e){
	 out.println("연결 오류!!");
	 e.printStackTrace();
}finally{
	if(rs != null){
		rs.close();	
	}
	if(stmt != null){
		stmt.close();	
	}
	if(ptmt1 != null){
		ptmt1.close();	
	}
	if(conn != null){
		conn.close();
	}
}

 %>