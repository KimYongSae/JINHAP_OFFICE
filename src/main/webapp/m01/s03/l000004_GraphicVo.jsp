<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%!
	 public class GraphicVo{
		private String tdatetime;
		private double q1;
		private double q2;
		private double q3;
		private double q4;
		private double q5;
		private double t1;
		private double t2;
		private double t3;
		private double t4;
		private double fw;
		private double mw;
		private double oil;
		private double cp;
		
		private double qun;
		private double tem;
		private double sign;
		
		private int chartIdx;
		
		public void setTdatetime(String tdatetime){
			this.tdatetime = tdatetime;
		}
		
		public String getTdatetime(){
			return tdatetime;
		}
		
		public void setQ1(double q1){
			this.q1 = q1;
		}
		
		public Double getQ1(){
			return q1;
		}
		
		public void setQ2(double q2){
			this.q2 = q2;
		}
		
		public Double getQ2(){
			return q2;
		}
		
		public void setQ3(double q3){
			this.q3 = q3;
		}
		
		public Double getQ3(){
			return q3;
		}
		
		public void setQ4(double q4){
			this.q4 = q4;
		}
		
		public Double getQ4(){
			return q4;
		}
		
		public void setQ5(double q5){
			this.q5 = q5;
		}
		
		public Double getQ5(){
			return q5;
		}	
		
		public void setT1(double t1){
			this.t1 = t1;
		}
		
		public Double getT1(){
			return t1;
		}

		public void setT2(double t2){
			this.t2 = t2;
		}
		
		public Double getT2(){
			return t2;
		}		

		public void setT3(double t3){
			this.t3 = t3;
		}
		
		public Double getT3(){
			return t3;
		}		

		public void setT4(double t4){
			this.t4 = t4;
		}
		
		public Double getT4(){
			return t4;
		}		
		
		public void setFw(double fw){
			this.fw = fw;
		}
		
		public Double getFw(){
			return fw;
		}		
		
		public void setMw(double mw){
			this.mw = mw;
		}
		
		public Double getMw(){
			return mw;
		}
		
		public void setOil(double oil){
			this.oil = oil;
		}
		
		public Double getOil(){
			return oil;
		}
		
		public void setCp(double cp){
			this.cp = cp;
		}
		
		public Double getCp(){
			return cp;
		}
		
		
		public void setQun(double qun){
			this.qun = qun;
		}
		
		public double getQun(){
			return qun;
		}
		
		public void setTem(double tem){
			this.tem = tem;
		}
		
		public double getTem(){
			return tem;
		}
		
		public void setSign(double sign){
			this.sign = sign;
		}
		
		public double getSign(){
			return sign;
		}
		
		public void setChartIdx(int chartIdx){
			this.chartIdx = chartIdx;
		}
		
		public int getChartIdx(){
			return chartIdx;
		}
}

%>