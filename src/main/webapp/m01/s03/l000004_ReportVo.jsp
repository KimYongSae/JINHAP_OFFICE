<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file="l000004_GraphicVo.jsp" %>


<%!
	 public class ReportVo{
		private String alarm_tf;
		private String alarm_qf;
		private String alarm_other;
		
		public void setAlarm_tf(String alarm_tf){
			this.alarm_tf = alarm_tf;
		}
		
		public String getAlarm_tf(){
			return alarm_tf;
		}
		
		public void setAlarm_qf(String alarm_qf){
			this.alarm_qf = alarm_qf;
		}
		
		public String getAlarm_qf(){
			return alarm_qf;
		}
		
		public void setAlarm_other(String alarm_other){
			this.alarm_other = alarm_other;
		}
		
		public String getAlarm_other(){
			return alarm_other;
		}	
	}
%>