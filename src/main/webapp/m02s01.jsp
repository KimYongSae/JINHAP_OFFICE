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
<script src="resources/js/jquery.tablesorter.js"></script>

<!-- 추가한 부분 start-->

<!-- <script type="text/javascript" src="resources/js/jQuery.js"></script> -->
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

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css" />

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
#temp th {
	background-color: #122d64;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	text-align: center;
	font-size: 16pt;
	font-family: headline;
	font-weight: 700;
}

#temp td {
	text-align: right;
	height: 50px;
	font-size: 12pt;
	word-break: break-all;
}

.scrolltbody {
	display: block;
	/* width: 100%; */
	border-collapse: collapse;
	border: 0px solid #000;
}

.scrolltbody td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	/* width: 100%; */
	height: 600px;
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

<body onload="init();" data-offset="60" data-target=".navbar">
	<div id="loading" style="display: none;">
		<img id="loading-image" src="resources/img/loading2.gif"
			alt="Loading..." />
	</div>
	<div style="display: none;" id="alert-form" title="확인창">
		<span id="alertSpan"></span>
	</div>

	<div style="display: none;" id="file-form" title="파일 첨부">
		<form class="form-horizontal" id="upload" name="upload" method="post"
			enctype="multipart/form-data">
			<table class="no-style">
				<tr>
					<td colspan="2"><b>**파일첨부**</b></td>
				</tr>
				<tr>
					<td colspan="2">*엑셀파일만 업로드 가능합니다.</td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td><input type="hidden" id="filePath"
						class="file_input_textbox" readonly="readonly">

						<div class="file_input_div">
							<input type="file" id="file" name="file1"
								class="file_input_hidden form-control"
								onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						class="btn small btn-primary" onclick="condition_excel_import();"
						value="전송"></td>
				</tr>
			</table>
		</form>
	</div>

	<div style="display: none;" id="regFormDialog" title="신규등록">
		<form class="form-horizontal" id="regForm" name="regForm"
			method="post" enctype="multipart/form-data">
			<table id="temp"
				class="table table-bordered table-hover table-responsive ">
				<thead>
					<tr>
						<th rowspan="2" width="50">선택</th>
						<th rowspan="2" width="140">설비명</th>
						<th rowspan="2" width="200">품번</th>
						<th rowspan="2" width="300">품명</th>
						<th rowspan="2" width="100">강종</th>
						<th rowspan="2" width="70">T급</th>
						<th rowspan="2" width="130">진합로트</th>
						<th colspan="3" width="240">참고 기준정보</th>
						<th colspan="3" width="240">적용 기준정보</th>
						<th rowspan="2" width="90">기준<br>장입량
						</th>
						<th rowspan="2" width="80" style="font-size: 13pt">요구경도</th>
					</tr>
					<tr>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
					</tr>

				</thead>
				<!-- <tbody style="display : block; overflow-y: auto;"> -->
				<tbody id="reg_body" style="font-weight: 600;">
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk1" name="insert_chk1" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi1" name="reg_hogi1" style="font-family: headline; width:140;"
							value="Q01-HN01" disabled /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="reg_pnum" name="reg_pnum" style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="reg_pname" name="reg_pname" style="font-family: headline;" />
						</td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="reg_gang" name="reg_gang" style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="reg_t_gb" name="reg_t_gb" style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="reg_lot" name="reg_lot" style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin1" name="reg_q_temp_jin1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin1" name="reg_t_temp_jin1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin1" name="reg_cp_jin1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez1" name="reg_q_temp_ez1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez1" name="reg_t_temp_ez1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez1" name="reg_cp_ez1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight1" name="reg_weight1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness1" name="reg_hardness1"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk2" name="insert_chk2" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi2" name="reg_hogi2" style="font-family: headline; width:140;"
							value="Q01-HN02" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin2" name="reg_q_temp_jin2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin2" name="reg_t_temp_jin2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin2" name="reg_cp_jin2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez2" name="reg_q_temp_ez2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez2" name="reg_t_temp_ez2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez2" name="reg_cp_ez2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight2" name="reg_weight2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness2" name="reg_hardness2"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk3" name="insert_chk3" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi3" name="reg_hogi3" style="font-family: headline; width:140;"
							value="Q01-HN03" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin3" name="reg_q_temp_jin3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin3" name="reg_t_temp_jin3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin3" name="reg_cp_jin3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez3" name="reg_q_temp_ez3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez3" name="reg_t_temp_ez3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez3" name="reg_cp_ez3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight3" name="reg_weight3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness3" name="reg_hardness3"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk4" name="insert_chk4" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi4" name="reg_hogi4" style="font-family: headline; width:140;"
							value="Q01-HN04" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin4" name="reg_q_temp_jin4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin4" name="reg_t_temp_jin4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin4" name="reg_cp_jin4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez4" name="reg_q_temp_ez4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez4" name="reg_t_temp_ez4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez4" name="reg_cp_ez4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight4" name="reg_weight4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness4" name="reg_hardness4"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk5" name="insert_chk5" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi5" name="reg_hogi5" style="font-family: headline; width:140;"
							value="Q01-HN05" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin5" name="reg_q_temp_jin5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin5" name="reg_t_temp_jin5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin5" name="reg_cp_jin5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez5" name="reg_q_temp_ez5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez5" name="reg_t_temp_ez5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez5" name="reg_cp_ez5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight5" name="reg_weight5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness5" name="reg_hardness5"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="insert_chk6" name="insert_chk6" value="1" checked style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hogi6" name="reg_hogi6" style="font-family: headline; width:140;"
							value="Q01-HN06" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_jin6" name="reg_q_temp_jin6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_jin6" name="reg_t_temp_jin6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_jin6" name="reg_cp_jin6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_q_temp_ez6" name="reg_q_temp_ez6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_t_temp_ez6" name="reg_t_temp_ez6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="reg_cp_ez6" name="reg_cp_ez6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_weight6" name="reg_weight6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="reg_hardness6" name="reg_hardness6"
							style="font-family: headline;" /></td>
					</tr>
				</tbody>

			</table>

			<div class="text-center">
				<input type="button" class="btn small btn-primary"
					onclick="lineRegister();" value="등록">
			</div>

		</form>
	</div>

	<div style="display: none;" id="modifyFormDialog" title="수정">
		<form class="form-horizontal" id="modifyForm" name="modifyForm"
			method="post" enctype="multipart/form-data">
			<table id="temp"
				class="table table-bordered table-hover table-responsive ">
				<thead>
					<tr>
						<th rowspan="2" width="50">선택</th>
						<th rowspan="2" width="140">설비명</th>
						<th rowspan="2" width="200">품번</th>
						<th rowspan="2" width="300">품명</th>
						<th rowspan="2" width="100">강종</th>
						<th rowspan="2" width="70">T급</th>
						<th rowspan="2" width="130">진합로트</th>
						<th colspan="3" width="240">참고 기준정보</th>
						<th colspan="3" width="240">적용 기준정보</th>
						<th rowspan="2" width="90">기준<br>장입량
						</th>
						<th rowspan="2" width="80" style="font-size: 13pt">요구경도</th>
					</tr>
					<tr>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
					</tr>

				</thead>
				<!-- <tbody style="display : block; overflow-y: auto;"> -->
				<tbody style="font-weight: 600;">
					<!-- <tr>
						<td><select class="form-control input-sm" id="modify_hogi"
							name="modify_hogi"
							style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;"
							disabled>
								<option value="0">전체</option>	
								<option value="Q01-HN01">Q01-HN01</option>
								<option value="Q01-HN02">Q01-HN02</option>
								<option value="Q01-HN03">Q01-HN03</option>
								<option value="Q01-HN04">Q01-HN04</option>
								<option value="Q01-HN05">Q01-HN05</option>
								<option value="Q01-HN06">Q01-HN06</option>
						</select></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_pnum" name="modify_pnum"
							style="font-family: headline;" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_pname" name="modify_pname"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_gang" name="modify_gang"
							style="font-family: headline;" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_gb" name="modify_t_gb"
							style="font-family: headline;" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_lot" name="modify_lot" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin" name="modify_q_temp_jin"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin" name="modify_t_temp_jin"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin" name="modify_cp_jin"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez" name="modify_q_temp_ez"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez" name="modify_t_temp_ez"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez" name="modify_cp_ez"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight" name="modify_weight"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness" name="modify_hardness"
							style="font-family: headline;" /></td>
					</tr> -->
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk1" name="modify_chk1" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi1" name="modify_hogi1" style="font-family: headline; width:140;"
							value="Q01-HN01" disabled /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="modify_pnum" name="modify_pnum" disabled style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="modify_pname" name="modify_pname" style="font-family: headline;" />
						</td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="modify_gang" name="modify_gang" disabled style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="modify_t_gb" name="modify_t_gb" disabled style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="modify_lot" name="modify_lot" style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin1" name="modify_q_temp_jin1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin1" name="modify_t_temp_jin1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin1" name="modify_cp_jin1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez1" name="modify_q_temp_ez1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez1" name="modify_t_temp_ez1"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez1" name="modify_cp_ez1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight1" name="modify_weight1" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness1" name="modify_hardness1"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk2" name="modify_chk2" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi2" name="modify_hogi2" style="font-family: headline; width:140;"
							value="Q01-HN02" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin2" name="modify_q_temp_jin2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin2" name="modify_t_temp_jin2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin2" name="modify_cp_jin2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez2" name="modify_q_temp_ez2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez2" name="modify_t_temp_ez2"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez2" name="modify_cp_ez2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight2" name="modify_weight2" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness2" name="modify_hardness2"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk3" name="modify_chk3" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi3" name="modify_hogi3" style="font-family: headline; width:140;"
							value="Q01-HN03" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin3" name="modify_q_temp_jin3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin3" name="modify_t_temp_jin3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin3" name="modify_cp_jin3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez3" name="modify_q_temp_ez3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez3" name="modify_t_temp_ez3"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez3" name="modify_cp_ez3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight3" name="modify_weight3" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness3" name="modify_hardness3"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk4" name="modify_chk4" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi4" name="modify_hogi4" style="font-family: headline; width:140;"
							value="Q01-HN04" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin4" name="modify_q_temp_jin4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin4" name="modify_t_temp_jin4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin4" name="modify_cp_jin4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez4" name="modify_q_temp_ez4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez4" name="modify_t_temp_ez4"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez4" name="modify_cp_ez4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight4" name="modify_weight4" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness4" name="modify_hardness4"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk5" name="modify_chk5" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi5" name="modify_hogi5" style="font-family: headline; width:140;"
							value="Q01-HN05" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin5" name="modify_q_temp_jin5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin5" name="modify_t_temp_jin5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin5" name="modify_cp_jin5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez5" name="modify_q_temp_ez5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez5" name="modify_t_temp_ez5"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez5" name="modify_cp_ez5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight5" name="modify_weight5" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness5" name="modify_hardness5"
							style="font-family: headline;" /></td>
					</tr>
					<tr>
						<td style="text-align: center;">
						<input type="checkbox" id="modify_chk6" name="modify_chk6" value="1" style="transform: scale(2)">
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hogi6" name="modify_hogi6" style="font-family: headline; width:140;"
							value="Q01-HN06" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_jin6" name="modify_q_temp_jin6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_jin6" name="modify_t_temp_jin6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_jin6" name="modify_cp_jin6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_q_temp_ez6" name="modify_q_temp_ez6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_t_temp_ez6" name="modify_t_temp_ez6"
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="modify_cp_ez6" name="modify_cp_ez6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_weight6" name="modify_weight6" style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="modify_hardness6" name="modify_hardness6"
							style="font-family: headline;" /></td>
					</tr>
				</tbody>

			</table>

			<div class="text-center">
				<input type="button" class="btn small btn-primary"
					onclick="lineModify();" value="수정">
			</div>

		</form>
	</div>
	<div style="display: none;" id="deleteFormDialog" title="삭제">
		<form class="form-horizontal" id="deleteForm" name="deleteForm"
			method="post" enctype="multipart/form-data">
			<table id="temp"
				class="table table-bordered table-hover table-responsive ">
				<thead>
					<tr>
						<th rowspan="2" width="140">설비명</th>
						<th rowspan="2" width="200">품번</th>
						<th rowspan="2" width="300">품명</th>
						<th rowspan="2" width="100">강종</th>
						<th rowspan="2" width="70">T급</th>
						<th rowspan="2" width="130">진합로트</th>
						<th colspan="3" width="240">참고 기준정보</th>
						<th colspan="3" width="240">적용 기준정보</th>
						<th rowspan="2" width="90">기준<br>장입량
						</th>
						<th rowspan="2" width="80" style="font-size: 13pt">요구경도</th>
					</tr>
					<tr>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
						<th width="80" style="font-size: 13pt">소입온도</th>
						<th width="80" style="font-size: 13pt">소려온도</th>
						<th width="80">CP</th>
					</tr>

				</thead>
				<!-- <tbody style="display : block; overflow-y: auto;"> -->
				<tbody style="font-weight: 600;">
					<tr>
						<td><input type="text" class="form-control input-sm"
							id="delete_hogi" name="delete_hogi" style="font-family: headline; width:140;"
							value="Q01-HN01" disabled /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_pnum" name="delete_pnum" disabled style="font-family: headline;" /></td>
						<td rowspan="6"><input type="text" class="form-control input-sm"
							id="delete_pname" name="delete_pname" disabled style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="delete_gang" name="delete_gang" disabled style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_t_gb" name="delete_t_gb" disabled style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_lot" name="delete_lot" disabled style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_q_temp_jin" name="delete_q_temp_jin" disabled
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_t_temp_jin" name="delete_t_temp_jin" disabled
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_cp_jin" name="delete_cp_jin" disabled style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="delete_q_temp_ez" name="delete_q_temp_ez" disabled
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_t_temp_ez" name="delete_t_temp_ez" disabled
							style="font-family: headline;" /></td>
						<td><input type="text" class="form-control input-sm"
							id="delete_cp_ez" name="delete_cp_ez" disabled style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="delete_weight" name="delete_weight" disabled style="font-family: headline;" />
						</td>
						<td><input type="text" class="form-control input-sm"
							id="delete_hardness" name="delete_hardness" disabled
							style="font-family: headline;" /></td>
					</tr>
				</tbody>

			</table>

			<div class="text-center">
				<input type="button" class="btn small btn-primary"
					onclick="lineDelete();" value="삭제">
			</div>

		</form>
	</div>

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

								<div style="width: 100%;" class="col-lg-12">
									<div class="box">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-list-alt"></i>
											</div>
											<h5 style="font-size: 14pt; font-family: headline;">
												조건관리 - 생산조건관리</h5>
										</header>
										<header style="background: white; height: 43px;">
											<form class="form-inline" role="form" id="searchform"
												name="searchform" method="post" autocomplete="off">

												<!-- 설비 선택 -->
												<div class="form-group">
													<label class="control-label"
														style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">설비
														: </label>
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
														style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">품번
														: </label>
												</div>
												<div class="form-group">
													<select class="form-control" name="pnum" ID="pnum"
														style="color: #8C8C8C !important; padding-top: 4px; margin-top: 5px; width: 200px; height: 30px; font-size: 14px;"></select>
												</div>
												<div class="form-group">
													<label class="control-label"
														style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">강종
														: </label>
												</div>
												<div class="form-group">
													<select class="form-control" name="gang" ID="gang"
														style="color: #8C8C8C !important; padding-top: 4px; margin-top: 5px; width: 200px; height: 30px; font-size: 14px;"></select>
												</div>
												<div class="form-group">
													<label class="control-label"
														style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">T급
														: </label>
												</div>
												<div class="form-group">
													<select class="form-control" name="t_gb" ID="t_gb"
														style="color: #8C8C8C !important; padding-top: 4px; margin-top: 5px; width: 200px; height: 30px; font-size: 14px;"></select>
												</div>

												<div class="form-group">
													&nbsp;&nbsp;
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="searchbtn">
															<i class="fa fa-search"></i> 검 색
														</button>
													</div>
												</div>
												<div class="form-group">
													&nbsp;&nbsp;
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="registerBtn" onclick="registerDialogOpen();">
															신규등록</button>
													</div>
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="modifyBtn" onclick="modifyDialogOpen();">수정</button>
													</div>
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="deleteBtn" onclick="deleteDialogOpen();">삭제</button>
													</div>
													<div class="form-group">
														<button class="btn btn-default pull-right btn-sm"
															type="button"
															style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
															id="excelBtn">
															<i class="glyphicon glyphicon-save"></i> 엑셀다운로드
														</button>
													</div>
												</div>
												<div class="form-group">
													<button class="btn btn-default pull-right btn-sm"
														type="button"
														style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
														id="in_excel" onclick="excel_import_open();">
														<span class="glyphicon glyphicon-open"></span>엑셀업로드
													</button>
												</div>


											</form>
										</header>

										<div id="collapse4" class="body"
											style="padding-top: 0; padding-bottom: 0; background-color: white;">
											<table id="temp"
												class="table table-bordered table-hover table-responsive scrolltbody">
												<thead>
													<tr>
														<th rowspan="2" width="70">설비명</th>
														<th rowspan="2" width="200">품번</th>
														<th rowspan="2" width="300">품명</th>
														<th rowspan="2" width="100">강종</th>
														<th rowspan="2" width="70">T급</th>
														<th rowspan="2" width="130">진합로트</th>
														<th colspan="3" width="240">참고 기준정보</th>
														<th colspan="3" width="240">적용 기준정보</th>
														<th rowspan="2" width="80" style="font-size: 14pt">장입량1</th>
														<th rowspan="2" width="80" style="font-size: 14pt">장입량2</th>
														<th rowspan="2" width="80" style="font-size: 14pt">장입량3</th>
														<th rowspan="2" width="90">기준<br>장입량
														</th>
														<th rowspan="2" width="80" style="font-size: 13pt">요구경도</th>
													</tr>
													<tr>
														<th width="80" style="font-size: 13pt">소입온도</th>
														<th width="80" style="font-size: 13pt">소려온도</th>
														<th width="80">CP</th>
														<th width="80" style="font-size: 13pt">소입온도</th>
														<th width="80" style="font-size: 13pt">소려온도</th>
														<th width="80">CP</th>
													</tr>

												</thead>
												<tbody id="conditionList"
													style="display: block; overflow-y: auto;">
												</tbody>

											</table>


										</div>


									</div>
								</div>

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
		//datepicker 초기화
		$.datepicker.formatDate("yy-mm-dd");
		$(".datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ]
				});

		//timepicker 초기화
		$(".timepicker").timepicker({
			timeFormat : 'HH:mm:ss',
			controlType : 'select',
			currentText : "현재시간",
			oneLine : true
		});

		/*전역변수*/

		/*인터벌*/

		/*페이지 로드*/

		$(function() {
			fn_check();
			getSelect();
			/* $("#temp").tablesorter(); */
			getConditionList();
		});

		/*함수*/
		var fn_check = function() {

			$
					.ajax(
							{
								method : "POST",
								url : "set_chk.jsp",
								contentType : "application/json; charset=utf-8",
								data : {
									'time' : new Date().getTime()
								},

								success : function(data) {

									var rsJson = JSON.parse(data);
									var rsAr = rsJson.data;

									if ($.isArray(rsAr)) {

										if (rsAr[0].sec == "") {
											alert("로그인 정보가 없습니다.");
											location.href = "index.jsp";
										}

										$("#user_span")
												.html(
														"<font color='#428bca'><strong><a href = 'javascript:popupOpen();'>"
																+ rsAr[0].sec
																+ "</a></strong></font> 님이 로그인중입니다. ");

										if (rsAr[0].lev == "관리자") {
											//alert("확인");
											$("#pwd").attr("disabled", false)
													.attr("readonly", false);
										}
									}

								}
							}).done(function(msg) {

					});

		};

		var cntArray = new Array();
		function getConditionList() {
			$
					.ajax({
						type : "POST",
						url : "m02/s01/select_m02s01.jsp",
						cache : false,
						dataType : "json",
						data : {
							'time' : new Date().getTime(),
							'hogi' : $("#hogi").val(),
							"pnum" : $("#pnum").val(),
							"gang" : $("#gang").val(),
							"t_gb" : $("#t_gb").val()
						},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rsAr = rsJson.rows;

								var listHtml = "";
								for (var i = 0; i < rsAr.length; i++) {
									cntArray[i] = rsAr[i].pnum + rsAr[i].gang
											+ rsAr[i].t_gb + rsAr[i].lot + rsAr[i].q_temp_jin
											+ rsAr[i].t_temp_jin + rsAr[i].cp_jin + rsAr[i].q_temp_ez
											+ rsAr[i].t_temp_ez + rsAr[i].cp_ez + rsAr[i].weight
											+ rsAr[i].hardness;
									listHtml += "<tr>";
									listHtml += '<td class="nr1" width = "70px" style = "text-align : center; font-size: 15pt;">'
											+ rsAr[i].hogi + '</td>';
									listHtml += '<td class="nr2" width = "200px">'
											+ rsAr[i].pnum + '</td>';
									listHtml += '<td class="nr3" width = "300px">'
											+ rsAr[i].pname + '</td>';
									listHtml += '<td class="nr4" width = "100px">'
											+ rsAr[i].gang + '</td>';
									listHtml += '<td class="nr5" width = "70px">'
											+ rsAr[i].t_gb + '</td>';
									listHtml += '<td class="nr6" width = "130px">'
											+ rsAr[i].lot + '</td>';
									listHtml += '<td class="nr7" width = "80px">'
											+ rsAr[i].q_temp_jin + '</td>';
									listHtml += '<td class="nr8" width = "80px">'
											+ rsAr[i].t_temp_jin + '</td>';
									listHtml += '<td class="nr9" width = "80px">'
											+ rsAr[i].cp_jin + '</td>';
									listHtml += '<td class="nr10" width = "80px">'
											+ rsAr[i].q_temp_ez + '</td>';
									listHtml += '<td class="nr11" width = "80px">'
											+ rsAr[i].t_temp_ez + '</td>';
									listHtml += '<td class="nr12" width = "80px">'
											+ rsAr[i].cp_ez + '</td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td class="nr13" width = "90px">'
											+ rsAr[i].weight + '</td>';
									listHtml += '<td class="nr14" width = "80px">'
											+ rsAr[i].hardness + '</td>';
									listHtml += "</tr>";
								}

								$("#conditionList").html(listHtml);
								$("#temp").trigger("update");
								//$("#temp").tablesorter();

							} else if (rsJson && rsJson.status == "fail") {
								alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
							} else {
								alert("에러발생!");
							}

						}, // success 끝
						error : function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},

					});
		}
		var getSelect = function() {
			console.log(boxId);
			$
					.ajax({
						type : "POST",
						url : "m02/s01/list_m02s01.jsp",
						cache : false,
						dataType : "json",
						data : {
							'time' : new Date().getTime(),
							'hogi' : $('#hogi').val(),
							'pnum' : $('#pnum').val(),
							'gang' : $('#gang').val(),
							't_gb' : $('#t_gb').val()
						},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rsPnum = rsJson.pnum;
								var rsGang = rsJson.gang;
								var rsT_gb = rsJson.t_gb;

								/* // 품목명
								var pnameHtml = "";
								if ($.isArray(rsPname)) {
								  pnameHtml += "<option value='0'>All</option>";
								  for (var i = 0; i < rsPname.length; i++) {
								    pnameHtml += "<option value='" + rsPname[i].pname + "'>" + rsPname[i].pname + "</option>";
								  }
								} else {
								  pnameHtml += "<option value='0'>품명이 없습니다.</option>";
								}
								$("#pname").empty().append(pnameHtml);
								$("#pname").select2(); // 이 위치에서 select2()를 호출합니다.

								// 강종
								var gangHtml = "";
								if ($.isArray(rsGang)) {
								  gangHtml += "<option value='0'>All</option>";
								  for (var i = 0; i < rsGang.length; i++) {
								    gangHtml += "<option value='" + rsGang[i].gang + "'>" + rsGang[i].gang + "</option>";
								  }
								} else {
								  gangHtml += "<option value='0'>품명이 없습니다.</option>";
								}
								$("#gang").empty().append(gangHtml);
								$("#gang").select2(); // 이 위치에서 select2()를 호출합니다.

								// t급
								var t_gbHtml = "";
								if ($.isArray(rsT_gb)) {
								  t_gbHtml += "<option value='0'>All</option>";
								  for (var i = 0; i < rsT_gb.length; i++) {
								    t_gbHtml += "<option value='" + rsT_gb[i].t_gb + "'>" + rsT_gb[i].t_gb + "</option>";
								  }
								} else {
								  t_gbHtml += "<option value='0'>품명이 없습니다.</option>";
								}
								$("#t_gb").empty().append(t_gbHtml);
								$("#t_gb").select2(); // 이 위치에서 select2()를 호출합니다. */

								// 품목명을 업데이트하는 함수
								function updatePnum(rsPnum) {
									var pnumHtml = "";
									if ($.isArray(rsPnum)) {
										pnumHtml += "<option value='0'>All</option>";
										for (var i = 0; i < rsPnum.length; i++) {
											pnumHtml += "<option value='" + rsPnum[i].pnum + "'>"
													+ rsPnum[i].pnum
													+ "</option>";
										}
									} else {
										pnumHtml += "<option value='0'>품명이 없습니다.</option>";
									}
									$("#pnum").empty().append(pnumHtml);
									$("#pnum").select2();
								}

								// 강종을 업데이트하는 함수
								function updateGang(rsGang) {
									var gangHtml = "";
									if ($.isArray(rsGang)) {
										gangHtml += "<option value='0'>All</option>";
										for (var i = 0; i < rsGang.length; i++) {
											gangHtml += "<option value='" + rsGang[i].gang + "'>"
													+ rsGang[i].gang
													+ "</option>";
										}
									} else {
										gangHtml += "<option value='0'>품명이 없습니다.</option>";
									}
									$("#gang").empty().append(gangHtml);
									$("#gang").select2();
								}

								// t급을 업데이트하는 함수
								function updateT_gb(rsT_gb) {
									var t_gbHtml = "";
									if ($.isArray(rsT_gb)) {
										t_gbHtml += "<option value='0'>All</option>";
										for (var i = 0; i < rsT_gb.length; i++) {
											t_gbHtml += "<option value='" + rsT_gb[i].t_gb + "'>"
													+ rsT_gb[i].t_gb
													+ "</option>";
										}
									} else {
										t_gbHtml += "<option value='0'>품명이 없습니다.</option>";
									}
									$("#t_gb").empty().append(t_gbHtml);
									$("#t_gb").select2();
								}

								if (boxId == "pnum") {
									updateGang(rsGang);
									updateT_gb(rsT_gb);
								} else if (boxId == "gang") {
									updateT_gb(rsT_gb);
								} else if (boxId == "t_gb") {
									;
									;
								} else {
									updateGang(rsGang);
									updatePnum(rsPnum);
									updateT_gb(rsT_gb);
								}

							} else if (rsJson && rsJson.status == "fail") {
								alert("데이터 불러오는 중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
							} else {
								alert("에러 발생!");
							}
						},
						error : function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								alert("처리 중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},
					});
		};

		function condition_excel_import() {

			var fileform = $("#upload")[0];
			var fileData = new FormData(fileform);
			if (upload.file1.value == "") {
				$("#alertSpan").text("파일을 업로드해주세요.");
				alertDialog.dialog("open");
				return false;
			} else if (!checkFileType(upload.file1.value)) {
				$("#alertSpan").text("엑셀파일만 업로드해주세요.");
				alertDialog.dialog("open");
				return false;
			}

			/* if(upload.file1.value.indexOf("기준정보") == -1){
			 console.log(upload.file1.value);
			 $("#alertSpan").text("선택하신 파일이 부품표의 파일이 맞는지 확인해주세요.");
			  alertDialog.dialog("open");
			  return false;
			} */
			console.log(upload.file1.value);
			console.log(upload.file1.value.indexOf("기준정보"));

			/* if(upload.file1.value.indexOf($("#hogiCode").val()) == -1){
			 $("#alertSpan").text("선택하신 파일이 해당 설비의 파일인지 확인해주세요.");
			  alertDialog.dialog("open");
			  return false;
			} */

			//document.upload.submit();
			//					  opener.getCodeDetail();
			//				 	  opener.getMachineCode();
			$.ajax({
				url : "m02/s01/import_m02s01_excel.jsp",
				type : "post",
				enctype : "multipart/form-data",
				data : fileData,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {

					fileDialog.dialog("close");
					getSelect();
					getConditionList();
					fileform.reset();
				}
			});

		}

		function checkFileType(filePath) {

			var fileLen = filePath.length;
			var fileFormat = filePath.substring(fileLen - 4);
			var fileFormat2 = filePath.substring(fileLen - 5);
			fileFormatfileFormat = fileFormat.toLowerCase();

			if (fileFormat == ".xls" || fileFormat2 == ".xlsx") {
				return true;
			} else {
				return false;
			}
		}

		//var line_register = function(){
		function lineRegister(){

			
			let ajaxCalls = [];
			for(let i = 1; i < 7; i++){
			    if($("#insert_chk"+i).is(":checked")){
					let request = $.ajax({
				    	type : "POST",
						url : "m02/s01/insert_m02s01.jsp",
						cache : false,
						dataType : "text",
						data : {
							"hogi" : $("#reg_hogi"+i).val(),
							"pnum" : $("#reg_pnum").val(),
							"pname" : $("#reg_pname").val(),
							"gang" : $("#reg_gang").val(),
							"t_gb" : $("#reg_t_gb").val(),
							"lot" : $("#reg_lot").val(),
							"q_temp_jin" : $("#reg_q_temp_jin"+i).val(),
							"t_temp_jin" : $("#reg_t_temp_jin"+i).val(),
							"cp_jin" : $("#reg_cp_jin"+i).val(),
							"q_temp_ez" : $("#reg_q_temp_ez"+i).val(),
							"t_temp_ez" : $("#reg_t_temp_ez"+i).val(),
							"cp_ez" : $("#reg_cp_ez"+i).val(),
							"weight" : $("#reg_weight"+i).val(),
							"hardness" : $("#reg_hardness"+i).val()
				        }
				    });

			    ajaxCalls.push(request);
			    }
			}

			Promise.all(ajaxCalls).then(function(results) {
				alert("등록 성공");
				getSelect();
				getConditionList();
				registerDialog.dialog("close");
			}).catch(function(error) {
				alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
			});
			
		}
		/* function lineRegister() {
			$
					.ajax({
						type : "POST",
						url : "m02/s01/insert_m02s01.jsp",
						cache : false,
						dataType : "text",
						data : {
							"hogi" : $("#reg_hogi").val(),
							"pnum" : $("#reg_pnum").val(),
							"pname" : $("#reg_pname").val(),
							"gang" : $("#reg_gang").val(),
							"t_gb" : $("#reg_t_gb").val(),
							"lot" : $("#reg_lot").val(),
							"q_temp_jin" : $("#reg_q_temp_jin").val(),
							"t_temp_jin" : $("#reg_t_temp_jin").val(),
							"cp_jin" : $("#reg_cp_jin").val(),
							"q_temp_ez" : $("#reg_q_temp_ez").val(),
							"t_temp_ez" : $("#reg_t_temp_ez").val(),
							"cp_ez" : $("#reg_cp_ez").val(),
							"weight" : $("#reg_weight").val(),
							"hardness" : $("#reg_hardness").val()
						},
						success : function() {
							alert("등록 성공");
							getSelect();
							getConditionList();
							registerDialog.dialog("close");

						}, // success 끝
						error : function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								console.log("Error status: " + status);
								console.log("Error detail: " + error);
								console.log("Full response: ", req);
								alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},

					});
		} */
		function lineModify(){

			
			let ajaxCalls = [];
			for(let i = 1; i < 7; i++){
			    if($("#modify_chk"+i).is(":checked")){
					let request = $.ajax({
				    	type : "POST",
						url : "m02/s01/insert_m02s01.jsp",
						cache : false,
						dataType : "text",
						data : {
							"hogi" : $("#modify_hogi"+i).val(),
							"pnum" : $("#modify_pnum").val(),
							"pname" : $("#modify_pname").val(),
							"gang" : $("#modify_gang").val(),
							"t_gb" : $("#modify_t_gb").val(),
							"lot" : $("#modify_lot").val(),
							"q_temp_jin" : $("#modify_q_temp_jin"+i).val(),
							"t_temp_jin" : $("#modify_t_temp_jin"+i).val(),
							"cp_jin" : $("#modify_cp_jin"+i).val(),
							"q_temp_ez" : $("#modify_q_temp_ez"+i).val(),
							"t_temp_ez" : $("#modify_t_temp_ez"+i).val(),
							"cp_ez" : $("#modify_cp_ez"+i).val(),
							"weight" : $("#modify_weight"+i).val(),
							"hardness" : $("#modify_hardness"+i).val()
				        }
				    });

			    ajaxCalls.push(request);
			    }
			}

			Promise.all(ajaxCalls).then(function(results) {
				alert("등록 성공");
				getSelect();
				getConditionList();
				modifyDialog.dialog("close");
			}).catch(function(error) {
				alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
			});
			
		}
		
		/* function lineModify() {
			$
					.ajax({
						type : "POST",
						url : "m02/s01/insert_m02s01.jsp",
						cache : false,
						dataType : "text",
						data : {
							"hogi" : $("#modify_hogi").val(),
							"pnum" : $("#modify_pnum").val(),
							"pname" : $("#modify_pname").val(),
							"gang" : $("#modify_gang").val(),
							"t_gb" : $("#modify_t_gb").val(),
							"lot" : $("#modify_lot").val(),
							"q_temp_jin" : $("#modify_q_temp_jin").val(),
							"t_temp_jin" : $("#modify_t_temp_jin").val(),
							"cp_jin" : $("#modify_cp_jin").val(),
							"q_temp_ez" : $("#modify_q_temp_ez").val(),
							"t_temp_ez" : $("#modify_t_temp_ez").val(),
							"cp_ez" : $("#modify_cp_ez").val(),
							"weight" : $("#modify_weight").val(),
							"hardness" : $("#modify_hardness").val()
						},
						success : function() {
							alert("등록 성공");
							getSelect();
							getConditionList();
							modifyDialog.dialog("close");

						}, // success 끝
						error : function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								console.log("Error status: " + status);
								console.log("Error detail: " + error);
								console.log("Full response: ", req);
								alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},

					});
		} */
		function lineDelete() {
			$
					.ajax({
						type : "POST",
						url : "m02/s01/delete_m02s01.jsp",
						cache : false,
						dataType : "text",
						data : {
							"hogi" : $("#delete_hogi").val(),
							"pnum" : $("#delete_pnum").val(),
							"pname" : $("#delete_pname").val(),
							"gang" : $("#delete_gang").val(),
							"t_gb" : $("#delete_t_gb").val(),
							"lot" : $("#delete_lot").val(),
							"q_temp_jin" : $("#delete_q_temp_jin").val(),
							"t_temp_jin" : $("#delete_t_temp_jin").val(),
							"cp_jin" : $("#delete_cp_jin").val(),
							"q_temp_ez" : $("#delete_q_temp_ez").val(),
							"t_temp_ez" : $("#delete_t_temp_ez").val(),
							"cp_ez" : $("#delete_cp_ez").val(),
							"weight" : $("#delete_weight").val(),
							"hardness" : $("#delete_hardness").val()
						},
						success : function() {
							alert("삭제 성공");
							getSelect();
							getConditionList();
							deleteDialog.dialog("close");

						}, // success 끝
						error : function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},

					});
		}

		function init() {

		}

		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

		function inputNumberFormat(obj) {
			plusClick = false;
			obj.value = comma(uncomma(obj.value));
		}

		/*이벤트*/

		var boxId = "";
		$('#hogi').change(function() {
			boxId = "hogi";
			getSelect();
		});
		$('#pnum').change(function() {
			boxId = "pnum";
			getSelect();
		});
		$('#gang').change(function() {
			boxId = "gang";
			getSelect();
		});
		$('#t_gb').change(function() {
			boxId = "t_gb";
			getSelect();
		});

		$("#searchbtn").on("click", function() {
			getConditionList();
			$("#modifyForm")[0].reset();
		});

		$("#excelBtn").on("click", function() {

			var form = document.forms["searchform"];
			console.log(form);
			form.action = "m02/s01/export_m02s01_excel.jsp";

			form.submit();

		});

		function excel_import_open() {
			/* var popupx = (window.screen.width/2)-(346/2);
			var popupy = (window.screen.height/2)-(300/2);
			var openWin = window.open('m02s01_importView.jsp','', 'status=no, width=450, height=260,menubar=1,left='+popupx+',top='+ popupy+', screenX='+popupx+', screenY='+popupy); */
			fileDialog.dialog("open");
		}
		function registerDialogOpen() {
			registerDialog.dialog("open");
		}
		function modifyDialogOpen() {
			modifyDialog.dialog("open");
		}
		function deleteDialogOpen() {
			deleteDialog.dialog("open");
		}

		$("#conditionList").delegate('tr', 'click', function() {

			var $row = $(this).closest("tr"), $nr1 = $row.find(".nr1").text(); //cnt
			$nr2 = $row.find(".nr2").text(); //작업자명
			$nr3 = $row.find(".nr3").text();
			$nr4 = $row.find(".nr4").text();
			$nr5 = $row.find(".nr5").text();
			$nr6 = $row.find(".nr6").text();
			$nr7 = $row.find(".nr7").text();
			$nr8 = $row.find(".nr8").text();
			$nr9 = $row.find(".nr9").text();
			$nr10 = $row.find(".nr10").text();
			$nr11 = $row.find(".nr11").text();
			$nr12 = $row.find(".nr12").text();
			$nr13 = $row.find(".nr13").text();
			$nr14 = $row.find(".nr14").text();

			var hogiNum = $nr1.charAt($nr1.length - 1);
			$('[id^="modify_chk"]').prop('checked', false);
			$('#modify_chk' + hogiNum).prop('checked', true);
			
			// $("#modify_hogi").val($nr1);
			$("#modify_pnum").val($nr2);
			$("#modify_pname").val($nr3);
			$("#modify_gang").val($nr4);
			$("#modify_t_gb").val($nr5);
			$("#modify_lot").val($nr6);
			$("#modify_q_temp_jin"+hogiNum).val($nr7);
			$("#modify_t_temp_jin"+hogiNum).val($nr8);
			$("#modify_cp_jin"+hogiNum).val($nr9);
			$("#modify_q_temp_ez"+hogiNum).val($nr10);
			$("#modify_t_temp_ez"+hogiNum).val($nr11);
			$("#modify_cp_ez"+hogiNum).val($nr12);
			$("#modify_weight"+hogiNum).val($nr13);
			$("#modify_hardness"+hogiNum).val($nr14);
			
			$("#delete_hogi").val($nr1);
			$("#delete_pnum").val($nr2);
			$("#delete_pname").val($nr3);
			$("#delete_gang").val($nr4);
			$("#delete_t_gb").val($nr5);
			$("#delete_lot").val($nr6);
			$("#delete_q_temp_jin").val($nr7);
			$("#delete_t_temp_jin").val($nr8);
			$("#delete_cp_jin").val($nr9);
			$("#delete_q_temp_ez").val($nr10);
			$("#delete_t_temp_ez").val($nr11);
			$("#delete_cp_ez").val($nr12);
			$("#delete_weight").val($nr13);
			$("#delete_hardness").val($nr14);

			//$("#saveBtn").attr("disabled",true);

			
			var index = 0;
			$("#conditionList > tr").each(function() {
				if ($nr2 + $nr4 + $nr5 + $nr6 + $nr7
						 + $nr8 + $nr9 + $nr10 + $nr11 + $nr12 + $nr13 + $nr14 == cntArray[index]) {
					$(this).css("background-color", "#B2CCFF");
				} else {
					$(this).css("background-color", "#fff");
				}
				index++;
			});

			//		console.log("선택 후 : "+$("#i_cnt").val());
		});

		/*다이얼로그*/
		var fileDialog;
		fileDialog = $("#file-form").dialog({
			autoOpen : false,
			height : 280,
			width : 380,
			modal : false,
			stack : false,
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						fileDialog.dialog("close");
					});
				}
			}
		});

		var registerDialog;
		registerDialog = $("#regFormDialog").dialog({
			autoOpen : false,
			//autoOpen: true,
			height : 550,
			width : 1600,
			modal : false,
			stack : false,
			close : function(event, ui) {
				var form = $("#regForm")[0];
				form.reset();
			},
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						registerDialog.dialog("close");
					});
				}
			}
		});

		var modifyDialog;
		modifyDialog = $("#modifyFormDialog").dialog({
			autoOpen : false,
			//autoOpen: true,
			height : 550,
			width : 1600,
			modal : false,
			stack : false,
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						modifyDialog.dialog("close");
					});
				}
			}
		});
		
		var deleteDialog;
		deleteDialog = $("#deleteFormDialog").dialog({
			autoOpen : false,
			//autoOpen: true,
			height : 300,
			width : 1600,
			modal : false,
			stack : false,
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						deleteDialog.dialog("close");
					});
				}
			}
		});

		var alertDialog;

		alertDialog = $("#alert-form").dialog({
			autoOpen : false,
			height : 200,
			width : 300,
			modal : false,
			stack : false,
			buttons : {
				"확 인" : function() {
					setTimeout(function() {
						alertDialog.dialog("close");
					}, 100);
				}
			}
		});

		/*차트 불러오는 함수*/
	</script>

</body>
</html>