<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합 등대사업</title>
<link rel="shortcut icon" href="resources/images/jinhap4.gif"
	type="image/x-icon" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/style2.css" />
<script src="assets/js/jquery-2.1.4.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-latest.js"></script>

<!-- 추가한 부분 start-->

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.color-2.1.2.min.js"></script>
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


<link rel="stylesheet" href="resources/css/table_font_size.css" />

<!-- 풀캘린더 사용 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/fullcalendar.css" />

<!-- Load D3 -->
<script src="resources/js/d3.min.js"></script>

<!-- Load billboard.js with base style -->
<link rel="stylesheet" href="resources/css/billboard3.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard3.js"></script>


<!-- datepicker에 있는 timepicker 추가기능 -->
<link rel="stylesheet"
	href="resources/css/jquery-ui-timepicker-addon.css">
<script src="resources/js/jquery-ui-timepicker-addon.js"></script>


<!-- 컬러셀렉터 -->
<script type="text/javascript"
	src="resources/js/bootstrap-colorselector.min.js"></script>
<link rel="stylesheet"
	href="resources/css/bootstrap-colorselector.min.css">


<!-- 추가한 부분 end-->

<style>
.tableHeader {
	    background-color: #122d64;
	    color:#FFFFFF;
	    border-color: #FFFFFF !important;
	}

</style>


<script>
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // add zero in front of numbers < 10 
		return i;
	}

	function checkDate(i) {
		i = i + 1; // to adjust real month
		return i;
	}

	// 실시간 날짜 end

	function writeCheck() {
		var form = document.writeform;

		form.submit();
	}

	var fn_logout = function() {

		if (!confirm("로그아웃 하시겠습니까?")) {
			return;
		}

		$.ajax({
			method : "POST",
			url : "logout_ok.jsp",
			contentType : "application/json; charset=utf-8",
			data : {
				'time' : new Date().getTime()
			},
			success : function(data) {
				var rsJson = JSON.parse(data);
				var rsBoolean = rsJson.isSuccess;

				if (rsBoolean) {

					alert("로그아웃 되었습니다.");
					location.href = "index.jsp";

				} else {

					alert("로그아웃 처리중 예외가 발생하였습니다.\n다시 시도하여 주시기바랍니다.");

				}

			}
		});
	}
</script>


</head>

