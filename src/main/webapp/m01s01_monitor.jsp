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
#capc_tbody  td{
	font-weight:700;
}
.tableHeader {
	    background-color: #122d64;
	    color:#FFFFFF;
	    border-color: #FFFFFF !important;
	}

</style>

</head>

<body data-offset="60" data-target=".navbar" style="background:white;">
	<div id="collapse4" class="body" style="height: 600px;">
            <div class="row">
            	<h1 class="text-center control-label" id="now_datetime" 
            		style="font-weight:bold; font-size:20pt;"></h1>
            </div>
			<div class="row" style="padding-top:30px">
              <table id="temp"
               class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
					
						<tr>
							<th class="text-center cell tableHeader" 
							style="width: 120px; height: 30px; 
								font-size: 18pt; font-family:headline;font-weight:700;">
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 120px; height: 30px; 
								font-size: 18pt; font-family:headline;font-weight:700;">
								일 목표<br>생산량
							</th>
							<th class="text-center cell tableHeader"  
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								현 생산량(Kg)
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								시간당<br>생산량(Kg)
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								누적 진도율(%)
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								장입량 준수율(%)
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								로트수
							</th>
							<th class="text-center cell tableHeader" 
							style="width: 420px; height: 30px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								비가동<br>현황(시간)
							</th>
						</tr>
					</thead>

					<tbody>
						<tr id="hogi1">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:25pt; font-family:headline; font-weight:700;">1호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">24,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht1_v7"></td>
						</tr>
						<tr id="hogi2">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;">2호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">12,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht2_v7"></td>
						</tr>
						<tr id="hogi3">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;">3호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">12,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht3_v7"></td>
						</tr>
						<tr id="hogi4">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;">4호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">24,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht4_v7"></td>
						</tr>
						<tr id="hogi5">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;">5호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">24,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht5_v7"></td>
						</tr>
						<tr id="hogi6">
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;">6호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 200px; 
							 font-size:20pt; font-family:headline; font-weight:700;">24,000 Kg</td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;"
							 id="ht6_v7"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:25pt; font-family:headline; font-weight:700;
							 background-color:lavender;">합계</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 75px; width: 150px; 
							 font-size:20pt; font-family:headline; font-weight:700;
							 background-color:lavender;"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v1"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v2"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v4"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v5"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px;
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v6"></td>
							<td style="text-align: right; vertical-align: middle;
							 padding: 1px; height: 75px; width: 420px; 
							 font-size:30pt; font-family:headline; font-weight:700;
							 background-color:lavender;"
							 id="ht7_v7"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
	<script>

	/*전역변수*/
	var dateInterval;
	var machineInterval;

	/*페이지 로드*/

	$(function(){
		$("#loading").show();
		
		now_search();
		
		dateInterval = setInterval('now_search()',1000);
		setInterval('getMonitoringData()',10000);
		
	});
	
	/*함수*/
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
					sdate = rsAr[0].n_date;
					etime = rsAr[0].n_time;
					getMonitoringData();

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

	function calculateTimeDifference() {
	    const now = new Date();
	    let eightAm;

	    if (now.getHours() >= 8) {
	        // 오늘 8시
	        eightAm = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 8, 0, 0);
	    } else {
	        // 어제 8시
	        eightAm = new Date(now.getFullYear(), now.getMonth(), now.getDate() - 1, 8, 0, 0);
	    }

	    const difference = now - eightAm;
	    return difference / 3600000;
	}
	
	function getMonitoringData(){
		$.ajax({
			url:"m01/s01/select_m01s01_monitor_1.jsp",
			type:"post",
			dataType:"json",
			data:{
				"sdate" : sdate,
				"etime" : etime
			},
			success:function(result){
				//console.log(result);
				
				var data = result.rows;
				var delay = result.delay;
				var timeDifference = calculateTimeDifference();
				var totalFCR = 0;
				var totalHP = 0;
				//console.log(timeDifference);
				
				for(var i=0; i<data.length; i++){
					
					//var hourlyProduction = (data[i].v1 / timeDifference).toFixed(2);
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
					
					
					var fillingComplianceRate;
					var progressRate;
					console.log(data[i].sdate)
					if(i == 1 || i == 2){
						fillingComplianceRate = (hourlyProduction / 500);
						progressRate = (parseInt(data[i].v1) / 12000 * 100).toFixed(0);
					} else{
						fillingComplianceRate = (hourlyProduction / 1000);
						progressRate = (parseInt(data[i].v1) / 24000 * 100).toFixed(0);
					}
					if(fillingComplianceRate > 1){
						fillingComplianceRate = 1;
					}
					$("#ht"+(i+1)+"_v1").text(parseInt(data[i].v1).toLocaleString()+" Kg");
					$("#ht"+(i+1)+"_v4").text(progressRate.toLocaleString()+" %");
					//$("#ht"+(i+1)+"_v4").text(parseInt(data[i].v4).toLocaleString()+" %");
/* 					$("#ht"+(i+1)+"_v1").text(data[i].v1+" Kg");
					//$("#ht"+(i+1)+"_v2").text(data[i].v2+" Kg");
					$("#ht"+(i+1)+"_v2").text(hourlyProduction + " Kg");
					//$("#ht"+(i+1)+"_v3").text(data[i].v3+" %");
					$("#ht"+(i+1)+"_v4").text(data[i].v4+" %");
					//$("#ht"+(i+1)+"_v5").text(data[i].v5+" %"); */
					if(i == 6){
						$("#ht"+(i+1)+"_v5").text((totalFCR.toFixed(2)/6).toFixed(2) + " %");
						$("#ht"+(i+1)+"_v2").text(totalHP.toLocaleString() + " Kg");
					} else{
					$("#ht"+(i+1)+"_v5").text((fillingComplianceRate * 100).toFixed(2)+" %");
						totalFCR += parseFloat((fillingComplianceRate * 100).toFixed(2));
					$("#ht"+(i+1)+"_v2").text(parseInt(hourlyProduction).toLocaleString() + " Kg");
						totalHP += parseInt(hourlyProduction);
					}
					/* $("#ht"+(i+1)+"_v7").text(data[i].v7+" 시간"); */
					$("#ht"+(i+1)+"_v7").text(delay[i].delay + " 시간");
					$("#ht"+(i+1)+"_v6").text(data[i].v6+" LOT");
					
					
				}
				for(var i=0; i<delay.length; i++){
					if(delay[i].proc_gb != 0 && delay[i].proc_cnt == 0){
						$("#hogi"+(i+1)).css({
							"background-color" : "red",
							"color" : "white"
						})
					}
				}
			}
		});
	}

	</script>

</body>
</html>