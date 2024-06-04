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

thead th {
	background-color: #122d64;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	text-align: center;
	font-size: 16pt;
	font-family: headline;
	font-weight: 700;
}
tbody th {
	text-align: center;
}
.r1{
	width:10%;
}
.r2{
	width:10%;
}
.r3{
	width:15%;
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
											<table class="table table-bordered text-center">
												<thead>
													<tr>
														<th class="r1" rowspan="2"></th>
														<th class="r2" rowspan="2">시간</th>
														<th id="first_hogi" colspan="2">1호기</th>
														<th class="r2" rowspan="2">시간</th>
														<th id="second_hogi" colspan="2">2호기</th>
													</tr>
													<tr>
														<th class="r3">LOT</th>
														<th class="r3">품번</th>
														<th class="r3">LOT</th>
														<th class="r3">품번</th>
													</tr>
													
												</thead>
												<tbody>
													<tr>
														<th>호퍼 투입</td>
														<td id = "stime-f-1"></td>
														<td id = "lot-f-1"></td>
														<td id = "pname-f-1"></td>
														<td id = "stime-s-1"></td>
														<td id = "lot-s-1"></td>
														<td id = "pname-s-1"></td>
													</tr>
													<tr>
														<th>소입로 구간_1</td>
														<td id = "stime-f-2"></td>
														<td id = "lot-f-2"></td>
														<td id = "pname-f-2"></td>
														<td id = "stime-s-2"></td>
														<td id = "lot-s-2"></td>
														<td id = "pname-s-2"></td>
													</tr>
													<tr>
														<th>소입로 구간_2</td>
														<td id = "stime-f-3"></td>
														<td id = "lot-f-3"></td>
														<td id = "pname-f-3"></td>
														<td id = "stime-s-3"></td>
														<td id = "lot-s-3"></td>
														<td id = "pname-s-3"></td>
													</tr>
													<tr>
														<th>소입로 구간_3</td>
														<td id = "stime-f-4"></td>
														<td id = "lot-f-4"></td>
														<td id = "pname-f-4"></td>
														<td id = "stime-s-4"></td>
														<td id = "lot-s-4"></td>
														<td id = "pname-s-4"></td>
													</tr>
													<tr>
														<th>소입로 구간_4</td>
														<td id = "stime-f-5"></td>
														<td id = "lot-f-5"></td>
														<td id = "pname-f-5"></td>
														<td id = "stime-s-5"></td>
														<td id = "lot-s-5"></td>
														<td id = "pname-s-5"></td>
													</tr>
													<tr>
														<th>소입로 구간_5</td>
														<td id = "stime-f-6"></td>
														<td id = "lot-f-6"></td>
														<td id = "pname-f-6"></td>
														<td id = "stime-s-6"></td>
														<td id = "lot-s-6"></td>
														<td id = "pname-s-6"></td>
													</tr>
													<tr>
														<th>소입로 구간_6</td>
														<td id = "stime-f-7"></td>
														<td id = "lot-f-7"></td>
														<td id = "pname-f-7"></td>
														<td id = "stime-s-7"></td>
														<td id = "lot-s-7"></td>
														<td id = "pname-s-7"></td>
													</tr>
													<tr>
														<th>소입로 구간_7</td>
														<td id = "stime-f-8"></td>
														<td id = "lot-f-8"></td>
														<td id = "pname-f-8"></td>
														<td id = "stime-s-8"></td>
														<td id = "lot-s-8"></td>
														<td id = "pname-s-8"></td>
													</tr>
													<tr>
														<th>소입로 구간_8</td>
														<td id = "stime-f-9"></td>
														<td id = "lot-f-9"></td>
														<td id = "pname-f-9"></td>
														<td id = "stime-s-9"></td>
														<td id = "lot-s-9"></td>
														<td id = "pname-s-9"></td>
													</tr>
													<tr>
														<th>소입유조</td>
														<td id = "stime-f-10"></td>
														<td id = "lot-f-10"></td>
														<td id = "pname-f-10"></td>
														<td id = "stime-s-10"></td>
														<td id = "lot-s-10"></td>
														<td id = "pname-s-10"></td>
													</tr>
													<tr>
														<th>중간세정</td>
														<td id = "stime-f-11"></td>
														<td id = "lot-f-11"></td>
														<td id = "pname-f-11"></td>
														<td id = "stime-s-11"></td>
														<td id = "lot-s-11"></td>
														<td id = "pname-s-11"></td>
													</tr>
													<tr>
														<th>소려로 구간_1</td>
														<td id = "stime-f-12"></td>
														<td id = "lot-f-12"></td>
														<td id = "pname-f-12"></td>
														<td id = "stime-s-12"></td>
														<td id = "lot-s-12"></td>
														<td id = "pname-s-12"></td>
													</tr>
													<tr>
														<th>소려로 구간_2</td>
														<td id = "stime-f-13"></td>
														<td id = "lot-f-13"></td>
														<td id = "pname-f-13"></td>
														<td id = "stime-s-13"></td>
														<td id = "lot-s-13"></td>
														<td id = "pname-s-13"></td>
													</tr>
													<tr>
														<th>소려로 구간_3</td>
														<td id = "stime-f-14"></td>
														<td id = "lot-f-14"></td>
														<td id = "pname-f-14"></td>
														<td id = "stime-s-14"></td>
														<td id = "lot-s-14"></td>
														<td id = "pname-s-14"></td>
													</tr>
													<tr>
														<th>소려로 구간_4</td>
														<td id = "stime-f-15"></td>
														<td id = "lot-f-15"></td>
														<td id = "pname-f-15"></td>
														<td id = "stime-s-15"></td>
														<td id = "lot-s-15"></td>
														<td id = "pname-s-15"></td>
													</tr>
													<tr>
														<th>소려로 구간_5</td>
														<td id = "stime-f-16"></td>
														<td id = "lot-f-16"></td>
														<td id = "pname-f-16"></td>
														<td id = "stime-s-16"></td>
														<td id = "lot-s-16"></td>
														<td id = "pname-s-16"></td>
													</tr>
													<tr>
														<th>소려로 구간_6</td>
														<td id = "stime-f-17"></td>
														<td id = "lot-f-17"></td>
														<td id = "pname-f-17"></td>
														<td id = "stime-s-17"></td>
														<td id = "lot-s-17"></td>
														<td id = "pname-s-17"></td>
													</tr>
													<tr>
														<th>소려로 구간_7</td>
														<td id = "stime-f-18"></td>
														<td id = "lot-f-18"></td>
														<td id = "pname-f-18"></td>
														<td id = "stime-s-18"></td>
														<td id = "lot-s-18"></td>
														<td id = "pname-s-18"></td>
													</tr>
													<tr>
														<th>소려로 구간_8</td>
														<td id = "stime-f-19"></td>
														<td id = "lot-f-19"></td>
														<td id = "pname-f-19"></td>
														<td id = "stime-s-19"></td>
														<td id = "lot-s-19"></td>
														<td id = "pname-s-19"></td>
													</tr>
													<tr>
														<th>소려로 구간_9</td>
														<td id = "stime-f-20"></td>
														<td id = "lot-f-20"></td>
														<td id = "pname-f-20"></td>
														<td id = "stime-s-20"></td>
														<td id = "lot-s-20"></td>
														<td id = "pname-s-20"></td>
													</tr>
													<tr>
														<th>소려로 구간_10</td>
														<td id = "stime-f-21"></td>
														<td id = "lot-f-21"></td>
														<td id = "pname-f-21"></td>
														<td id = "stime-s-21"></td>
														<td id = "lot-s-21"></td>
														<td id = "pname-s-21"></td>
													</tr>
												</tbody>
												
											</table>

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
			getList("1-2");
		})
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
		    getList("1-2");
		});
		$("#btn3-4").click(function() {
		    toggleVisibility("#hogi3-4", "#hogi1-2", "#hogi5-6");
		    getList("3-4");
		});
		$("#btn5-6").click(function() {
		    toggleVisibility("#hogi5-6", "#hogi3-4", "#hogi1-2");
		    getList("5-6");
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
		
		
		function getList(hogiValue){
			$("tbody td").text("");
			switch(hogiValue){
			case "1-2" :
				$("#first_hogi").text("1호기");
				$("#second_hogi").text("2호기");
				break;
			case "3-4" :
				$("#first_hogi").text("3호기");
				$("#second_hogi").text("4호기");
				break;
			case "5-6" :
				$("#first_hogi").text("5호기");
				$("#second_hogi").text("6호기");
				break;
				
			}
			
			$.ajax({
				type : "POST",
				url : "m01/s07/select_m01s07.jsp",
				cache : false,
				dataType : "json",
				data:{
					hogi : hogiValue,
				},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
							for(var i=0; i<rsAr.length; i++){
								var stime = new Date(rsAr[i].stime);
								var now = new Date();
								var timeDiff = (now - stime) / 60000;
								var tenMin = Math.floor(timeDiff / 10) + 1;
								var first_second = "";
								if(["1", "3", "5"].includes(rsAr[i].hogi)) {
									first_second = "f";
								} else{
									first_second = "s";
								}
								
								$("#stime-"+first_second+"-"+tenMin).text(rsAr[i].stime);
								$("#lot-"+first_second+"-"+tenMin).text(rsAr[i].lot);
								$("#pname-"+first_second+"-"+tenMin).text(rsAr[i].item_cd);
								console.log("#stime-"+first_second+"-"+tenMin);
								
							}
						
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
		
		
		
		
		
	</script>

</body>
</html>