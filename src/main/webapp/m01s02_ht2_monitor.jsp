<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합 등대사업</title>
<link rel="shortcut icon" href="resources/images/jinhap4.gif" type="image/x-icon" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/style2.css"/>
<script src="assets/js/jquery-2.1.4.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-latest.js"></script>

<!-- 추가한 부분 start-->

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script> 
<script type="text/javascript" src="resources/js/jquery.color-2.1.2.min.js"></script>
<script type="text/javascript" src="resources/js/menu_min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/menu-css.css" />
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />

<!-- 데이트피커 사용 -->
<script src="resources/js/moment.min.js"></script> 
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/menu.js"></script>
<script src="resources/js/jquery-ui.js" /></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/jquery-ui.theme.css" />


<!-- 폰트 css -->
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">


<link rel="stylesheet" href="resources/css/table_font_size.css"/>

<!-- 풀캘린더 사용 -->
<link rel="stylesheet" type="text/css" href="resources/css/fullcalendar.css"/>

<!-- Load D3 -->
<script src="resources/js/d3.min.js"></script>
 
 
<!-- Load billboard.js with base style -->
<link rel="stylesheet" href="resources/css/billboard3.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard3.js"></script>


<!-- datepicker에 있는 timepicker 추가기능 -->
<link rel="stylesheet" href="resources/css/jquery-ui-timepicker-addon.css">
<script src="resources/js/jquery-ui-timepicker-addon.js"></script>


<!-- 컬러셀렉터 -->
<script type="text/javascript" src="resources/js/bootstrap-colorselector.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-colorselector.min.css"> 


<!-- 추가한 부분 end-->

<style>
	table tr:nth-child(-n+12) th {
		text-align : center;
		background-color: #122d64;
    	color:#FFFFFF;
    	border-color: #FFFFFF !important;
	}
	th{
	text-align : center;
	}
	.total{
		color:black !important;
	}
	td{
		text-align : right;
		font-weight:700;
		
	}
	h2{
	color:red;
}
</style>

</head>

