<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="../../db/DBConnector.jsp" %>

<%
   String sdate = request.getParameter("sdate");
   String stime = request.getParameter("stime");
   String edate = request.getParameter("edate");
   String etime = request.getParameter("etime");
   String hogi = request.getParameter("hogi");
      
   String result = "";
   StringBuffer sql = new StringBuffer();
   StringBuffer sql2 = new StringBuffer();
   StringBuffer whereSql = new StringBuffer();
   StringBuffer whereSql2 = new StringBuffer();
   StringBuffer fromSql = new StringBuffer();
   JSONObject mainObj = new JSONObject();  
   JSONObject outObj = new JSONObject();   
   String from = null;
   String join = null;

switch (hogi) {
    case "1":
    	from = " tb_temp1_log ";
    	join = " tb_temp1_memo ";
    	//fromSql.append(" FROM tb_temp1_log ");
        break;
    case "2":
    	from = " tb_temp2_log ";
    	join = " tb_temp2_memo ";
    	//fromSql.append(" FROM tb_temp2_log ");
        break;
    case "3":
    	from = " tb_temp3_log ";
    	join = " tb_temp3_memo ";
    	//fromSql.append(" FROM tb_temp3_log ");
        break;
    case "4":
    	from = " tb_temp4_log ";
    	join = " tb_temp4_memo ";
    	//fromSql.append(" FROM tb_temp4_log ");
        break;
    case "5":
    	from = " tb_temp5_log ";
    	join = " tb_temp5_memo ";
    	//fromSql.append(" FROM tb_temp5_log ");
        break;
    case "6":
    	from = " tb_temp6_log ";
    	join = " tb_temp6_memo ";
    	//fromSql.append(" FROM tb_temp6_log ");
        break;
}
   
   if(sdate != null && !"".equals(sdate) && edate != null && !"".equals(edate)
      && stime != null && !"".equals(stime) && etime != null && !"".equals(etime)){
      whereSql.append(" AND A.datetime1 >= '"+sdate+" "+stime+":00' AND A.datetime1 <= '"+edate+" "+etime+":00'");
      whereSql2.append(" AND regtime >= '"+sdate+" "+stime+":00' AND regtime <= '"+edate+" "+etime+":00'");
   } else {
	    // 조건이 만족하지 않을 경우 실행할 코드
	    try {
	        throw new Exception("날짜 및 시간 조건이 충족되지 않음");
	    } catch (Exception e) {
	        // 오류 처리, 예를 들어 로그를 남기는 등의 작업
	        e.printStackTrace();
	    }
	}
		
      sql.append("SELECT *, UNIX_TIMESTAMP(TIMESTAMP(A.datetime1)) AS unix_time, LEFT(A.datetime1,10) AS mdate ");
      /* sql.append("CASE WHEN tic1_pv_memo IS NOT NULL THEN tic1_pv+5 ELSE NULL END AS tic1_pv_memo_val, ");
      sql.append("CASE WHEN tic2_pv_memo IS NOT NULL THEN tic2_pv+5 ELSE NULL END AS tic2_pv_memo_val, ");
      sql.append("CASE WHEN tic3_pv_memo IS NOT NULL THEN tic3_pv+5 ELSE NULL END AS tic3_pv_memo_val, ");
      sql.append("CASE WHEN tic1_sp_memo IS NOT NULL THEN tic1_sp+5 ELSE NULL END AS tic1_sp_memo_val, ");
      sql.append("CASE WHEN tic2_sp_memo IS NOT NULL THEN tic2_sp+5 ELSE NULL END AS tic2_sp_memo_val, ");
      sql.append("CASE WHEN tic3_sp_memo IS NOT NULL THEN tic3_sp+5 ELSE NULL END AS tic3_sp_memo_val "); */
      //sql.append(" FROM tb_temp1_log ");
      sql.append(" FROM "+from+" AS A");
      sql.append(" LEFT OUTER JOIN "+join+" AS B ON ");
      sql.append(" A.datetime1 = B.datetime1");
      
      sql.append(" WHERE 1=1 "); 
      sql.append(whereSql.toString());
      sql.append(" ORDER BY A.datetime1 ");
   
