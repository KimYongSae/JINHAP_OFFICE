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
.scrolltbody {
	display: block;
	/* width: 1900px; */
	border-collapse: collapse;
	border: 0px solid #000;
	padding-top: 50px;
}

.scrolltbody td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	height: 500px;
	overflow-x: hidden;
}

/*값 보여주는곳에서 코멘트목록 사용*/
.scrolltbody2 {
	display: block;
	width: 400px;
	border-collapse: collapse;
	border: 0px solid #000;
}

.scrolltbody2 td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody2 thead {
	display: block;
	width: 400px;
	overflow-x: hidden;
}

.scrolltbody2 tbody {
	display: block;
	width: 400px;
	height: 321px;
	overflow-x: hidden;
}
/*태그목록 사용*/
.scrolltbody3 {
	display: block;
	width: 400px;
	border-collapse: collapse;
	border: 0px solid #000;
}

.scrolltbody3 td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody3 thead {
	display: block;
	width: 400px;
	overflow-x: hidden;
}

.scrolltbody3 tbody {
	display: block;
	width: 400px;
	height: 220px;
	overflow-x: hidden;
}

.dropdown-colorselector {
	display: inline-block;
	padding-left: 10px;
}

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
.image-container {
  position: relative;
  display: inline-block;
  width: 100%; 
}

.image-container .img-responsive {
  width: 100%; 
  height: auto;
}

.text-overlay {
  position: absolute;
  color: white;
  background-color: rgba(0, 0, 0, 0.5);
}

#ymtitle{
	font-weight:bold;
	font-size:30pt;
	padding-bottom: 30px;
}

.r1 { width: 8%; }
.r2 { width: 8%; }
.r3 { width: 8%; }
.r4 { width: 8%; }
.r5 { width: 8%; }
.r6 { width: 8%; }
.r7 { width: 8%; }
.r8 { width: 8%; }
.r9 { width: 8%; }
.r10 { width: 20%; }

.tm { width: 5%; }


th{
	height: 50px;
	background-color: #122d64 !important;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	font-size: 20px;
	text-align: center;
}

td{
	height: 50px;
	font-size: 20px;
	text-align: center;
	
}

#total th{
	height: 30px;
	background-color: #122d64 !important;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	font-size: 15px;
	text-align: center;

}

#total td{
	height: 20px;
	font-size: 15px;
	text-align: center;
	
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
											<h5 style="font-family: headline; font-size: 14pt;">조건관리
												- 열처리유 성상 분석</h5>
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
														<button class="btn btn-default btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="totalButton">
															종합
														</button>
														<button class="btn btn-default btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px; display:none;"
															id="monthButton">
															월별
														</button>
													</div>
													
											</form>
							            </header>


										<div id="collapse4" class="body">
										
											
											<div class="container" id="oilMonth">
												<div class="row">
													<h1 class="text-center control-label" id="ymtitle">
													2024년 01월 소입유 분석
													</h1>
												</div>
												<div class="row">
													<table class="table table-bordered text-center">
														<thead>
													    	<tr>
														        <th class="r1"></th>
														        <th colspan="4">기준</th>
														        <th colspan="4">분석 값</th>
														        <th class="r10" rowspan="2">IVF 냉각곡선</th>
													     	</tr>
													    	<tr>
														        <th class="r1">설비</th>
														        <th class="r2">동점도</th>
														        <th class="r3">수분</th>
														        <th class="r4">최대냉각속도</th>
														        <th class="r5">전산가</th>
														        <th class="r6">동점도</th>
														        <th class="r7">전산가</th>
														        <th class="r8">최대냉각속도</th>
														        <th class="r9">수분</th>
													     	</tr>
													    </thead>
													    <tbody>
													    	<tr>
													    		<td>1호기</td>
													    		<td rowspan="6">15~18</td>
													    		<td rowspan="6">0.05%이하</td>
													    		<td rowspan="6">95℃/Sec이상</td>
													    		<td rowspan="6">1.0이하</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr>
													    		<td>2호기</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr>
													    		<td>3호기</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr>
													    		<td>4호기</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr>
													    		<td>5호기</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr>
													    		<td>6호기</td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    		<td></td>
													    	</tr>
													    	<tr style="height:150px">
													    		<td>비고</td>
													    		<td colspan="9"></td>
													    	</tr>
													    </tbody>
													</table>
												</div>
											</div>
											<div class="container" id="monthTotal" style="display:none;">
												<div class="row">
													<table class="table table-bordered text-center" id="total">
														<tr>
															<th class="tm"></th>
															<th class="tm">관리항목</th>
															<th class="tm">관리범위</th>
															<th class="tm">23년 7월</th>
															<th class="tm">23년 8월</th>
															<th class="tm">23년 9월</th>
															<th class="tm">23년 10월</th>
															<th class="tm">23년 11월</th>
															<th class="tm">23년 12월</th>
															<th class="tm">24년 1월</th>
															<th class="tm">24년 2월</th>
															<th class="tm">24년 3월</th>
															<th class="tm">24년 4월</th>
															<th class="tm">24년 5월</th>
															<th class="tm">24년 6월</th>
															<th class="tm">비고</th>
														</tr>
														<tr>
															<td rowspan="4">1호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">2호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">3호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">4호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">5호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">6호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>1.0이하</td>
														</tr>
													</table>
												</div>
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
		// for ESM environment, need to import modules as:
		// import bb, {gauge} from "billboard.js";

		
		/*다이얼로그*/

		/* 이벤트 */
		$("#totalButton").on("click", function(){
			$("#totalButton").css("display", "none");
			$("#monthButton").css("display", "block");
			
			$("#oilMonth").css("display", "none");
			$("#monthTotal").css("display", "block");

			
		});
		$("#monthButton").on("click", function(){
			$("#monthButton").css("display", "none");
			$("#totalButton").css("display", "block");
			
			$("#monthTotal").css("display", "none");
			$("#oilMonth").css("display", "block");

			
		});
		
		
		/*차트 불러오는 함수*/
	</script>

</body>
</html>