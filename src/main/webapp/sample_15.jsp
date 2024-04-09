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
	.tmp {
		overflow-x: auto;
	}

	.table {
		width: auto;
		table-layout: fixed;
		
	}
	
	th{
		text-align: center;
	}
	
	.col1{width:100px}		
	.col2{width:150px}		
	.col3{width:100px}		
	.col_day{width:50px}
			
	.col2-1{width:50px}		
	.col2-2{width:50px}		
	.col2-3{width:100px}
	.col2-4{width:100px}
	.col2-5{width:50px}
	
	
	
</style>




</head>

<body>

	<div class="tmp">
		<table class="table table-bordered table-hover">
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
			<tr>
				<th rowspan="2">소입<br>1존</th>
				<th rowspan="2">+50 ~ -150℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소입<br>2존</th>
				<th rowspan="2">+30 ~ -100℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소입<br>3존</th>
				<th rowspan="2">+-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소입<br>4존</th>
				<th rowspan="2">+-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소입<br>5존</th>
				<th rowspan="2">+-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">유조</th>
				<th rowspan="2">+10 ~ -30℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>

				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>유면높이</th>
				<th>하한</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">중간<br>세정기</th>
				<th rowspan="2">+-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>수면높이</th>
				<th>하한</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소려<br>1존</th>
				<th rowspan="2">+20 ~ -150℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소려<br>2존</th>
				<th rowspan="2">+20 ~ -30℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소려<br>3존</th>
				<th rowspan="2">+-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">소려<br>4존</th>
				<th rowspan="2">설정온도 +-10℃</th>
				<th>과승</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>과냉</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">CP</th>
				<th rowspan="2">+0.05℃</th>
				<th>상한</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>하한</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>특이사항</th>
				<td colspan="34"></td>
			</tr>
			<tr>
				<th>측정결과</th>
				<td colspan="34"></td>
			</tr>
		</table>
	</div>

	<div class="tmp">
		<table class="table table-bordered table-hover">
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
			<tr>
				<th rowspan="17">소<br>입<br>로</th>
				<th rowspan="3">1존</th>
				<th rowspan="3" colspan="2"></th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">2존</th>
				<th rowspan="3" colspan="2"></th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">3존</th>
				<th colspan="2">+- 7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">4존</th>
				<th colspan="2">+- 7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">5존</th>
				<th colspan="2">+- 7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">CP</th>
				<th rowspan="2">+-0.05</th>
				<th rowspan="2"></th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="2">변<br>성<br>로</th>
				<th>CO2</th>
				<th>+-0.05</th>
				<th></th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>DEW<br>POINT</th>
				<th>10+-7</th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3" colspan="2">소입유조</th>
				<th colspan="2">+-7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="12">소<br>려<br>로</th>
				<th rowspan="3">1존</th>
				<th rowspan="3"></th>
				<th rowspan="3"></th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">2존</th>
				<th colspan="2">+-7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">3존</th>
				<th colspan="2">+-7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th rowspan="3">4존</th>
				<th colspan="2">+-7.5℃</th>
				<th>설정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th>상한치</th>
				<th>하한치</th>
				<th>지시</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>측정</th>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
				<td class="col_day"></td>
			</tr>
			<tr>
				<th colspan="2">특이사항</th>
				<td colspan="34"></th>
			</tr>
			<tr>
				<th colspan="2">측정결과</th>
				<td colspan="34"></th>
			</tr>
		</table>
	</div>




</body>
</html>