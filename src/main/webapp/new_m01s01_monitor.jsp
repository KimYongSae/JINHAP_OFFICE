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

</style>

</head>

<body data-offset="60" data-target=".navbar" style="background:white;">
	<div id="collapse4" class="body" style="height: 910px;">
		<div class="row" style= "height: 300px;">
			<div class="col-xs-5">
			</div>			
		</div>
			<div class="row">
              <table id="temp"
               class="table table-bordered table-hover table-responsive">
					<thead>
					
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 150px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								현 생산량(Kg)
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								시간당 생산량(Kg)
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								시간당 진도율(%)
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								누적 진도율(%)
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								장입량 준수율(%)
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								로트수
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 20pt; font-family:headline;font-weight:700;">
								비가동 현황(시간)
							</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">1호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">2호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">3호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">4호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">5호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; 
							 font-size: 20pt; font-family:headline; font-weight:700;">6호기</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; 
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 150px; background-color: #E8E6FC;
							 font-size: 20pt; font-family:headline; font-weight:700;">합계</td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
							<td style="text-align: center; vertical-align: middle;
							 padding: 1px; height: 80px; width: 420px; background-color: #E8E6FC;
							 font-size:24pt; font-family:headline; font-weight:700;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
	<script>

	

	/*페이지 로드*/

	$(function(){
		$("#loading").show();
		
		now_search();
		
		dateInterval = setInterval('now_search()',1000);
		
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
							rsAr[0].n_time.substring(0,2)+"시"
							+
							" ~ "
							+
							(rsAr[0].n_time.substring(0,2) != "24" 
						        ? (parseInt(rsAr[0].n_time.substring(0,2)) + 1) + "시"
						        : "1시")
							);
					

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

	</script>

</body>
</html>