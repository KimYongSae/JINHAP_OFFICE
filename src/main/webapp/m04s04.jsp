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

.r1 { width: 5%; }
.r2 { width: 5%; }
.r3 { width: 5%; }
.r4 { width: 5%; }
.r5 { width: 5%; }
.r6 { width: 5%; }
.r7 { width: 5%; }
.r8 { width: 5%; }
.r9 { width: 5%; }
.r10 { width: 10%; }

.nr1 { width: 5%; }
.nr2 { width: 5%; }
.nr3 { width: 5%; }
.nr4 { width: 2%; }
.nr5 { width: 4%; }
.nr6 { width: 5%; }
.nr7 { width: 5%; }
.nr8 { width: 5%; }
.nr9 { width: 5%; }
.nr10 { width: 5%; }
.nr11 { width: 5%; }
.nr12 { width: 8%; }



th{
	height: 30px;
	background-color: #122d64 !important;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	font-size: 15px;
	text-align: center;
}

td{
	height: 30px;
	font-size: 15px;
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
	height: 35px;
	font-size: 15px;
	text-align: center;
	
}

.form-control{
	height:30px;
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
											<h5 style="font-family: headline; font-size: 14pt;">설비관리
												- 예방보전</h5>
										</header>
										<header style="background:white; height:43px;">
							                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
								                <div class="form-group" id="hogiButtonGroup">
														<div class="form-group">
															<label class="control-label" 
															style="font-size: 14pt;  font-family:headline;font-weight:700; 
																color:#8C8C8C; width: 70px; text-align: right;">
															호기 : </label>
														</div>
														<div class="form-group">
															<select class="form-control input-sm" id="hogi" name="hogi"
																style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
																<!-- <option value="0">전체</option>	 -->
																<option value="1">Q01-HN01</option>
																<option value="2">Q01-HN02</option>
																<option value="3">Q01-HN03</option>
																<option value="4">Q01-HN04</option>
																<option value="5">Q01-HN05</option>
																<option value="6">Q01-HN06</option>
															</select>
		
														</div>
														
														<div class="form-group">
															<label class="control-label" 
															style="font-size: 14pt;  font-family:headline;font-weight:700; 
																color:#8C8C8C; width: 70px; text-align: right;">
															날짜 : </label>
														</div>
														
														<div class="form-group">
															<input type="text" class="form-control input-sm datepicker" id="s_sdate" name="s_sdate" 
															style="margin-top:5px; height: 30px; width: 140px; 
															font-size: 14pt; font-family:headline;"  
															placeholder="예)2020-01-01"
															onkeyup="auto_date_format(event, this);"/>
														</div>			
														<div class="form-group">
															<button class="btn btn-default btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="saveButton">
																저장
															</button>
														</div>
													</div>
												<div class="form-group" id="totalButtonGroup" style="display:none;">
													<div class="form-group">
														<label class="control-label" 
														style="font-size: 14pt;  font-family:headline;font-weight:700; 
															color:#8C8C8C; width: 70px; text-align: right;">
														기간 : </label>
													</div>
													
													<div class="form-group">
														<input type="text" class="form-control input-sm datepicker" id="t_sdate" name="t_sdate" 
														style="margin-top:5px; height: 30px; width: 140px; 
														font-size: 14pt; font-family:headline;"  
														placeholder="예)2020-01-01"
														onkeyup="auto_date_format(event, this);"/>
													</div>
													 ~ 
													<div class="form-group">
														<input type="text" class="form-control input-sm datepicker" id="t_edate" name="t_edate" 
														style="margin-top:5px; height: 30px; width: 140px; 
														font-size: 14pt; font-family:headline;"  
														placeholder="예)2020-01-01"
														onkeyup="auto_date_format(event, this);"/>
													</div>
													<div class="form-group">
														<button class="btn btn-default btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="refreshButton">
															초기화
														</button>
													</div>
												</div>
													
													
													<div class="form-group pull-right" style="padding-right: 40px;">
														<button class="btn btn-info btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px; display:none;"
															id="excelBtn">
															<i class="glyphicon glyphicon-save"></i> 엑셀 다운로드
														</button>
														<button class="btn btn-info btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="totalButton">
															종합
														</button>
														<button class="btn btn-info btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px; display:none;"
															id="hogiButton">
															등록
														</button>
													</div>
													
											</form>
							            </header>


										<div id="collapse4" class="body">
										
											
											<div class="container" id="hogiCheck">
												<div class="row">
													<form id="inspectionForm">
													<table class="table table-bordered text-center">
														<thead>
													    	<tr>
														        <th class="r1" rowspan="3"> 점검항목</th>
														        <th class="r2" rowspan="3"> 적용설비</th>
														        <th class="r3" rowspan="3"> 점검주기</th>
														        <th class="r4" rowspan="3"> 설비공정명</th>
														        <th class="r5" rowspan="3"> 점검도구</th>
														        <th class="r6" rowspan="3"> 관리기준</th>
														        <th rowspan="2" colspan="4"> 관리기준<br>[마모도에 대한 판정기준]</th>
														        <th class="r8">점검일자</th>
														        <th class="r10" rowspan="3">비고</th>
													     	</tr>
													     	<tr>
													     		<th></th>
													     	</tr>
													     	<tr>
													     		<th class="r7">상</th>
													     		<th class="r7">중</th>
													     		<th class="r7">하</th>
													     		<th class="r7">교체준비</th>
													     		<th>측정</th>
												     		</tr>
													    </thead>
													    <tbody>
													    	<tr>
													    		<td rowspan="2"> RF-CHAIN</td>
													    		<td rowspan="16"> </td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">41.8mm 지그</td>
													    		<td rowspan="2">23.83mm</td>
													    		<td rowspan="2">23.83mm</td>
													    		<td rowspan="2">23.9~32.1</td>
													    		<td rowspan="2">32.2~40.5</td>
													    		<td rowspan="2">40.6~41.7</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="rf-chain_oil" name="rf-chain_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="rf-chain_oil_bigo" name="rf-chain_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="rf-chain_a" name="rf-chain_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="rf-chain_a_bigo" name="rf-chain_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">상부 기어축</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">V/C</td>
													    		<td rowspan="2">60mm</td>
													    		<td rowspan="2">60mm</td>
													    		<td rowspan="2">57mm</td>
													    		<td rowspan="2">54mm</td>
													    		<td rowspan="2">53.4mm</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-gear_oil" name="top-gear_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-gear_oil_bigo" name="top-gear_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-gear_a" name="top-gear_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-gear_a_bigo" name="top-gear_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">상부 스프라켓</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">V/C</td>
													    		<td rowspan="2">110mm</td>
													    		<td rowspan="2">110mm</td>
													    		<td rowspan="2">93.5mm</td>
													    		<td rowspan="2">77mm</td>
													    		<td rowspan="2">75.9mm</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-sprocket_oil" name="top-sprocket_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-sprocket_oil_bigo" name="top-sprocket_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-sprocket_a" name="top-sprocket_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-sprocket_a_bigo" name="top-sprocket_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">상부베어링</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-bearing_oil" name="top-bearing_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-bearing_oil_bigo" name="top-bearing_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-bearing_a" name="top-bearing_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="top-bearing_a_bigo" name="top-bearing_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">하부 스프라켓</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">V/C</td>
													    		<td rowspan="2">110mm</td>
													    		<td rowspan="2">110mm</td>
													    		<td rowspan="2">93.5mm</td>
													    		<td rowspan="2">77mm</td>
													    		<td rowspan="2">75.9mm</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-sprocket_oil" name="bottom-sprocket_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-sprocket_oil_bigo" name="bottom-sprocket_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-sprocket_a" name="bottom-sprocket_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-sprocket_a_bigo" name="bottom-sprocket_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">하부 기어축</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">V/C</td>
													    		<td rowspan="2">60mm</td>
													    		<td rowspan="2">60mm</td>
													    		<td rowspan="2">57mm</td>
													    		<td rowspan="2">54mm</td>
													    		<td rowspan="2">53.4mm</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-gear_oil" name="bottom-gear_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-gear_oil_bigo" name="bottom-gear_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-gear_a" name="bottom-gear_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-gear_a_bigo" name="bottom-gear_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">하부 베어링</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td rowspan="2"></td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-bearing_oil" name="bottom-bearing_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-bearing_oil_bigo" name="bottom-bearing_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-bearing_a" name="bottom-bearing_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="bottom-bearing_a_bigo" name="bottom-bearing_a_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td rowspan="2">체인 레일</td>
													    		<td rowspan="2">1회/반기</td>
													    		<td>유조컨베어</td>
													    		<td rowspan="2">V/C</td>
													    		<td rowspan="2">100mm</td>
													    		<td rowspan="2">100mm</td>
													    		<td rowspan="2">70mm</td>
													    		<td rowspan="2">40mm</td>
													    		<td rowspan="2">39mm</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="chain_oil" name="chain_oil" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="chain_oil_bigo" name="chain_oil_bigo" />
												    			</td>
													    	</tr>
													    	<tr>
													    		<td>중간세정기</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="chain_a" name="chain_a" />
												    			</td>
													    		<td>
													    			<input type="text" class="form-control input-sm" id="chain_a_bigo" name="chain_a_bigo" />
												    			</td>
													    	</tr>
													    </tbody>
													</table>
													</form>
												</div>
											</div>
											<div class="container" id="checkTotal" style="display:none;">
												<div class="row">
													<table class="table table-bordered text-center" id="total">
														<thead>
															<tr>
																<th class="nr1" rowspan="2">점검항목</th>
																<th class="nr2" rowspan="2">설비명</th>
																<th colspan="2">규격</th>
																<th class="nr4" rowspan="2">단위</th>
																<th class="nr5" rowspan="2">점검방법</th>
																<th class="nr6" rowspan="2">1호기</th>
																<th class="nr7" rowspan="2">2호기</th>
																<th class="nr8" rowspan="2">3호기</th>
																<th class="nr9" rowspan="2">4호기</th>
																<th class="nr10" rowspan="2">5호기</th>
																<th class="nr11" rowspan="2">6호기</th>
																<th class="nr12" rowspan="2">비고</th>
															</tr>
															<tr>
																<th class="nr3">1, 6호기</th>
																<th class="nr3">2, 3, 4, 5호기</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="nr1" rowspan="2">RF-CHAIN</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2">23.83 ~ 40.5</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">지그 활용</td>
																<td class="nr6" id="rf-chain_1_oil"></td>
																<td class="nr7" id="rf-chain_2_oil"></td>
																<td class="nr8" id="rf-chain_3_oil"></td>
																<td class="nr9" id="rf-chain_4_oil"></td>
																<td class="nr10" id="rf-chain_5_oil"></td>
																<td class="nr11" id="rf-chain_6_oil"></td>
																<td class="nr12" ></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>23.83 ~ 40.5</td>
																<td>22.2 ~ 37.7</td>
																<td>mm</td>
																<td class="nr6" id="rf-chain_1_a"></td>
																<td class="nr7" id="rf-chain_2_a"></td>
																<td class="nr8" id="rf-chain_3_a"></td>
																<td class="nr9" id="rf-chain_4_a"></td>
																<td class="nr10" id="rf-chain_5_a"></td>
																<td class="nr11" id="rf-chain_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">상부 기어축</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2">60 ~ 54</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">V/C 측정</td>
																<td class="nr6" id="top-gear_1_oil"></td>
																<td class="nr7" id="top-gear_2_oil"></td>
																<td class="nr8" id="top-gear_3_oil"></td>
																<td class="nr9" id="top-gear_4_oil"></td>
																<td class="nr10" id="top-gear_5_oil"></td>
																<td class="nr11" id="top-gear_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="top-gear_1_a"></td>
																<td class="nr7" id="top-gear_2_a"></td>
																<td class="nr8" id="top-gear_3_a"></td>
																<td class="nr9" id="top-gear_4_a"></td>
																<td class="nr10" id="top-gear_5_a"></td>
																<td class="nr11" id="top-gear_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">상부 스프라켓</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2">110 ~ 77</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">V/C 측정</td>
																<td class="nr6" id="top-sprocket_1_oil"></td>
																<td class="nr7" id="top-sprocket_2_oil"></td>
																<td class="nr8" id="top-sprocket_3_oil"></td>
																<td class="nr9" id="top-sprocket_4_oil"></td>
																<td class="nr10" id="top-sprocket_5_oil"></td>
																<td class="nr11" id="top-sprocket_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="top-sprocket_1_a"></td>
																<td class="nr7" id="top-sprocket_2_a"></td>
																<td class="nr8" id="top-sprocket_3_a"></td>
																<td class="nr9" id="top-sprocket_4_a"></td>
																<td class="nr10" id="top-sprocket_5_a"></td>
																<td class="nr11" id="top-sprocket_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">상부 베어링</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2"></td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">육안점검</td>
																<td class="nr6" id="top-bearing_1_oil"></td>
																<td class="nr7" id="top-bearing_2_oil"></td>
																<td class="nr8" id="top-bearing_3_oil"></td>
																<td class="nr9" id="top-bearing_4_oil"></td>
																<td class="nr10" id="top-bearing_5_oil"></td>
																<td class="nr11" id="top-bearing_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="top-bearing_1_a"></td>
																<td class="nr7" id="top-bearing_2_a"></td>
																<td class="nr8" id="top-bearing_3_a"></td>
																<td class="nr9" id="top-bearing_4_a"></td>
																<td class="nr10" id="top-bearing_5_a"></td>
																<td class="nr11" id="top-bearing_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">하부 스프라켓</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2">110 ~ 77</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">V/C 측정</td>
																<td class="nr6" id="bottom-sprocket_1_oil"></td>
																<td class="nr7" id="bottom-sprocket_2_oil"></td>
																<td class="nr8" id="bottom-sprocket_3_oil"></td>
																<td class="nr9" id="bottom-sprocket_4_oil"></td>
																<td class="nr10" id="bottom-sprocket_5_oil"></td>
																<td class="nr11" id="bottom-sprocket_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="bottom-sprocket_1_a"></td>
																<td class="nr7" id="bottom-sprocket_2_a"></td>
																<td class="nr8" id="bottom-sprocket_3_a"></td>
																<td class="nr9" id="bottom-sprocket_4_a"></td>
																<td class="nr10" id="bottom-sprocket_5_a"></td>
																<td class="nr11" id="bottom-sprocket_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">하부 기어축</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2">60 ~ 54</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">V/C 측정</td>
																<td class="nr6" id="bottom-gear_1_oil"></td>
																<td class="nr7" id="bottom-gear_2_oil"></td>
																<td class="nr8" id="bottom-gear_3_oil"></td>
																<td class="nr9" id="bottom-gear_4_oil"></td>
																<td class="nr10" id="bottom-gear_5_oil"></td>
																<td class="nr11" id="bottom-gear_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="bottom-gear_1_a"></td>
																<td class="nr7" id="bottom-gear_2_a"></td>
																<td class="nr8" id="bottom-gear_3_a"></td>
																<td class="nr9" id="bottom-gear_4_a"></td>
																<td class="nr10" id="bottom-gear_5_a"></td>
																<td class="nr11" id="bottom-gear_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">하부베어링</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2"></td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">육안점검</td>
																<td class="nr6" id="bottom-bearing_1_oil"></td>
																<td class="nr7" id="bottom-bearing_2_oil"></td>
																<td class="nr8" id="bottom-bearing_3_oil"></td>
																<td class="nr9" id="bottom-bearing_4_oil"></td>
																<td class="nr10" id="bottom-bearing_5_oil"></td>
																<td class="nr11" id="bottom-bearing_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="bottom-bearing_1_a"></td>
																<td class="nr7" id="bottom-bearing_2_a"></td>
																<td class="nr8" id="bottom-bearing_3_a"></td>
																<td class="nr9" id="bottom-bearing_4_a"></td>
																<td class="nr10" id="bottom-bearing_5_a"></td>
																<td class="nr11" id="bottom-bearing_6_a"></td>
																<td></td>
															</tr>
															<tr>
																<td class="nr1" rowspan="2">체인레일</td>
																<td class="nr2">유조컨베어</td>
																<td class="nr3" colspan="2" rowspan="2">100 ~ 40</td>
																<td class="nr4">mm</td>
																<td class="nr5" rowspan="2">V/C 측정</td>
																<td class="nr6" id="chain_1_oil"></td>
																<td class="nr7" id="chain_2_oil"></td>
																<td class="nr8" id="chain_3_oil"></td>
																<td class="nr9" id="chain_4_oil"></td>
																<td class="nr10" id="chain_5_oil"></td>
																<td class="nr11" id="chain_6_oil"></td>
																<td class="nr12"></td>
															</tr>
															<tr>
																<td>중간세정기</td>
																<td>mm</td>
																<td class="nr6" id="chain_1_a"></td>
																<td class="nr7" id="chain_2_a"></td>
																<td class="nr8" id="chain_3_a"></td>
																<td class="nr9" id="chain_4_a"></td>
																<td class="nr10" id="chain_5_a"></td>
																<td class="nr11" id="chain_6_a"></td>
																<td></td>
															</tr>
														</tbody>
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
		<!-- <div id="reg_div" style="display:none;" title="등록">
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
		</div> -->
		
		
		
	</div>

	<script>
	
	$(function(){
		date_search();
		
		
		/* // 클릭 이벤트
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
	    }); */
		//
	})
	
	$.datepicker.formatDate("yy-mm-dd");
		$(".datepicker").datepicker({
			dateFormat: "yy-mm-dd",
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
		});
	
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
					
					$("#s_sdate").val(rsAr[0].b_date);
					$("#t_sdate").val(rsAr[0].lastYear);
					$("#t_edate").val(rsAr[0].b_date);
					//$("#s_sdate").val(rsAr[0].y_date);
					//$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
					//$("#s_stime").val("08:00:00");
					//$("#s_stime").val(rsAr[0].n_time);
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					//$("#s_edate").val(rsAr[0].n_date);
					//$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					//$("#s_etime").val(rsAr[0].n_time);
					//$("#s_etime").val("08:00:00");
					getList();
					getTotalList();
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
		
	function getList(){
		$.ajax({
            type: "POST",
            dataType : "json",
            url: "m04/s04/select_m04s04.jsp",  // 실제 JSP 파일의 경로로 변경
            data: { hogi: $("#hogi").val(),
            	date: $("#s_sdate").val()
            	},
            success: function(response) {
                if (response.status === "ok") {
                    var rows = response.rows;
                    console.log(rows);
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i].inspection_item;
                        $("#" + item + "_oil").val(rows[i].oil_value);
                        $("#" + item + "_oil_bigo").val(rows[i].oil_bigo);
                        $("#" + item + "_a").val(rows[i].a_value);
                        $("#" + item + "_a_bigo").val(rows[i].a_bigo);
                    }
                } else {
                    alert("Error: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
		
	}
	$('#saveButton').click(function() {
        insertList();
    });
	$('#refreshButton').click(function() {
        date_search();
    });
	
	function getTotalList(){
		$.ajax({
            type: "POST",
            dataType : "json",
            data:{
            	sdate: $("#t_sdate").val(),
            	edate: $("#t_edate").val()
            },
            url: "m04/s04/select_total_m04s04.jsp", 
            success: function(response) {
            	$("td[id*='_oil'], td[id*='_a']").text("");
                if (response.status === "ok") {
                    var rows = response.rows;
                    for (var i = 0; i < rows.length; i++) {
                        var item = rows[i].inspection_item;
                        var hogiPrefix = "_" + rows[i].hogi;
                        $("#" + item + hogiPrefix + "_oil").text(rows[i].oil_value);
                        $("#" + item + hogiPrefix + "_a").text(rows[i].a_value);
                    }
                } else {
                    alert("Error: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
		
	}
	
	function exportExcel(){
		$.ajax({
            type: "POST",
            data:{
            	sdate: $("#t_sdate").val(),
            	edate: $("#t_edate").val()
            },
            url: "m04/s04/export_m04s04_excel.jsp", 
            success: function(response) {
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
		
	}
	
	
	
	function insertList(){
		var formDataArray = $('#inspectionForm').serializeArray();
		formDataArray.push({name: "date",value: $("#s_sdate").val()});
		formDataArray.push({name: "hogi",value: $("#hogi").val()});
		$.ajax({
			type : "POST",
			url : "m04/s04/insert_m04s04.jsp",
			cache : false,
			data : formDataArray,
			success : function(rsJson) {
				alert('저장 성공');
			}
		})
	}
	/* function getTotalList(){
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
	} */
	
	/* function calcMonth() {
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
	} */

	
	
	
		/*다이얼로그*/
		/* var regDialog;
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
		}); */
		
		
		
		/* 이벤트 */
		$("#totalButton").on("click", function(){
			$("#totalButton").css("display", "none");
			$("#hogiButton").css("display", "inline-block");
			$("#excelBtn").css("display", "inline-block");
			
			$("#hogiCheck").css("display", "none");
			$("#checkTotal").css("display", "block");

			$("#totalButtonGroup").css("display", "inline-block");
			$("#hogiButtonGroup").css("display", "none");

			
		});
		$("#hogiButton").on("click", function(){
			$("#hogiButton").css("display", "none");
			$("#totalButton").css("display", "block");
			$("#excelBtn").css("display", "none");
			
			$("#checkTotal").css("display", "none");
			$("#hogiCheck").css("display", "block");

			$("#totalButtonGroup").css("display", "none");
			$("#hogiButtonGroup").css("display", "inline-block");
			
		});
		
		$("#t_sdate, #t_edate").on("change", function(){
			getTotalList();
		});
		$("#s_sdate, #hogi").on("change", function(){
			getList();
		});
		
		$("#excelBtn").on("click", function() {

			var form = document.forms["searchform"];
			console.log(form);
			form.action = "m04/s04/export_m04s04_excel.jsp";

			form.submit();

		});
		/*차트 불러오는 함수*/
	</script>

</body>
</html>