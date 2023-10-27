<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	/*
		- 효율현황(비가동)
		1. 설비명
		2. 구분 - 주, 야, 합계
		3. 생산실적 - 주, 야, 합계
		4. 불량실적 - 주, 야, 합계
		5. C/T - capacity
		6. 부하시간 - 주, 야, 합계
		7. 시간가동율 - round( (  d_buha   -  d_ntsum  )  /   ( d_buha  -   d_of   )  * 100,2)
		 -> ROUND( ( 부하시간 - 비가동합계 ) / ( 부하시간 - 관리책임 ) * 100, 2 )
		8. 성능가동율 - round( d_pdqty / ( ( d_buha  -   d_ntsum  )  *  capacity )  * 100,2)
		 -> ROUND( ( 생산실적 / ( 부하시간 - 비가동합계 ) * capacity ) * 100, 2 )
		9. 양품율 - round(( d_pdqty - d_faqty ) /  d_pdqty *100,2)
		 -> ROUND( ( 생산실적 - 불량실적 ) / 생산실적 * 100, 2 )
		10. 종합효율 - round(d_rate1 * d_rate2 * d_rate3 / 10000,2)
		 -> ROUND( 시간가동율 * 성능가동율 * 양품율 / 10000, 2 )
		11. 가동시간 - d_buha - d_ntsum
		 -> 부하시간 - 비가동합계
		12. MTBF(평균 고장 시간 간격) - if ( repair_cnt = 0, 0, Round(t_gadong / repair_cnt, 2))
		 -> ROUND( 총가동시간 / 고장횟수 , 2 )
		13. 비가동합계
		14. 현장책임
		15. 관리책임	
	*/
	
	public class Capa_calc{
			 
		//시간가동율
		//round( (  d_buha   -  d_ntsum  )  /   ( d_buha  -   d_of   )  * 100,2)
		//ROUND( ( 부하시간 - 비가동합계 ) / ( 부하시간 - 관리책임 ) * 100, 2 )
		
		public double getTime_rate(double buha, int ntsum, int of){
			double result =  

			Math.round(((buha - ntsum) / (buha - of))*10000)/100.0;
//			System.out.println(Math.round((buha - ntsum) / (buha - of)*100)/100.0);
			return result;
			
		}
		
		//성능가동율
		//round( d_pdqty / ( ( d_buha  -   d_ntsum  )  *  capacity )  * 100,2)
		//ROUND( ( 생산실적 / ( 부하시간 - 비가동합계 ) * capacity ) * 100, 2 )
		
		public double getPerform_rate(int pdqty, int buha, int ntsum, double capacity){
			double result = 
			
			Math.round( ( (pdqty / ( (buha - ntsum ) * capacity ) ) )*10000)/100.0;
//			Math.round( ( (pdqty / ( (buha - ntsum ) * capacity ) ) ));
//			System.out.println(Math.round( ( (pdqty / ( (buha - ntsum ) * capacity ) ) )*1000000));
			
			
			return result;
		}	
		
		//양품율
		//round(( d_pdqty - d_faqty ) /  d_pdqty *100,2)
		//ROUND( ( 생산실적 - 불량실적 ) / 생산실적 * 100, 2 )
		
		public double getYangpum_rate(int pdqty, double faqty){
			double result = 
			
				Math.round(((pdqty - faqty) / pdqty)*10000)/100.0;
						
			return result;
		}
		
		
		//종합효율
		//round(d_rate1 * d_rate2 * d_rate3 / 10000,2)
		//ROUND( 시간가동율 * 성능가동율 * 양품율 / 10000, 2 )
		
		public String getAll_rate(double t_rate, double p_rate, double y_rate){
//			System.out.println("t_rate : "+t_rate+", p_rate : "+p_rate+", y_rate : "+y_rate+", avg : "+String.format("%.2f",(Math.round(((t_rate * p_rate * y_rate)/100)))/100.0));
			String result = "";
			if(t_rate == 0 || p_rate == 0 || y_rate == 0){
				result = "";
			}else{
				result = String.format("%.2f",(Math.round(((t_rate * p_rate * y_rate)/100)))/100.0);
			}
			 
					
					
			
			return result;
		}
		
		//MTBF
		//MTBF(평균 고장 시간 간격) - if ( repair_cnt = 0, 0, Round(t_gadong / repair_cnt, 2))
		//ROUND( 총가동시간 / 고장횟수 , 2 )
		public String getMTBF(double ytsum, int repair_cnt){
			String result = "";
			
			if(repair_cnt == 0){
				result = "";
			}else{
				result = String.format("%.0f",Math.round((ytsum / repair_cnt)*100)/100.0);
			}
			
			return result;
		}
		
		public String calc_string(int a, int b){
			String result = "";
					
			if(a == 0 && b == 0){
				result = "";
			}else{
				String.format("%d",(a+b));
			}
			
			return result;
		}

		public String calc_string(int a){
			String result = "";
			
			if(a == 0){
				result = "";
			}else{
				result = String.format("%d",a);				
			}
			
			return result;
		}		
		
		public String calc_string(double a){
			String result = "";
			
			if(a == 0){
				result = "";
			}else{
				result = String.format("%.2f",a);				
			}
			
			return result;
		}			
		
	}

%>