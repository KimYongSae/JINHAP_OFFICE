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
	th{
		background-color: #24FCFF; text-align : center;
	}
	td{
		text-align : right;
	}
</style>

</head>

<body onload="init();" data-offset="60" data-target=".navbar" style="background:white;">
	<div id="collapse4" class="body" style="height: 910px;">
			<div class="row">
              <table id="temp"
               class="table table-bordered table-hover table-responsive scrolltbody"
               style= "font-size: 30px; width: 1000px; margin: auto; height: 850px;">
					
						<tr>
							<th rowspan = "2" style="background-color: white;">1호기(시간당 1000kg)</th>
							<th>전 LOT품명</th>
							<td colspan = "2"></td>
						</tr>
						<tr>
							<th>현 LOT품명</th>
							<td colspan = "2"></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2">주간<br>08:00 ~ 20:00</th>
							<th>목표 생산량</th>
							<td>12,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td></td>
							<th>진도율 (%)</th>
							<td></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td></td>
							<th>로트수</th>
							<td></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2">야간<br>20:00 ~ 08:00</th>
							<th>목표 생산량</th>
							<td>12,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td></td>
							<th>진도율 (%)</th>
							<td></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td></td>
							<th>로트수</th>
							<td></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th colspan = "4">합계</th>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td></td>
							<th>진도율 (%)</th>
							<td></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td></td>
							<th>로트수</th>
							<td></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
				</table>
			</div>
		</div>
		
	<script>

	/*페이지 로드*/

	$(function(){
		$("#loading").show();
	});
	
	</script>

</body>
</html>