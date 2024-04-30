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

#loading-image {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}

@font-face {
	font-family: "headline";
	src: url("fonts/headline.TTF") format("ttf");
	font-style: normal;
	font-weight: normal;
}

	.tmp {
		overflow: auto;
		height: 670px;
	}

	.table {
		display: block; /* 테이블을 블록 레벨 요소로 변경 */
		width: 100%; /* 테이블 너비 */
	  	table-layout: fixed; /* 열 너비 고정 */
	 	border-collapse: collapse;
		
	}
	thead {
	  display: block; /* 헤더를 블록 요소로 변경 */
	}
	tbody {
	  display: block;
	  height: 600px;
	  overflow: auto;
	}
	th, td {
	  padding: 5px;
	  text-align: center;
	}
	
	.col1{width:70px}		
	.col2{width:150px}		
	.col3{width:100px}		
	.col_day{width:46px}
			
	.col2-1{width:50px}		
	.col2-2{width:70px}		
	.col2-3{width:80px}
	.col2-4{width:80px}
	.col2-5{width:50px}
	
	table thead th {
		background-color: #122d64 !important;
		color:#FFFFFF;
		border-color: #FFFFFF !important;
	}
	
	@media print{
		html {
			height: auto;
		}
		body * {
        	visibility: hidden;
	    }
	    #printArea, #printArea * {
	        visibility: visible;
	    }
	    #printArea {
	        position: absolute;
	        left: 0;
	    /*     top: -100px; */
	        /* width: 100%; */
	    }
	    tbody{
	    	height: auto;
	    	
	    }
		.tmp {
			height: auto;
		}
		#floater2{
			margin-top: 0 !important;
		}
		.col_day{width:42px}
		#whyRelative{
			top:0px !important;
		}
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


					<div style="position: relative; left: -275px; top: -185px;" id="whyRelative">


						<div id="room1"
							style="width: 100%; height: 20px; position: absolute; left: 272px; top: 185px; font-size: 16px; font-weight: 600; color: black;">


							<!--Begin Datatables-->
							<div class="row">
								<!-- <hr class="bread_under"> -->
								<!-- 월간 -->
								<div style="width: 100%;" class="col-lg-12">
									<div class="box" id="printArea">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-list-alt"></i>
											</div>
											<h5 style="font-family: headline; font-size: 14pt;">품질관리
												- E/PROOF, 열전대 비교검증, CP, CO2 점검 일지</h5>
										</header>
										<header style="background:white; height:43px;">
							                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt;  font-family:headline;font-weight:700; 
															color:#8C8C8C; width: 70px; text-align: right;">
														연도 : </label>
													</div>
													
													<div class="form-group">
														<select class="form-control input-sm" 
														id="s_year" name="s_year"
														style="margin-top:5px; height: 30px; width: 160px; 
															font-size: 14pt; font-family:headline;font-weight:700;
															padding-top:1px; padding-bottom:1px;">
														</select>
													</div>						
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt;  font-family:headline;font-weight:700; 
															color:#8C8C8C; width: 50px; text-align: right;">
														월 : </label>
													</div>
													
													<div class="form-group">
														<select class="form-control input-sm" 
														id="s_month" name="s_month"
														style="margin-top:5px; height: 30px; width: 100px;  
															font-size: 14pt; font-family:headline;font-weight:700;
															padding-top:1px; padding-bottom:1px;">
															<option value="1">1월</option>
															<option value="2">2월</option>
															<option value="3">3월</option>
															<option value="4">4월</option>
															<option value="5">5월</option>
															<option value="6">6월</option>
															<option value="7">7월</option>
															<option value="8">8월</option>
															<option value="9">9월</option>
															<option value="10">10월</option>
															<option value="11">11월</option>
															<option value="12">12월</option>
														</select>
													</div>						
							
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt;  font-family:headline;font-weight:700; 
															color:#8C8C8C; width: 50px; text-align: right;">
														구분 : </label>
													</div>
													
													
													<div class="form-group">
														<select class="form-control input-sm" 
														id="s_gubun" name="s_gubun"
														style="margin-top:5px; height: 30px; width: 160px; 
															font-size: 14pt; font-family:headline;font-weight:700;
															padding-top:1px; padding-bottom:1px;" disabled="disabled">
															<option value="1">F/PROOF</option>
														</select>
														
													</div>
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt;  font-family:headline;font-weight:700; 
															color:#8C8C8C; width: 50px; text-align: right;">
														설비 : </label>
													</div>
													
													
													<div class="form-group">
														<select class="form-control input-sm" 
														id="s_hogi" name="s_hogi"
														style="margin-top:5px; height: 30px; width: 160px; 
															font-size: 14pt; font-family:headline;font-weight:700;
															padding-top:1px; padding-bottom:1px;">
															<option value="1">Q01-HN01</option>
															<option value="2">Q01-HN02</option>
															<option value="3">Q01-HN03</option>
															<option value="4">Q01-HN04</option>
															<option value="5">Q01-HN05</option>
															<option value="6">Q01-HN06</option>
														</select>
														
													</div>
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="printBtn">
															<i class="fa fa-print"></i> 인쇄
														</button>
													</div>
													
											</form>
							            </header>

										<div id="collapse4" class="body">
											
											<div id="table1" class="tmp">
												<table class="table table-bordered table-hover">
													<thead>
													<tr>
														<th class="col1"></th>
														<th class="col2">규격<br>(설정값)</th>
														<th class="col3">점검<br>항목</th>
														<th class="col_day">1</th>
														<th class="col_day">2</th>
														<th class="col_day">3</th>
														<th class="col_day">4</th>
														<th class="col_day">5</th>
														<th class="col_day">6</th>
														<th class="col_day">7</th>
														<th class="col_day">8</th>
														<th class="col_day">9</th>
														<th class="col_day">10</th>
														<th class="col_day">11</th>
														<th class="col_day">12</th>
														<th class="col_day">13</th>
														<th class="col_day">14</th>
														<th class="col_day">15</th>
														<th class="col_day">16</th>
														<th class="col_day">17</th>
														<th class="col_day">18</th>
														<th class="col_day">19</th>
														<th class="col_day">20</th>
														<th class="col_day">21</th>
														<th class="col_day">22</th>
														<th class="col_day">23</th>
														<th class="col_day">24</th>
														<th class="col_day">25</th>
														<th class="col_day">26</th>
														<th class="col_day">27</th>
														<th class="col_day">28</th>
														<th class="col_day">29</th>
														<th class="col_day">30</th>
														<th class="col_day">31</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														<th class="col1" rowspan="2">소입<br>1존</th>
														<th class="col2" rowspan="2">+50 ~ -150℃</th>
														<th class="col3" >과승</th>
														<td class="col_day" id="q1_sh1"></td>
														<td class="col_day" id="q1_sh2"></td>
														<td class="col_day" id="q1_sh3"></td>
														<td class="col_day" id="q1_sh4"></td>
														<td class="col_day" id="q1_sh5"></td>
														<td class="col_day" id="q1_sh6"></td>
														<td class="col_day" id="q1_sh7"></td>
														<td class="col_day" id="q1_sh8"></td>
														<td class="col_day" id="q1_sh9"></td>
														<td class="col_day" id="q1_sh10"></td>
														<td class="col_day" id="q1_sh11"></td>
														<td class="col_day" id="q1_sh12"></td>
														<td class="col_day" id="q1_sh13"></td>
														<td class="col_day" id="q1_sh14"></td>
														<td class="col_day" id="q1_sh15"></td>
														<td class="col_day" id="q1_sh16"></td>
														<td class="col_day" id="q1_sh17"></td>
														<td class="col_day" id="q1_sh18"></td>
														<td class="col_day" id="q1_sh19"></td>
														<td class="col_day" id="q1_sh20"></td>
														<td class="col_day" id="q1_sh21"></td>
														<td class="col_day" id="q1_sh22"></td>
														<td class="col_day" id="q1_sh23"></td>
														<td class="col_day" id="q1_sh24"></td>
														<td class="col_day" id="q1_sh25"></td>
														<td class="col_day" id="q1_sh26"></td>
														<td class="col_day" id="q1_sh27"></td>
														<td class="col_day" id="q1_sh28"></td>
														<td class="col_day" id="q1_sh29"></td>
														<td class="col_day" id="q1_sh30"></td>
														<td class="col_day" id="q1_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="q1_sc1"></td>
														<td class="col_day" id="q1_sc2"></td>
														<td class="col_day" id="q1_sc3"></td>
														<td class="col_day" id="q1_sc4"></td>
														<td class="col_day" id="q1_sc5"></td>
														<td class="col_day" id="q1_sc6"></td>
														<td class="col_day" id="q1_sc7"></td>
														<td class="col_day" id="q1_sc8"></td>
														<td class="col_day" id="q1_sc9"></td>
														<td class="col_day" id="q1_sc10"></td>
														<td class="col_day" id="q1_sc11"></td>
														<td class="col_day" id="q1_sc12"></td>
														<td class="col_day" id="q1_sc13"></td>
														<td class="col_day" id="q1_sc14"></td>
														<td class="col_day" id="q1_sc15"></td>
														<td class="col_day" id="q1_sc16"></td>
														<td class="col_day" id="q1_sc17"></td>
														<td class="col_day" id="q1_sc18"></td>
														<td class="col_day" id="q1_sc19"></td>
														<td class="col_day" id="q1_sc20"></td>
														<td class="col_day" id="q1_sc21"></td>
														<td class="col_day" id="q1_sc22"></td>
														<td class="col_day" id="q1_sc23"></td>
														<td class="col_day" id="q1_sc24"></td>
														<td class="col_day" id="q1_sc25"></td>
														<td class="col_day" id="q1_sc26"></td>
														<td class="col_day" id="q1_sc27"></td>
														<td class="col_day" id="q1_sc28"></td>
														<td class="col_day" id="q1_sc29"></td>
														<td class="col_day" id="q1_sc30"></td>
														<td class="col_day" id="q1_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소입<br>2존</th>
														<th rowspan="2">+30 ~ -100℃</th>
														<th>과승</th>
														<td class="col_day" id="q2_sh1"></td>
														<td class="col_day" id="q2_sh2"></td>
														<td class="col_day" id="q2_sh3"></td>
														<td class="col_day" id="q2_sh4"></td>
														<td class="col_day" id="q2_sh5"></td>
														<td class="col_day" id="q2_sh6"></td>
														<td class="col_day" id="q2_sh7"></td>
														<td class="col_day" id="q2_sh8"></td>
														<td class="col_day" id="q2_sh9"></td>
														<td class="col_day" id="q2_sh10"></td>
														<td class="col_day" id="q2_sh11"></td>
														<td class="col_day" id="q2_sh12"></td>
														<td class="col_day" id="q2_sh13"></td>
														<td class="col_day" id="q2_sh14"></td>
														<td class="col_day" id="q2_sh15"></td>
														<td class="col_day" id="q2_sh16"></td>
														<td class="col_day" id="q2_sh17"></td>
														<td class="col_day" id="q2_sh18"></td>
														<td class="col_day" id="q2_sh19"></td>
														<td class="col_day" id="q2_sh20"></td>
														<td class="col_day" id="q2_sh21"></td>
														<td class="col_day" id="q2_sh22"></td>
														<td class="col_day" id="q2_sh23"></td>
														<td class="col_day" id="q2_sh24"></td>
														<td class="col_day" id="q2_sh25"></td>
														<td class="col_day" id="q2_sh26"></td>
														<td class="col_day" id="q2_sh27"></td>
														<td class="col_day" id="q2_sh28"></td>
														<td class="col_day" id="q2_sh29"></td>
														<td class="col_day" id="q2_sh30"></td>
														<td class="col_day" id="q2_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="q2_sc1"></td>
														<td class="col_day" id="q2_sc2"></td>
														<td class="col_day" id="q2_sc3"></td>
														<td class="col_day" id="q2_sc4"></td>
														<td class="col_day" id="q2_sc5"></td>
														<td class="col_day" id="q2_sc6"></td>
														<td class="col_day" id="q2_sc7"></td>
														<td class="col_day" id="q2_sc8"></td>
														<td class="col_day" id="q2_sc9"></td>
														<td class="col_day" id="q2_sc10"></td>
														<td class="col_day" id="q2_sc11"></td>
														<td class="col_day" id="q2_sc12"></td>
														<td class="col_day" id="q2_sc13"></td>
														<td class="col_day" id="q2_sc14"></td>
														<td class="col_day" id="q2_sc15"></td>
														<td class="col_day" id="q2_sc16"></td>
														<td class="col_day" id="q2_sc17"></td>
														<td class="col_day" id="q2_sc18"></td>
														<td class="col_day" id="q2_sc19"></td>
														<td class="col_day" id="q2_sc20"></td>
														<td class="col_day" id="q2_sc21"></td>
														<td class="col_day" id="q2_sc22"></td>
														<td class="col_day" id="q2_sc23"></td>
														<td class="col_day" id="q2_sc24"></td>
														<td class="col_day" id="q2_sc25"></td>
														<td class="col_day" id="q2_sc26"></td>
														<td class="col_day" id="q2_sc27"></td>
														<td class="col_day" id="q2_sc28"></td>
														<td class="col_day" id="q2_sc29"></td>
														<td class="col_day" id="q2_sc30"></td>
														<td class="col_day" id="q2_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소입<br>3존</th>
														<th rowspan="2">+-10℃</th>
														<th>과승</th>
														<td class="col_day" id="q3_sh1"></td>
														<td class="col_day" id="q3_sh2"></td>
														<td class="col_day" id="q3_sh3"></td>
														<td class="col_day" id="q3_sh4"></td>
														<td class="col_day" id="q3_sh5"></td>
														<td class="col_day" id="q3_sh6"></td>
														<td class="col_day" id="q3_sh7"></td>
														<td class="col_day" id="q3_sh8"></td>
														<td class="col_day" id="q3_sh9"></td>
														<td class="col_day" id="q3_sh10"></td>
														<td class="col_day" id="q3_sh11"></td>
														<td class="col_day" id="q3_sh12"></td>
														<td class="col_day" id="q3_sh13"></td>
														<td class="col_day" id="q3_sh14"></td>
														<td class="col_day" id="q3_sh15"></td>
														<td class="col_day" id="q3_sh16"></td>
														<td class="col_day" id="q3_sh17"></td>
														<td class="col_day" id="q3_sh18"></td>
														<td class="col_day" id="q3_sh19"></td>
														<td class="col_day" id="q3_sh20"></td>
														<td class="col_day" id="q3_sh21"></td>
														<td class="col_day" id="q3_sh22"></td>
														<td class="col_day" id="q3_sh23"></td>
														<td class="col_day" id="q3_sh24"></td>
														<td class="col_day" id="q3_sh25"></td>
														<td class="col_day" id="q3_sh26"></td>
														<td class="col_day" id="q3_sh27"></td>
														<td class="col_day" id="q3_sh28"></td>
														<td class="col_day" id="q3_sh29"></td>
														<td class="col_day" id="q3_sh30"></td>
														<td class="col_day" id="q3_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="q3_sc1"></td>
														<td class="col_day" id="q3_sc2"></td>
														<td class="col_day" id="q3_sc3"></td>
														<td class="col_day" id="q3_sc4"></td>
														<td class="col_day" id="q3_sc5"></td>
														<td class="col_day" id="q3_sc6"></td>
														<td class="col_day" id="q3_sc7"></td>
														<td class="col_day" id="q3_sc8"></td>
														<td class="col_day" id="q3_sc9"></td>
														<td class="col_day" id="q3_sc10"></td>
														<td class="col_day" id="q3_sc11"></td>
														<td class="col_day" id="q3_sc12"></td>
														<td class="col_day" id="q3_sc13"></td>
														<td class="col_day" id="q3_sc14"></td>
														<td class="col_day" id="q3_sc15"></td>
														<td class="col_day" id="q3_sc16"></td>
														<td class="col_day" id="q3_sc17"></td>
														<td class="col_day" id="q3_sc18"></td>
														<td class="col_day" id="q3_sc19"></td>
														<td class="col_day" id="q3_sc20"></td>
														<td class="col_day" id="q3_sc21"></td>
														<td class="col_day" id="q3_sc22"></td>
														<td class="col_day" id="q3_sc23"></td>
														<td class="col_day" id="q3_sc24"></td>
														<td class="col_day" id="q3_sc25"></td>
														<td class="col_day" id="q3_sc26"></td>
														<td class="col_day" id="q3_sc27"></td>
														<td class="col_day" id="q3_sc28"></td>
														<td class="col_day" id="q3_sc29"></td>
														<td class="col_day" id="q3_sc30"></td>
														<td class="col_day" id="q3_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소입<br>4존</th>
														<th rowspan="2">+-10℃</th>
														<th>과승</th>
														<td class="col_day" id="q4_sh1"></td>
														<td class="col_day" id="q4_sh2"></td>
														<td class="col_day" id="q4_sh3"></td>
														<td class="col_day" id="q4_sh4"></td>
														<td class="col_day" id="q4_sh5"></td>
														<td class="col_day" id="q4_sh6"></td>
														<td class="col_day" id="q4_sh7"></td>
														<td class="col_day" id="q4_sh8"></td>
														<td class="col_day" id="q4_sh9"></td>
														<td class="col_day" id="q4_sh10"></td>
														<td class="col_day" id="q4_sh11"></td>
														<td class="col_day" id="q4_sh12"></td>
														<td class="col_day" id="q4_sh13"></td>
														<td class="col_day" id="q4_sh14"></td>
														<td class="col_day" id="q4_sh15"></td>
														<td class="col_day" id="q4_sh16"></td>
														<td class="col_day" id="q4_sh17"></td>
														<td class="col_day" id="q4_sh18"></td>
														<td class="col_day" id="q4_sh19"></td>
														<td class="col_day" id="q4_sh20"></td>
														<td class="col_day" id="q4_sh21"></td>
														<td class="col_day" id="q4_sh22"></td>
														<td class="col_day" id="q4_sh23"></td>
														<td class="col_day" id="q4_sh24"></td>
														<td class="col_day" id="q4_sh25"></td>
														<td class="col_day" id="q4_sh26"></td>
														<td class="col_day" id="q4_sh27"></td>
														<td class="col_day" id="q4_sh28"></td>
														<td class="col_day" id="q4_sh29"></td>
														<td class="col_day" id="q4_sh30"></td>
														<td class="col_day" id="q4_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="q4_sc1"></td>
														<td class="col_day" id="q4_sc2"></td>
														<td class="col_day" id="q4_sc3"></td>
														<td class="col_day" id="q4_sc4"></td>
														<td class="col_day" id="q4_sc5"></td>
														<td class="col_day" id="q4_sc6"></td>
														<td class="col_day" id="q4_sc7"></td>
														<td class="col_day" id="q4_sc8"></td>
														<td class="col_day" id="q4_sc9"></td>
														<td class="col_day" id="q4_sc10"></td>
														<td class="col_day" id="q4_sc11"></td>
														<td class="col_day" id="q4_sc12"></td>
														<td class="col_day" id="q4_sc13"></td>
														<td class="col_day" id="q4_sc14"></td>
														<td class="col_day" id="q4_sc15"></td>
														<td class="col_day" id="q4_sc16"></td>
														<td class="col_day" id="q4_sc17"></td>
														<td class="col_day" id="q4_sc18"></td>
														<td class="col_day" id="q4_sc19"></td>
														<td class="col_day" id="q4_sc20"></td>
														<td class="col_day" id="q4_sc21"></td>
														<td class="col_day" id="q4_sc22"></td>
														<td class="col_day" id="q4_sc23"></td>
														<td class="col_day" id="q4_sc24"></td>
														<td class="col_day" id="q4_sc25"></td>
														<td class="col_day" id="q4_sc26"></td>
														<td class="col_day" id="q4_sc27"></td>
														<td class="col_day" id="q4_sc28"></td>
														<td class="col_day" id="q4_sc29"></td>
														<td class="col_day" id="q4_sc30"></td>
														<td class="col_day" id="q4_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소입<br>5존</th>
														<th rowspan="2">+-10℃</th>
														<th>과승</th>
														<td class="col_day" id="q5_sh1"></td>
														<td class="col_day" id="q5_sh2"></td>
														<td class="col_day" id="q5_sh3"></td>
														<td class="col_day" id="q5_sh4"></td>
														<td class="col_day" id="q5_sh5"></td>
														<td class="col_day" id="q5_sh6"></td>
														<td class="col_day" id="q5_sh7"></td>
														<td class="col_day" id="q5_sh8"></td>
														<td class="col_day" id="q5_sh9"></td>
														<td class="col_day" id="q5_sh10"></td>
														<td class="col_day" id="q5_sh11"></td>
														<td class="col_day" id="q5_sh12"></td>
														<td class="col_day" id="q5_sh13"></td>
														<td class="col_day" id="q5_sh14"></td>
														<td class="col_day" id="q5_sh15"></td>
														<td class="col_day" id="q5_sh16"></td>
														<td class="col_day" id="q5_sh17"></td>
														<td class="col_day" id="q5_sh18"></td>
														<td class="col_day" id="q5_sh19"></td>
														<td class="col_day" id="q5_sh20"></td>
														<td class="col_day" id="q5_sh21"></td>
														<td class="col_day" id="q5_sh22"></td>
														<td class="col_day" id="q5_sh23"></td>
														<td class="col_day" id="q5_sh24"></td>
														<td class="col_day" id="q5_sh25"></td>
														<td class="col_day" id="q5_sh26"></td>
														<td class="col_day" id="q5_sh27"></td>
														<td class="col_day" id="q5_sh28"></td>
														<td class="col_day" id="q5_sh29"></td>
														<td class="col_day" id="q5_sh30"></td>
														<td class="col_day" id="q5_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="q5_sc1"></td>
														<td class="col_day" id="q5_sc2"></td>
														<td class="col_day" id="q5_sc3"></td>
														<td class="col_day" id="q5_sc4"></td>
														<td class="col_day" id="q5_sc5"></td>
														<td class="col_day" id="q5_sc6"></td>
														<td class="col_day" id="q5_sc7"></td>
														<td class="col_day" id="q5_sc8"></td>
														<td class="col_day" id="q5_sc9"></td>
														<td class="col_day" id="q5_sc10"></td>
														<td class="col_day" id="q5_sc11"></td>
														<td class="col_day" id="q5_sc12"></td>
														<td class="col_day" id="q5_sc13"></td>
														<td class="col_day" id="q5_sc14"></td>
														<td class="col_day" id="q5_sc15"></td>
														<td class="col_day" id="q5_sc16"></td>
														<td class="col_day" id="q5_sc17"></td>
														<td class="col_day" id="q5_sc18"></td>
														<td class="col_day" id="q5_sc19"></td>
														<td class="col_day" id="q5_sc20"></td>
														<td class="col_day" id="q5_sc21"></td>
														<td class="col_day" id="q5_sc22"></td>
														<td class="col_day" id="q5_sc23"></td>
														<td class="col_day" id="q5_sc24"></td>
														<td class="col_day" id="q5_sc25"></td>
														<td class="col_day" id="q5_sc26"></td>
														<td class="col_day" id="q5_sc27"></td>
														<td class="col_day" id="q5_sc28"></td>
														<td class="col_day" id="q5_sc29"></td>
														<td class="col_day" id="q5_sc30"></td>
														<td class="col_day" id="q5_sc31"></td>
													</tr>
													<tr>
														<th rowspan="3">유조</th>
														<th rowspan="2">+10 ~ -30℃</th>
														<th>과승</th>
														<td class="col_day" id="oil_sh1"></td>
														<td class="col_day" id="oil_sh2"></td>
														<td class="col_day" id="oil_sh3"></td>
														<td class="col_day" id="oil_sh4"></td>
														<td class="col_day" id="oil_sh5"></td>
														<td class="col_day" id="oil_sh6"></td>
														<td class="col_day" id="oil_sh7"></td>
														<td class="col_day" id="oil_sh8"></td>
														<td class="col_day" id="oil_sh9"></td>
														<td class="col_day" id="oil_sh10"></td>
														<td class="col_day" id="oil_sh11"></td>
														<td class="col_day" id="oil_sh12"></td>
														<td class="col_day" id="oil_sh13"></td>
														<td class="col_day" id="oil_sh14"></td>
														<td class="col_day" id="oil_sh15"></td>
														<td class="col_day" id="oil_sh16"></td>
														<td class="col_day" id="oil_sh17"></td>
														<td class="col_day" id="oil_sh18"></td>
														<td class="col_day" id="oil_sh19"></td>
														<td class="col_day" id="oil_sh20"></td>
														<td class="col_day" id="oil_sh21"></td>
														<td class="col_day" id="oil_sh22"></td>
														<td class="col_day" id="oil_sh23"></td>
														<td class="col_day" id="oil_sh24"></td>
														<td class="col_day" id="oil_sh25"></td>
														<td class="col_day" id="oil_sh26"></td>
														<td class="col_day" id="oil_sh27"></td>
														<td class="col_day" id="oil_sh28"></td>
														<td class="col_day" id="oil_sh29"></td>
														<td class="col_day" id="oil_sh30"></td>
														<td class="col_day" id="oil_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="oil_sc1"></td>
														<td class="col_day" id="oil_sc2"></td>
														<td class="col_day" id="oil_sc3"></td>
														<td class="col_day" id="oil_sc4"></td>
														<td class="col_day" id="oil_sc5"></td>
														<td class="col_day" id="oil_sc6"></td>
														<td class="col_day" id="oil_sc7"></td>
														<td class="col_day" id="oil_sc8"></td>
														<td class="col_day" id="oil_sc9"></td>
														<td class="col_day" id="oil_sc10"></td>
														<td class="col_day" id="oil_sc11"></td>
														<td class="col_day" id="oil_sc12"></td>
														<td class="col_day" id="oil_sc13"></td>
														<td class="col_day" id="oil_sc14"></td>
														<td class="col_day" id="oil_sc15"></td>
														<td class="col_day" id="oil_sc16"></td>
														<td class="col_day" id="oil_sc17"></td>
														<td class="col_day" id="oil_sc18"></td>
														<td class="col_day" id="oil_sc19"></td>
														<td class="col_day" id="oil_sc20"></td>
														<td class="col_day" id="oil_sc21"></td>
														<td class="col_day" id="oil_sc22"></td>
														<td class="col_day" id="oil_sc23"></td>
														<td class="col_day" id="oil_sc24"></td>
														<td class="col_day" id="oil_sc25"></td>
														<td class="col_day" id="oil_sc26"></td>
														<td class="col_day" id="oil_sc27"></td>
														<td class="col_day" id="oil_sc28"></td>
														<td class="col_day" id="oil_sc29"></td>
														<td class="col_day" id="oil_sc30"></td>
														<td class="col_day" id="oil_sc31"></td>
													</tr>
													<tr>
														<th>유면높이</th>
														<th>하한</th>
														<td class="col_day" id="oil_min1"></td>
														<td class="col_day" id="oil_min2"></td>
														<td class="col_day" id="oil_min3"></td>
														<td class="col_day" id="oil_min4"></td>
														<td class="col_day" id="oil_min5"></td>
														<td class="col_day" id="oil_min6"></td>
														<td class="col_day" id="oil_min7"></td>
														<td class="col_day" id="oil_min8"></td>
														<td class="col_day" id="oil_min9"></td>
														<td class="col_day" id="oil_min10"></td>
														<td class="col_day" id="oil_min11"></td>
														<td class="col_day" id="oil_min12"></td>
														<td class="col_day" id="oil_min13"></td>
														<td class="col_day" id="oil_min14"></td>
														<td class="col_day" id="oil_min15"></td>
														<td class="col_day" id="oil_min16"></td>
														<td class="col_day" id="oil_min17"></td>
														<td class="col_day" id="oil_min18"></td>
														<td class="col_day" id="oil_min19"></td>
														<td class="col_day" id="oil_min20"></td>
														<td class="col_day" id="oil_min21"></td>
														<td class="col_day" id="oil_min22"></td>
														<td class="col_day" id="oil_min23"></td>
														<td class="col_day" id="oil_min24"></td>
														<td class="col_day" id="oil_min25"></td>
														<td class="col_day" id="oil_min26"></td>
														<td class="col_day" id="oil_min27"></td>
														<td class="col_day" id="oil_min28"></td>
														<td class="col_day" id="oil_min29"></td>
														<td class="col_day" id="oil_min30"></td>
														<td class="col_day" id="oil_min31"></td>
													</tr>
													<tr>
														<th rowspan="3">중간<br>세정기</th>
														<th rowspan="2">+-10℃</th>
														<th>과승</th>
														<td class="col_day" id="a_sh1"></td>
														<td class="col_day" id="a_sh2"></td>
														<td class="col_day" id="a_sh3"></td>
														<td class="col_day" id="a_sh4"></td>
														<td class="col_day" id="a_sh5"></td>
														<td class="col_day" id="a_sh6"></td>
														<td class="col_day" id="a_sh7"></td>
														<td class="col_day" id="a_sh8"></td>
														<td class="col_day" id="a_sh9"></td>
														<td class="col_day" id="a_sh10"></td>
														<td class="col_day" id="a_sh11"></td>
														<td class="col_day" id="a_sh12"></td>
														<td class="col_day" id="a_sh13"></td>
														<td class="col_day" id="a_sh14"></td>
														<td class="col_day" id="a_sh15"></td>
														<td class="col_day" id="a_sh16"></td>
														<td class="col_day" id="a_sh17"></td>
														<td class="col_day" id="a_sh18"></td>
														<td class="col_day" id="a_sh19"></td>
														<td class="col_day" id="a_sh20"></td>
														<td class="col_day" id="a_sh21"></td>
														<td class="col_day" id="a_sh22"></td>
														<td class="col_day" id="a_sh23"></td>
														<td class="col_day" id="a_sh24"></td>
														<td class="col_day" id="a_sh25"></td>
														<td class="col_day" id="a_sh26"></td>
														<td class="col_day" id="a_sh27"></td>
														<td class="col_day" id="a_sh28"></td>
														<td class="col_day" id="a_sh29"></td>
														<td class="col_day" id="a_sh30"></td>
														<td class="col_day" id="a_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="a_sc1"></td>
														<td class="col_day" id="a_sc2"></td>
														<td class="col_day" id="a_sc3"></td>
														<td class="col_day" id="a_sc4"></td>
														<td class="col_day" id="a_sc5"></td>
														<td class="col_day" id="a_sc6"></td>
														<td class="col_day" id="a_sc7"></td>
														<td class="col_day" id="a_sc8"></td>
														<td class="col_day" id="a_sc9"></td>
														<td class="col_day" id="a_sc10"></td>
														<td class="col_day" id="a_sc11"></td>
														<td class="col_day" id="a_sc12"></td>
														<td class="col_day" id="a_sc13"></td>
														<td class="col_day" id="a_sc14"></td>
														<td class="col_day" id="a_sc15"></td>
														<td class="col_day" id="a_sc16"></td>
														<td class="col_day" id="a_sc17"></td>
														<td class="col_day" id="a_sc18"></td>
														<td class="col_day" id="a_sc19"></td>
														<td class="col_day" id="a_sc20"></td>
														<td class="col_day" id="a_sc21"></td>
														<td class="col_day" id="a_sc22"></td>
														<td class="col_day" id="a_sc23"></td>
														<td class="col_day" id="a_sc24"></td>
														<td class="col_day" id="a_sc25"></td>
														<td class="col_day" id="a_sc26"></td>
														<td class="col_day" id="a_sc27"></td>
														<td class="col_day" id="a_sc28"></td>
														<td class="col_day" id="a_sc29"></td>
														<td class="col_day" id="a_sc30"></td>
														<td class="col_day" id="a_sc31"></td>
													</tr>
													<tr>
														<th>수면높이</th>
														<th>하한</th>
														<td class="col_day" id="a_min1"></td>
														<td class="col_day" id="a_min2"></td>
														<td class="col_day" id="a_min3"></td>
														<td class="col_day" id="a_min4"></td>
														<td class="col_day" id="a_min5"></td>
														<td class="col_day" id="a_min6"></td>
														<td class="col_day" id="a_min7"></td>
														<td class="col_day" id="a_min8"></td>
														<td class="col_day" id="a_min9"></td>
														<td class="col_day" id="a_min10"></td>
														<td class="col_day" id="a_min11"></td>
														<td class="col_day" id="a_min12"></td>
														<td class="col_day" id="a_min13"></td>
														<td class="col_day" id="a_min14"></td>
														<td class="col_day" id="a_min15"></td>
														<td class="col_day" id="a_min16"></td>
														<td class="col_day" id="a_min17"></td>
														<td class="col_day" id="a_min18"></td>
														<td class="col_day" id="a_min19"></td>
														<td class="col_day" id="a_min20"></td>
														<td class="col_day" id="a_min21"></td>
														<td class="col_day" id="a_min22"></td>
														<td class="col_day" id="a_min23"></td>
														<td class="col_day" id="a_min24"></td>
														<td class="col_day" id="a_min25"></td>
														<td class="col_day" id="a_min26"></td>
														<td class="col_day" id="a_min27"></td>
														<td class="col_day" id="a_min28"></td>
														<td class="col_day" id="a_min29"></td>
														<td class="col_day" id="a_min30"></td>
														<td class="col_day" id="a_min31"></td>
													</tr>
													<tr>
														<th rowspan="2">소려<br>1존</th>
														<th rowspan="2">+20 ~ -150℃</th>
														<th>과승</th>
														<td class="col_day" id="t1_sh1"></td>
														<td class="col_day" id="t1_sh2"></td>
														<td class="col_day" id="t1_sh3"></td>
														<td class="col_day" id="t1_sh4"></td>
														<td class="col_day" id="t1_sh5"></td>
														<td class="col_day" id="t1_sh6"></td>
														<td class="col_day" id="t1_sh7"></td>
														<td class="col_day" id="t1_sh8"></td>
														<td class="col_day" id="t1_sh9"></td>
														<td class="col_day" id="t1_sh10"></td>
														<td class="col_day" id="t1_sh11"></td>
														<td class="col_day" id="t1_sh12"></td>
														<td class="col_day" id="t1_sh13"></td>
														<td class="col_day" id="t1_sh14"></td>
														<td class="col_day" id="t1_sh15"></td>
														<td class="col_day" id="t1_sh16"></td>
														<td class="col_day" id="t1_sh17"></td>
														<td class="col_day" id="t1_sh18"></td>
														<td class="col_day" id="t1_sh19"></td>
														<td class="col_day" id="t1_sh20"></td>
														<td class="col_day" id="t1_sh21"></td>
														<td class="col_day" id="t1_sh22"></td>
														<td class="col_day" id="t1_sh23"></td>
														<td class="col_day" id="t1_sh24"></td>
														<td class="col_day" id="t1_sh25"></td>
														<td class="col_day" id="t1_sh26"></td>
														<td class="col_day" id="t1_sh27"></td>
														<td class="col_day" id="t1_sh28"></td>
														<td class="col_day" id="t1_sh29"></td>
														<td class="col_day" id="t1_sh30"></td>
														<td class="col_day" id="t1_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="t1_sc1"></td>
														<td class="col_day" id="t1_sc2"></td>
														<td class="col_day" id="t1_sc3"></td>
														<td class="col_day" id="t1_sc4"></td>
														<td class="col_day" id="t1_sc5"></td>
														<td class="col_day" id="t1_sc6"></td>
														<td class="col_day" id="t1_sc7"></td>
														<td class="col_day" id="t1_sc8"></td>
														<td class="col_day" id="t1_sc9"></td>
														<td class="col_day" id="t1_sc10"></td>
														<td class="col_day" id="t1_sc11"></td>
														<td class="col_day" id="t1_sc12"></td>
														<td class="col_day" id="t1_sc13"></td>
														<td class="col_day" id="t1_sc14"></td>
														<td class="col_day" id="t1_sc15"></td>
														<td class="col_day" id="t1_sc16"></td>
														<td class="col_day" id="t1_sc17"></td>
														<td class="col_day" id="t1_sc18"></td>
														<td class="col_day" id="t1_sc19"></td>
														<td class="col_day" id="t1_sc20"></td>
														<td class="col_day" id="t1_sc21"></td>
														<td class="col_day" id="t1_sc22"></td>
														<td class="col_day" id="t1_sc23"></td>
														<td class="col_day" id="t1_sc24"></td>
														<td class="col_day" id="t1_sc25"></td>
														<td class="col_day" id="t1_sc26"></td>
														<td class="col_day" id="t1_sc27"></td>
														<td class="col_day" id="t1_sc28"></td>
														<td class="col_day" id="t1_sc29"></td>
														<td class="col_day" id="t1_sc30"></td>
														<td class="col_day" id="t1_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소려<br>2존</th>
														<th rowspan="2">+20 ~ -30℃</th>
														<th>과승</th>
														<td class="col_day" id="t2_sh1"></td>
														<td class="col_day" id="t2_sh2"></td>
														<td class="col_day" id="t2_sh3"></td>
														<td class="col_day" id="t2_sh4"></td>
														<td class="col_day" id="t2_sh5"></td>
														<td class="col_day" id="t2_sh6"></td>
														<td class="col_day" id="t2_sh7"></td>
														<td class="col_day" id="t2_sh8"></td>
														<td class="col_day" id="t2_sh9"></td>
														<td class="col_day" id="t2_sh10"></td>
														<td class="col_day" id="t2_sh11"></td>
														<td class="col_day" id="t2_sh12"></td>
														<td class="col_day" id="t2_sh13"></td>
														<td class="col_day" id="t2_sh14"></td>
														<td class="col_day" id="t2_sh15"></td>
														<td class="col_day" id="t2_sh16"></td>
														<td class="col_day" id="t2_sh17"></td>
														<td class="col_day" id="t2_sh18"></td>
														<td class="col_day" id="t2_sh19"></td>
														<td class="col_day" id="t2_sh20"></td>
														<td class="col_day" id="t2_sh21"></td>
														<td class="col_day" id="t2_sh22"></td>
														<td class="col_day" id="t2_sh23"></td>
														<td class="col_day" id="t2_sh24"></td>
														<td class="col_day" id="t2_sh25"></td>
														<td class="col_day" id="t2_sh26"></td>
														<td class="col_day" id="t2_sh27"></td>
														<td class="col_day" id="t2_sh28"></td>
														<td class="col_day" id="t2_sh29"></td>
														<td class="col_day" id="t2_sh30"></td>
														<td class="col_day" id="t2_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="t2_sc1"></td>
														<td class="col_day" id="t2_sc2"></td>
														<td class="col_day" id="t2_sc3"></td>
														<td class="col_day" id="t2_sc4"></td>
														<td class="col_day" id="t2_sc5"></td>
														<td class="col_day" id="t2_sc6"></td>
														<td class="col_day" id="t2_sc7"></td>
														<td class="col_day" id="t2_sc8"></td>
														<td class="col_day" id="t2_sc9"></td>
														<td class="col_day" id="t2_sc10"></td>
														<td class="col_day" id="t2_sc11"></td>
														<td class="col_day" id="t2_sc12"></td>
														<td class="col_day" id="t2_sc13"></td>
														<td class="col_day" id="t2_sc14"></td>
														<td class="col_day" id="t2_sc15"></td>
														<td class="col_day" id="t2_sc16"></td>
														<td class="col_day" id="t2_sc17"></td>
														<td class="col_day" id="t2_sc18"></td>
														<td class="col_day" id="t2_sc19"></td>
														<td class="col_day" id="t2_sc20"></td>
														<td class="col_day" id="t2_sc21"></td>
														<td class="col_day" id="t2_sc22"></td>
														<td class="col_day" id="t2_sc23"></td>
														<td class="col_day" id="t2_sc24"></td>
														<td class="col_day" id="t2_sc25"></td>
														<td class="col_day" id="t2_sc26"></td>
														<td class="col_day" id="t2_sc27"></td>
														<td class="col_day" id="t2_sc28"></td>
														<td class="col_day" id="t2_sc29"></td>
														<td class="col_day" id="t2_sc30"></td>
														<td class="col_day" id="t2_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소려<br>3존</th>
														<th rowspan="2">+-10℃</th>
														<th>과승</th>
														<td class="col_day" id="t3_sh1"></td>
														<td class="col_day" id="t3_sh2"></td>
														<td class="col_day" id="t3_sh3"></td>
														<td class="col_day" id="t3_sh4"></td>
														<td class="col_day" id="t3_sh5"></td>
														<td class="col_day" id="t3_sh6"></td>
														<td class="col_day" id="t3_sh7"></td>
														<td class="col_day" id="t3_sh8"></td>
														<td class="col_day" id="t3_sh9"></td>
														<td class="col_day" id="t3_sh10"></td>
														<td class="col_day" id="t3_sh11"></td>
														<td class="col_day" id="t3_sh12"></td>
														<td class="col_day" id="t3_sh13"></td>
														<td class="col_day" id="t3_sh14"></td>
														<td class="col_day" id="t3_sh15"></td>
														<td class="col_day" id="t3_sh16"></td>
														<td class="col_day" id="t3_sh17"></td>
														<td class="col_day" id="t3_sh18"></td>
														<td class="col_day" id="t3_sh19"></td>
														<td class="col_day" id="t3_sh20"></td>
														<td class="col_day" id="t3_sh21"></td>
														<td class="col_day" id="t3_sh22"></td>
														<td class="col_day" id="t3_sh23"></td>
														<td class="col_day" id="t3_sh24"></td>
														<td class="col_day" id="t3_sh25"></td>
														<td class="col_day" id="t3_sh26"></td>
														<td class="col_day" id="t3_sh27"></td>
														<td class="col_day" id="t3_sh28"></td>
														<td class="col_day" id="t3_sh29"></td>
														<td class="col_day" id="t3_sh30"></td>
														<td class="col_day" id="t3_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="t3_sc1"></td>
														<td class="col_day" id="t3_sc2"></td>
														<td class="col_day" id="t3_sc3"></td>
														<td class="col_day" id="t3_sc4"></td>
														<td class="col_day" id="t3_sc5"></td>
														<td class="col_day" id="t3_sc6"></td>
														<td class="col_day" id="t3_sc7"></td>
														<td class="col_day" id="t3_sc8"></td>
														<td class="col_day" id="t3_sc9"></td>
														<td class="col_day" id="t3_sc10"></td>
														<td class="col_day" id="t3_sc11"></td>
														<td class="col_day" id="t3_sc12"></td>
														<td class="col_day" id="t3_sc13"></td>
														<td class="col_day" id="t3_sc14"></td>
														<td class="col_day" id="t3_sc15"></td>
														<td class="col_day" id="t3_sc16"></td>
														<td class="col_day" id="t3_sc17"></td>
														<td class="col_day" id="t3_sc18"></td>
														<td class="col_day" id="t3_sc19"></td>
														<td class="col_day" id="t3_sc20"></td>
														<td class="col_day" id="t3_sc21"></td>
														<td class="col_day" id="t3_sc22"></td>
														<td class="col_day" id="t3_sc23"></td>
														<td class="col_day" id="t3_sc24"></td>
														<td class="col_day" id="t3_sc25"></td>
														<td class="col_day" id="t3_sc26"></td>
														<td class="col_day" id="t3_sc27"></td>
														<td class="col_day" id="t3_sc28"></td>
														<td class="col_day" id="t3_sc29"></td>
														<td class="col_day" id="t3_sc30"></td>
														<td class="col_day" id="t3_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">소려<br>4존</th>
														<th rowspan="2">설정온도 +-10℃</th>
														<th>과승</th>
														<td class="col_day" id="t4_sh1"></td>
														<td class="col_day" id="t4_sh2"></td>
														<td class="col_day" id="t4_sh3"></td>
														<td class="col_day" id="t4_sh4"></td>
														<td class="col_day" id="t4_sh5"></td>
														<td class="col_day" id="t4_sh6"></td>
														<td class="col_day" id="t4_sh7"></td>
														<td class="col_day" id="t4_sh8"></td>
														<td class="col_day" id="t4_sh9"></td>
														<td class="col_day" id="t4_sh10"></td>
														<td class="col_day" id="t4_sh11"></td>
														<td class="col_day" id="t4_sh12"></td>
														<td class="col_day" id="t4_sh13"></td>
														<td class="col_day" id="t4_sh14"></td>
														<td class="col_day" id="t4_sh15"></td>
														<td class="col_day" id="t4_sh16"></td>
														<td class="col_day" id="t4_sh17"></td>
														<td class="col_day" id="t4_sh18"></td>
														<td class="col_day" id="t4_sh19"></td>
														<td class="col_day" id="t4_sh20"></td>
														<td class="col_day" id="t4_sh21"></td>
														<td class="col_day" id="t4_sh22"></td>
														<td class="col_day" id="t4_sh23"></td>
														<td class="col_day" id="t4_sh24"></td>
														<td class="col_day" id="t4_sh25"></td>
														<td class="col_day" id="t4_sh26"></td>
														<td class="col_day" id="t4_sh27"></td>
														<td class="col_day" id="t4_sh28"></td>
														<td class="col_day" id="t4_sh29"></td>
														<td class="col_day" id="t4_sh30"></td>
														<td class="col_day" id="t4_sh31"></td>
													</tr>
													<tr>
														<th>과냉</th>
														<td class="col_day" id="t4_sc1"></td>
														<td class="col_day" id="t4_sc2"></td>
														<td class="col_day" id="t4_sc3"></td>
														<td class="col_day" id="t4_sc4"></td>
														<td class="col_day" id="t4_sc5"></td>
														<td class="col_day" id="t4_sc6"></td>
														<td class="col_day" id="t4_sc7"></td>
														<td class="col_day" id="t4_sc8"></td>
														<td class="col_day" id="t4_sc9"></td>
														<td class="col_day" id="t4_sc10"></td>
														<td class="col_day" id="t4_sc11"></td>
														<td class="col_day" id="t4_sc12"></td>
														<td class="col_day" id="t4_sc13"></td>
														<td class="col_day" id="t4_sc14"></td>
														<td class="col_day" id="t4_sc15"></td>
														<td class="col_day" id="t4_sc16"></td>
														<td class="col_day" id="t4_sc17"></td>
														<td class="col_day" id="t4_sc18"></td>
														<td class="col_day" id="t4_sc19"></td>
														<td class="col_day" id="t4_sc20"></td>
														<td class="col_day" id="t4_sc21"></td>
														<td class="col_day" id="t4_sc22"></td>
														<td class="col_day" id="t4_sc23"></td>
														<td class="col_day" id="t4_sc24"></td>
														<td class="col_day" id="t4_sc25"></td>
														<td class="col_day" id="t4_sc26"></td>
														<td class="col_day" id="t4_sc27"></td>
														<td class="col_day" id="t4_sc28"></td>
														<td class="col_day" id="t4_sc29"></td>
														<td class="col_day" id="t4_sc30"></td>
														<td class="col_day" id="t4_sc31"></td>
													</tr>
													<tr>
														<th rowspan="2">CP</th>
														<th rowspan="2">+0.05℃</th>
														<th>상한</th>
														<td class="col_day" id="cp_max1"></td>
														<td class="col_day" id="cp_max2"></td>
														<td class="col_day" id="cp_max3"></td>
														<td class="col_day" id="cp_max4"></td>
														<td class="col_day" id="cp_max5"></td>
														<td class="col_day" id="cp_max6"></td>
														<td class="col_day" id="cp_max7"></td>
														<td class="col_day" id="cp_max8"></td>
														<td class="col_day" id="cp_max9"></td>
														<td class="col_day" id="cp_max10"></td>
														<td class="col_day" id="cp_max11"></td>
														<td class="col_day" id="cp_max12"></td>
														<td class="col_day" id="cp_max13"></td>
														<td class="col_day" id="cp_max14"></td>
														<td class="col_day" id="cp_max15"></td>
														<td class="col_day" id="cp_max16"></td>
														<td class="col_day" id="cp_max17"></td>
														<td class="col_day" id="cp_max18"></td>
														<td class="col_day" id="cp_max19"></td>
														<td class="col_day" id="cp_max20"></td>
														<td class="col_day" id="cp_max21"></td>
														<td class="col_day" id="cp_max22"></td>
														<td class="col_day" id="cp_max23"></td>
														<td class="col_day" id="cp_max24"></td>
														<td class="col_day" id="cp_max25"></td>
														<td class="col_day" id="cp_max26"></td>
														<td class="col_day" id="cp_max27"></td>
														<td class="col_day" id="cp_max28"></td>
														<td class="col_day" id="cp_max29"></td>
														<td class="col_day" id="cp_max30"></td>
														<td class="col_day" id="cp_max31"></td>
													</tr>
													<tr>
														<th>하한</th>
														<td class="col_day" id="cp_min1"></td>
														<td class="col_day" id="cp_min2"></td>
														<td class="col_day" id="cp_min3"></td>
														<td class="col_day" id="cp_min4"></td>
														<td class="col_day" id="cp_min5"></td>
														<td class="col_day" id="cp_min6"></td>
														<td class="col_day" id="cp_min7"></td>
														<td class="col_day" id="cp_min8"></td>
														<td class="col_day" id="cp_min9"></td>
														<td class="col_day" id="cp_min10"></td>
														<td class="col_day" id="cp_min11"></td>
														<td class="col_day" id="cp_min12"></td>
														<td class="col_day" id="cp_min13"></td>
														<td class="col_day" id="cp_min14"></td>
														<td class="col_day" id="cp_min15"></td>
														<td class="col_day" id="cp_min16"></td>
														<td class="col_day" id="cp_min17"></td>
														<td class="col_day" id="cp_min18"></td>
														<td class="col_day" id="cp_min19"></td>
														<td class="col_day" id="cp_min20"></td>
														<td class="col_day" id="cp_min21"></td>
														<td class="col_day" id="cp_min22"></td>
														<td class="col_day" id="cp_min23"></td>
														<td class="col_day" id="cp_min24"></td>
														<td class="col_day" id="cp_min25"></td>
														<td class="col_day" id="cp_min26"></td>
														<td class="col_day" id="cp_min27"></td>
														<td class="col_day" id="cp_min28"></td>
														<td class="col_day" id="cp_min29"></td>
														<td class="col_day" id="cp_min30"></td>
														<td class="col_day" id="cp_min31"></td>
													</tr>
													<tr>
														<th>특이사항</th>
														<th colspan="2"></th>
														<td class="col_day" id="special1"></td>
														<td class="col_day" id="special2"></td>
														<td class="col_day" id="special3"></td>
														<td class="col_day" id="special4"></td>
														<td class="col_day" id="special5"></td>
														<td class="col_day" id="special6"></td>
														<td class="col_day" id="special7"></td>
														<td class="col_day" id="special8"></td>
														<td class="col_day" id="special9"></td>
														<td class="col_day" id="special10"></td>
														<td class="col_day" id="special11"></td>
														<td class="col_day" id="special12"></td>
														<td class="col_day" id="special13"></td>
														<td class="col_day" id="special14"></td>
														<td class="col_day" id="special15"></td>
														<td class="col_day" id="special16"></td>
														<td class="col_day" id="special17"></td>
														<td class="col_day" id="special18"></td>
														<td class="col_day" id="special19"></td>
														<td class="col_day" id="special20"></td>
														<td class="col_day" id="special21"></td>
														<td class="col_day" id="special22"></td>
														<td class="col_day" id="special23"></td>
														<td class="col_day" id="special24"></td>
														<td class="col_day" id="special25"></td>
														<td class="col_day" id="special26"></td>
														<td class="col_day" id="special27"></td>
														<td class="col_day" id="special28"></td>
														<td class="col_day" id="special29"></td>
														<td class="col_day" id="special30"></td>
														<td class="col_day" id="special31"></td>
													</tr>
													<!-- <tr>
														<th>측정결과</th>
														<td colspan="34" id="testresult1"></td>
													</tr> -->
													</tbody>
												</table>
											</div>
										
											<!-- <div id="table2" class="tmp" style="display:none">
												<table class="table table-bordered table-hover">
													<thead>
													<tr>
														<th class="col2-1">구분</th>
														<th class="col2-2">위치</th>
														<th class="col2-3">관리기준</th>
														<th class="col2-4">규격</th>
														<th class="col2-5">온도</th>
														<th class="col_day">1</th>
														<th class="col_day">2</th>
														<th class="col_day">3</th>
														<th class="col_day">4</th>
														<th class="col_day">5</th>
														<th class="col_day">6</th>
														<th class="col_day">7</th>
														<th class="col_day">8</th>
														<th class="col_day">9</th>
														<th class="col_day">10</th>
														<th class="col_day">11</th>
														<th class="col_day">12</th>
														<th class="col_day">13</th>
														<th class="col_day">14</th>
														<th class="col_day">15</th>
														<th class="col_day">16</th>
														<th class="col_day">17</th>
														<th class="col_day">18</th>
														<th class="col_day">19</th>
														<th class="col_day">20</th>
														<th class="col_day">21</th>
														<th class="col_day">22</th>
														<th class="col_day">23</th>
														<th class="col_day">24</th>
														<th class="col_day">25</th>
														<th class="col_day">26</th>
														<th class="col_day">27</th>
														<th class="col_day">28</th>
														<th class="col_day">29</th>
														<th class="col_day">30</th>
														<th class="col_day">31</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														<th class="col2-1" rowspan="17">소<br>입<br>로</th>
														<th class="col2-2" rowspan="3">1존</th>
														<th class="col2-3" rowspan="3" colspan="2"></th>
														<th class="col2-5">설정</th>
														<td class="col_day" id="q1_set1"></td>
														<td class="col_day" id="q1_set2"></td>
														<td class="col_day" id="q1_set3"></td>
														<td class="col_day" id="q1_set4"></td>
														<td class="col_day" id="q1_set5"></td>
														<td class="col_day" id="q1_set6"></td>
														<td class="col_day" id="q1_set7"></td>
														<td class="col_day" id="q1_set8"></td>
														<td class="col_day" id="q1_set9"></td>
														<td class="col_day" id="q1_set10"></td>
														<td class="col_day" id="q1_set11"></td>
														<td class="col_day" id="q1_set12"></td>
														<td class="col_day" id="q1_set13"></td>
														<td class="col_day" id="q1_set14"></td>
														<td class="col_day" id="q1_set15"></td>
														<td class="col_day" id="q1_set16"></td>
														<td class="col_day" id="q1_set17"></td>
														<td class="col_day" id="q1_set18"></td>
														<td class="col_day" id="q1_set19"></td>
														<td class="col_day" id="q1_set20"></td>
														<td class="col_day" id="q1_set21"></td>
														<td class="col_day" id="q1_set22"></td>
														<td class="col_day" id="q1_set23"></td>
														<td class="col_day" id="q1_set24"></td>
														<td class="col_day" id="q1_set25"></td>
														<td class="col_day" id="q1_set26"></td>
														<td class="col_day" id="q1_set27"></td>
														<td class="col_day" id="q1_set28"></td>
														<td class="col_day" id="q1_set29"></td>
														<td class="col_day" id="q1_set30"></td>
														<td class="col_day" id="q1_set31"></td>
													</tr>
													<tr>
														<th>지시</th>
														<td class="col_day" id="q1_instructions1"></td>
														<td class="col_day" id="q1_instructions2"></td>
														<td class="col_day" id="q1_instructions3"></td>
														<td class="col_day" id="q1_instructions4"></td>
														<td class="col_day" id="q1_instructions5"></td>
														<td class="col_day" id="q1_instructions6"></td>
														<td class="col_day" id="q1_instructions7"></td>
														<td class="col_day" id="q1_instructions8"></td>
														<td class="col_day" id="q1_instructions9"></td>
														<td class="col_day" id="q1_instructions10"></td>
														<td class="col_day" id="q1_instructions11"></td>
														<td class="col_day" id="q1_instructions12"></td>
														<td class="col_day" id="q1_instructions13"></td>
														<td class="col_day" id="q1_instructions14"></td>
														<td class="col_day" id="q1_instructions15"></td>
														<td class="col_day" id="q1_instructions16"></td>
														<td class="col_day" id="q1_instructions17"></td>
														<td class="col_day" id="q1_instructions18"></td>
														<td class="col_day" id="q1_instructions19"></td>
														<td class="col_day" id="q1_instructions20"></td>
														<td class="col_day" id="q1_instructions21"></td>
														<td class="col_day" id="q1_instructions22"></td>
														<td class="col_day" id="q1_instructions23"></td>
														<td class="col_day" id="q1_instructions24"></td>
														<td class="col_day" id="q1_instructions25"></td>
														<td class="col_day" id="q1_instructions26"></td>
														<td class="col_day" id="q1_instructions27"></td>
														<td class="col_day" id="q1_instructions28"></td>
														<td class="col_day" id="q1_instructions29"></td>
														<td class="col_day" id="q1_instructions30"></td>
														<td class="col_day" id="q1_instructions31"></td>
													</tr>
													<tr>
														<th>측정</th>
														<td class="col_day" id="q1_measurements1"></td>
														<td class="col_day" id="q1_measurements2"></td>
														<td class="col_day" id="q1_measurements3"></td>
														<td class="col_day" id="q1_measurements4"></td>
														<td class="col_day" id="q1_measurements5"></td>
														<td class="col_day" id="q1_measurements6"></td>
														<td class="col_day" id="q1_measurements7"></td>
														<td class="col_day" id="q1_measurements8"></td>
														<td class="col_day" id="q1_measurements9"></td>
														<td class="col_day" id="q1_measurements10"></td>
														<td class="col_day" id="q1_measurements11"></td>
														<td class="col_day" id="q1_measurements12"></td>
														<td class="col_day" id="q1_measurements13"></td>
														<td class="col_day" id="q1_measurements14"></td>
														<td class="col_day" id="q1_measurements15"></td>
														<td class="col_day" id="q1_measurements16"></td>
														<td class="col_day" id="q1_measurements17"></td>
														<td class="col_day" id="q1_measurements18"></td>
														<td class="col_day" id="q1_measurements19"></td>
														<td class="col_day" id="q1_measurements20"></td>
														<td class="col_day" id="q1_measurements21"></td>
														<td class="col_day" id="q1_measurements22"></td>
														<td class="col_day" id="q1_measurements23"></td>
														<td class="col_day" id="q1_measurements24"></td>
														<td class="col_day" id="q1_measurements25"></td>
														<td class="col_day" id="q1_measurements26"></td>
														<td class="col_day" id="q1_measurements27"></td>
														<td class="col_day" id="q1_measurements28"></td>
														<td class="col_day" id="q1_measurements29"></td>
														<td class="col_day" id="q1_measurements30"></td>
														<td class="col_day" id="q1_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">2존</th>
														<th rowspan="3" colspan="2"></th>
														<th>설정</th>
														<td class="col_day" id="q2_set1"></td>
														<td class="col_day" id="q2_set2"></td>
														<td class="col_day" id="q2_set3"></td>
														<td class="col_day" id="q2_set4"></td>
														<td class="col_day" id="q2_set5"></td>
														<td class="col_day" id="q2_set6"></td>
														<td class="col_day" id="q2_set7"></td>
														<td class="col_day" id="q2_set8"></td>
														<td class="col_day" id="q2_set9"></td>
														<td class="col_day" id="q2_set10"></td>
														<td class="col_day" id="q2_set11"></td>
														<td class="col_day" id="q2_set12"></td>
														<td class="col_day" id="q2_set13"></td>
														<td class="col_day" id="q2_set14"></td>
														<td class="col_day" id="q2_set15"></td>
														<td class="col_day" id="q2_set16"></td>
														<td class="col_day" id="q2_set17"></td>
														<td class="col_day" id="q2_set18"></td>
														<td class="col_day" id="q2_set19"></td>
														<td class="col_day" id="q2_set20"></td>
														<td class="col_day" id="q2_set21"></td>
														<td class="col_day" id="q2_set22"></td>
														<td class="col_day" id="q2_set23"></td>
														<td class="col_day" id="q2_set24"></td>
														<td class="col_day" id="q2_set25"></td>
														<td class="col_day" id="q2_set26"></td>
														<td class="col_day" id="q2_set27"></td>
														<td class="col_day" id="q2_set28"></td>
														<td class="col_day" id="q2_set29"></td>
														<td class="col_day" id="q2_set30"></td>
														<td class="col_day" id="q2_set31"></td>
													</tr>
													<tr>
														<th>지시</th>
														<td class="col_day" id="q2_instructions1"></td>
														<td class="col_day" id="q2_instructions2"></td>
														<td class="col_day" id="q2_instructions3"></td>
														<td class="col_day" id="q2_instructions4"></td>
														<td class="col_day" id="q2_instructions5"></td>
														<td class="col_day" id="q2_instructions6"></td>
														<td class="col_day" id="q2_instructions7"></td>
														<td class="col_day" id="q2_instructions8"></td>
														<td class="col_day" id="q2_instructions9"></td>
														<td class="col_day" id="q2_instructions10"></td>
														<td class="col_day" id="q2_instructions11"></td>
														<td class="col_day" id="q2_instructions12"></td>
														<td class="col_day" id="q2_instructions13"></td>
														<td class="col_day" id="q2_instructions14"></td>
														<td class="col_day" id="q2_instructions15"></td>
														<td class="col_day" id="q2_instructions16"></td>
														<td class="col_day" id="q2_instructions17"></td>
														<td class="col_day" id="q2_instructions18"></td>
														<td class="col_day" id="q2_instructions19"></td>
														<td class="col_day" id="q2_instructions20"></td>
														<td class="col_day" id="q2_instructions21"></td>
														<td class="col_day" id="q2_instructions22"></td>
														<td class="col_day" id="q2_instructions23"></td>
														<td class="col_day" id="q2_instructions24"></td>
														<td class="col_day" id="q2_instructions25"></td>
														<td class="col_day" id="q2_instructions26"></td>
														<td class="col_day" id="q2_instructions27"></td>
														<td class="col_day" id="q2_instructions28"></td>
														<td class="col_day" id="q2_instructions29"></td>
														<td class="col_day" id="q2_instructions30"></td>
														<td class="col_day" id="q2_instructions31"></td>
													</tr>
													<tr>
														<th>측정</th>
														<td class="col_day" id="q2_measurements1"></td>
														<td class="col_day" id="q2_measurements2"></td>
														<td class="col_day" id="q2_measurements3"></td>
														<td class="col_day" id="q2_measurements4"></td>
														<td class="col_day" id="q2_measurements5"></td>
														<td class="col_day" id="q2_measurements6"></td>
														<td class="col_day" id="q2_measurements7"></td>
														<td class="col_day" id="q2_measurements8"></td>
														<td class="col_day" id="q2_measurements9"></td>
														<td class="col_day" id="q2_measurements10"></td>
														<td class="col_day" id="q2_measurements11"></td>
														<td class="col_day" id="q2_measurements12"></td>
														<td class="col_day" id="q2_measurements13"></td>
														<td class="col_day" id="q2_measurements14"></td>
														<td class="col_day" id="q2_measurements15"></td>
														<td class="col_day" id="q2_measurements16"></td>
														<td class="col_day" id="q2_measurements17"></td>
														<td class="col_day" id="q2_measurements18"></td>
														<td class="col_day" id="q2_measurements19"></td>
														<td class="col_day" id="q2_measurements20"></td>
														<td class="col_day" id="q2_measurements21"></td>
														<td class="col_day" id="q2_measurements22"></td>
														<td class="col_day" id="q2_measurements23"></td>
														<td class="col_day" id="q2_measurements24"></td>
														<td class="col_day" id="q2_measurements25"></td>
														<td class="col_day" id="q2_measurements26"></td>
														<td class="col_day" id="q2_measurements27"></td>
														<td class="col_day" id="q2_measurements28"></td>
														<td class="col_day" id="q2_measurements29"></td>
														<td class="col_day" id="q2_measurements30"></td>
														<td class="col_day" id="q2_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">3존</th>
														<th colspan="2">+- 7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="q3_set1"></td>
														<td class="col_day" id="q3_set2"></td>
														<td class="col_day" id="q3_set3"></td>
														<td class="col_day" id="q3_set4"></td>
														<td class="col_day" id="q3_set5"></td>
														<td class="col_day" id="q3_set6"></td>
														<td class="col_day" id="q3_set7"></td>
														<td class="col_day" id="q3_set8"></td>
														<td class="col_day" id="q3_set9"></td>
														<td class="col_day" id="q3_set10"></td>
														<td class="col_day" id="q3_set11"></td>
														<td class="col_day" id="q3_set12"></td>
														<td class="col_day" id="q3_set13"></td>
														<td class="col_day" id="q3_set14"></td>
														<td class="col_day" id="q3_set15"></td>
														<td class="col_day" id="q3_set16"></td>
														<td class="col_day" id="q3_set17"></td>
														<td class="col_day" id="q3_set18"></td>
														<td class="col_day" id="q3_set19"></td>
														<td class="col_day" id="q3_set20"></td>
														<td class="col_day" id="q3_set21"></td>
														<td class="col_day" id="q3_set22"></td>
														<td class="col_day" id="q3_set23"></td>
														<td class="col_day" id="q3_set24"></td>
														<td class="col_day" id="q3_set25"></td>
														<td class="col_day" id="q3_set26"></td>
														<td class="col_day" id="q3_set27"></td>
														<td class="col_day" id="q3_set28"></td>
														<td class="col_day" id="q3_set29"></td>
														<td class="col_day" id="q3_set30"></td>
														<td class="col_day" id="q3_set31"></td>
													</tr>
													<tr>
														<th class="col2-3">상한치</th>
														<th class="col2-4">하한치</th>
														<th>지시</th>
														<td class="col_day" id="q3_instructions1"></td>
														<td class="col_day" id="q3_instructions2"></td>
														<td class="col_day" id="q3_instructions3"></td>
														<td class="col_day" id="q3_instructions4"></td>
														<td class="col_day" id="q3_instructions5"></td>
														<td class="col_day" id="q3_instructions6"></td>
														<td class="col_day" id="q3_instructions7"></td>
														<td class="col_day" id="q3_instructions8"></td>
														<td class="col_day" id="q3_instructions9"></td>
														<td class="col_day" id="q3_instructions10"></td>
														<td class="col_day" id="q3_instructions11"></td>
														<td class="col_day" id="q3_instructions12"></td>
														<td class="col_day" id="q3_instructions13"></td>
														<td class="col_day" id="q3_instructions14"></td>
														<td class="col_day" id="q3_instructions15"></td>
														<td class="col_day" id="q3_instructions16"></td>
														<td class="col_day" id="q3_instructions17"></td>
														<td class="col_day" id="q3_instructions18"></td>
														<td class="col_day" id="q3_instructions19"></td>
														<td class="col_day" id="q3_instructions20"></td>
														<td class="col_day" id="q3_instructions21"></td>
														<td class="col_day" id="q3_instructions22"></td>
														<td class="col_day" id="q3_instructions23"></td>
														<td class="col_day" id="q3_instructions24"></td>
														<td class="col_day" id="q3_instructions25"></td>
														<td class="col_day" id="q3_instructions26"></td>
														<td class="col_day" id="q3_instructions27"></td>
														<td class="col_day" id="q3_instructions28"></td>
														<td class="col_day" id="q3_instructions29"></td>
														<td class="col_day" id="q3_instructions30"></td>
														<td class="col_day" id="q3_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="q3_measurements1"></td>
														<td class="col_day" id="q3_measurements2"></td>
														<td class="col_day" id="q3_measurements3"></td>
														<td class="col_day" id="q3_measurements4"></td>
														<td class="col_day" id="q3_measurements5"></td>
														<td class="col_day" id="q3_measurements6"></td>
														<td class="col_day" id="q3_measurements7"></td>
														<td class="col_day" id="q3_measurements8"></td>
														<td class="col_day" id="q3_measurements9"></td>
														<td class="col_day" id="q3_measurements10"></td>
														<td class="col_day" id="q3_measurements11"></td>
														<td class="col_day" id="q3_measurements12"></td>
														<td class="col_day" id="q3_measurements13"></td>
														<td class="col_day" id="q3_measurements14"></td>
														<td class="col_day" id="q3_measurements15"></td>
														<td class="col_day" id="q3_measurements16"></td>
														<td class="col_day" id="q3_measurements17"></td>
														<td class="col_day" id="q3_measurements18"></td>
														<td class="col_day" id="q3_measurements19"></td>
														<td class="col_day" id="q3_measurements20"></td>
														<td class="col_day" id="q3_measurements21"></td>
														<td class="col_day" id="q3_measurements22"></td>
														<td class="col_day" id="q3_measurements23"></td>
														<td class="col_day" id="q3_measurements24"></td>
														<td class="col_day" id="q3_measurements25"></td>
														<td class="col_day" id="q3_measurements26"></td>
														<td class="col_day" id="q3_measurements27"></td>
														<td class="col_day" id="q3_measurements28"></td>
														<td class="col_day" id="q3_measurements29"></td>
														<td class="col_day" id="q3_measurements30"></td>
														<td class="col_day" id="q3_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">4존</th>
														<th colspan="2">+- 7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="q4_set1"></td>
														<td class="col_day" id="q4_set2"></td>
														<td class="col_day" id="q4_set3"></td>
														<td class="col_day" id="q4_set4"></td>
														<td class="col_day" id="q4_set5"></td>
														<td class="col_day" id="q4_set6"></td>
														<td class="col_day" id="q4_set7"></td>
														<td class="col_day" id="q4_set8"></td>
														<td class="col_day" id="q4_set9"></td>
														<td class="col_day" id="q4_set10"></td>
														<td class="col_day" id="q4_set11"></td>
														<td class="col_day" id="q4_set12"></td>
														<td class="col_day" id="q4_set13"></td>
														<td class="col_day" id="q4_set14"></td>
														<td class="col_day" id="q4_set15"></td>
														<td class="col_day" id="q4_set16"></td>
														<td class="col_day" id="q4_set17"></td>
														<td class="col_day" id="q4_set18"></td>
														<td class="col_day" id="q4_set19"></td>
														<td class="col_day" id="q4_set20"></td>
														<td class="col_day" id="q4_set21"></td>
														<td class="col_day" id="q4_set22"></td>
														<td class="col_day" id="q4_set23"></td>
														<td class="col_day" id="q4_set24"></td>
														<td class="col_day" id="q4_set25"></td>
														<td class="col_day" id="q4_set26"></td>
														<td class="col_day" id="q4_set27"></td>
														<td class="col_day" id="q4_set28"></td>
														<td class="col_day" id="q4_set29"></td>
														<td class="col_day" id="q4_set30"></td>
														<td class="col_day" id="q4_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="q4_instructions1"></td>
														<td class="col_day" id="q4_instructions2"></td>
														<td class="col_day" id="q4_instructions3"></td>
														<td class="col_day" id="q4_instructions4"></td>
														<td class="col_day" id="q4_instructions5"></td>
														<td class="col_day" id="q4_instructions6"></td>
														<td class="col_day" id="q4_instructions7"></td>
														<td class="col_day" id="q4_instructions8"></td>
														<td class="col_day" id="q4_instructions9"></td>
														<td class="col_day" id="q4_instructions10"></td>
														<td class="col_day" id="q4_instructions11"></td>
														<td class="col_day" id="q4_instructions12"></td>
														<td class="col_day" id="q4_instructions13"></td>
														<td class="col_day" id="q4_instructions14"></td>
														<td class="col_day" id="q4_instructions15"></td>
														<td class="col_day" id="q4_instructions16"></td>
														<td class="col_day" id="q4_instructions17"></td>
														<td class="col_day" id="q4_instructions18"></td>
														<td class="col_day" id="q4_instructions19"></td>
														<td class="col_day" id="q4_instructions20"></td>
														<td class="col_day" id="q4_instructions21"></td>
														<td class="col_day" id="q4_instructions22"></td>
														<td class="col_day" id="q4_instructions23"></td>
														<td class="col_day" id="q4_instructions24"></td>
														<td class="col_day" id="q4_instructions25"></td>
														<td class="col_day" id="q4_instructions26"></td>
														<td class="col_day" id="q4_instructions27"></td>
														<td class="col_day" id="q4_instructions28"></td>
														<td class="col_day" id="q4_instructions29"></td>
														<td class="col_day" id="q4_instructions30"></td>
														<td class="col_day" id="q4_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="q4_measurements1"></td>
														<td class="col_day" id="q4_measurements2"></td>
														<td class="col_day" id="q4_measurements3"></td>
														<td class="col_day" id="q4_measurements4"></td>
														<td class="col_day" id="q4_measurements5"></td>
														<td class="col_day" id="q4_measurements6"></td>
														<td class="col_day" id="q4_measurements7"></td>
														<td class="col_day" id="q4_measurements8"></td>
														<td class="col_day" id="q4_measurements9"></td>
														<td class="col_day" id="q4_measurements10"></td>
														<td class="col_day" id="q4_measurements11"></td>
														<td class="col_day" id="q4_measurements12"></td>
														<td class="col_day" id="q4_measurements13"></td>
														<td class="col_day" id="q4_measurements14"></td>
														<td class="col_day" id="q4_measurements15"></td>
														<td class="col_day" id="q4_measurements16"></td>
														<td class="col_day" id="q4_measurements17"></td>
														<td class="col_day" id="q4_measurements18"></td>
														<td class="col_day" id="q4_measurements19"></td>
														<td class="col_day" id="q4_measurements20"></td>
														<td class="col_day" id="q4_measurements21"></td>
														<td class="col_day" id="q4_measurements22"></td>
														<td class="col_day" id="q4_measurements23"></td>
														<td class="col_day" id="q4_measurements24"></td>
														<td class="col_day" id="q4_measurements25"></td>
														<td class="col_day" id="q4_measurements26"></td>
														<td class="col_day" id="q4_measurements27"></td>
														<td class="col_day" id="q4_measurements28"></td>
														<td class="col_day" id="q4_measurements29"></td>
														<td class="col_day" id="q4_measurements30"></td>
														<td class="col_day" id="q4_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">5존</th>
														<th colspan="2">+- 7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="q5_set1"></td>
														<td class="col_day" id="q5_set2"></td>
														<td class="col_day" id="q5_set3"></td>
														<td class="col_day" id="q5_set4"></td>
														<td class="col_day" id="q5_set5"></td>
														<td class="col_day" id="q5_set6"></td>
														<td class="col_day" id="q5_set7"></td>
														<td class="col_day" id="q5_set8"></td>
														<td class="col_day" id="q5_set9"></td>
														<td class="col_day" id="q5_set10"></td>
														<td class="col_day" id="q5_set11"></td>
														<td class="col_day" id="q5_set12"></td>
														<td class="col_day" id="q5_set13"></td>
														<td class="col_day" id="q5_set14"></td>
														<td class="col_day" id="q5_set15"></td>
														<td class="col_day" id="q5_set16"></td>
														<td class="col_day" id="q5_set17"></td>
														<td class="col_day" id="q5_set18"></td>
														<td class="col_day" id="q5_set19"></td>
														<td class="col_day" id="q5_set20"></td>
														<td class="col_day" id="q5_set21"></td>
														<td class="col_day" id="q5_set22"></td>
														<td class="col_day" id="q5_set23"></td>
														<td class="col_day" id="q5_set24"></td>
														<td class="col_day" id="q5_set25"></td>
														<td class="col_day" id="q5_set26"></td>
														<td class="col_day" id="q5_set27"></td>
														<td class="col_day" id="q5_set28"></td>
														<td class="col_day" id="q5_set29"></td>
														<td class="col_day" id="q5_set30"></td>
														<td class="col_day" id="q5_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="q5_instructions1"></td>
														<td class="col_day" id="q5_instructions2"></td>
														<td class="col_day" id="q5_instructions3"></td>
														<td class="col_day" id="q5_instructions4"></td>
														<td class="col_day" id="q5_instructions5"></td>
														<td class="col_day" id="q5_instructions6"></td>
														<td class="col_day" id="q5_instructions7"></td>
														<td class="col_day" id="q5_instructions8"></td>
														<td class="col_day" id="q5_instructions9"></td>
														<td class="col_day" id="q5_instructions10"></td>
														<td class="col_day" id="q5_instructions11"></td>
														<td class="col_day" id="q5_instructions12"></td>
														<td class="col_day" id="q5_instructions13"></td>
														<td class="col_day" id="q5_instructions14"></td>
														<td class="col_day" id="q5_instructions15"></td>
														<td class="col_day" id="q5_instructions16"></td>
														<td class="col_day" id="q5_instructions17"></td>
														<td class="col_day" id="q5_instructions18"></td>
														<td class="col_day" id="q5_instructions19"></td>
														<td class="col_day" id="q5_instructions20"></td>
														<td class="col_day" id="q5_instructions21"></td>
														<td class="col_day" id="q5_instructions22"></td>
														<td class="col_day" id="q5_instructions23"></td>
														<td class="col_day" id="q5_instructions24"></td>
														<td class="col_day" id="q5_instructions25"></td>
														<td class="col_day" id="q5_instructions26"></td>
														<td class="col_day" id="q5_instructions27"></td>
														<td class="col_day" id="q5_instructions28"></td>
														<td class="col_day" id="q5_instructions29"></td>
														<td class="col_day" id="q5_instructions30"></td>
														<td class="col_day" id="q5_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="q5_measurements1"></td>
														<td class="col_day" id="q5_measurements2"></td>
														<td class="col_day" id="q5_measurements3"></td>
														<td class="col_day" id="q5_measurements4"></td>
														<td class="col_day" id="q5_measurements5"></td>
														<td class="col_day" id="q5_measurements6"></td>
														<td class="col_day" id="q5_measurements7"></td>
														<td class="col_day" id="q5_measurements8"></td>
														<td class="col_day" id="q5_measurements9"></td>
														<td class="col_day" id="q5_measurements10"></td>
														<td class="col_day" id="q5_measurements11"></td>
														<td class="col_day" id="q5_measurements12"></td>
														<td class="col_day" id="q5_measurements13"></td>
														<td class="col_day" id="q5_measurements14"></td>
														<td class="col_day" id="q5_measurements15"></td>
														<td class="col_day" id="q5_measurements16"></td>
														<td class="col_day" id="q5_measurements17"></td>
														<td class="col_day" id="q5_measurements18"></td>
														<td class="col_day" id="q5_measurements19"></td>
														<td class="col_day" id="q5_measurements20"></td>
														<td class="col_day" id="q5_measurements21"></td>
														<td class="col_day" id="q5_measurements22"></td>
														<td class="col_day" id="q5_measurements23"></td>
														<td class="col_day" id="q5_measurements24"></td>
														<td class="col_day" id="q5_measurements25"></td>
														<td class="col_day" id="q5_measurements26"></td>
														<td class="col_day" id="q5_measurements27"></td>
														<td class="col_day" id="q5_measurements28"></td>
														<td class="col_day" id="q5_measurements29"></td>
														<td class="col_day" id="q5_measurements30"></td>
														<td class="col_day" id="q5_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="2">CP</th>
														<th rowspan="2">+-0.05</th>
														<th rowspan="2"></th>
														<th>지시</th>
														<td class="col_day" id="cp_instructions1"></td>
														<td class="col_day" id="cp_instructions2"></td>
														<td class="col_day" id="cp_instructions3"></td>
														<td class="col_day" id="cp_instructions4"></td>
														<td class="col_day" id="cp_instructions5"></td>
														<td class="col_day" id="cp_instructions6"></td>
														<td class="col_day" id="cp_instructions7"></td>
														<td class="col_day" id="cp_instructions8"></td>
														<td class="col_day" id="cp_instructions9"></td>
														<td class="col_day" id="cp_instructions10"></td>
														<td class="col_day" id="cp_instructions11"></td>
														<td class="col_day" id="cp_instructions12"></td>
														<td class="col_day" id="cp_instructions13"></td>
														<td class="col_day" id="cp_instructions14"></td>
														<td class="col_day" id="cp_instructions15"></td>
														<td class="col_day" id="cp_instructions16"></td>
														<td class="col_day" id="cp_instructions17"></td>
														<td class="col_day" id="cp_instructions18"></td>
														<td class="col_day" id="cp_instructions19"></td>
														<td class="col_day" id="cp_instructions20"></td>
														<td class="col_day" id="cp_instructions21"></td>
														<td class="col_day" id="cp_instructions22"></td>
														<td class="col_day" id="cp_instructions23"></td>
														<td class="col_day" id="cp_instructions24"></td>
														<td class="col_day" id="cp_instructions25"></td>
														<td class="col_day" id="cp_instructions26"></td>
														<td class="col_day" id="cp_instructions27"></td>
														<td class="col_day" id="cp_instructions28"></td>
														<td class="col_day" id="cp_instructions29"></td>
														<td class="col_day" id="cp_instructions30"></td>
														<td class="col_day" id="cp_instructions31"></td>
													</tr>
													<tr>
														<th>측정</th>
														<td class="col_day" id="cp_measurements1"></td>
														<td class="col_day" id="cp_measurements2"></td>
														<td class="col_day" id="cp_measurements3"></td>
														<td class="col_day" id="cp_measurements4"></td>
														<td class="col_day" id="cp_measurements5"></td>
														<td class="col_day" id="cp_measurements6"></td>
														<td class="col_day" id="cp_measurements7"></td>
														<td class="col_day" id="cp_measurements8"></td>
														<td class="col_day" id="cp_measurements9"></td>
														<td class="col_day" id="cp_measurements10"></td>
														<td class="col_day" id="cp_measurements11"></td>
														<td class="col_day" id="cp_measurements12"></td>
														<td class="col_day" id="cp_measurements13"></td>
														<td class="col_day" id="cp_measurements14"></td>
														<td class="col_day" id="cp_measurements15"></td>
														<td class="col_day" id="cp_measurements16"></td>
														<td class="col_day" id="cp_measurements17"></td>
														<td class="col_day" id="cp_measurements18"></td>
														<td class="col_day" id="cp_measurements19"></td>
														<td class="col_day" id="cp_measurements20"></td>
														<td class="col_day" id="cp_measurements21"></td>
														<td class="col_day" id="cp_measurements22"></td>
														<td class="col_day" id="cp_measurements23"></td>
														<td class="col_day" id="cp_measurements24"></td>
														<td class="col_day" id="cp_measurements25"></td>
														<td class="col_day" id="cp_measurements26"></td>
														<td class="col_day" id="cp_measurements27"></td>
														<td class="col_day" id="cp_measurements28"></td>
														<td class="col_day" id="cp_measurements29"></td>
														<td class="col_day" id="cp_measurements30"></td>
														<td class="col_day" id="cp_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="2">변<br>성<br>로</th>
														<th>CO2</th>
														<th>+-0.05</th>
														<th></th>
														<th>지시</th>
														<td class="col_day" id="co2_instructions1"></td>
														<td class="col_day" id="co2_instructions2"></td>
														<td class="col_day" id="co2_instructions3"></td>
														<td class="col_day" id="co2_instructions4"></td>
														<td class="col_day" id="co2_instructions5"></td>
														<td class="col_day" id="co2_instructions6"></td>
														<td class="col_day" id="co2_instructions7"></td>
														<td class="col_day" id="co2_instructions8"></td>
														<td class="col_day" id="co2_instructions9"></td>
														<td class="col_day" id="co2_instructions10"></td>
														<td class="col_day" id="co2_instructions11"></td>
														<td class="col_day" id="co2_instructions12"></td>
														<td class="col_day" id="co2_instructions13"></td>
														<td class="col_day" id="co2_instructions14"></td>
														<td class="col_day" id="co2_instructions15"></td>
														<td class="col_day" id="co2_instructions16"></td>
														<td class="col_day" id="co2_instructions17"></td>
														<td class="col_day" id="co2_instructions18"></td>
														<td class="col_day" id="co2_instructions19"></td>
														<td class="col_day" id="co2_instructions20"></td>
														<td class="col_day" id="co2_instructions21"></td>
														<td class="col_day" id="co2_instructions22"></td>
														<td class="col_day" id="co2_instructions23"></td>
														<td class="col_day" id="co2_instructions24"></td>
														<td class="col_day" id="co2_instructions25"></td>
														<td class="col_day" id="co2_instructions26"></td>
														<td class="col_day" id="co2_instructions27"></td>
														<td class="col_day" id="co2_instructions28"></td>
														<td class="col_day" id="co2_instructions29"></td>
														<td class="col_day" id="co2_instructions30"></td>
														<td class="col_day" id="co2_instructions31"></td>
													</tr>
													<tr>
														<th>DEW<br>POINT</th>
														<th>10+-7</th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="dew_measurements1"></td>
														<td class="col_day" id="dew_measurements2"></td>
														<td class="col_day" id="dew_measurements3"></td>
														<td class="col_day" id="dew_measurements4"></td>
														<td class="col_day" id="dew_measurements5"></td>
														<td class="col_day" id="dew_measurements6"></td>
														<td class="col_day" id="dew_measurements7"></td>
														<td class="col_day" id="dew_measurements8"></td>
														<td class="col_day" id="dew_measurements9"></td>
														<td class="col_day" id="dew_measurements10"></td>
														<td class="col_day" id="dew_measurements11"></td>
														<td class="col_day" id="dew_measurements12"></td>
														<td class="col_day" id="dew_measurements13"></td>
														<td class="col_day" id="dew_measurements14"></td>
														<td class="col_day" id="dew_measurements15"></td>
														<td class="col_day" id="dew_measurements16"></td>
														<td class="col_day" id="dew_measurements17"></td>
														<td class="col_day" id="dew_measurements18"></td>
														<td class="col_day" id="dew_measurements19"></td>
														<td class="col_day" id="dew_measurements20"></td>
														<td class="col_day" id="dew_measurements21"></td>
														<td class="col_day" id="dew_measurements22"></td>
														<td class="col_day" id="dew_measurements23"></td>
														<td class="col_day" id="dew_measurements24"></td>
														<td class="col_day" id="dew_measurements25"></td>
														<td class="col_day" id="dew_measurements26"></td>
														<td class="col_day" id="dew_measurements27"></td>
														<td class="col_day" id="dew_measurements28"></td>
														<td class="col_day" id="dew_measurements29"></td>
														<td class="col_day" id="dew_measurements30"></td>
														<td class="col_day" id="dew_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3" colspan="2">소입유조</th>
														<th colspan="2">+-7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="oil_set1"></td>
														<td class="col_day" id="oil_set2"></td>
														<td class="col_day" id="oil_set3"></td>
														<td class="col_day" id="oil_set4"></td>
														<td class="col_day" id="oil_set5"></td>
														<td class="col_day" id="oil_set6"></td>
														<td class="col_day" id="oil_set7"></td>
														<td class="col_day" id="oil_set8"></td>
														<td class="col_day" id="oil_set9"></td>
														<td class="col_day" id="oil_set10"></td>
														<td class="col_day" id="oil_set11"></td>
														<td class="col_day" id="oil_set12"></td>
														<td class="col_day" id="oil_set13"></td>
														<td class="col_day" id="oil_set14"></td>
														<td class="col_day" id="oil_set15"></td>
														<td class="col_day" id="oil_set16"></td>
														<td class="col_day" id="oil_set17"></td>
														<td class="col_day" id="oil_set18"></td>
														<td class="col_day" id="oil_set19"></td>
														<td class="col_day" id="oil_set20"></td>
														<td class="col_day" id="oil_set21"></td>
														<td class="col_day" id="oil_set22"></td>
														<td class="col_day" id="oil_set23"></td>
														<td class="col_day" id="oil_set24"></td>
														<td class="col_day" id="oil_set25"></td>
														<td class="col_day" id="oil_set26"></td>
														<td class="col_day" id="oil_set27"></td>
														<td class="col_day" id="oil_set28"></td>
														<td class="col_day" id="oil_set29"></td>
														<td class="col_day" id="oil_set30"></td>
														<td class="col_day" id="oil_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="oil_instructions1"></td>
														<td class="col_day" id="oil_instructions2"></td>
														<td class="col_day" id="oil_instructions3"></td>
														<td class="col_day" id="oil_instructions4"></td>
														<td class="col_day" id="oil_instructions5"></td>
														<td class="col_day" id="oil_instructions6"></td>
														<td class="col_day" id="oil_instructions7"></td>
														<td class="col_day" id="oil_instructions8"></td>
														<td class="col_day" id="oil_instructions9"></td>
														<td class="col_day" id="oil_instructions10"></td>
														<td class="col_day" id="oil_instructions11"></td>
														<td class="col_day" id="oil_instructions12"></td>
														<td class="col_day" id="oil_instructions13"></td>
														<td class="col_day" id="oil_instructions14"></td>
														<td class="col_day" id="oil_instructions15"></td>
														<td class="col_day" id="oil_instructions16"></td>
														<td class="col_day" id="oil_instructions17"></td>
														<td class="col_day" id="oil_instructions18"></td>
														<td class="col_day" id="oil_instructions19"></td>
														<td class="col_day" id="oil_instructions20"></td>
														<td class="col_day" id="oil_instructions21"></td>
														<td class="col_day" id="oil_instructions22"></td>
														<td class="col_day" id="oil_instructions23"></td>
														<td class="col_day" id="oil_instructions24"></td>
														<td class="col_day" id="oil_instructions25"></td>
														<td class="col_day" id="oil_instructions26"></td>
														<td class="col_day" id="oil_instructions27"></td>
														<td class="col_day" id="oil_instructions28"></td>
														<td class="col_day" id="oil_instructions29"></td>
														<td class="col_day" id="oil_instructions30"></td>
														<td class="col_day" id="oil_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="oil_measurements1"></td>
														<td class="col_day" id="oil_measurements2"></td>
														<td class="col_day" id="oil_measurements3"></td>
														<td class="col_day" id="oil_measurements4"></td>
														<td class="col_day" id="oil_measurements5"></td>
														<td class="col_day" id="oil_measurements6"></td>
														<td class="col_day" id="oil_measurements7"></td>
														<td class="col_day" id="oil_measurements8"></td>
														<td class="col_day" id="oil_measurements9"></td>
														<td class="col_day" id="oil_measurements10"></td>
														<td class="col_day" id="oil_measurements11"></td>
														<td class="col_day" id="oil_measurements12"></td>
														<td class="col_day" id="oil_measurements13"></td>
														<td class="col_day" id="oil_measurements14"></td>
														<td class="col_day" id="oil_measurements15"></td>
														<td class="col_day" id="oil_measurements16"></td>
														<td class="col_day" id="oil_measurements17"></td>
														<td class="col_day" id="oil_measurements18"></td>
														<td class="col_day" id="oil_measurements19"></td>
														<td class="col_day" id="oil_measurements20"></td>
														<td class="col_day" id="oil_measurements21"></td>
														<td class="col_day" id="oil_measurements22"></td>
														<td class="col_day" id="oil_measurements23"></td>
														<td class="col_day" id="oil_measurements24"></td>
														<td class="col_day" id="oil_measurements25"></td>
														<td class="col_day" id="oil_measurements26"></td>
														<td class="col_day" id="oil_measurements27"></td>
														<td class="col_day" id="oil_measurements28"></td>
														<td class="col_day" id="oil_measurements29"></td>
														<td class="col_day" id="oil_measurements30"></td>
														<td class="col_day" id="oil_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="12">소<br>려<br>로</th>
														<th rowspan="3">1존</th>
														<th rowspan="3"></th>
														<th rowspan="3"></th>
														<th>설정</th>
														<td class="col_day" id="t1_set1"></td>
														<td class="col_day" id="t1_set2"></td>
														<td class="col_day" id="t1_set3"></td>
														<td class="col_day" id="t1_set4"></td>
														<td class="col_day" id="t1_set5"></td>
														<td class="col_day" id="t1_set6"></td>
														<td class="col_day" id="t1_set7"></td>
														<td class="col_day" id="t1_set8"></td>
														<td class="col_day" id="t1_set9"></td>
														<td class="col_day" id="t1_set10"></td>
														<td class="col_day" id="t1_set11"></td>
														<td class="col_day" id="t1_set12"></td>
														<td class="col_day" id="t1_set13"></td>
														<td class="col_day" id="t1_set14"></td>
														<td class="col_day" id="t1_set15"></td>
														<td class="col_day" id="t1_set16"></td>
														<td class="col_day" id="t1_set17"></td>
														<td class="col_day" id="t1_set18"></td>
														<td class="col_day" id="t1_set19"></td>
														<td class="col_day" id="t1_set20"></td>
														<td class="col_day" id="t1_set21"></td>
														<td class="col_day" id="t1_set22"></td>
														<td class="col_day" id="t1_set23"></td>
														<td class="col_day" id="t1_set24"></td>
														<td class="col_day" id="t1_set25"></td>
														<td class="col_day" id="t1_set26"></td>
														<td class="col_day" id="t1_set27"></td>
														<td class="col_day" id="t1_set28"></td>
														<td class="col_day" id="t1_set29"></td>
														<td class="col_day" id="t1_set30"></td>
														<td class="col_day" id="t1_set31"></td>
													</tr>
													<tr>
														<th>지시</th>
														<td class="col_day" id="t1_instructions1"></td>
														<td class="col_day" id="t1_instructions2"></td>
														<td class="col_day" id="t1_instructions3"></td>
														<td class="col_day" id="t1_instructions4"></td>
														<td class="col_day" id="t1_instructions5"></td>
														<td class="col_day" id="t1_instructions6"></td>
														<td class="col_day" id="t1_instructions7"></td>
														<td class="col_day" id="t1_instructions8"></td>
														<td class="col_day" id="t1_instructions9"></td>
														<td class="col_day" id="t1_instructions10"></td>
														<td class="col_day" id="t1_instructions11"></td>
														<td class="col_day" id="t1_instructions12"></td>
														<td class="col_day" id="t1_instructions13"></td>
														<td class="col_day" id="t1_instructions14"></td>
														<td class="col_day" id="t1_instructions15"></td>
														<td class="col_day" id="t1_instructions16"></td>
														<td class="col_day" id="t1_instructions17"></td>
														<td class="col_day" id="t1_instructions18"></td>
														<td class="col_day" id="t1_instructions19"></td>
														<td class="col_day" id="t1_instructions20"></td>
														<td class="col_day" id="t1_instructions21"></td>
														<td class="col_day" id="t1_instructions22"></td>
														<td class="col_day" id="t1_instructions23"></td>
														<td class="col_day" id="t1_instructions24"></td>
														<td class="col_day" id="t1_instructions25"></td>
														<td class="col_day" id="t1_instructions26"></td>
														<td class="col_day" id="t1_instructions27"></td>
														<td class="col_day" id="t1_instructions28"></td>
														<td class="col_day" id="t1_instructions29"></td>
														<td class="col_day" id="t1_instructions30"></td>
														<td class="col_day" id="t1_instructions31"></td>
													</tr>
													<tr>
														<th>측정</th>
														<td class="col_day" id="t1_measurements1"></td>
														<td class="col_day" id="t1_measurements2"></td>
														<td class="col_day" id="t1_measurements3"></td>
														<td class="col_day" id="t1_measurements4"></td>
														<td class="col_day" id="t1_measurements5"></td>
														<td class="col_day" id="t1_measurements6"></td>
														<td class="col_day" id="t1_measurements7"></td>
														<td class="col_day" id="t1_measurements8"></td>
														<td class="col_day" id="t1_measurements9"></td>
														<td class="col_day" id="t1_measurements10"></td>
														<td class="col_day" id="t1_measurements11"></td>
														<td class="col_day" id="t1_measurements12"></td>
														<td class="col_day" id="t1_measurements13"></td>
														<td class="col_day" id="t1_measurements14"></td>
														<td class="col_day" id="t1_measurements15"></td>
														<td class="col_day" id="t1_measurements16"></td>
														<td class="col_day" id="t1_measurements17"></td>
														<td class="col_day" id="t1_measurements18"></td>
														<td class="col_day" id="t1_measurements19"></td>
														<td class="col_day" id="t1_measurements20"></td>
														<td class="col_day" id="t1_measurements21"></td>
														<td class="col_day" id="t1_measurements22"></td>
														<td class="col_day" id="t1_measurements23"></td>
														<td class="col_day" id="t1_measurements24"></td>
														<td class="col_day" id="t1_measurements25"></td>
														<td class="col_day" id="t1_measurements26"></td>
														<td class="col_day" id="t1_measurements27"></td>
														<td class="col_day" id="t1_measurements28"></td>
														<td class="col_day" id="t1_measurements29"></td>
														<td class="col_day" id="t1_measurements30"></td>
														<td class="col_day" id="t1_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">2존</th>
														<th colspan="2">+-7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="t2_set1"></td>
														<td class="col_day" id="t2_set2"></td>
														<td class="col_day" id="t2_set3"></td>
														<td class="col_day" id="t2_set4"></td>
														<td class="col_day" id="t2_set5"></td>
														<td class="col_day" id="t2_set6"></td>
														<td class="col_day" id="t2_set7"></td>
														<td class="col_day" id="t2_set8"></td>
														<td class="col_day" id="t2_set9"></td>
														<td class="col_day" id="t2_set10"></td>
														<td class="col_day" id="t2_set11"></td>
														<td class="col_day" id="t2_set12"></td>
														<td class="col_day" id="t2_set13"></td>
														<td class="col_day" id="t2_set14"></td>
														<td class="col_day" id="t2_set15"></td>
														<td class="col_day" id="t2_set16"></td>
														<td class="col_day" id="t2_set17"></td>
														<td class="col_day" id="t2_set18"></td>
														<td class="col_day" id="t2_set19"></td>
														<td class="col_day" id="t2_set20"></td>
														<td class="col_day" id="t2_set21"></td>
														<td class="col_day" id="t2_set22"></td>
														<td class="col_day" id="t2_set23"></td>
														<td class="col_day" id="t2_set24"></td>
														<td class="col_day" id="t2_set25"></td>
														<td class="col_day" id="t2_set26"></td>
														<td class="col_day" id="t2_set27"></td>
														<td class="col_day" id="t2_set28"></td>
														<td class="col_day" id="t2_set29"></td>
														<td class="col_day" id="t2_set30"></td>
														<td class="col_day" id="t2_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="t2_instructions1"></td>
														<td class="col_day" id="t2_instructions2"></td>
														<td class="col_day" id="t2_instructions3"></td>
														<td class="col_day" id="t2_instructions4"></td>
														<td class="col_day" id="t2_instructions5"></td>
														<td class="col_day" id="t2_instructions6"></td>
														<td class="col_day" id="t2_instructions7"></td>
														<td class="col_day" id="t2_instructions8"></td>
														<td class="col_day" id="t2_instructions9"></td>
														<td class="col_day" id="t2_instructions10"></td>
														<td class="col_day" id="t2_instructions11"></td>
														<td class="col_day" id="t2_instructions12"></td>
														<td class="col_day" id="t2_instructions13"></td>
														<td class="col_day" id="t2_instructions14"></td>
														<td class="col_day" id="t2_instructions15"></td>
														<td class="col_day" id="t2_instructions16"></td>
														<td class="col_day" id="t2_instructions17"></td>
														<td class="col_day" id="t2_instructions18"></td>
														<td class="col_day" id="t2_instructions19"></td>
														<td class="col_day" id="t2_instructions20"></td>
														<td class="col_day" id="t2_instructions21"></td>
														<td class="col_day" id="t2_instructions22"></td>
														<td class="col_day" id="t2_instructions23"></td>
														<td class="col_day" id="t2_instructions24"></td>
														<td class="col_day" id="t2_instructions25"></td>
														<td class="col_day" id="t2_instructions26"></td>
														<td class="col_day" id="t2_instructions27"></td>
														<td class="col_day" id="t2_instructions28"></td>
														<td class="col_day" id="t2_instructions29"></td>
														<td class="col_day" id="t2_instructions30"></td>
														<td class="col_day" id="t2_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="t2_measurements1"></td>
														<td class="col_day" id="t2_measurements2"></td>
														<td class="col_day" id="t2_measurements3"></td>
														<td class="col_day" id="t2_measurements4"></td>
														<td class="col_day" id="t2_measurements5"></td>
														<td class="col_day" id="t2_measurements6"></td>
														<td class="col_day" id="t2_measurements7"></td>
														<td class="col_day" id="t2_measurements8"></td>
														<td class="col_day" id="t2_measurements9"></td>
														<td class="col_day" id="t2_measurements10"></td>
														<td class="col_day" id="t2_measurements11"></td>
														<td class="col_day" id="t2_measurements12"></td>
														<td class="col_day" id="t2_measurements13"></td>
														<td class="col_day" id="t2_measurements14"></td>
														<td class="col_day" id="t2_measurements15"></td>
														<td class="col_day" id="t2_measurements16"></td>
														<td class="col_day" id="t2_measurements17"></td>
														<td class="col_day" id="t2_measurements18"></td>
														<td class="col_day" id="t2_measurements19"></td>
														<td class="col_day" id="t2_measurements20"></td>
														<td class="col_day" id="t2_measurements21"></td>
														<td class="col_day" id="t2_measurements22"></td>
														<td class="col_day" id="t2_measurements23"></td>
														<td class="col_day" id="t2_measurements24"></td>
														<td class="col_day" id="t2_measurements25"></td>
														<td class="col_day" id="t2_measurements26"></td>
														<td class="col_day" id="t2_measurements27"></td>
														<td class="col_day" id="t2_measurements28"></td>
														<td class="col_day" id="t2_measurements29"></td>
														<td class="col_day" id="t2_measurements30"></td>
														<td class="col_day" id="t2_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">3존</th>
														<th colspan="2">+-7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="t3_set1"></td>
														<td class="col_day" id="t3_set2"></td>
														<td class="col_day" id="t3_set3"></td>
														<td class="col_day" id="t3_set4"></td>
														<td class="col_day" id="t3_set5"></td>
														<td class="col_day" id="t3_set6"></td>
														<td class="col_day" id="t3_set7"></td>
														<td class="col_day" id="t3_set8"></td>
														<td class="col_day" id="t3_set9"></td>
														<td class="col_day" id="t3_set10"></td>
														<td class="col_day" id="t3_set11"></td>
														<td class="col_day" id="t3_set12"></td>
														<td class="col_day" id="t3_set13"></td>
														<td class="col_day" id="t3_set14"></td>
														<td class="col_day" id="t3_set15"></td>
														<td class="col_day" id="t3_set16"></td>
														<td class="col_day" id="t3_set17"></td>
														<td class="col_day" id="t3_set18"></td>
														<td class="col_day" id="t3_set19"></td>
														<td class="col_day" id="t3_set20"></td>
														<td class="col_day" id="t3_set21"></td>
														<td class="col_day" id="t3_set22"></td>
														<td class="col_day" id="t3_set23"></td>
														<td class="col_day" id="t3_set24"></td>
														<td class="col_day" id="t3_set25"></td>
														<td class="col_day" id="t3_set26"></td>
														<td class="col_day" id="t3_set27"></td>
														<td class="col_day" id="t3_set28"></td>
														<td class="col_day" id="t3_set29"></td>
														<td class="col_day" id="t3_set30"></td>
														<td class="col_day" id="t3_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="t3_instructions1"></td>
														<td class="col_day" id="t3_instructions2"></td>
														<td class="col_day" id="t3_instructions3"></td>
														<td class="col_day" id="t3_instructions4"></td>
														<td class="col_day" id="t3_instructions5"></td>
														<td class="col_day" id="t3_instructions6"></td>
														<td class="col_day" id="t3_instructions7"></td>
														<td class="col_day" id="t3_instructions8"></td>
														<td class="col_day" id="t3_instructions9"></td>
														<td class="col_day" id="t3_instructions10"></td>
														<td class="col_day" id="t3_instructions11"></td>
														<td class="col_day" id="t3_instructions12"></td>
														<td class="col_day" id="t3_instructions13"></td>
														<td class="col_day" id="t3_instructions14"></td>
														<td class="col_day" id="t3_instructions15"></td>
														<td class="col_day" id="t3_instructions16"></td>
														<td class="col_day" id="t3_instructions17"></td>
														<td class="col_day" id="t3_instructions18"></td>
														<td class="col_day" id="t3_instructions19"></td>
														<td class="col_day" id="t3_instructions20"></td>
														<td class="col_day" id="t3_instructions21"></td>
														<td class="col_day" id="t3_instructions22"></td>
														<td class="col_day" id="t3_instructions23"></td>
														<td class="col_day" id="t3_instructions24"></td>
														<td class="col_day" id="t3_instructions25"></td>
														<td class="col_day" id="t3_instructions26"></td>
														<td class="col_day" id="t3_instructions27"></td>
														<td class="col_day" id="t3_instructions28"></td>
														<td class="col_day" id="t3_instructions29"></td>
														<td class="col_day" id="t3_instructions30"></td>
														<td class="col_day" id="t3_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="t3_measurements1"></td>
														<td class="col_day" id="t3_measurements2"></td>
														<td class="col_day" id="t3_measurements3"></td>
														<td class="col_day" id="t3_measurements4"></td>
														<td class="col_day" id="t3_measurements5"></td>
														<td class="col_day" id="t3_measurements6"></td>
														<td class="col_day" id="t3_measurements7"></td>
														<td class="col_day" id="t3_measurements8"></td>
														<td class="col_day" id="t3_measurements9"></td>
														<td class="col_day" id="t3_measurements10"></td>
														<td class="col_day" id="t3_measurements11"></td>
														<td class="col_day" id="t3_measurements12"></td>
														<td class="col_day" id="t3_measurements13"></td>
														<td class="col_day" id="t3_measurements14"></td>
														<td class="col_day" id="t3_measurements15"></td>
														<td class="col_day" id="t3_measurements16"></td>
														<td class="col_day" id="t3_measurements17"></td>
														<td class="col_day" id="t3_measurements18"></td>
														<td class="col_day" id="t3_measurements19"></td>
														<td class="col_day" id="t3_measurements20"></td>
														<td class="col_day" id="t3_measurements21"></td>
														<td class="col_day" id="t3_measurements22"></td>
														<td class="col_day" id="t3_measurements23"></td>
														<td class="col_day" id="t3_measurements24"></td>
														<td class="col_day" id="t3_measurements25"></td>
														<td class="col_day" id="t3_measurements26"></td>
														<td class="col_day" id="t3_measurements27"></td>
														<td class="col_day" id="t3_measurements28"></td>
														<td class="col_day" id="t3_measurements29"></td>
														<td class="col_day" id="t3_measurements30"></td>
														<td class="col_day" id="t3_measurements31"></td>
													</tr>
													<tr>
														<th rowspan="3">4존</th>
														<th colspan="2">+-7.5℃</th>
														<th>설정</th>
														<td class="col_day" id="t4_set1"></td>
														<td class="col_day" id="t4_set2"></td>
														<td class="col_day" id="t4_set3"></td>
														<td class="col_day" id="t4_set4"></td>
														<td class="col_day" id="t4_set5"></td>
														<td class="col_day" id="t4_set6"></td>
														<td class="col_day" id="t4_set7"></td>
														<td class="col_day" id="t4_set8"></td>
														<td class="col_day" id="t4_set9"></td>
														<td class="col_day" id="t4_set10"></td>
														<td class="col_day" id="t4_set11"></td>
														<td class="col_day" id="t4_set12"></td>
														<td class="col_day" id="t4_set13"></td>
														<td class="col_day" id="t4_set14"></td>
														<td class="col_day" id="t4_set15"></td>
														<td class="col_day" id="t4_set16"></td>
														<td class="col_day" id="t4_set17"></td>
														<td class="col_day" id="t4_set18"></td>
														<td class="col_day" id="t4_set19"></td>
														<td class="col_day" id="t4_set20"></td>
														<td class="col_day" id="t4_set21"></td>
														<td class="col_day" id="t4_set22"></td>
														<td class="col_day" id="t4_set23"></td>
														<td class="col_day" id="t4_set24"></td>
														<td class="col_day" id="t4_set25"></td>
														<td class="col_day" id="t4_set26"></td>
														<td class="col_day" id="t4_set27"></td>
														<td class="col_day" id="t4_set28"></td>
														<td class="col_day" id="t4_set29"></td>
														<td class="col_day" id="t4_set30"></td>
														<td class="col_day" id="t4_set31"></td>
													</tr>
													<tr>
														<th>상한치</th>
														<th>하한치</th>
														<th>지시</th>
														<td class="col_day" id="t4_instructions1"></td>
														<td class="col_day" id="t4_instructions2"></td>
														<td class="col_day" id="t4_instructions3"></td>
														<td class="col_day" id="t4_instructions4"></td>
														<td class="col_day" id="t4_instructions5"></td>
														<td class="col_day" id="t4_instructions6"></td>
														<td class="col_day" id="t4_instructions7"></td>
														<td class="col_day" id="t4_instructions8"></td>
														<td class="col_day" id="t4_instructions9"></td>
														<td class="col_day" id="t4_instructions10"></td>
														<td class="col_day" id="t4_instructions11"></td>
														<td class="col_day" id="t4_instructions12"></td>
														<td class="col_day" id="t4_instructions13"></td>
														<td class="col_day" id="t4_instructions14"></td>
														<td class="col_day" id="t4_instructions15"></td>
														<td class="col_day" id="t4_instructions16"></td>
														<td class="col_day" id="t4_instructions17"></td>
														<td class="col_day" id="t4_instructions18"></td>
														<td class="col_day" id="t4_instructions19"></td>
														<td class="col_day" id="t4_instructions20"></td>
														<td class="col_day" id="t4_instructions21"></td>
														<td class="col_day" id="t4_instructions22"></td>
														<td class="col_day" id="t4_instructions23"></td>
														<td class="col_day" id="t4_instructions24"></td>
														<td class="col_day" id="t4_instructions25"></td>
														<td class="col_day" id="t4_instructions26"></td>
														<td class="col_day" id="t4_instructions27"></td>
														<td class="col_day" id="t4_instructions28"></td>
														<td class="col_day" id="t4_instructions29"></td>
														<td class="col_day" id="t4_instructions30"></td>
														<td class="col_day" id="t4_instructions31"></td>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>측정</th>
														<td class="col_day" id="t4_measurements1"></td>
														<td class="col_day" id="t4_measurements2"></td>
														<td class="col_day" id="t4_measurements3"></td>
														<td class="col_day" id="t4_measurements4"></td>
														<td class="col_day" id="t4_measurements5"></td>
														<td class="col_day" id="t4_measurements6"></td>
														<td class="col_day" id="t4_measurements7"></td>
														<td class="col_day" id="t4_measurements8"></td>
														<td class="col_day" id="t4_measurements9"></td>
														<td class="col_day" id="t4_measurements10"></td>
														<td class="col_day" id="t4_measurements11"></td>
														<td class="col_day" id="t4_measurements12"></td>
														<td class="col_day" id="t4_measurements13"></td>
														<td class="col_day" id="t4_measurements14"></td>
														<td class="col_day" id="t4_measurements15"></td>
														<td class="col_day" id="t4_measurements16"></td>
														<td class="col_day" id="t4_measurements17"></td>
														<td class="col_day" id="t4_measurements18"></td>
														<td class="col_day" id="t4_measurements19"></td>
														<td class="col_day" id="t4_measurements20"></td>
														<td class="col_day" id="t4_measurements21"></td>
														<td class="col_day" id="t4_measurements22"></td>
														<td class="col_day" id="t4_measurements23"></td>
														<td class="col_day" id="t4_measurements24"></td>
														<td class="col_day" id="t4_measurements25"></td>
														<td class="col_day" id="t4_measurements26"></td>
														<td class="col_day" id="t4_measurements27"></td>
														<td class="col_day" id="t4_measurements28"></td>
														<td class="col_day" id="t4_measurements29"></td>
														<td class="col_day" id="t4_measurements30"></td>
														<td class="col_day" id="t4_measurements31"></td>
													</tr>
													<tr>
														<th colspan="2">특이사항</th>
														<th colspan="3"></th>
														<td class="col_day" id="sat_special1"></td>
														<td class="col_day" id="sat_special2"></td>
														<td class="col_day" id="sat_special3"></td>
														<td class="col_day" id="sat_special4"></td>
														<td class="col_day" id="sat_special5"></td>
														<td class="col_day" id="sat_special6"></td>
														<td class="col_day" id="sat_special7"></td>
														<td class="col_day" id="sat_special8"></td>
														<td class="col_day" id="sat_special9"></td>
														<td class="col_day" id="sat_special10"></td>
														<td class="col_day" id="sat_special11"></td>
														<td class="col_day" id="sat_special12"></td>
														<td class="col_day" id="sat_special13"></td>
														<td class="col_day" id="sat_special14"></td>
														<td class="col_day" id="sat_special15"></td>
														<td class="col_day" id="sat_special16"></td>
														<td class="col_day" id="sat_special17"></td>
														<td class="col_day" id="sat_special18"></td>
														<td class="col_day" id="sat_special19"></td>
														<td class="col_day" id="sat_special20"></td>
														<td class="col_day" id="sat_special21"></td>
														<td class="col_day" id="sat_special22"></td>
														<td class="col_day" id="sat_special23"></td>
														<td class="col_day" id="sat_special24"></td>
														<td class="col_day" id="sat_special25"></td>
														<td class="col_day" id="sat_special26"></td>
														<td class="col_day" id="sat_special27"></td>
														<td class="col_day" id="sat_special28"></td>
														<td class="col_day" id="sat_special29"></td>
														<td class="col_day" id="sat_special30"></td>
														<td class="col_day" id="sat_special31"></td>
													</tr>
													<tr>
														<th colspan="2">측정결과</th>
														<td colspan="34" id="testresult2"></td>
													</tr>
													</tbody>
												</table>
											</div> -->
											
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
	
	<div id="chk-form" style="display:none;" title="판정">
		<form class="form-inline" role="form" id="chkform" name="chkform" method="post" autocomplete="off">
		    <div class="form-group">
		        <input style="width:30px; height:30px; margin-left:80px;" type="radio" checked="checked" 
		        id="c_chk_o" name="c_chk" value="O">
		        <label for="c_chk_o" class="control-label" 
		        style="font-size: 30pt; font-family:headline; font-weight:700; margin-bottom:20px; 
		        width: 70px; ">O</label>
		        
		        <input style="width:30px; height:30px;" type="radio" 
		        id="c_chk_x" name="c_chk" value="X">
		        <label for="c_chk_x" class="control-label" 
		        style="font-size: 30pt; font-family:headline; font-weight:700; margin-bottom:20px;
		        width: 70px; ">X</label>
		    </div>          
		</form>

			<input type="hidden" id="c_day" name="c_day" />
			<input type="hidden" id="c_zone" name="c_zone" />
			<input type="hidden" id="c_category" name="c_category" />
	</div>
	<div id="minmax-form" style="display:none;" title="상한/하한 등록">
		<form class="form-inline" role="form" id="minmaxform" name="minmaxform" 
		method="post" autocomplete="off">
			<div class="form-group">
				<label class="control-label" 
				style="font-size: 14pt;  font-family:headline; font-weight:700; 
					color:#8C8C8C; width: 60px; text-align: right;">
				온도: </label>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control input-sm" 
				id="minmax" name="minmax" 
    					style="width: 280px; height: 34px; 
    					font-size: 14pt; font-family :headline; font-weight:700;"/>
			</div>			
			</form>
				<input type="hidden" id="m_day" name="m_day" />
				<input type="hidden" id="m_zone" name="m_zone" />
				<input type="hidden" id="m_category" name="m_category" />
		</div>
		
	<div id="special-form" style="display:none;" title="특이사항/측정결과 등록">
		<form class="form-inline" role="form" id="specialform" name="specialform" 
		method="post" autocomplete="off">
			<div class="form-group">
				<label class="control-label" 
				style="font-size: 14pt;  font-family:headline; font-weight:700; 
					color:#8C8C8C; width: 60px; text-align: right;">
				메모: </label>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control input-sm" 
				id="special" name="special" 
    					style="width: 280px; height: 34px; 
    					font-size: 14pt; font-family :headline; font-weight:700;"/>
			</div>			
		</form>
			<input type="hidden" id="sp_day" name="sp_day" />
			<input type="hidden" id="sp_zone" name="sp_zone" />
			<input type="hidden" id="sp_category" name="sp_category" />
	</div>

	<div id="temp-form" style="display:none;" title="온도 등록">
		<form class="form-inline" role="form" id="tempform" name="tempform" 
		method="post" autocomplete="off">
			<div class="form-group">
				<label class="control-label" 
				style="font-size: 14pt;  font-family:headline; font-weight:700; 
					color:#8C8C8C; width: 60px; text-align: right;">
				온도: </label>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control input-sm" 
				id="temp" name="temp" 
    					style="width: 280px; height: 34px; 
    					font-size: 14pt; font-family :headline; font-weight:700;"/>
			</div>			
		</form>
			<input type="hidden" id="temp_day" name="temp_day" />
			<input type="hidden" id="temp_zone" name="temp_zone" />
			<input type="hidden" id="temp_category" name="temp_category" />
	</div>


	<script>
	var specialArray = new Array(32);
	var specialSatArray = new Array(32);
	
		$(function(){
			var now = new Date();
			
			
			for(var j=-3; j<1; j++){
				var y_value = now.getFullYear() + j;
				$("#s_year").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
			}
			
			$("#s_year").val(now.getFullYear());
			$("#s_month").val(now.getMonth()+1);
			
			getYearCount();
			getList();			
			getListSat();			
			
			
		});
	
		$("#s_gubun").change(function(){
			var selectedTable = $(this).val();
			
			$("#table1").hide();
			$("#table2").hide();
			
			$("#table" + selectedTable).show();
			
		})		
		
		$("#s_year, #s_month, #s_hogi, #s_gubun").change(function(){
			getYearCount();
		})
		
		
		function getYearCount(){
			$.post("m03/s03/count_m03s03.jsp", {
			    "year": $("#s_year").val(),
			    "month": $("#s_month").val(),
			    "hogi": $("#s_hogi").val(),
			    "gb": $("#s_gubun").val()
			}).done(function(response) {
				getList();
				getListSat();
			}).fail(function(xhr, status, error) {
				console.log("실패:", xhr.status);
			});
		}
		// fproof
		function getList(){
			$.ajax({
				type : "POST",
				url : "m03/s03/select_m03s03.jsp",
				cache : false,
				dataType : "json",
				data : {
					"year":$("#s_year").val(),
					"month":$("#s_month").val(),
					"hogi":$("#s_hogi").val()
					},
				success : function(rsJson) {
					
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
						
						var listHtml = "";
						
						for(var i=0; i<rsAr.length; i++){
							
							var zone = rsAr[i].zone;
							var category = rsAr[i].category;
							
							switch(category){
								case '과승' :
									category = 'sh';
									break;
								case '과냉' :
									category = 'sc';
									break;
								case '하한' :
									category = 'min';
									break;
								case '상한' :
									category = 'max';
									break;
							}
							
							var tdId = zone + "_" + category;
							for(var j = 1; j <= 31; j ++){
								var dayNum = "day" + j;
								var chk;
								if(rsAr[i][dayNum]!= null){
									chk = rsAr[i][dayNum]
								} else{
									chk = "";
								}
								if(zone != 'special'){
									$("#"+tdId+j).text(chk);
									if(category == 'sh' || category == 'sc'){
										$("#"+tdId+j).attr("onclick", "chkReg("+ j +", '"+ rsAr[i].zone +"', '"+rsAr[i].category+"' )");
									} else{
										$("#"+tdId+j).attr("onclick", "minMaxReg("+ j +", '"+ rsAr[i].zone +"', '"+rsAr[i].category+"' )");
									}
								} else{
									specialArray[j] = chk;
									//$("#special"+j).text(chk);
									if(chk != ""){
										$("#special"+j).html('<i class="fa fa-search"></i>');
									}
									$("#special"+j).attr("onclick", "specialReg("+ j +", '"+ rsAr[i].zone +"', '"+rsAr[i].category+"' )");
								}
							}
						}
					}
					
				},
				error: function(req, status) {
					if (req.status == 0 || status == "timeout") {
						alert("네트워크 연결 확인 후 다시 시도해주세요.");
					} else {
						alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
					}
					
				}
			});
		}
		

		function chkReg(day, zone, category){
			$("#c_day").val(day);
			$("#c_zone").val(zone);
			$("#c_category").val(category);
			
			chkDialog.dialog("open");
		}
		function minMaxReg(day, zone, category){
			$("#m_day").val(day);
			$("#m_zone").val(zone);
			$("#m_category").val(category);
			
			minmaxDialog.dialog("open");
		}
		function specialReg(day, zone, category){
			$("#sp_day").val(day);
			$("#sp_zone").val(zone);
			$("#sp_category").val(category);
			$("#special").val(specialArray[day]);
			
			specialDialog.dialog("open");
		}
		function tempReg(day, zone, category){
			$("#temp_day").val(day);
			$("#temp_zone").val(zone);
			$("#temp_category").val(category);
			
			tempDialog.dialog("open");
		}
		
		// sat
		function getListSat(){
			$.ajax({
				type : "POST",
				url : "m03/s03/select_m03s03_sat.jsp",
				cache : false,
				dataType : "json",
				data : {
					"year":$("#s_year").val(),
					"month":$("#s_month").val(),
					"hogi":$("#s_hogi").val()
					},
				success : function(rsJson) {
					
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
						
						var listHtml = "";
						
						for(var i=0; i<rsAr.length; i++){
							
							var zone = rsAr[i].zone;
							var category = rsAr[i].category;
							
							switch(category){
								case '설정' :
									category = 'set';
									break;
								case '지시' :
									category = 'instructions';
									break;
								case '측정' :
									category = 'measurements';
									break;
							}
							
							var tdId = zone + "_" + category;
							/* if(zone != 'special' && zone != 'testresult'){ */
								for(var j = 1; j <= 31; j ++){
									var dayNum = "day" + j;
									var chk;
									if(rsAr[i][dayNum]!= null){
										chk = rsAr[i][dayNum]
									} else{
										chk = "";
									}
									if(zone != 'special'){
										$("#"+tdId+j).text(chk);
										$("#"+tdId+j).attr("onclick", "tempReg("+ j +", '"+ rsAr[i].zone +"', '"+rsAr[i].category+"' )");
									} else{
										specialSatArray[j] = chk;
										if(chk != ""){
											$("#sat_special"+j).html('<i class="fa fa-search"></i>');
										}
										$("#sat_special"+j).attr("onclick", "specialReg("+ j +", '"+ rsAr[i].zone +"', '"+rsAr[i].category+"' )");
										
									}
									
								}
							/* } else{
								$("#"+rsAr[i].zone+"2").text(rsAr[i].memo);
								$("#"+rsAr[i].zone+"2").attr("onclick", "specialReg('"+ rsAr[i].zone +"')");
								console.log("#"+rsAr[i].zone+"2");
							} */
						}
					}
					
				},
				error: function(req, status) {
					if (req.status == 0 || status == "timeout") {
						alert("네트워크 연결 확인 후 다시 시도해주세요.");
					} else {
						alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
					}
					
				}
			});
		}
		
		
		
		
		
		
		
		/*다이얼로그*/

		var chkDialog;
		chkDialog = $("#chk-form").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:200,
			width:370,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m03/s03/update_m03s03.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"hogi":$("#s_hogi").val(),
						"gubun":$("#s_gubun").val(),
						"day":$("#c_day").val(),
						"zone":$("#c_zone").val(),
						"category":$("#c_category").val(),
						"value":$("input[name='c_chk']:checked").val()
					}).done(function(response) {
						getList();
						$("#chkform")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					chkDialog.dialog("close");
				},
				"닫 기":function(){
					$("#chkform")[0].reset();
					chkDialog.dialog("close");
				}
			}
		});
		
		var minmaxDialog;
		minmaxDialog = $("#minmax-form").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:180,
			width:400,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m03/s03/update_m03s03.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"hogi":$("#s_hogi").val(),
						"gubun":$("#s_gubun").val(),
						"day":$("#m_day").val(),
						"zone":$("#m_zone").val(),
						"category":$("#m_category").val(),
						"value":$("#minmax").val()
					}).done(function(response) {
						getList();
						$("#minmaxform")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					minmaxDialog.dialog("close");
					
				},
				"닫 기":function(){
					$("#minmaxform")[0].reset();
					minmaxDialog.dialog("close");
				}
			}
		});

		
		var specialDialog;
		specialDialog = $("#special-form").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:180,
			width:400,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m03/s03/update_m03s03.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"hogi":$("#s_hogi").val(),
						"gubun":$("#s_gubun").val(),
						"day":$("#sp_day").val(),
						"zone":$("#sp_zone").val(),
						"category":$("#sp_category").val(),
						"value":$("#special").val()
					}).done(function(response) {
						getList();
						getListSat();
						$("#specialform")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					specialDialog.dialog("close");
					
				},
				"닫 기":function(){
					$("#specialform")[0].reset();
					specialDialog.dialog("close");
				}
			}
		});
		
		var tempDialog;
		tempDialog = $("#temp-form").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:180,
			width:400,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m03/s03/update_m03s03.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"hogi":$("#s_hogi").val(),
						"gubun":$("#s_gubun").val(),
						"day":$("#temp_day").val(),
						"zone":$("#temp_zone").val(),
						"category":$("#temp_category").val(),
						"value":$("#temp").val()
					}).done(function(response) {
						getList();
						getListSat();
						$("#tempform")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					tempDialog.dialog("close");
					
				},
				"닫 기":function(){
					$("#tempform")[0].reset();
					tempDialog.dialog("close");
				}
			}
		});
		
		$("#printBtn").click(function(){
			 window.print();
		})
		
		/*차트 불러오는 함수*/
	</script>

</body>
</html>