<body data-offset="60" data-target=".navbar" style="background:white;">
	<div id="collapse4" class="body" style="height: 910px;">
            <div class="row">
            	<h1 class="text-center control-label" id="now_datetime" 
            		style="font-weight:bold; font-size:30pt;"></h1>
            		<h2>* 현재 보이는 실적과 효율등은 생산 로트투입완료 시점을 기준으로 보여지고 있습니다. (실시간 투입되는 수치와는 차이가 있습니다.) 
            		</h2>
            </div>		
			<div class="row">
              <table id="temp"
               class="table table-bordered table-hover table-responsive scrolltbody"
               style= "font-size: 25px; width: 1400px; margin: auto; height: 750px;">
					
						<tr>
							<th rowspan = "2" style="background-color: white; width:450px; color:black">2호기(시간당 500kg)<br/> 설비효율</th>
							<th style="width:350px">전 LOT품명</th>
							<td colspan = "2" id="v_1" style="width:600px"></td>
						</tr>
						<tr>
							<th>현 LOT품명</th>
							<td colspan = "2" id="v_2"></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2" id="day">주간<br>08:00 ~ 20:00</th>
							<th>목표 생산량</th>
							<td>6,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td id="v_3"></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td id="v_4"></td>
							<th>진도율 (%)</th>
							<td id="v_5"></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td id="v_6"></td>
							<th>로트수</th>
							<td id="v_7"></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td id="v_8"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2" id="night">야간<br>20:00 ~ 08:00</th>
							<th>목표 생산량</th>
							<td>6,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td id="v_9"></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td id="v_10"></td>
							<th>진도율 (%)</th>
							<td id="v_11"></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td id="v_12"></td>
							<th>로트수</th>
							<td id="v_13"></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td id="v_14"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th colspan = "2" style="background-color:lavender;">합계</th>
							<th style="background-color:lavender;">현 생산량</th>
							<td id="v_15"></td>

						</tr>
						<tr>
							<th style="background-color:lavender;">시간당 생산량</th>
							<td id="v_16"></td>
							<th style="background-color:lavender;">진도율 (%)</th>
							<td id="v_17"></td>
						</tr>
						<tr>
							<th style="background-color:lavender;">비가동 시간(로트간격제외)</th>
							<td id="v_18"></td>
							<th style="background-color:lavender;">로트 수</th>
							<td id="v_19"></td>
						</tr>
						<tr>
							<th style="background-color:lavender;">capa 장입량 준수율 (%)</th>
							<td id="v_20"></td>
							<td></td>
							<td></td>						
						</tr>
				</table>
			</div>
		</div>
		
	<script>

	/*페이지 로드*/

	$(function(){
		$("#loading").show();
		
		now_search();
		
		dateInterval = setInterval('now_search()',10000);
		
		
		
	});
	var sdate;
	var edate;
	var n_sdate;
	var n_edate;
	var yChk;
	function now_search(){
		$.ajax({
			type : "POST",
			url : "util/lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					
					$("#now_datetime").text(
							"집계시간기준 : "+ 
							rsAr[0].n_date.substring(0,4)+"년"
							+
							rsAr[0].n_date.substring(5,7)+"월"
							+
							rsAr[0].n_date.substring(8,10)+"일"
							+
							" "
							+
							"08시"
							+
							"00분"
							+
							" ~ "
							+
							rsAr[0].n_time.substring(0,2)+"시"
							+
							rsAr[0].n_time.substring(3,5)+"분"
							);
					var hour = parseInt(rsAr[0].n_time.substring(0,2));
					
					if( hour >=0  && hour < 8){
						sdate = rsAr[0].y_date;
						edate = rsAr[0].n_date;
					} else{
						sdate = rsAr[0].n_date;
						edate = rsAr[0].t_date;
					}
					
					if( hour >= 8 && hour < 20){

						n_sdate = rsAr[0].y_date;
						n_edate = rsAr[0].n_date;
						yChk = true;
					} else{
						n_sdate = rsAr[0].n_date;
						n_edate = rsAr[0].t_date;
						yChk = false;
					}
					getDayData();
					getNightData();
					getTotalData();
					getPnameData();

				} else if (rsJson && rsJson.status == "fail") {
					alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				} else {
					alert("에러발생!");
				}
				
//				timer = setTimeout(function(){ o.run(); }, o.pollInterval);
				
			},	// success 끝
			error: function(req, status) {
				if (req.status == 0 || status == "timeout") {
					alert("네트워크 연결 확인 후 다시 시도해주세요.");
				} else {
					alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
				}
			},
			
		});
	}
	
	function getDayData(){
		$.ajax({
			url:"m01/s02/select_m01s02_ht2_monitor_day.jsp",
			type:"post",
			dataType:"json",
			data:{
				"sdate" : sdate
			},
			success:function(result){
				var data = result.rows;
				var delay = result.delay;
				var totalFCR = 0;
				var totalHP = 0;
				
				for(var i=0; i<data.length; i++){
					
					var sdateStr = data[i].sdate.replace(".0", "");
    				var edateStr = data[i].edate.replace(".0", "");
    				var sdate2 = new Date(sdateStr);
    			    var edate2 = new Date(edateStr);
    			    var tttt = edate2 - sdate2;
    			    var hoursDifference = tttt / (1000 * 60 * 60);
    			    	hoursDifference = hoursDifference.toFixed(2);
					var hourlyProduction;
					if (hoursDifference == 0) {
					    hourlyProduction = 0;
					} else {
					    hourlyProduction = (data[i].v1 / hoursDifference).toFixed(2);
					}
					var hogi = data[i].hogi;
					
					var fillingComplianceRate;
					var progressRate;
					console.log(data[i].sdate)
					if(hogi == 2 || hogi == 3){
						fillingComplianceRate = (hourlyProduction / 500);
						progressRate = (parseInt(data[i].v1) / 6000 * 100).toFixed(0);
					} else{
						fillingComplianceRate = (hourlyProduction / 1000);
						progressRate = (parseInt(data[i].v1) / 12000 * 100).toFixed(0);
					}
					if(fillingComplianceRate > 1){
						fillingComplianceRate = 1;
					}
					$("#v_3").text(parseInt(data[i].v1).toLocaleString()+" Kg");
					$("#v_5").text(progressRate.toLocaleString()+" %");
					$("#v_8").text((fillingComplianceRate * 100).toFixed(2)+" %");
					$("#v_4").text(parseInt(hourlyProduction).toLocaleString() + " Kg");
					$("#v_6").text(delay[i].delay + " 시간");
					$("#v_7").text(data[i].v6+" LOT");
					$("#day").html("주간<br>"+data[i].sdate.substring(11,16)+" ~ "+data[i].edate.substring(11,16));
				}	
			}
		});
	}
	
	function getNightData(){
		$.ajax({
			url:"m01/s02/select_m01s02_ht2_monitor_night.jsp",
			type:"post",
			dataType:"json",
			data:{
				"sdate" : n_sdate,
				"edate" : n_edate
			},
			success:function(result){
				var data = result.rows;
				var delay = result.delay;
				var totalFCR = 0;
				var totalHP = 0;
				
				for(var i=0; i<data.length; i++){
					
					var sdateStr = data[i].sdate.replace(".0", "");
    				var edateStr = data[i].edate.replace(".0", "");
    				var sdate2 = new Date(sdateStr);
    			    var edate2 = new Date(edateStr);
    			    var tttt = edate2 - sdate2;
    			    var hoursDifference = tttt / (1000 * 60 * 60);
    			    	hoursDifference = hoursDifference.toFixed(2);
					var hourlyProduction;
					if (hoursDifference == 0) {
					    hourlyProduction = 0;
					} else {
					    hourlyProduction = (data[i].v1 / hoursDifference).toFixed(2);
					}
					var hogi = data[i].hogi;
					
					var fillingComplianceRate;
					var progressRate;
					console.log(data[i].sdate)
					if(hogi == 2 || hogi == 3){
						fillingComplianceRate = (hourlyProduction / 500);
						progressRate = (parseInt(data[i].v1) / 6000 * 100).toFixed(0);
					} else{
						fillingComplianceRate = (hourlyProduction / 1000);
						progressRate = (parseInt(data[i].v1) / 12000 * 100).toFixed(0);
					}
					if(fillingComplianceRate > 1){
						fillingComplianceRate = 1;
					}
					$("#v_9").text(parseInt(data[i].v1).toLocaleString()+" Kg");
					$("#v_11").text(progressRate.toLocaleString()+" %");
					$("#v_14").text((fillingComplianceRate * 100).toFixed(2)+" %");
					$("#v_10").text(parseInt(hourlyProduction).toLocaleString() + " Kg");
					$("#v_12").text(delay[i].delay + " 시간");
					$("#v_13").text(data[i].v6+" LOT");
					if(yChk){
						$("#night").html("전일 야간<br>"+data[i].sdate.substring(11,16)+" ~ "+data[i].edate.substring(11,16));
					} else{
						$("#night").html("야간<br>"+data[i].sdate.substring(11,16)+" ~ "+data[i].edate.substring(11,16));
					}
				}	
			}
		});
	}
	
	function getTotalData(){
		$.ajax({
			url:"m01/s02/select_m01s02_ht2_monitor_total.jsp",
			type:"post",
			dataType:"json",
			data:{
				"sdate" : sdate,
				"edate" : edate
			},
			success:function(result){
				var data = result.rows;
				var delay = result.delay;
				var totalFCR = 0;
				var totalHP = 0;
				
				for(var i=0; i<data.length; i++){
					
					var sdateStr = data[i].sdate.replace(".0", "");
    				var edateStr = data[i].edate.replace(".0", "");
    				var sdate2 = new Date(sdateStr);
    			    var edate2 = new Date(edateStr);
    			    var tttt = edate2 - sdate2;
    			    var hoursDifference = tttt / (1000 * 60 * 60);
    			    	hoursDifference = hoursDifference.toFixed(2);
					var hourlyProduction;
					if (hoursDifference == 0) {
					    hourlyProduction = 0;
					} else {
					    hourlyProduction = (data[i].v1 / hoursDifference).toFixed(2);
					}
					var hogi = data[i].hogi;
					
					var fillingComplianceRate;
					var progressRate;
					console.log(data[i].sdate)
					if(hogi == 2 || hogi == 3){
						fillingComplianceRate = (hourlyProduction / 500);
						progressRate = (parseInt(data[i].v1) / 12000 * 100).toFixed(0);
					} else{
						fillingComplianceRate = (hourlyProduction / 1000);
						progressRate = (parseInt(data[i].v1) / 24000 * 100).toFixed(0);
					}
					if(fillingComplianceRate > 1){
						fillingComplianceRate = 1;
					}
					$("#v_15").text(parseInt(data[i].v1).toLocaleString()+" Kg");
					$("#v_17").text(progressRate.toLocaleString()+" %");
					$("#v_20").text((fillingComplianceRate * 100).toFixed(2)+" %");
					$("#v_16").text(parseInt(hourlyProduction).toLocaleString() + " Kg");
					$("#v_18").text(delay[i].delay + " 시간");
					$("#v_19").text(data[i].v6+" LOT");
				}	
			}
		});
	}
	
	function getPnameData(){
		$.ajax({
			url:"m01/s02/select_m01s02_ht2_monitor_lot.jsp",
			type:"post",
			dataType:"json",
			data:{},
			success:function(result){
				var data = result.rows;
				$("#v_1").text(data[0].pname);
				$("#v_2").text(data[1].pname);
			}			
		});
	}
	
	</script>

</body>
</html>