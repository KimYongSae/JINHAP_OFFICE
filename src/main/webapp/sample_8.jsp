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
  background-color: black;
  border: 3px solid;
  border-color:gray;
  
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
											<h5 style="font-family: headline; font-size: 14pt;">생산관리
												- 생산 모니터링 현황</h5>
										</header>
					
										<header style="background:white; height:43px;">
                <form class="form-inline" role="form" id="searchform" 
                name="searchform" method="post" autocomplete="off" onsubmit="event.preventDefault();">
                
						<div class="form-group">
							<button class="btn btn-info" id="btn1-2" style="margin-left:50px; margin-top:5px;">
							1호기 - 2호기
							</button>
							<button class="btn btn-default" id="btn3-4" style="margin-left:50px; margin-top:5px;">
							3호기 - 4호기
							</button>
							<button class="btn btn-default" id="btn5-6" style="margin-left:50px; margin-top:5px;">
							5호기 - 6호기
							</button>
						</div>				
															
				</form>
            </header>

										<div id="collapse4" class="body">
											<div class="image-container" id="hogi1-2">
												<img src="resources/img/temp_1-2.png" class="img-responsive" style="height:650px" alt="이미지 설명">
													<div class="btn btn-warning" style="position:absolute;top: 10%; left: 3%;">열처리 1호기</div>
													<div class="text-overlay hogi1 wait" style="top: 25%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 5%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 2%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 8%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 2%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 8%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 2%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 8%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 2%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 8%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 23%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 13%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 2%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 8%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 2%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 8%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 2%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 8%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 2%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 8%; left: 75.5%;">소려00008</div>
													
													<div class="btn btn-warning" style="position:absolute;top: 60%; left: 3%;">열처리 2호기</div>
													<div class="text-overlay hogi1 wait" style="top: 75.0%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 55.0%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 52.0%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 58.0%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 52.0%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 58.0%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 52.0%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 58.0%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 52.0%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 58.0%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 73.0%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 63.0%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 52.0%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 58.0%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 52.0%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 58.0%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 52.0%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 58.0%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 52.0%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 58.0%; left: 75.5%;">소려00008</div>

											</div>
											<div class="image-container" id="hogi3-4" style="display:none;">
												<img src="resources/img/temp_3-4.png" class="img-responsive" style="height:650px" alt="이미지 설명">
													<div class="btn btn-warning" style="position:absolute;top: 10%; left: 3%;">열처리 3호기</div>
													<div class="text-overlay hogi1 wait" style="top: 25%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 5%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 2%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 8%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 2%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 8%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 2%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 8%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 2%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 8%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 23%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 13%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 2%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 8%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 2%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 8%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 2%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 8%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 2%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 8%; left: 75.5%;">소려00008</div>
													
													<div class="btn btn-warning" style="position:absolute;top: 60%; left: 3%;">열처리 4호기</div>
													<div class="text-overlay hogi1 wait" style="top: 75.0%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 55.0%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 52.0%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 58.0%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 52.0%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 58.0%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 52.0%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 58.0%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 52.0%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 58.0%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 73.0%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 63.0%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 52.0%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 58.0%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 52.0%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 58.0%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 52.0%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 58.0%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 52.0%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 58.0%; left: 75.5%;">소려00008</div>

											</div>
											<div class="image-container" id="hogi5-6" style="display:none">
												<img src="resources/img/temp_5-6.png" class="img-responsive" style="height:650px" alt="이미지 설명">
													<div class="btn btn-warning" style="position:absolute;top: 10%; left: 3%;">열처리 5호기</div>
													<div class="text-overlay hogi1 wait" style="top: 25%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 5%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 2%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 8%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 2%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 8%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 2%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 8%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 2%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 8%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 23%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 13%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 2%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 8%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 2%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 8%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 2%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 8%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 2%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 8%; left: 75.5%;">소려00008</div>
													
													<div class="btn btn-warning" style="position:absolute;top: 60%; left: 3%;">열처리 6호기</div>
													<div class="text-overlay hogi1 wait" style="top: 75.0%; left: 5%;">대기위치000</div>
													<div class="text-overlay hogi1 hoper" style="top: 55.0%; left: 10%;">호퍼투입000</div>
													<div class="text-overlay hogi1 q1" style="top: 52.0%; left: 17%;">소입00001</div>
													<div class="text-overlay hogi1 q2" style="top: 58.0%; left: 19.5%;">소입00002</div>
													<div class="text-overlay hogi1 q3" style="top: 52.0%; left: 22%;">소입00003</div>
													<div class="text-overlay hogi1 q4" style="top: 58.0%; left: 24.5%;">소입00004</div>
													<div class="text-overlay hogi1 q5" style="top: 52.0%; left: 27%;">소입00005</div>
													<div class="text-overlay hogi1 q6" style="top: 58.0%; left: 29.5%;">소입00006</div>
													<div class="text-overlay hogi1 q7" style="top: 52.0%; left: 32%;">소입00007</div>
													<div class="text-overlay hogi1 q8" style="top: 58.0%; left: 34.5%;">소입00008</div>
													<div class="text-overlay hogi1 oil" style="top: 73.0%; left: 40%;">소입유조000</div>
													<div class="text-overlay hogi1 mw" style="top: 63.0%; left: 46%;">중간세정000</div>
													<div class="text-overlay hogi1 t1" style="top: 52.0%; left: 58%;">소려00001</div>
													<div class="text-overlay hogi1 t2" style="top: 58.0%; left: 60.5%;">소려00002</div>
													<div class="text-overlay hogi1 t3" style="top: 52.0%; left: 63%;">소려00003</div>
													<div class="text-overlay hogi1 t4" style="top: 58.0%; left: 65.5%;">소려00004</div>
													<div class="text-overlay hogi1 t5" style="top: 52.0%; left: 68%;">소려00005</div>
													<div class="text-overlay hogi1 t6" style="top: 58.0%; left: 70.5%;">소려00006</div>
													<div class="text-overlay hogi1 t7" style="top: 52.0%; left: 73%;">소려00007</div>
													<div class="text-overlay hogi1 t8" style="top: 58.0%; left: 75.5%;">소려00008</div>

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

		/* 함수 */
		function toggleVisibility(showId, ...hideIds) {
		    $(showId).show();
		    $(hideIds.join(', ')).hide();
		    
		    // 모든 버튼을 기본 상태로 설정하고 클릭된 버튼만 특별 상태로 설정
		    $(".btn").removeClass("btn-info").addClass("btn-default"); // 모든 버튼을 기본 상태로
		    $(showId.replace('hogi', 'btn')).removeClass("btn-default").addClass("btn-info"); // 클릭된 버튼만 변경
		}
		
		$("#btn1-2").click(function() {
		    toggleVisibility("#hogi1-2", "#hogi3-4", "#hogi5-6");
		});
		$("#btn3-4").click(function() {
		    toggleVisibility("#hogi3-4", "#hogi1-2", "#hogi5-6");
		});
		$("#btn5-6").click(function() {
		    toggleVisibility("#hogi5-6", "#hogi3-4", "#hogi1-2");
		});

		
		/*이벤트*/

		/* $("#btn1-2").click(function{
		    $("#hogi1-2").show;
		    $("#hogi3-4").hide;
		    $("#hogi5-6").hide;
		    $("#btn1-2").removeClass("btn-primary");
		    $("#btn1-2").addClass("btn-info");
		    $("#btn3-4").removeClass("btn-info");
		    $("#btn3-4").addClass("btn-primary");
		    $("#btn5-6").removeClass("btn-info");
		    $("#btn5-6").addClass("btn-primary");
		}) */
		
		
	</script>

</body>
</html>