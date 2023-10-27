<%@page import="org.apache.poi.ss.formula.Formula"%>
<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="net.sf.jasperreports.functions.standard.MathFunctions"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ include file="ppk_calc.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public class Ppk_Graph{
	
		Ppk_Calc calc = new Ppk_Calc();
	
		//IF(Q10="A",(I10+ M10)/2,E161)
		//Q10 : tolType
		//I10 : 규격상한
		//M10 : 규격하한
		//E161: 평균
		public String graph_dif(JSONArray valueArray, String uppTol, String lowTol){
			
			String avg = calc.ppk_average(valueArray, uppTol, lowTol);
			String tolType = calc.tolType(uppTol, lowTol);
			
			String result = "";
						
			double left = (Double.parseDouble(uppTol) + Double.parseDouble(lowTol))/2;
			
			if("A".equals(tolType)){
				result = String.format("%.1f",left);
			}else{
				result = avg;
			}
			
			return result;
		}
		
		//G297 : IF(Q10="C",(E161-M10)/50,(I10-M10)/100)
		public String graph_dif2(JSONArray valueArray, String uppTol, String lowTol){
			
			String avg = calc.ppk_average(valueArray, uppTol, lowTol);
			String tolType = calc.tolType(uppTol, lowTol);

			String result = "";

			if("C".equals(tolType)){
				result = String.format("%.2f",(Double.parseDouble(avg) - Double.parseDouble(lowTol))/50);
			}else{
				result = String.format("%.2f",(Double.parseDouble(uppTol) - Double.parseDouble(lowTol))/100 );
			}
			
			
			return result;
		}
	
		public int graph_hMax(int[] hArray){
			
			int r_max = 0;
			
			
			
			for(int i=0; i<hArray.length; i++){
				if(r_max < hArray[i]){
					r_max = hArray[i];
				}
				
			}
			
			return r_max;
		}
		

			
			
		public String n(JSONArray valueArray, String uppTol, String lowTol, double g_val){
			String result = "";
			double low = 0.0;
			if("".equals(lowTol) || "∞".equals(lowTol)){
				low = 0.0;
			}else{
				low = Double.parseDouble(lowTol);				
			}
			
			//J24
			String average = calc.ppk_average(valueArray, uppTol, lowTol);
			double m = 0.0;
			if(!"".equals(average)){
				m = Double.parseDouble(average);
			}
			//M24
			String dev = calc.ppk_dev(valueArray, uppTol, lowTol);
			double d = 0.0;
			if(!"".equals(dev)){
				d = Double.parseDouble(dev);
			}
			
//			System.out.println(low+", "+m+", "+d);
			
//			result = (1/Math.sqrt(2*Math.PI*d*d)*Math.exp(-((low-m)*(low-m))/2*d*d))*1000000+"";
//			result = ((1/Math.sqrt(2*Math.PI)*Math.exp(-(low*low)/2))*1000000)+"";
			result = (Math.round(( (1/(d*Math.sqrt(2*Math.PI))) * Math.exp((-Math.pow(g_val-m,2)) /(2*Math.pow(d,2))) ))) +"";
			
			return result;
		}		
			
		public double graph_nSum(double[] nArray){
			double result = 0;
			
			for(int i=0; i<nArray.length; i++){
				result += nArray[i];
			}
			
			return result;
		}
		
		public double graph_jRound(double[] jArray){
			double result = 0;
			
			for(int i=0; i<jArray.length; i++){
				if(result < jArray[i]){
					result = jArray[i];
				}
				
			}
			
			return result;
		}
		
		//IF(OR(H297=0,J297=0),0,IF(H297>J297,ROUND(H297*1.4,0),ROUND(J297*1.4,0)))
		//H297 : H의 최댓값
		//J297 : J의 최댓값
		public double graph_iValue(int h297, double j297){
			double result = 0;
			
			
			if(h297 == 0 || j297 == 0){
				result = 0;
			}else{
				if(h297 > j297){
					result = Math.round(h297*1.4);
				}else{
					result = Math.round(j297*1.4);
				}
			}
			
			return result;
		}
		
	}
%>