<body>


	<div id="wrap">

		<div id="header">
			<jsp:include page="/header-menu.jsp" />
		</div>


		<div id="body2">
			<div id="floater2" style="margin-top: 30px;">

				<jsp:include page="/body-menu.jsp" />
			</div>
			<div id="contents">

				<div class="content" style="height: 810px;">


					<div style="position: relative; left: -275px; top: -185px;">


						<div id="room1"
							style="width: 100%; height: 20px; position: absolute; left: 272px; top: 185px; font-size: 16px; font-weight: 600; color: black;">


							<!--Begin Datatables-->
							<div class="row">
								<!-- 월간 -->
								<div style="width: 100%;" class="col-lg-12">
									<div class="box">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-list-alt"></i>
											</div>
											<h5 style="font-family: headline; font-size: 14pt;">생산관리
												- 설비별 생산실적(일자별)</h5>
										</header>
										<header style="background:white; height:43px;">
							                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt; font-family:headline; 
														color:#8C8C8C; width: 90px; text-align: right;">일자 : </label>
													</div>
													
													<div class="form-group">
														<input type="text" class="form-control input-sm datepicker" id="s_sdate" name="s_sdate" 
														style="margin-top:5px; height: 30px; width: 140px; 
														font-size: 14pt; font-family:headline;"  
														placeholder="예)2020-01-01"
														onkeyup="auto_date_format(event, this);"/>
													</div>
													
													<div class="form-group">
														&nbsp;&nbsp;
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm" type="button" 
															style="margin-top:6px; height: 31px; width: 120px; 
															font-size:14pt; font-family:headline; font-weight:700;
															padding-top:1px; padding-bottom:1px;" 
															id="searchBtn">
															<i class="fa fa-search"></i> 검 색</button>
														</div>
													</div>
											</form>
							            </header>
										<div id="collapse4" class="body" >
											<div class="row" >
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
									</div>
								</div>

								<!-- 연간 -->


								<!--END TEXT INPUT FIELD-->
							</div>
						</div>
					</div>
					<!-- content description -->
				</div>

			</div>
		</div>
		<!-- 로그인 끝 -->
		<div id="footer">

			<img src="resources/images/jinhap4.gif" style="height: 30px;" />&nbsp;(주)진합&nbsp;&nbsp;
			<!-- 써니 로고 -->
			Copyright 2023. All Rights Reserved.

		</div>
	</div>

	<script>
	
	$(function(){
		date_search();
		
	})
	
	
	function date_search(){
		
		$.ajax({
			type : "POST",
			url : "util/lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					$("#s_sdate").val(rsAr[0].y_date);
					getMonitoringData();
				} else if (rsJson && rsJson.status == "fail") {
					alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				} else {
					alert("에러발생!");
				}
					
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
	//datepicker 초기화
	$.datepicker.formatDate("yy-mm-dd");
	$(".datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	});
	
    function auto_date_format( e, oThis ){
        
        var num_arr = [ 
            97, 98, 99, 100, 101, 102, 103, 104, 105, 96,
            48, 49, 50, 51, 52, 53, 54, 55, 56, 57
        ]
        
        var key_code = ( e.which ) ? e.which : e.keyCode;
        if( num_arr.indexOf( Number( key_code ) ) != -1 ){
        
            var len = oThis.value.length;
            if( len == 4 ) oThis.value += "-";
            if( len == 7 ) oThis.value += "-";
        
        }
    }
    function getMonitoringData(){
    	var i_date = $("#s_sdate").val();
    	var date = new Date(i_date);

		date.setDate(date.getDate() + 1);

		var nextDay = date.toISOString().slice(0, 10);
		
		
		$.ajax({
			url:"m01/s08/select_m01s08.jsp",
			type:"post",
			dataType:"json",
			data:{
				"date":i_date,
				"edate":nextDay
			},
			success:function(result){
				
				var data = result.rows;
				var delay = result.delay;
				//var timeDifference = calculateTimeDifference();
				var totalFCR = 0;
				var totalHP = 0;
				
				for(var i=0; i<data.length; i++){
					
					var hourlyProduction = (data[i].lot_weight / (24-delay[i].delay)).toFixed(2);
					var fillingComplianceRate;
					var progressRate;
					
					if(i == 1 || i == 2){
						fillingComplianceRate = (hourlyProduction / 500);
						progressRate = (parseInt(data[i].lot_weight) / 12000 * 100).toFixed(0);
					} else{
						fillingComplianceRate = (hourlyProduction / 1000);
						progressRate = (parseInt(data[i].lot_weight) / 24000 * 100).toFixed(0);
					}
					if(fillingComplianceRate > 1){
						fillingComplianceRate = 1;
					}
					//console.log("v1 : "+progressRate);
					//$("#ht"+(i+1)+"_v1").text(parseInt(data[i].v1).toLocaleString()+" Kg");
					$("#ht"+(i+1)+"_v4").text(progressRate.toLocaleString()+" %");
					$("#ht"+(i+1)+"_v1").text(data[i].lot_weight.toLocaleString()+" Kg");
					$("#ht"+(i+1)+"_v6").text(data[i].lot_count);
					$("#ht"+(i+1)+"_v7").text(delay[i].delay);
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
					$/* ("#ht"+(i+1)+"_v7").text(data[i].v7+" 시간");
					$("#ht"+(i+1)+"_v6").text(data[i].v6+" LOT"); */
					
					
				}
				/* for(var i=0; i<delay.length; i++){
					if(delay[i].proc_gb != 0 && delay[i].proc_cnt == 0){
						$("#hogi"+(i+1)).css({
							"background-color" : "red",
							"color" : "white"
						})
					}
				} */
			}
		});
	}
	
    $("#searchBtn").on("click", function(){
    	getMonitoringData();
    })
	</script>

</body>
</html>