/*    System.out.println(sql.toString()); */
		sql2.append(" SELECT *, UNIX_TIMESTAMP(TIMESTAMP(regtime)) AS UNIX_TIMESTAMP FROM tb_out_log ");
		sql2.append(" WHERE 1=1 ");
		sql2.append(" AND hogi = " + hogi);
		sql2.append(whereSql2.toString());
		sql2.append(" ORDER BY regtime DESC ");
		
		
   JSONArray datetime = new JSONArray();
   /* JSONArray tic1_pvArr = new JSONArray();
   JSONArray tic2_pvArr = new JSONArray();
   JSONArray tic3_pvArr = new JSONArray();
   JSONArray tic1_spArr = new JSONArray();
   JSONArray tic2_spArr = new JSONArray();
   JSONArray tic3_spArr = new JSONArray(); */
   JSONArray q1_pvArr = new JSONArray();
   JSONArray q2_pvArr = new JSONArray();
   JSONArray q3_pvArr = new JSONArray();
   JSONArray q4_pvArr = new JSONArray();
   JSONArray q5_pvArr = new JSONArray();
   JSONArray t1_pvArr = new JSONArray();
   JSONArray t2_pvArr = new JSONArray();
   JSONArray t3_pvArr = new JSONArray();
   JSONArray t4_pvArr = new JSONArray();
   JSONArray oil_pvArr = new JSONArray();
   JSONArray a_pvArr = new JSONArray();
   JSONArray cp_pvArr = new JSONArray();
   
   
   /*메모*/
   /* JSONArray mDateArr = new JSONArray();
   JSONArray pv1MvArr = new JSONArray();   
   JSONArray pv2MvArr = new JSONArray();
   JSONArray pv3MvArr = new JSONArray();
   JSONArray sp1MvArr = new JSONArray();
   JSONArray sp2MvArr = new JSONArray();
   JSONArray sp3MvArr = new JSONArray(); */
   
   JSONArray mDateArr = new JSONArray();
   JSONArray q1_MvArr = new JSONArray();
   JSONArray q2_MvArr = new JSONArray();
   JSONArray q3_MvArr = new JSONArray();
   JSONArray q4_MvArr = new JSONArray();
   JSONArray q5_MvArr = new JSONArray();
   JSONArray t1_MvArr = new JSONArray();
   JSONArray t2_MvArr = new JSONArray();
   JSONArray t3_MvArr = new JSONArray();
   JSONArray t4_MvArr = new JSONArray();
   JSONArray oil_MvArr = new JSONArray();
   JSONArray a_MvArr = new JSONArray();
   JSONArray cp_MvArr = new JSONArray();
   
   
   
   Statement stmt = null;
   ResultSet rs = null;
   try {  
      stmt = conn.createStatement();  
       rs = stmt.executeQuery(sql.toString());  
          
      mainObj.put("status", String.valueOf("ok"));
      JSONArray rowsArray = new JSONArray();  
      
      
      while(rs.next()){
         datetime.add(rs.getInt("unix_time")); 
         
         JSONArray q1_pv = new JSONArray();
         q1_pv.add(rs.getInt("unix_time")); 
         q1_pv.add(rs.getDouble("q1_pv"));
         
         JSONArray q2_pv = new JSONArray();
         q2_pv.add(rs.getInt("unix_time")); 
         q2_pv.add(rs.getDouble("q2_pv"));
         
         JSONArray q3_pv = new JSONArray();
         q3_pv.add(rs.getInt("unix_time")); 
         q3_pv.add(rs.getDouble("q3_pv"));
         
         JSONArray q4_pv = new JSONArray();
         q4_pv.add(rs.getInt("unix_time")); 
         q4_pv.add(rs.getDouble("q4_pv"));
         
         JSONArray q5_pv = new JSONArray();
         q5_pv.add(rs.getInt("unix_time")); 
         q5_pv.add(rs.getDouble("q5_pv"));
         
         JSONArray t1_pv = new JSONArray();
         t1_pv.add(rs.getInt("unix_time")); 
         t1_pv.add(rs.getDouble("t1_pv"));
         
         JSONArray t2_pv = new JSONArray();
         t2_pv.add(rs.getInt("unix_time")); 
         t2_pv.add(rs.getDouble("t2_pv"));
         
         JSONArray t3_pv = new JSONArray();
         t3_pv.add(rs.getInt("unix_time")); 
         t3_pv.add(rs.getDouble("t3_pv"));
         
         JSONArray t4_pv = new JSONArray();
         t4_pv.add(rs.getInt("unix_time")); 
         t4_pv.add(rs.getDouble("t4_pv"));

         JSONArray oil_pv = new JSONArray();
         oil_pv.add(rs.getInt("unix_time")); 
         oil_pv.add(rs.getDouble("oil_pv"));
         
         JSONArray a_pv = new JSONArray();
         a_pv.add(rs.getInt("unix_time")); 
         a_pv.add(rs.getDouble("a_pv"));
         
         JSONArray cp_pv = new JSONArray();
         cp_pv.add(rs.getInt("unix_time")); 
         cp_pv.add(rs.getDouble("cp_pv")*0.001);
         
         /* JSONArray tic1_pv = new JSONArray();
          tic1_pv.add(rs.getInt("unix_time")); 
         tic1_pv.add(rs.getDouble("tic1_pv")); */
         /* 
         JSONArray tic2_pv = new JSONArray();
          tic2_pv.add(rs.getInt("unix_time")); 
         tic2_pv.add(rs.getDouble("tic2_pv"));
         
         JSONArray tic3_pv = new JSONArray();
         tic3_pv.add(rs.getInt("unix_time")); 
          tic3_pv.add(rs.getDouble("tic3_pv"));
         
         JSONArray tic1_sp = new JSONArray();
         tic1_sp.add(rs.getInt("unix_time")); 
         tic1_sp.add(rs.getDouble("tic1_sp"));
         
         JSONArray tic2_sp = new JSONArray();
         tic2_sp.add(rs.getInt("unix_time"));       
         tic2_sp.add(rs.getDouble("tic2_sp"));
         
         JSONArray tic3_sp = new JSONArray();
         tic3_sp.add(rs.getInt("unix_time"));    
         tic3_sp.add(rs.getDouble("tic3_sp")); */
         
         
         /*메모 추가시작*/
         JSONArray mDate = new JSONArray();
         mDate.add(rs.getInt("unix_time"));
         mDate.add(rs.getString("mdate"));

         // q1
         JSONArray q1Mv = new JSONArray();
         q1Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("q1_memo") != null){
            q1Mv.add(rs.getDouble("q1_pv")+5);      

            String memo = rs.getString("q1_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;

            q1Mv.add(label);

            /* q1Mv.add(rs.getString("q1_memo"));
            q1Mv.add(rs.getString("quenching"));
            q1Mv.add(rs.getString("tempering"));
            q1Mv.add(rs.getString("cp"));
            q1Mv.add(rs.getString("worker")); */
         }else{
            q1Mv.add(null);
            q1Mv.add(null);
         }
         // q2
         JSONArray q2Mv = new JSONArray();
         q2Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("q2_memo") != null){
            q2Mv.add(rs.getDouble("q2_pv")+5);      
            q2Mv.add(rs.getString("q2_memo"));
            String memo = rs.getString("q2_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            q2Mv.add(label);
            /* q2Mv.add(rs.getString("quenching"));
            q2Mv.add(rs.getString("tempering"));
            q2Mv.add(rs.getString("cp"));
            q2Mv.add(rs.getString("worker")); */
         }else{
            q2Mv.add(null);
            q2Mv.add(null);
         }
         
         // q3
         JSONArray q3Mv = new JSONArray();
         q3Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("q3_memo") != null){
            q3Mv.add(rs.getDouble("q3_pv")+5);
            String memo = rs.getString("q3_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            q3Mv.add(label);
            /* q3Mv.add(rs.getString("q3_memo"));
            q3Mv.add(rs.getString("quenching"));
            q3Mv.add(rs.getString("tempering"));
            q3Mv.add(rs.getString("cp"));
            q3Mv.add(rs.getString("worker")); */
         }else{
            q3Mv.add(null);
            q3Mv.add(null);
         }
         
         JSONArray q4Mv = new JSONArray();
         q4Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("q4_memo") != null){
            q4Mv.add(rs.getDouble("q4_pv")+5);
            String memo = rs.getString("q4_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            q4Mv.add(label);
            /* q4Mv.add(rs.getString("q4_memo"));
            q4Mv.add(rs.getString("quenching"));
            q4Mv.add(rs.getString("tempering"));
            q4Mv.add(rs.getString("cp"));
            q4Mv.add(rs.getString("worker")); */
         }else{
            q4Mv.add(null);
            q4Mv.add(null);
         }
         
         JSONArray q5Mv = new JSONArray();
         q5Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("q5_memo") != null){
            q5Mv.add(rs.getDouble("q5_pv")+5);      
            String memo = rs.getString("q5_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            q5Mv.add(label);
            /* q5Mv.add(rs.getString("q5_memo"));
            q5Mv.add(rs.getString("quenching"));
            q5Mv.add(rs.getString("tempering"));
            q5Mv.add(rs.getString("cp"));
            q5Mv.add(rs.getString("worker")); */
         }else{
            q5Mv.add(null);
            q5Mv.add(null);
         }
         
         JSONArray t1Mv = new JSONArray();
         t1Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("t1_memo") != null){
            t1Mv.add(rs.getDouble("t1_pv")+5);
            String memo = rs.getString("t1_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            t1Mv.add(label);
            /* t1Mv.add(rs.getString("t1_memo"));
            t1Mv.add(rs.getString("quenching"));
            t1Mv.add(rs.getString("tempering"));
            t1Mv.add(rs.getString("cp"));
            t1Mv.add(rs.getString("worker")); */
         }else{
            t1Mv.add(null);
            t1Mv.add(null);
         }
         
         JSONArray t2Mv = new JSONArray();
         t2Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("t2_memo") != null){
            t2Mv.add(rs.getDouble("t2_pv")+5);
            String memo = rs.getString("t2_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            t2Mv.add(label);
            /* t2Mv.add(rs.getString("t2_memo"));
            t2Mv.add(rs.getString("quenching"));
            t2Mv.add(rs.getString("tempering"));
            t2Mv.add(rs.getString("cp"));
            t2Mv.add(rs.getString("worker")); */
         }else{
            t2Mv.add(null);
            t2Mv.add(null);
         }
         
         JSONArray t3Mv = new JSONArray();
         t3Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("t3_memo") != null){
            t3Mv.add(rs.getDouble("t3_pv")+5);
            String memo = rs.getString("t3_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            t3Mv.add(label);
            /* t3Mv.add(rs.getString("t3_memo"));
            t3Mv.add(rs.getString("quenching"));
            t3Mv.add(rs.getString("tempering"));
            t3Mv.add(rs.getString("cp"));
            t3Mv.add(rs.getString("worker")); */
         }else{
            t3Mv.add(null);
            t3Mv.add(null);
         }
         
         JSONArray t4Mv = new JSONArray();
         t4Mv.add(rs.getInt("unix_time"));         
         if(rs.getString("t4_memo") != null){
            t4Mv.add(rs.getDouble("t4_pv")+5);
            String memo = rs.getString("t4_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            t4Mv.add(label);
            /* t4Mv.add(rs.getString("t4_memo"));
            t4Mv.add(rs.getString("quenching"));
            t4Mv.add(rs.getString("tempering"));
            t4Mv.add(rs.getString("cp"));
            t4Mv.add(rs.getString("worker")); */
         }else{
            t4Mv.add(null);
            t4Mv.add(null);
         }
         
         JSONArray oilMv = new JSONArray();
         oilMv.add(rs.getInt("unix_time"));         
         if(rs.getString("oil_memo") != null){
            oilMv.add(rs.getDouble("oil_pv")+5);
            String memo = rs.getString("oil_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            oilMv.add(label);
            /* oilMv.add(rs.getString("oil_memo"));
            oilMv.add(rs.getString("quenching"));
            oilMv.add(rs.getString("tempering"));
            oilMv.add(rs.getString("cp"));
            oilMv.add(rs.getString("worker")); */
         }else{
            oilMv.add(null);
            oilMv.add(null);
         }
         
         JSONArray aMv = new JSONArray();
         aMv.add(rs.getInt("unix_time"));         
         if(rs.getString("a_memo") != null){
            aMv.add(rs.getDouble("a_pv")+5);
            String memo = rs.getString("a_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            aMv.add(label);
            /* aMv.add(rs.getString("a_memo"));
            aMv.add(rs.getString("quenching"));
            aMv.add(rs.getString("tempering"));
            aMv.add(rs.getString("cp"));
            aMv.add(rs.getString("worker")); */
         }else{
            aMv.add(null);
            aMv.add(null);
         }
         
         JSONArray cpMv = new JSONArray();
         cpMv.add(rs.getInt("unix_time"));         
         if(rs.getString("cp_memo") != null){
            cpMv.add(rs.getDouble("cp_pv")+5);
            String memo = rs.getString("cp_memo");
            String quenching = rs.getString("quenching");
            String tempering = rs.getString("tempering");
            String cp = rs.getString("cp");
            String worker = rs.getString("worker");

            String label = "";
            if (memo != null && !memo.isEmpty()) label += "메모: " + memo + "<br/>";
            if (quenching != null && !quenching.isEmpty()) label += "소입: " + quenching + "<br/>";
            if (tempering != null && !tempering.isEmpty()) label += "소려: " + tempering + "<br/>";
            if (cp != null && !cp.isEmpty()) label += "CP: " + cp + "<br/>";
            if (worker != null && !worker.isEmpty()) label += "작업자: " + worker;
            cpMv.add(label);
            /* cpMv.add(rs.getString("cp_memo"));
            cpMv.add(rs.getString("quenching"));
            cpMv.add(rs.getString("tempering"));
            cpMv.add(rs.getString("cp"));
            cpMv.add(rs.getString("worker")); */
         }else{
            cpMv.add(null);
            cpMv.add(null);
         }
         
         
        /* 
         JSONArray mDate = new JSONArray();
         mDate.add(rs.getInt("unix_time"));
         mDate.add(rs.getString("mdate"));
         
         //pv1존
         JSONArray pv1Mv = new JSONArray();
         pv1Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic1_pv_memo_val") != 0){
            pv1Mv.add(rs.getDouble("tic1_pv_memo_val"));      
            pv1Mv.add(rs.getString("tic1_pv_memo"));
         }else{
            pv1Mv.add(null);
            pv1Mv.add(null);
         }
         
         //pv2존
         JSONArray pv2Mv = new JSONArray();
         pv2Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic2_pv_memo_val") != 0){
            pv2Mv.add(rs.getDouble("tic2_pv_memo_val"));         
            pv2Mv.add(rs.getString("tic2_pv_memo"));
         }else{
            pv2Mv.add(null);
            pv2Mv.add(null);
         }

         //pv3존
         JSONArray pv3Mv = new JSONArray();
         pv3Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic3_pv_memo_val") != 0){
            pv3Mv.add(rs.getDouble("tic3_pv_memo_val"));         
            pv3Mv.add(rs.getString("tic3_pv_memo"));
         }else{
            pv3Mv.add(null);
            pv3Mv.add(null);
         }
         
         //sp1존
         JSONArray sp1Mv = new JSONArray();
         sp1Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic1_sp_memo_val") != 0){
            sp1Mv.add(rs.getDouble("tic1_sp_memo_val"));         
            sp1Mv.add(rs.getString("tic1_sp_memo"));
         }else{
            sp1Mv.add(null);
            sp1Mv.add(null);
         }
         
         

         //sp2존
         JSONArray sp2Mv = new JSONArray();
         sp2Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic2_sp_memo_val") != 0){
            sp2Mv.add(rs.getDouble("tic2_sp_memo_val"));         
            sp2Mv.add(rs.getString("tic2_sp_memo"));
         }else{
            sp2Mv.add(null);
            sp2Mv.add(null);
         }

         
         //sp3존
         JSONArray sp3Mv = new JSONArray();
         sp3Mv.add(rs.getInt("unix_time"));         
         if(rs.getInt("tic3_sp_memo_val") != 0){
            sp3Mv.add(rs.getDouble("tic3_sp_memo_val"));         
            sp3Mv.add(rs.getString("tic3_sp_memo"));
         }else{
            sp3Mv.add(null);
            sp3Mv.add(null);
         } */

         
        
         
         
         
         /*메모추가종료*/

         
         
         /* tic1_pvArr.add(tic1_pv);
         tic2_pvArr.add(tic2_pv);
         tic3_pvArr.add(tic3_pv);
         tic1_spArr.add(tic1_sp);
         tic2_spArr.add(tic2_sp);
         tic3_spArr.add(tic3_sp);
         mDateArr.add(mDate);
         pv1MvArr.add(pv1Mv);
         pv2MvArr.add(pv2Mv);
         pv3MvArr.add(pv3Mv);
         sp1MvArr.add(sp1Mv);
         sp2MvArr.add(sp2Mv);
         sp3MvArr.add(sp3Mv); */
         
         q1_pvArr.add(q1_pv);
         q2_pvArr.add(q2_pv);
         q3_pvArr.add(q3_pv);
         q4_pvArr.add(q4_pv);
         q5_pvArr.add(q5_pv);
         t1_pvArr.add(t1_pv);
         t2_pvArr.add(t2_pv);
         t3_pvArr.add(t3_pv);
         t4_pvArr.add(t4_pv);
         oil_pvArr.add(oil_pv);
         a_pvArr.add(a_pv);
         cp_pvArr.add(cp_pv);
         
         q1_MvArr.add(q1Mv);
         q2_MvArr.add(q2Mv);
         q3_MvArr.add(q3Mv);
         q4_MvArr.add(q4Mv);
         q5_MvArr.add(q5Mv);
         t1_MvArr.add(t1Mv);
         t2_MvArr.add(t2Mv);
         t3_MvArr.add(t3Mv);
         t4_MvArr.add(t4Mv);
         oil_MvArr.add(oilMv);
         a_MvArr.add(aMv);
         cp_MvArr.add(cpMv);
         
         
      }
      
      

      JSONObject q1_pvObj = new JSONObject();
      JSONObject q2_pvObj = new JSONObject();
      JSONObject q3_pvObj = new JSONObject();
      JSONObject q4_pvObj = new JSONObject();
      JSONObject q5_pvObj = new JSONObject();
      JSONObject t1_pvObj = new JSONObject();
      JSONObject t2_pvObj = new JSONObject();
      JSONObject t3_pvObj = new JSONObject();
      JSONObject t4_pvObj = new JSONObject();
      JSONObject oil_pvObj = new JSONObject();
      JSONObject a_pvObj = new JSONObject();
      JSONObject cp_pvObj = new JSONObject();
      
      JSONObject mDateObj = new JSONObject();
      JSONObject q1MvObj = new JSONObject();
      JSONObject q2MvObj = new JSONObject();
      JSONObject q3MvObj = new JSONObject();
      JSONObject q4MvObj = new JSONObject();
      JSONObject q5MvObj = new JSONObject();
      JSONObject t1MvObj = new JSONObject();
      JSONObject t2MvObj = new JSONObject();
      JSONObject t3MvObj = new JSONObject();
      JSONObject t4MvObj = new JSONObject();
      JSONObject oilMvObj = new JSONObject();
      JSONObject aMvObj = new JSONObject();
      JSONObject cpMvObj = new JSONObject();
      
      
      /* JSONObject tic1_pvObj = new JSONObject();
      JSONObject tic2_pvObj = new JSONObject();
      JSONObject tic3_pvObj = new JSONObject();
      JSONObject tic1_spObj = new JSONObject();
      JSONObject tic2_spObj = new JSONObject();
      JSONObject tic3_spObj = new JSONObject();
      
      JSONObject mDateObj = new JSONObject();
      JSONObject pv1MvObj = new JSONObject();
      JSONObject pv2MvObj = new JSONObject();
      JSONObject pv3MvObj = new JSONObject();
      JSONObject sp1MvObj = new JSONObject();
      JSONObject sp2MvObj = new JSONObject();
      JSONObject sp3MvObj = new JSONObject();
 */      
      JSONObject markerObj = new JSONObject();
      JSONObject symbolObj = new JSONObject();      

      
      q1_pvObj.put("name","소입1로");
      q1_pvObj.put("data",q1_pvArr);
      q1_pvObj.put("color","#0000FF");
      
      q2_pvObj.put("name","소입2로");
      q2_pvObj.put("data",q2_pvArr);
      q2_pvObj.put("color","#00FF00");
      
      q3_pvObj.put("name","소입3로");
      q3_pvObj.put("data",q3_pvArr);
      q3_pvObj.put("color","#FF0000");
      
      q4_pvObj.put("name","소입4로");
      q4_pvObj.put("data",q4_pvArr);
      q4_pvObj.put("color","#0000CC");
      
      q5_pvObj.put("name","소입5로");
      q5_pvObj.put("data",q5_pvArr);
      q5_pvObj.put("color","#00BB00");
      
      t1_pvObj.put("name","소려1로");
      t1_pvObj.put("data",t1_pvArr);
      t1_pvObj.put("color","#CC0000");
      
      t2_pvObj.put("name","소려2로");
      t2_pvObj.put("data",t2_pvArr);
      t2_pvObj.put("color","#AA0000");
      
      t3_pvObj.put("name","소려3로");
      t3_pvObj.put("data",t3_pvArr);
      t3_pvObj.put("color","#CC00AA");
      
      t4_pvObj.put("name","소려4로");
      t4_pvObj.put("data",t4_pvArr);
      t4_pvObj.put("color","#CCBBAA");

      oil_pvObj.put("name","유조");
      oil_pvObj.put("data",oil_pvArr);
      oil_pvObj.put("color","#ABCDEF");
      
      a_pvObj.put("name","세정기");
      a_pvObj.put("data",a_pvArr);
      a_pvObj.put("color","#ZXECGE");
      
      cp_pvObj.put("name","CP");
      cp_pvObj.put("data",cp_pvArr);
      cp_pvObj.put("color","#ANRWYD");
      
      q1MvObj.put("name","q1 메모");
      q1MvObj.put("data",q1_MvArr);
      q1MvObj.put("color","#0000FF");
      q1MvObj.put("type","scatter");
      q1MvObj.put("showInLegend",false);   //legend 숨기기
      
      q2MvObj.put("name","q2 메모");
      q2MvObj.put("data",q2_MvArr);
      q2MvObj.put("color","#00FF00");
      q2MvObj.put("type","scatter");
      q2MvObj.put("showInLegend",false);   //legend 숨기기
      
      q3MvObj.put("name","q3 메모");
      q3MvObj.put("data",q3_MvArr);
      q3MvObj.put("color","#FF0000");
      q3MvObj.put("type","scatter");
      q3MvObj.put("showInLegend",false);   //legend 숨기기
      
      q4MvObj.put("name","q4 메모");
      q4MvObj.put("data",q4_MvArr);
      q4MvObj.put("color","#0000CC");
      q4MvObj.put("type","scatter");
      q4MvObj.put("showInLegend",false);   //legend 숨기기
      
      q5MvObj.put("name","q5 메모");
      q5MvObj.put("data",q5_MvArr);
      q5MvObj.put("color","#00BB00");
      q5MvObj.put("type","scatter");
      q5MvObj.put("showInLegend",false);   //legend 숨기기
      
      t1MvObj.put("name","t1 메모");
      t1MvObj.put("data",t1_MvArr);
      t1MvObj.put("color","#CC0000");
      t1MvObj.put("type","scatter");
      t1MvObj.put("showInLegend",false);   //legend 숨기기
      
      t2MvObj.put("name","t2 메모");
      t2MvObj.put("data",t2_MvArr);
      t2MvObj.put("color","#AA0000");
      t2MvObj.put("type","scatter");
      t2MvObj.put("showInLegend",false);   //legend 숨기기
      
      t3MvObj.put("name","t3 메모");
      t3MvObj.put("data",t3_MvArr);
      t3MvObj.put("color","#CC00AA");
      t3MvObj.put("type","scatter");
      t3MvObj.put("showInLegend",false);   //legend 숨기기
      
      t4MvObj.put("name","t4 메모");
      t4MvObj.put("data",t4_MvArr);
      t4MvObj.put("color","#CCBBAA");
      t4MvObj.put("type","scatter");
      t4MvObj.put("showInLegend",false);   //legend 숨기기
      
      oilMvObj.put("name","oil 메모");
      oilMvObj.put("data",oil_MvArr);
      oilMvObj.put("color","#ABCDEF");
      oilMvObj.put("type","scatter");
      oilMvObj.put("showInLegend",false);   //legend 숨기기
      
      aMvObj.put("name","a 메모");
      aMvObj.put("data",a_MvArr);
      aMvObj.put("color","#ZXECGE");
      aMvObj.put("type","scatter");
      aMvObj.put("showInLegend",false);   //legend 숨기기
      
      cpMvObj.put("name","cp 메모");
      cpMvObj.put("data",cp_MvArr);
      cpMvObj.put("color","#ANRWYD");
      cpMvObj.put("type","scatter");
      cpMvObj.put("showInLegend",false);   //legend 숨기기
      
      /* tic1_pvObj.put("name","1존 PV");
      tic1_pvObj.put("data",tic1_pvArr);
      tic1_pvObj.put("color","#0000FF");
      //color
      
      tic2_pvObj.put("name","2존 PV");
      tic2_pvObj.put("data",tic2_pvArr);
      tic2_pvObj.put("color","#00FF00");
      //color
      
      
      tic3_pvObj.put("name","3존 PV");
      tic3_pvObj.put("data",tic3_pvArr);
      tic3_pvObj.put("color","#FF0000");
      //color
      
      tic1_spObj.put("name","1존 SV");
      tic1_spObj.put("data",tic1_spArr);
      tic1_spObj.put("color","#0000CC");
      //color
      
      
      tic2_spObj.put("name","2존 SV");
      tic2_spObj.put("data",tic2_spArr);
      tic2_spObj.put("color","#00BB00");
      //color
      
      tic3_spObj.put("name","3존 SV");
      tic3_spObj.put("data",tic3_spArr);
      tic3_spObj.put("color","#DC0000");
      //color */

   
   
     /*   mDateObj.put("name","pv3Memo");
      mDateObj.put("data",mDateArr);
      mDateObj.put("color","#884466"); */


      
      /* //메모컬럼      
      pv1MvObj.put("name","1존 PV 메모");
      pv1MvObj.put("data",pv1MvArr);
      pv1MvObj.put("color","#0000FF");
      pv1MvObj.put("type","scatter");
      pv1MvObj.put("showInLegend",false);   //legend 숨기기
      
      
      pv2MvObj.put("name","2존 PV 메모");
      pv2MvObj.put("data",pv2MvArr);
      pv2MvObj.put("color","#00FF00");
      pv2MvObj.put("type","scatter");
      pv2MvObj.put("showInLegend",false);   //legend 숨기기 */
      
   /*    pv3MvObj.put("name","pv3Mv");
      pv3MvObj.put("data",pv3MvArr);
      pv3MvObj.put("color","#0000FF");
      pv3MvObj.put("type","scatter");
      pv3MvObj.put("showInLegend",false); */
     
      
      //tic1sp1 ~ 3
      
      /* sp1MvObj.put("name","1존 SV 메모");
      sp1MvObj.put("data",sp1MvArr);
      sp1MvObj.put("color","#FF0000");
      sp1MvObj.put("type","scatter");
      sp1MvObj.put("showInLegend",false);   //legend 숨기기
      
      sp2MvObj.put("name","2존 SV 메모");
      sp2MvObj.put("data",sp2MvArr);
      sp2MvObj.put("color","#0000CC");
      sp2MvObj.put("type","scatter");
      sp2MvObj.put("showInLegend",false);   //legend 숨기기
      
      
      /* sp3MvObj.put("name","sp3Mv");
      sp3MvObj.put("data",sp3MvArr);
      sp3MvObj.put("color","#00BB00");
      sp3MvObj.put("type","scatter");
      sp3MvObj.put("showInLegend",false); */   //legend 숨기기
      
      //tic2sp1 ~ 3   

       
      
      
////////////////////////////////////////////////////////////////      
      
      JSONArray keysArr = new JSONArray();
      keysArr.add("x");
      keysArr.add("y");
      keysArr.add("label");
      q1MvObj.put("keys",keysArr);   
      q2MvObj.put("keys",keysArr);   
      q3MvObj.put("keys",keysArr);   
      q4MvObj.put("keys",keysArr);   
      q5MvObj.put("keys",keysArr);   
      t1MvObj.put("keys",keysArr);   
      t2MvObj.put("keys",keysArr);   
      t3MvObj.put("keys",keysArr);   
      t4MvObj.put("keys",keysArr);   
      oilMvObj.put("keys",keysArr);   
      aMvObj.put("keys",keysArr);   
      cpMvObj.put("keys",keysArr);   
      
      /* JSONArray keysArr = new JSONArray();
      keysArr.add("x");
      keysArr.add("y");
      keysArr.add("label");
      pv1MvObj.put("keys",keysArr);   
      pv2MvObj.put("keys",keysArr);   
      pv3MvObj.put("keys",keysArr);   
      sp1MvObj.put("keys",keysArr);   
      sp2MvObj.put("keys",keysArr);
      sp3MvObj.put("keys",keysArr); */
      
      
      
      JSONObject dataLabelObj = new JSONObject();
      dataLabelObj.put("enabled",true);
      dataLabelObj.put("format","{point.label}");   
      dataLabelObj.put("overflow","allow");
      dataLabelObj.put("crop",false);      
      markerObj.put("enabled",true);
      markerObj.put("radius","1");
      markerObj.put("symbol","diamond");
      
      q1MvObj.put("dataLabels",dataLabelObj);
      q1MvObj.put("marker",markerObj);
      
      q2MvObj.put("dataLabels",dataLabelObj);
      q2MvObj.put("marker",markerObj);
      
      q3MvObj.put("dataLabels",dataLabelObj);
      q3MvObj.put("marker",markerObj);
      
      q4MvObj.put("dataLabels",dataLabelObj);
      q4MvObj.put("marker",markerObj);
      
      q5MvObj.put("dataLabels",dataLabelObj);
      q5MvObj.put("marker",markerObj);
      
      t1MvObj.put("dataLabels",dataLabelObj);
      t1MvObj.put("marker",markerObj);
      
      t2MvObj.put("dataLabels",dataLabelObj);
      t2MvObj.put("marker",markerObj);
      
      t3MvObj.put("dataLabels",dataLabelObj);
      t3MvObj.put("marker",markerObj);
      
      t4MvObj.put("dataLabels",dataLabelObj);
      t4MvObj.put("marker",markerObj);
      
      oilMvObj.put("dataLabels",dataLabelObj);
      oilMvObj.put("marker",markerObj);
      
      aMvObj.put("dataLabels",dataLabelObj);
      aMvObj.put("marker",markerObj);
      
      cpMvObj.put("dataLabels",dataLabelObj);
      cpMvObj.put("marker",markerObj);
      
      /* JSONObject dataLabelObj = new JSONObject();
      dataLabelObj.put("enabled",true);
      dataLabelObj.put("format","{point.label}");   
      dataLabelObj.put("overflow","allow");
       dataLabelObj.put("crop",false);      
      markerObj.put("enabled",true);
      markerObj.put("radius","1");
      markerObj.put("symbol","diamond");
      
      
      pv1MvObj.put("dataLabels",dataLabelObj);
      pv1MvObj.put("marker",markerObj);
      
      pv2MvObj.put("dataLabels",dataLabelObj);
      pv2MvObj.put("marker",markerObj); */
      
     /*  pv3MvObj.put("dataLabels",dataLabelObj);
      pv3MvObj.put("marker",markerObj); */
      
      /* sp1MvObj.put("dataLabels",dataLabelObj);
      sp1MvObj.put("marker",markerObj);
      
      sp2MvObj.put("dataLabels",dataLabelObj);
      sp2MvObj.put("marker",markerObj); */
      
     /*  sp3MvObj.put("dataLabels",dataLabelObj);
      sp3MvObj.put("marker",markerObj); */
    //----------------------------------

      rs = stmt.executeQuery(sql2.toString());
      
      JSONArray lot = new JSONArray();
      while(rs.next()){
    	   JSONArray lotPoint = new JSONArray();
    	   lotPoint.add(rs.getInt("UNIX_TIMESTAMP"));
    	   lotPoint.add(200);
    	   
    	   String label = rs.getString("lot");
    	   lotPoint.add(label);
    	   
    	   lot.add(lotPoint);
    	  
      }
      JSONObject lotObj = new JSONObject(); // 새로운 시리즈 객체
      lotObj.put("name", "LOT"); // 시리즈 이름 설정
      lotObj.put("data", lot); // 시리즈 데이터 추가
      lotObj.put("color", "#22d10f"); // 시리즈 색상 설정
      lotObj.put("showInLegend",false);
      lotObj.put("lineWidth","0");
      
//      JSONArray keysArr = new JSONArray(); // 데이터 포인트의 구성 요소를 지정할 배열
//      keysArr.add("x");
//      keysArr.add("y");
//      keysArr.add("label");
      lotObj.put("keys", keysArr); // 구성 요소 지정

      // 데이터 레이블과 마커 설정 (선택적)
//      JSONObject dataLabelObj = new JSONObject();
//      dataLabelObj.put("enabled", true);
//      dataLabelObj.put("format", "{point.label}"); // 라벨 포맷 지정
      lotObj.put("dataLabels", dataLabelObj);

      JSONObject lotMarkerObj = new JSONObject();
      lotMarkerObj.put("enabled", false);
      lotObj.put("marker", lotMarkerObj);
      
//--------------------------------------------
      


      JSONObject labelObj = new JSONObject();
      
      mainObj.put("datetime",datetime);
      mainObj.put("q1_pv",q1_pvObj);
      mainObj.put("q2_pv",q2_pvObj);
      mainObj.put("q3_pv",q3_pvObj);
      mainObj.put("q4_pv",q4_pvObj);
      mainObj.put("q5_pv",q5_pvObj);
      mainObj.put("t1_pv",t1_pvObj);
      mainObj.put("t2_pv",t2_pvObj);
      mainObj.put("t3_pv",t3_pvObj);
      mainObj.put("t4_pv",t4_pvObj);
      mainObj.put("oil_pv",oil_pvObj);
      mainObj.put("a_pv",a_pvObj);
      mainObj.put("cp_pv",cp_pvObj);
      
      mainObj.put("q1_Mv",q1MvObj);
      mainObj.put("q2_Mv",q2MvObj);
      mainObj.put("q3_Mv",q3MvObj);
      mainObj.put("q4_Mv",q4MvObj);
      mainObj.put("q5_Mv",q5MvObj);
      mainObj.put("t1_Mv",t1MvObj);
      mainObj.put("t2_Mv",t2MvObj);
      mainObj.put("t3_Mv",t3MvObj);
      mainObj.put("t4_Mv",t4MvObj);
      mainObj.put("oil_Mv",oilMvObj);
      mainObj.put("a_Mv",aMvObj);
      mainObj.put("cp_Mv",cpMvObj);
      mainObj.put("lot", lotObj); // 새로운 시리즈 추가
      
/*       mainObj.put("tic1_pv",tic1_pvObj);
      mainObj.put("tic2_pv",tic2_pvObj);
      mainObj.put("tic3_pv",tic3_pvObj);
      mainObj.put("tic1_sp",tic1_spObj);
      mainObj.put("tic2_sp",tic2_spObj);
      mainObj.put("tic3_sp",tic3_spObj);
      mainObj.put("tic1_pvMv",pv1MvObj);
      mainObj.put("tic2_pvMv",pv2MvObj);
      mainObj.put("tic3_pvMv",pv3MvObj);
      mainObj.put("tic1_spMv",sp1MvObj);
      mainObj.put("tic2_spMv",sp2MvObj);
      mainObj.put("tic3_spMv",sp3MvObj); */

      
   /*    System.out.println(labelObj); */
      outObj.put("data", mainObj);
      outObj.put("label", labelObj);
      
      result = outObj.toJSONString();  
   }   
   catch(Exception e){
      e.printStackTrace();
   }finally{
      out.print(outObj);
      //out.print(hogi);
      //out.print(sql.toString());
      out.flush();
      if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
      if(conn != null) try {conn.close();}catch(SQLException sqle){}
   }
      
%>