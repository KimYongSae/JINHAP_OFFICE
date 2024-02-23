<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../../db/DBConnector.jsp" %>
<%@ include file="ppk_graph.jsp" %>
<%@ page import="java.util.*"%> 

<%
	request.setCharacterEncoding("UTF-8");

	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	Ppk_Graph g = new Ppk_Graph();
	
	StringBuffer s_sql = new StringBuffer();
	JSONObject mainObj = new JSONObject();
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{	
		s_sql.append("SELECT upp, low ");
		for(int i=0; i<100; i++){
			s_sql.append(",val"+(i+1)+" ");	
		}
		s_sql.append("FROM tb_ppk ");
		s_sql.append("WHERE cnt = "+cnt+" ");

		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(s_sql.toString());
		int rowCount = rs.last() ? rs.getRow() : 0;  
		rs.beforeFirst();  		
		JSONArray mainArray = new JSONArray();
		JSONArray mainArray2 = new JSONArray();
		
		JSONArray valArray = new JSONArray();

		double g_valArray[] = new double[241];
		int frequency[] = new int[241];
		int kArray[] = new int[241];
		int lArray[] = new int[241];
		int hArray[] = new int[241];
		double nArray[] = new double[241];
		double jArray[] = new double[241];
		double iArray[] = new double[241];
		
		while(rs.next()){
			
			for(int i=1; i<=100; i++){
				valArray.add(rs.getString("val"+i));
			}
//			System.out.println(g.graph_dif(valArray, rs.getString("upp"), rs.getString("low")));
//			System.out.println(g.graph_dif2(valArray, rs.getString("upp"), rs.getString("low")));
			
			for(int j=1; j<=100; j++){
				JSONObject rowObj = new JSONObject();
				rowObj.put("xval",j);
				if(!"".equals(rs.getString("val"+j))){
					rowObj.put("val",rs.getString("val"+j));
				}else{
					rowObj.put("val",null);
				}
				rowObj.put("upp",rs.getString("upp"));
				rowObj.put("low",rs.getString("low"));
				rowObj.put("dif",g.graph_dif(valArray, rs.getString("upp"), rs.getString("low")));
				
				mainArray.add(rowObj);
			}
			
			String g297 = g.graph_dif2(valArray, rs.getString("upp"), rs.getString("low"));
			
			g_valArray[60] = rs.getDouble("low");
			
			for(int a=59; a>=0; a--){
				g_valArray[a] = g_valArray[a+1] - Double.parseDouble(g297);
			}				
			
			for(int b=61; b<241; b++){
				g_valArray[b] = g_valArray[b-1] + Double.parseDouble(g297);
			}
			int blankCount = 0;
			
			for(int b=0; b<valArray.size(); b++){
				if(!"".equals(valArray.get(b))){
					blankCount++;	
				}
			}
			
			for(int x=0; x<241; x++){
				int count = 0;
				for(int y=0; y<valArray.size(); y++){
//					System.out.println("["+y+"]"+valArray.get(y));
					if(!"".equals(valArray.get(y))){
						if(x == 0){
							if(Double.parseDouble(valArray.get(y).toString()) < g_valArray[x] ){
								count++;
							}						
						}else{
							if((Double.parseDouble(valArray.get(y).toString()) < g_valArray[x])
									&& Double.parseDouble(valArray.get(y).toString()) > g_valArray[x-1]){
								count++;
							}
						}						
					}

				}
				frequency[x] = count;
//				System.out.println("frequency : ["+x+"]"+frequency[x]);
			}
			int[] f_sum = new int[24];
			int f_count = 0;
			for(int i=1; i<=241; i++){
				
				f_count += frequency [i-1];
//				System.out.println("f_count : [i_"+i+"] - "+f_count);
				
				if(i == 10){
					f_sum[0] = f_count;
					f_count = 0;
				}else if(i == 20){
					f_sum[1] = f_count;
					f_count = 0;
				}else if(i == 30){
					f_sum[2] = f_count;
					f_count = 0;
				}else if(i == 40){
					f_sum[3] = f_count;
					f_count = 0;
				}else if(i == 50){
					f_sum[4] = f_count;
					f_count = 0;
				}else if(i == 60){
					f_sum[5] = f_count;
					f_count = 0;
				}else if(i == 70){
					f_sum[6] = f_count;
					f_count = 0;
				}else if(i == 80){
					f_sum[7] = f_count;
					f_count = 0;
				}else if(i == 90){
					f_sum[8] = f_count;
					f_count = 0;
				}else if(i == 100){
					f_sum[9] = f_count;
					f_count = 0;					
				}else if(i == 110){
					f_sum[10] = f_count;
					f_count = 0;					
				}else if(i == 120){
					f_sum[11] = f_count;
					f_count = 0;					
				}else if(i == 130){
					f_sum[12] = f_count;
					f_count = 0;					
				}else if(i == 140){
					f_sum[13] = f_count;
					f_count = 0;					
				}else if(i == 150){
					f_sum[14] = f_count;
					f_count = 0;					
				}else if(i == 160){
					f_sum[15] = f_count;
					f_count = 0;
				}else if(i == 170){
					f_sum[16] = f_count;
					f_count = 0;
				}else if(i == 180){
					f_sum[17] = f_count;
					f_count = 0;					
				}else if(i == 190){
					f_sum[18] = f_count;
					f_count = 0;
				}else if(i == 200){
					f_sum[19] = f_count;
					f_count = 0;
				}else if(i == 210){
					f_sum[20] = f_count;
					f_count = 0;
				}else if(i == 220){
					f_sum[21] = f_count;
					f_count = 0;
				}else if(i == 230){
					f_sum[22] = f_count;
					f_count = 0;
				}else if(i == 240){
					f_sum[23] = f_count;
					f_count = 0;
				}
			}
			
			for(int k=0; k<241; k++){
								
				if(k <= 10){
					kArray[k] = f_sum[0];
				}else if(k <= 19){
					kArray[k] = 0;
				}else if(k <= 30){
					kArray[k] = f_sum[2];
				}else if(k <= 39){
					kArray[k] = 0;
				}else if(k <= 50){
					kArray[k] = f_sum[4];
				}else if(k <= 59){
					kArray[k] = 0;
				}else if(k <= 70){
					kArray[k] = f_sum[6];
				}else if(k <= 79){
					kArray[k] = 0;
				}else if(k <= 90){
					kArray[k] = f_sum[8];
				}else if(k <= 99){
					kArray[k] = 0;
				}else if(k <= 110){
					kArray[k] = f_sum[10];
				}else if(k <= 119){
					kArray[k] = 0;
				}else if(k <= 130){
					kArray[k] = f_sum[12];
				}else if(k <= 139){
					kArray[k] = 0;
				}else if(k <= 150){
					kArray[k] = f_sum[14];
				}else if(k <= 159){
					kArray[k] = 0;
				}else if(k <= 170){
					kArray[k] = f_sum[16];
				}else if(k <= 179){
					kArray[k] = 0;
				}else if(k <= 190){
					kArray[k] = f_sum[18];
				}else if(k <= 199){
					kArray[k] = 0;
				}else if(k <= 210){
					kArray[k] = f_sum[20];
				}else if(k <= 219){
					kArray[k] = 0;
				}else if(k <= 230){
					kArray[k] = f_sum[22];
				}else if(k <= 239){
					kArray[k] = 0;
				}
				
			}
//			System.out.println("kArray[k] : [k_"+k+"] - "+f_sum[0]);		
//			System.out.println("===========================================");
//			System.out.println("lArray[l] : [l_"+l+"] - "+f_sum[1]);
			for(int l=0; l<241; l++){
				if(l <= 9){
					lArray[l] = 0;
				}else if(l <= 20){
					lArray[l] = f_sum[1];
					
				}else if(l <= 29){
					lArray[l] = 0;
				}else if(l <= 40){
					lArray[l] = f_sum[3];
				}else if(l <= 49){
					lArray[l] = 0;
				}else if(l <= 60){
					lArray[l] = f_sum[5];
				}else if(l <= 69){
					lArray[l] = 0;
				}else if(l <= 80){
					lArray[l] = f_sum[7];
				}else if(l <= 89){
					lArray[l] = 0;
				}else if(l <= 100){
					lArray[l] = f_sum[9];
				}else if(l <= 109){
					lArray[l] = 0;
				}else if(l <= 120){
					lArray[l] = f_sum[11];
				}else if(l <= 129){
					lArray[l] = 0;
				}else if(l <= 140){
					lArray[l] = f_sum[13];
				}else if(l <= 149){
					lArray[l] = 0;
				}else if(l <= 160){
					lArray[l] = f_sum[15];
				}else if(l <= 169){
					lArray[l] = 0;
				}else if(l <= 180){
					lArray[l] = f_sum[17];
				}else if(l <= 189){
					lArray[l] = 0;
				}else if(l <= 200){
					lArray[l] = f_sum[19];
				}else if(l <= 209){
					lArray[l] = 0;
				}else if(l <= 220){
					lArray[l] = f_sum[21];
				}else if(l <= 229){
					lArray[l] = 0;
				}else if(l <= 240){
					lArray[l] = f_sum[23];
				}
			}
			
			for(int i=0; i<240; i++){
				if(i == 0){
					int temp = 0;
					for(int t=0; t<10; t++){
						 temp+= frequency[t];
					}
					hArray[i] = temp;
				}else{
					if(i%10 == 0){
						if(kArray[i] > lArray[i] ){
							hArray[i] = kArray[i];
						}else{
							hArray[i] = lArray[i];
						}						
					}else{
						hArray[i] = 0;
					}
				}
			}
			
			//g298 : blankCount
			
			hArray[240] = lArray[240];
			
			int h297 = g.graph_hMax(hArray);
			
			
			for(int n=0; n<241; n++){
				nArray[n] = Double.parseDouble(g.n(valArray, rs.getString("upp"), rs.getString("low"), g_valArray[n]));
//				System.out.println("n : ["+n+"] "+g.n(valArray, rs.getString("upp"), rs.getString("low"), g_valArray[n]));
			}
			
//			System.out.println("==============================");


			double n297 = g.graph_nSum(nArray);
//			System.out.println("n297 : "+n297);

//			System.out.println("==============================");

			for(int j=0; j<241; j++){
				jArray[j] = (Double.parseDouble(g.n(valArray, rs.getString("upp"), rs.getString("low"), g_valArray[j])) * (blankCount * 10 / n297) );
//				System.out.println("j : ["+j+"] "+
//					(Integer.parseInt(g.n(valArray, rs.getString("upp"), rs.getString("low"), g_valArray[j])))
//				);
				
//				System.out.println("j2 : ["+j+"] "+(blankCount * 10 / n297) );
//				System.out.println("blankCount : ["+blankCount+"], n297 : ["+n297+"]");
			}

			
			
			double j297 = g.graph_jRound(jArray);
			
			
			
			double iVal = g.graph_iValue(h297, j297);
			
			//Integer.parseInt((iVal+"").substring(0,(iVal+"").indexOf(".")));
			
			for(int i=0; i<241; i++){
				if(i <= 60){
					iArray[i] = 0;
				}else if(i == 61){
					iArray[i] = iVal;
				}else if(i <= 110){
					iArray[i] = 0;
				}else if(i == 111){
					iArray[i] = iVal;
				}else if(i <= 160){
					iArray[i] = 0;
				}else if(i == 161){
					iArray[i] = iVal;
				}else{
					iArray[i] = 0;
				}
			}
			
			
//			g.graph_k(frequency);
			
//			System.out.println("==============================");
			for(int k=0; k<241; k++){
				JSONObject rowObj2 = new JSONObject();
//				System.out.println("g_valArray : ["+k+"]"+g_valArray[k]);
				rowObj2.put("xval",(String.format("%.1f",g_valArray[k])));
				rowObj2.put("k",kArray[k]);
				rowObj2.put("l",lArray[k]);
//				rowObj2.put("n",nArray[k]);
				rowObj2.put("j",(String.format("%.1f",jArray[k])));
				rowObj2.put("i",iArray[k]);
				rowObj2.put("h",hArray[k]);
				
				mainArray2.add(rowObj2);
			}
		}

		
		
		
		mainObj.put("total", String.valueOf(rowCount));
		mainObj.put("status", String.valueOf("ok"));
		mainObj.put("rows",mainArray);
		mainObj.put("rows2",mainArray2);
		
		
		conn.commit();	
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		out.print(mainObj);
		out.flush();		
		if(stmt != null) try {stmt.close();}catch(SQLException sqle){}
		if(rs != null) try {rs.close();}catch(SQLException sqle){}
		if(conn != null) try {conn.close();}catch(SQLException sqle){}
	}
	
%>