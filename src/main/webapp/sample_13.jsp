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

table{
	table-layout: fixed;
}
th{
	background-color: #122d64;
	color:#FFFFFF;
	font-weight: 700;
	border-color: #FFFFFF !important;
}
th, td{
	text-align: center;
}

/* 1번째 테이블 */
#realtimeInfo1 tr > :nth-child(1) {
	width: 10%;
}

#realtimeInfo1 tr{
	height: 90px;
}

#realtimeInfo1 thead tr:nth-child(1){
	height: 50px;
}

/* 2번째 테이블 */
#realtimeInfo2 tr > :nth-child(1) {
	width: 10%;
}
#realtimeInfo2 tr > :nth-child(2) {
	width: 68%;
}
#realtimeInfo2 tr > :nth-child(3) {
	width: 15%;
}
#realtimeInfo2 tr > :nth-child(4) {
	width: 7%;
}
#realtimeInfo2 thead tr:nth-child(1){
	height: 50px;
}
#realtimeInfo2 tr{
	height: 90px;
}
#realtimeInfo2 td{
	font-size:25px;
	font-weight: 700;
}

/* 공통 */
.circle{
	width: 50px;
	height: 50px;
	border-radius: 50%;
}
.circle-sm{
	width: 30px;
	height: 30px;
	border-radius: 100%;
	font-size: 20px;
	padding: 0;
}
.square{
	width: 60px;
	height: 30px;
}
.square-sm{
	width: 50px;
	height: 30px;
}
.possible{
	color: green;
}

.impossible{
	color: red;
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
								<hr class="bread_under">
								<!-- 월간 -->
								<div style="width: 100%;" class="col-lg-12">
									<div class="box">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-list-alt"></i>
											</div>
											<h5 style="font-family: headline; font-size: 14pt;">투입 운전관리
												- 생산/설비 실시간 정보</h5>
										</header>

										<div id="collapse4" class="body">
											<div class="row">
												<div class="col-xs-6">
													<table id="realtimeInfo1" class="table table-bordered table-hover table-responsive">
														<thead>
															<tr>
																<th></th>
																<th>1호기</th>
																<th>2호기</th>
																<th>3호기</th>
																<th>4호기</th>
																<th>5호기</th>
																<th>6호기</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>투입 Flag</th>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
															</tr>
															<tr>
																<th>대기위치<br>D9610~5<br>-><br>M2010</th>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-danger square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-danger circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
															</tr>
															<tr>
																<th>투입위치<br>D9616~21<br>-><br>M2012</th>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-success circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-danger square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<button class="btn btn-danger circle-sm"></button>
																		<i class="glyphicon glyphicon-arrow-right"></i>
																		<button class="btn btn-success square-sm"></button>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default square">SET</button>
																	</div>
																</td>
															</tr>
															<tr>
																<th>투입버튼</th>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
																<td>
																	<button class="btn btn-primary square"></button>
																</td>
															</tr>
															<tr>
																<th>투입요청<br>가능</th>
																<td>
																	<div class="row">
																		<div class="impossible">
																			불가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<div class="impossible">
																			불가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<div class="impossible">
																			불가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<div class="impossible">
																			불가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<div class="possible">
																			가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
																<td>
																	<div class="row">
																		<div class="impossible">
																			불가능
																		</div>
																	</div>
																	<div class="row" style="margin-top:10px;">
																		<button class="btn btn-default circle-sm">3</button>
																		<span>빈박스</span>
																	</div>
																</td>
															</tr>
															<tr>
																<th>M2077</th>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
															</tr>
															<tr>
																<th>M2082</th>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-success circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
																<td><button class="btn btn-danger circle"></button></td>
															</tr>
														</tbody>
													
													</table>
												</div>
												<div class="col-xs-6">
													<table id="realtimeInfo2" class="table table-bordered table-hover table-responsive">
													
														<thead>
															<tr>
																<th>자동투입</th>
																<th>품번</th>
																<th>로트</th>
																<th>위치</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>1호기<br>수동</th>
																<td>BS0BP08024400</td>
																<td>SF74335</td>
																<td>166</td>
															</tr>
															<tr>
																<th>2호기<br>자동</th>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>3호기<br>수동</th>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>4호기<br>자동</th>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>5호기<br>자동</th>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>6호기<br>자동</th>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>창고위치</th>
																<td></td>
																<td></td>
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
	</div>

	<script>
		// for ESM environment, need to import modules as:
		// import bb, {gauge} from "billboard.js";

		/*다이얼로그*/

		/*차트 불러오는 함수*/
	</script>

</body>
</html>