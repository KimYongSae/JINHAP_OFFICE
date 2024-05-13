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
														        <th class="r7">수분</th>
														        <th class="r8">최대냉각속도</th>
														        <th class="r9">전산가</th>
													     	</tr>
													    </thead>
													    <tbody>
													    	<tr>
													    		<td>1호기</td>
													    		<td rowspan="6">15~18</td>
													    		<td rowspan="6">0.05%이하</td>
													    		<td rowspan="6">93.7~114.6<br>℃/Sec이상</td>
													    		<td rowspan="6">1.0이하</td>
													    		<td id="kv_1" class="data-cell"></td>
													    		<td id="mc_1" class="data-cell"></td>
													    		<td id="mcr_1" class="data-cell"></td>
													    		<td id="tan_1" class="data-cell"></td>
													    		<td id="ivf_1" class="data-cell"></td>
													    	</tr>
													    	<tr>
													    		<td>2호기</td>
													    		<td id="kv_2" class="data-cell"></td>
													    		<td id="mc_2" class="data-cell"></td>
													    		<td id="mcr_2" class="data-cell"></td>
													    		<td id="tan_2" class="data-cell"></td>
													    		<td id="ivf_2" class="data-cell"></td>
													    	</tr>
													    	<tr>
													    		<td>3호기</td>
													    		<td id="kv_3" class="data-cell"></td>
													    		<td id="mc_3" class="data-cell"></td>
													    		<td id="mcr_3" class="data-cell"></td>
													    		<td id="tan_3" class="data-cell"></td>
													    		<td id="ivf_3" class="data-cell"></td>
													    	</tr>
													    	<tr>
													    		<td>4호기</td>
													    		<td id="kv_4" class="data-cell"></td>
													    		<td id="mc_4" class="data-cell"></td>
													    		<td id="mcr_4" class="data-cell"></td>
													    		<td id="tan_4" class="data-cell"></td>
													    		<td id="ivf_4" class="data-cell"></td>
													    	</tr>
													    	<tr>
													    		<td>5호기</td>
													    		<td id="kv_5" class="data-cell"></td>
													    		<td id="mc_5" class="data-cell"></td>
													    		<td id="mcr_5" class="data-cell"></td>
													    		<td id="tan_5" class="data-cell"></td>
													    		<td id="ivf_5" class="data-cell"></td>
													    	</tr>
													    	<tr>
													    		<td>6호기</td>
													    		<td id="kv_6" class="data-cell"></td>
													    		<td id="mc_6" class="data-cell"></td>
													    		<td id="mcr_6" class="data-cell"></td>
													    		<td id="tan_6" class="data-cell"></td>
													    		<td id="ivf_6" class="data-cell"></td>
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
															<th class="tm" id="month-11">23년 7월</th>
															<th class="tm" id="month-10">23년 8월</th>
															<th class="tm" id="month-9">23년 9월</th>
															<th class="tm" id="month-8">23년 10월</th>
															<th class="tm" id="month-7">23년 11월</th>
															<th class="tm" id="month-6">23년 12월</th>
															<th class="tm" id="month-5">24년 1월</th>
															<th class="tm" id="month-4">24년 2월</th>
															<th class="tm" id="month-3">24년 3월</th>
															<th class="tm" id="month-2">24년 4월</th>
															<th class="tm" id="month-1">24년 5월</th>
															<th class="tm" id="month-0">24년 6월</th>
															<th class="tm">비고</th>
														</tr>
														<tr>
															<td rowspan="4">1호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv1-11"></td>
															<td id="kv1-10"></td>
															<td id="kv1-9"></td>
															<td id="kv1-8"></td>
															<td id="kv1-7"></td>
															<td id="kv1-6"></td>
															<td id="kv1-5"></td>
															<td id="kv1-4"></td>
															<td id="kv1-3"></td>
															<td id="kv1-2"></td>
															<td id="kv1-1"></td>
															<td id="kv1-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc1-11"></td>
															<td id="mc1-10"></td>
															<td id="mc1-9"></td>
															<td id="mc1-8"></td>
															<td id="mc1-7"></td>
															<td id="mc1-6"></td>
															<td id="mc1-5"></td>
															<td id="mc1-4"></td>
															<td id="mc1-3"></td>
															<td id="mc1-2"></td>
															<td id="mc1-1"></td>
															<td id="mc1-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr1-11"></td>
															<td id="mcr1-10"></td>
															<td id="mcr1-9"></td>
															<td id="mcr1-8"></td>
															<td id="mcr1-7"></td>
															<td id="mcr1-6"></td>
															<td id="mcr1-5"></td>
															<td id="mcr1-4"></td>
															<td id="mcr1-3"></td>
															<td id="mcr1-2"></td>
															<td id="mcr1-1"></td>
															<td id="mcr1-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan1-11"></td>
															<td id="tan1-10"></td>
															<td id="tan1-9"></td>
															<td id="tan1-8"></td>
															<td id="tan1-7"></td>
															<td id="tan1-6"></td>
															<td id="tan1-5"></td>
															<td id="tan1-4"></td>
															<td id="tan1-3"></td>
															<td id="tan1-2"></td>
															<td id="tan1-1"></td>
															<td id="tan1-0"></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">2호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv2-11"></td>
															<td id="kv2-10"></td>
															<td id="kv2-9"></td>
															<td id="kv2-8"></td>
															<td id="kv2-7"></td>
															<td id="kv2-6"></td>
															<td id="kv2-5"></td>
															<td id="kv2-4"></td>
															<td id="kv2-3"></td>
															<td id="kv2-2"></td>
															<td id="kv2-1"></td>
															<td id="kv2-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc2-11"></td>
															<td id="mc2-10"></td>
															<td id="mc2-9"></td>
															<td id="mc2-8"></td>
															<td id="mc2-7"></td>
															<td id="mc2-6"></td>
															<td id="mc2-5"></td>
															<td id="mc2-4"></td>
															<td id="mc2-3"></td>
															<td id="mc2-2"></td>
															<td id="mc2-1"></td>
															<td id="mc2-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr2-11"></td>
															<td id="mcr2-10"></td>
															<td id="mcr2-9"></td>
															<td id="mcr2-8"></td>
															<td id="mcr2-7"></td>
															<td id="mcr2-6"></td>
															<td id="mcr2-5"></td>
															<td id="mcr2-4"></td>
															<td id="mcr2-3"></td>
															<td id="mcr2-2"></td>
															<td id="mcr2-1"></td>
															<td id="mcr2-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan2-11"></td>
															<td id="tan2-10"></td>
															<td id="tan2-9"></td>
															<td id="tan2-8"></td>
															<td id="tan2-7"></td>
															<td id="tan2-6"></td>
															<td id="tan2-5"></td>
															<td id="tan2-4"></td>
															<td id="tan2-3"></td>
															<td id="tan2-2"></td>
															<td id="tan2-1"></td>
															<td id="tan2-0"></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">3호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv3-11"></td>
															<td id="kv3-10"></td>
															<td id="kv3-9"></td>
															<td id="kv3-8"></td>
															<td id="kv3-7"></td>
															<td id="kv3-6"></td>
															<td id="kv3-5"></td>
															<td id="kv3-4"></td>
															<td id="kv3-3"></td>
															<td id="kv3-2"></td>
															<td id="kv3-1"></td>
															<td id="kv3-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc3-11"></td>
															<td id="mc3-10"></td>
															<td id="mc3-9"></td>
															<td id="mc3-8"></td>
															<td id="mc3-7"></td>
															<td id="mc3-6"></td>
															<td id="mc3-5"></td>
															<td id="mc3-4"></td>
															<td id="mc3-3"></td>
															<td id="mc3-2"></td>
															<td id="mc3-1"></td>
															<td id="mc3-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr3-11"></td>
															<td id="mcr3-10"></td>
															<td id="mcr3-9"></td>
															<td id="mcr3-8"></td>
															<td id="mcr3-7"></td>
															<td id="mcr3-6"></td>
															<td id="mcr3-5"></td>
															<td id="mcr3-4"></td>
															<td id="mcr3-3"></td>
															<td id="mcr3-2"></td>
															<td id="mcr3-1"></td>
															<td id="mcr3-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan3-11"></td>
															<td id="tan3-10"></td>
															<td id="tan3-9"></td>
															<td id="tan3-8"></td>
															<td id="tan3-7"></td>
															<td id="tan3-6"></td>
															<td id="tan3-5"></td>
															<td id="tan3-4"></td>
															<td id="tan3-3"></td>
															<td id="tan3-2"></td>
															<td id="tan3-1"></td>
															<td id="tan3-0"></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">4호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv4-11"></td>
															<td id="kv4-10"></td>
															<td id="kv4-9"></td>
															<td id="kv4-8"></td>
															<td id="kv4-7"></td>
															<td id="kv4-6"></td>
															<td id="kv4-5"></td>
															<td id="kv4-4"></td>
															<td id="kv4-3"></td>
															<td id="kv4-2"></td>
															<td id="kv4-1"></td>
															<td id="kv4-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc4-11"></td>
															<td id="mc4-10"></td>
															<td id="mc4-9"></td>
															<td id="mc4-8"></td>
															<td id="mc4-7"></td>
															<td id="mc4-6"></td>
															<td id="mc4-5"></td>
															<td id="mc4-4"></td>
															<td id="mc4-3"></td>
															<td id="mc4-2"></td>
															<td id="mc4-1"></td>
															<td id="mc4-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr4-11"></td>
															<td id="mcr4-10"></td>
															<td id="mcr4-9"></td>
															<td id="mcr4-8"></td>
															<td id="mcr4-7"></td>
															<td id="mcr4-6"></td>
															<td id="mcr4-5"></td>
															<td id="mcr4-4"></td>
															<td id="mcr4-3"></td>
															<td id="mcr4-2"></td>
															<td id="mcr4-1"></td>
															<td id="mcr4-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan4-11"></td>
															<td id="tan4-10"></td>
															<td id="tan4-9"></td>
															<td id="tan4-8"></td>
															<td id="tan4-7"></td>
															<td id="tan4-6"></td>
															<td id="tan4-5"></td>
															<td id="tan4-4"></td>
															<td id="tan4-3"></td>
															<td id="tan4-2"></td>
															<td id="tan4-1"></td>
															<td id="tan4-0"></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">5호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv5-11"></td>
															<td id="kv5-10"></td>
															<td id="kv5-9"></td>
															<td id="kv5-8"></td>
															<td id="kv5-7"></td>
															<td id="kv5-6"></td>
															<td id="kv5-5"></td>
															<td id="kv5-4"></td>
															<td id="kv5-3"></td>
															<td id="kv5-2"></td>
															<td id="kv5-1"></td>
															<td id="kv5-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc5-11"></td>
															<td id="mc5-10"></td>
															<td id="mc5-9"></td>
															<td id="mc5-8"></td>
															<td id="mc5-7"></td>
															<td id="mc5-6"></td>
															<td id="mc5-5"></td>
															<td id="mc5-4"></td>
															<td id="mc5-3"></td>
															<td id="mc5-2"></td>
															<td id="mc5-1"></td>
															<td id="mc5-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr5-11"></td>
															<td id="mcr5-10"></td>
															<td id="mcr5-9"></td>
															<td id="mcr5-8"></td>
															<td id="mcr5-7"></td>
															<td id="mcr5-6"></td>
															<td id="mcr5-5"></td>
															<td id="mcr5-4"></td>
															<td id="mcr5-3"></td>
															<td id="mcr5-2"></td>
															<td id="mcr5-1"></td>
															<td id="mcr5-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan5-11"></td>
															<td id="tan5-10"></td>
															<td id="tan5-9"></td>
															<td id="tan5-8"></td>
															<td id="tan5-7"></td>
															<td id="tan5-6"></td>
															<td id="tan5-5"></td>
															<td id="tan5-4"></td>
															<td id="tan5-3"></td>
															<td id="tan5-2"></td>
															<td id="tan5-1"></td>
															<td id="tan5-0"></td>
															<td>1.0이하</td>
														</tr>
														<tr>
															<td rowspan="4">6호기</td>
															<td>동점도</td>
															<td>15~18</td>
															<td id="kv6-11"></td>
															<td id="kv6-10"></td>
															<td id="kv6-9"></td>
															<td id="kv6-8"></td>
															<td id="kv6-7"></td>
															<td id="kv6-6"></td>
															<td id="kv6-5"></td>
															<td id="kv6-4"></td>
															<td id="kv6-3"></td>
															<td id="kv6-2"></td>
															<td id="kv6-1"></td>
															<td id="kv6-0"></td>
															<td>15~18</td>
														</tr>
														<tr>
															<td>수분</td>
															<td>0.05이하</td>
															<td id="mc6-11"></td>
															<td id="mc6-10"></td>
															<td id="mc6-9"></td>
															<td id="mc6-8"></td>
															<td id="mc6-7"></td>
															<td id="mc6-6"></td>
															<td id="mc6-5"></td>
															<td id="mc6-4"></td>
															<td id="mc6-3"></td>
															<td id="mc6-2"></td>
															<td id="mc6-1"></td>
															<td id="mc6-0"></td>
															<td>0.05이하</td>
														</tr>
														<tr>
															<td>최대냉각속도</td>
															<td>93.7~114.6</td>
															<td id="mcr6-11"></td>
															<td id="mcr6-10"></td>
															<td id="mcr6-9"></td>
															<td id="mcr6-8"></td>
															<td id="mcr6-7"></td>
															<td id="mcr6-6"></td>
															<td id="mcr6-5"></td>
															<td id="mcr6-4"></td>
															<td id="mcr6-3"></td>
															<td id="mcr6-2"></td>
															<td id="mcr6-1"></td>
															<td id="mcr6-0"></td>
															<td>93.7~114.6</td>
														</tr>
														<tr>
															<td>전산가</td>
															<td>1.0이하</td>
															<td id="tan6-11"></td>
															<td id="tan6-10"></td>
															<td id="tan6-9"></td>
															<td id="tan6-8"></td>
															<td id="tan6-7"></td>
															<td id="tan6-6"></td>
															<td id="tan6-5"></td>
															<td id="tan6-4"></td>
															<td id="tan6-3"></td>
															<td id="tan6-2"></td>
															<td id="tan6-1"></td>
															<td id="tan6-0"></td>
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
		<div id="reg_div" style="display:none;" title="등록">
			<form class="form-inline" role="form" id="reg_form" name="reg_form" 
			method="post" autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 60px; text-align: right;">
					등록: </label>
				</div>
				
				<div class="form-group">
					<input type="number" class="form-control input-sm" 
					id="reg_value" name="reg_value" 
	    					style="width: 280px; height: 34px; 
	    					font-size: 14pt; font-family :headline; font-weight:700;"/>
				</div>			
			</form>
				<input type="hidden" id="reg_tagId" name="reg_tagId" />
		</div>
		
		<div id="ivf_div" style="display:none;" title="등록">
			<form class="form-inline" role="form" id="ivf_form" name="ivf_form" 
			method="post" autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 60px; text-align: right;">
					등록: </label>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control input-sm" 
					id="ivf_value" name="ivf_value" 
	    					style="width: 280px; height: 34px; 
	    					font-size: 14pt; font-family :headline; font-weight:700;"/>
				</div>			
			</form>
				<input type="hidden" id="ivf_tagId" name="ivf_tagId" />
		</div>
		
		
		
	</div>

	<script>
	
	$(function(){
		var now = new Date();
		
		
		for(var j=-3; j<1; j++){
			var y_value = now.getFullYear() + j;
			$("#s_year").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
		}
		
		$("#s_year").val(now.getFullYear());
		$("#s_month").val(now.getMonth()+1);
		getYearCount();
		
		// 클릭 이벤트
		$('.data-cell').click(function() {
	        var cellId = $(this).attr('id'); 
	        var cellContent = $(this).text(); 
	        $("#reg_tagId").val(cellId);      
	        $("#reg_value").val(cellContent);
	        $("#ivf_tagId").val(cellId);      
	        $("#ivf_value").val(cellContent);
			
	        var splitId = cellId.split("_")[0];
	        
	        if(splitId == "ivf" || splitId == "bigo"){
	        	ivfDialog.dialog("open");
	        } else{
	        	regDialog.dialog("open");
	        }
	    });
		//
	})
		
	function getYearCount(){
		$.post("m02/s04/count_m02s04.jsp", {
		    "year": $("#s_year").val()
		}).done(function(response) {
			getList();	
			calcMonth();
		}).fail(function(xhr, status, error) {
			console.log("실패:", xhr.status);
		});
	}
	
	function getList(){
		$.ajax({
			type : "POST",
			url : "m02/s04/select_m02s04.jsp",
			cache : false,
			dataType : "json",
			data : {
				"year":$("#s_year").val(),
				"month":$("#s_month").val()
				},
			success : function(rsJson) {
				
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					for(var i=0; i<rsAr.length; i++){
						var hogi = rsAr[i].hogi;
						$("#kv_"+hogi).text(rsAr[i].kv)
						$("#mc_"+hogi).text(rsAr[i].mc)
						$("#mcr_"+hogi).text(rsAr[i].mcr)
						$("#tan_"+hogi).text(rsAr[i].tan)
						$("#ivf_"+hogi).text(rsAr[i].ivf)
						$("#bigo_"+hogi).text(rsAr[i].bigo)
						
					}
				}
			}
		})
	}
	function getTotalList(){
		$.ajax({
			type : "POST",
			url : "m02/s04/select_total_m02s04.jsp",
			cache : false,
			dataType : "json",
			data : {
				"year":$("#s_year").val(),
				"month":$("#s_month").val()
				},
			success : function(rsJson) {
				var syear = $("#s_year").val();
				var smonth = $("#s_month").val();
				
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					for(var i=0; i<rsAr.length; i++){
						var keys = Object.keys(rsAr[i]);
						for(var j=0; j < keys.length; j ++){
							var keyArr = keys[j].split("-");
							var keyId = "";
							
							if (smonth - parseInt(keyArr[1]) >= 0) {
				                keyId = keyArr[3] + keyArr[2] + "-" + (smonth - parseInt(keyArr[1]));
				                console.log(keyId);
				                console.log(rsAr[i][keys[j]]);
				                
				                $("#" + keyId).text(rsAr[i][keys[j]]);
				                
				            } else {
				                keyId = keyArr[3] + keyArr[2] + "-" + (smonth - parseInt(keyArr[1]) + 12);
				                console.log(keyId);
				                console.log(rsAr[i][keys[j]]);
				                $("#" + keyId).text(rsAr[i][keys[j]]);
				                
				            }
							
						}
						
					}
				}
			}
		})
	}
	
	function calcMonth() {
	    let year = parseInt($("#s_year").val());  // 연도를 정수로 변환
	    let month = parseInt($("#s_month").val());  // 월을 정수로 변환

	    for(let i = 0; i < 12; i++){
	        let displayMonth = month - i;
	        let displayYear = year;

	   		if(displayMonth <= 0){
	   			displayYear --;
	   			displayMonth += 12;
	   			
	   		
	   		 	let displayYearLastTwo = String(displayYear).slice(-2);
	        	$("#month-" + i).text(displayYearLastTwo + "년 " + displayMonth + "월");
	   		} else{
	   			
	   		 	let displayYearLastTwo = String(displayYear).slice(-2);
	        	$("#month-" + i).text(displayYearLastTwo + "년 " + displayMonth + "월");
	   			
	   		}
		}
	    getTotalList();
	}

	
	
	
		/*다이얼로그*/
		var regDialog;
		regDialog = $("#reg_div").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:180,
			width:400,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m02/s04/update_m02s04.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"id":$("#reg_tagId").val(),
						"value":$("#reg_value").val()
					}).done(function(response) {
						getList();
						getTotalList();
						$("#reg_form")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					regDialog.dialog("close");
					
				},
				"닫 기":function(){
					$("#reg_form")[0].reset();
					regDialog.dialog("close");
				}
			}
		});
		
		var ivfDialog;
		ivfDialog = $("#ivf_div").dialog({
			autoOpen:false,
			//autoOpen:true,
			height:180,
			width:400,
			modal:false,
			stack:false,
			buttons:{
				"등 록":function(){
					$.post("m02/s04/update_m02s04.jsp",{
						"year":$("#s_year").val(),
						"month":$("#s_month").val(),
						"id":$("#ivf_tagId").val(),
						"value":$("#ivf_value").val()
					}).done(function(response) {
						getList();
						getTotalList();
						$("#ivf_form")[0].reset();
					}).fail(function(xhr, status, error) {
						console.log("실패:", xhr.status);
						alert("실패");
					});
					
					ivfDialog.dialog("close");
					
				},
				"닫 기":function(){
					$("#ivf_form")[0].reset();
					ivfDialog.dialog("close");
				}
			}
		});
		
		
		
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
		
		$("#s_year, #s_month").on("change", function(){
			getYearCount();
		})
		
		/*차트 불러오는 함수*/
	</script>

</body>
</html>