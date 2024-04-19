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
  height: 750px;
}

.text-overlay {
  position: absolute;
  padding: 2px 4px;
  border-radius: 4px;
}
th{
	width: 65px;
	border: 1px solid black;
	text-align: center;
	color: black;
	background-color: white;
}

td{
	border: 1px solid black;
	text-align: center;
	color: white;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 2px 4px;
}
.label{
	font-size: 25px;
	width: 150px;
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
											<h5 style="font-family: headline; font-size: 14pt;">모니터링
												- 통합모니터링</h5>
										</header>

										<div id="collapse4" class="body">
											<div class="image-container">
												<img src="resources/img/layout3.jpg" class="img-responsive" alt="이미지 설명">
													<div class="label label-default text-overlay" 
													style="top: 3%; left: 3%; width:100px;">6호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk6" style="top: 3%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:9%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_6"></td>
															<td id="q2_6"></td>
															<td id="q3_6"></td>
															<td id="q4_6"></td>
															<td id="q5_6"></td>
															<td id="cp_6"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:9%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_6"></td>
															<td id="a_6"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:9%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_6"></td>
															<td id="t2_6"></td>
															<td id="t3_6"></td>
															<td id="t4_6"></td>
														</tr>
													</table>
													<div class="label label-default text-overlay" 
													style="top: 17%; left: 3%; width:100px;">5호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk5" style="top: 17%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:24%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_5"></td>
															<td id="q2_5"></td>
															<td id="q3_5"></td>
															<td id="q4_5"></td>
															<td id="q5_5"></td>
															<td id="cp_5"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:24%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_5"></td>
															<td id="a_5"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:24%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_5"></td>
															<td id="t2_5"></td>
															<td id="t3_5"></td>
															<td id="t4_5"></td>
														</tr>
													</table>
													<div class="label label-default text-overlay" 
													style="top: 34%; left: 3%; width:100px;">4호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk4" style="top: 34%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:41%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_4"></td>
															<td id="q2_4"></td>
															<td id="q3_4"></td>
															<td id="q4_4"></td>
															<td id="q5_4"></td>
															<td id="cp_4"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:41%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_4"></td>
															<td id="a_4"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:41%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_4"></td>
															<td id="t2_4"></td>
															<td id="t3_4"></td>
															<td id="t4_4"></td>
														</tr>
													</table>
													<div class="label label-default text-overlay" 
													style="top: 50%; left: 3%; width:100px;">3호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk3" style="top: 50%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:57%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_3"></td>
															<td id="q2_3"></td>
															<td id="q3_3"></td>
															<td id="q4_3"></td>
															<td id="q5_3"></td>
															<td id="cp_3"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:57%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_3"></td>
															<td id="a_3"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:57%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_3"></td>
															<td id="t2_3"></td>
															<td id="t3_3"></td>
															<td id="t4_3"></td>
														</tr>
													</table>
													<div class="label label-default text-overlay" 
													style="top: 67%; left: 3%; width:100px;">2호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk2" style="top: 67%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:74%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_2"></td>
															<td id="q2_2"></td>
															<td id="q3_2"></td>
															<td id="q4_2"></td>
															<td id="q5_2"></td>
															<td id="cp_2"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:74%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_2"></td>
															<td id="a_2"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:74%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_2"></td>
															<td id="t2_2"></td>
															<td id="t3_2"></td>
															<td id="t4_2"></td>
														</tr>
													</table>
													<div class="label label-default text-overlay" 
													style="top: 83%; left: 3%; width:100px;">1호기</div>
													<div class="label label-success text-overlay" 
													id="autoChk1" style="top: 83%; left: 9%;">자동운전중</div>
													<table class="text-overlay" style="top:90%; left: 25%;">
														<tr>
															<th>소입1존</th>
															<th>소입2존</th>
															<th>소입3존</th>
															<th>소입4존</th>
															<th>소입5존</th>
															<th>CP</th>
														</tr>
														<tr>
															<td id="q1_1"></td>
															<td id="q2_1"></td>
															<td id="q3_1"></td>
															<td id="q4_1"></td>
															<td id="q5_1"></td>
															<td id="cp_1"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:90%; left: 48%;">
														<tr>
															<th>유조</th>
															<th>세정기</th>
														</tr>
														<tr>
															<td id="oil_1"></td>
															<td id="a_1"></td>
														</tr>
													</table>
													<table class="text-overlay" style="top:90%; left: 63%;">
														<tr>
															<th>소려1존</th>
															<th>소려2존</th>
															<th>소려3존</th>
															<th>소려4존</th>
														</tr>
														<tr>
															<td id="t1_1"></td>
															<td id="t2_1"></td>
															<td id="t3_1"></td>
															<td id="t4_1"></td>
														</tr>
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
		getTemp();
		setInterval(getTemp, 1000 * 60);
	})
	
	function getTemp(){
		$.ajax({
			type : "POST",
			url : "sample/sample_7/select_sample_7.jsp", 
			cache : false,
			dataType : "json",
			success : function(rsJson) {
				var rsAr = rsJson.rows;
				
				for(var i=0; i<rsAr.length; i++){
					var hogi = rsAr[i].hogi;
					
					$("#autoChk"+hogi).toggleClass("label-success", rsAr[i].autoChk == 1);
					$("#autoChk"+hogi).toggleClass("label-danger", rsAr[i].autoChk == 0);
					

					if (rsAr[i].autoChk == 1) {
					    $("#autoChk" + hogi).text("자동운전중");
					} else if (rsAr[i].autoChk == 0) {
					    $("#autoChk" + hogi).text("수동운전중");
					}
						
						
					$("#q1_"+hogi).text(rsAr[i].q1);
					$("#q2_"+hogi).text(rsAr[i].q2);
					$("#q3_"+hogi).text(rsAr[i].q3);
					$("#q4_"+hogi).text(rsAr[i].q4);
					$("#q5_"+hogi).text(rsAr[i].q5);
					$("#t1_"+hogi).text(rsAr[i].t1);
					$("#t2_"+hogi).text(rsAr[i].t2);
					$("#t3_"+hogi).text(rsAr[i].t3);
					$("#t4_"+hogi).text(rsAr[i].t4);
					$("#cp_"+hogi).text(rsAr[i].cp);
					$("#oil_"+hogi).text(rsAr[i].oil);
					$("#a_"+hogi).text(rsAr[i].a);
					
				}
			}
		})
	}
	
	
	
	</script>

</body>
</html>