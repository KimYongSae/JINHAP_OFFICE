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
	font-size: 15pt;
	font-family: headline;
	font-weight: 700;
	height: 50px;
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

.content{
	width: 2000px;
}
.nr1{
		width: 40px;
	}
	.nr2{
		width: 100px;
	}
	.nr3{
		width: 200px;
	}
	.nr4{
		width: 200px;
	}
	.nr5{
		width: 200px;
	}
	.nr6{
		width: 150px;
	}
	.nr7{
		width: 100px;
	}
	.nr8{
		width: 100px;
	}
	.nr9{
		width: 100px;
	}
	.nr10{
		width: 100px;
	}
	.nr11{
		width: 100px;
	}
	.nr12{
		width: 100px;
	}
	.nr13{
		width: 100px;
	}
	.nr14{
		width: 100px;
	}
	.nr15{
		width: 100px;
	}
	.nr16{
		width: 100px;
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


	<div style="display: none;" id="regFormDialog" title="신규등록">
		<form class="form-horizontal" id="regForm" name="regForm"
			method="post" enctype="multipart/form-data">
			<table id="temp"
				class="table table-bordered table-hover table-responsive ">
				<thead>
					<tr>
						<th class="nr2">설비</th>
						<th class="nr3">부품명</th>
						<th class="nr4">사용처</th>
						<th class="nr5">규격</th>
						<th class="nr6">제작업체</th>
						<th class="nr7">교체</th>
						<th class="nr8">구매주기</th>
						<th class="nr9">현재고</th>
						<th class="nr10">안전재고</th>
						<th class="nr11">부족재고</th>
						<th class="nr12">단위</th>
						<th class="nr13">보관위치</th>
						<th class="nr14">랙번호</th>
						<th class="nr15">구매신청</th>
						<th class="nr16">비고</th>
					</tr>

				</thead>
				<!-- <tbody style="display : block; overflow-y: auto;"> -->
				<tbody id="reg_body" style="font-weight: 600;">
					<tr>
						<td class="nr2">
							<select class="form-control input-sm" id="reg_seolbi" name="reg_seolbi"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="연속로">연속로</option>
								<option value="소입로">소입로</option>
								<option value="배치로">배치로</option>
								<option value="변성로">변성로</option>
							</select>
						</td>
						<td class="nr3"><input type="text" class="form-control input-sm"
							id="reg_component_name" name="reg_component_name" style="font-family: headline;" /></td>
						<td class="nr4"><input type="text" class="form-control input-sm"
							id="reg_usage_location" name="reg_usage_location" style="font-family: headline;" /></td>
						<td class="nr5"><input type="text" class="form-control input-sm"
							id="reg_specifications" name="reg_specifications" style="font-family: headline;" /></td>
						<td class="nr6"><input type="text" class="form-control input-sm"
							id="reg_manufacturer" name="reg_manufacturer" style="font-family: headline;" /></td>
						<td class="nr7">
							<select class="form-control input-sm" id="reg_replacement_frequency" name="reg_replacement_frequency"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="상시">상시</option>
								<option value="정기">정기</option>
							</select>
						</td>
						<td class="nr8">
							<select class="form-control input-sm" id="reg_purchase_cycle" name="reg_purchase_cycle"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="월">월</option>
								<option value="반기">반기</option>
								<option value="년">년</option>
								<option value="수시">수시</option>
							</select>
						</td>
						<td class="nr9"><input type="text" class="form-control input-sm"
							id="reg_current_stock" name="reg_current_stock" style="font-family: headline;" /></td>
						<td class="nr10"><input type="text" class="form-control input-sm"
							id="reg_safety_stock" name="reg_safety_stock" style="font-family: headline;" /></td>
						<td class="nr11"><input type="text" class="form-control input-sm"
							id="reg_shortage_stock" name="reg_shortage_stock" readonly style="font-family: headline;" /></td>
						<td class="nr12">
							<select class="form-control input-sm" id="reg_unit" name="reg_unit"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="EA">EA</option>
								<option value="SET">SET</option>
							</select>
						</td>
						<td class="nr13"><input type="text" class="form-control input-sm"
							id="reg_storage_location" name="reg_storage_location" style="font-family: headline;" /></td>
						<td class="nr14"><input type="text" class="form-control input-sm"
							id="reg_rack_number" name="reg_rack_number" style="font-family: headline;" /></td>
						<td class="nr15"><input type="text" class="form-control input-sm"
							id="reg_purchase_request" name="reg_purchase_request" style="font-family: headline;" /></td>
						<td class="nr16"><input type="text" class="form-control input-sm"
							id="reg_remarks" name="reg_remarks" style="font-family: headline;" /></td>
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
						<th class="nr2">설비</th>
						<th class="nr3">부품명</th>
						<th class="nr4">사용처</th>
						<th class="nr5">규격</th>
						<th class="nr6">제작업체</th>
						<th class="nr7">교체</th>
						<th class="nr8">구매주기</th>
						<th class="nr9">현재고</th>
						<th class="nr10">안전재고</th>
						<th class="nr11">부족재고</th>
						<th class="nr12">단위</th>
						<th class="nr13">보관위치</th>
						<th class="nr14">랙번호</th>
						<th class="nr15">구매신청</th>
						<th class="nr16">비고</th>
					</tr>

				</thead>
				<tbody style="font-weight: 600;">
					<tr>
						<td class="nr1" style="display:none"><input type="text" class="form-control input-sm"
							id="modify_cnt" name="modify_cnt" style="font-family: headline;" /></td>
						<td class="nr2">
							<select class="form-control input-sm" id="modify_seolbi" name="modify_seolbi"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="연속로">연속로</option>
								<option value="소입로">소입로</option>
								<option value="배치로">배치로</option>
								<option value="변성로">변성로</option>
							</select>	
						</td>
						<td class="nr3"><input type="text" class="form-control input-sm"
							id="modify_component_name" name="modify_component_name" style="font-family: headline;" /></td>
						<td class="nr4"><input type="text" class="form-control input-sm"
							id="modify_usage_location" name="modify_usage_location" style="font-family: headline;" /></td>
						<td class="nr5"><input type="text" class="form-control input-sm"
							id="modify_specifications" name="modify_specifications" style="font-family: headline;" /></td>
						<td class="nr6"><input type="text" class="form-control input-sm"
							id="modify_manufacturer" name="modify_manufacturer" style="font-family: headline;" /></td>
						<td class="nr7">
							<select class="form-control input-sm" id="modify_replacement_frequency" name="modify_replacement_frequency"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="상시">상시</option>
								<option value="정기">정기</option>
							</select>	
						</td>
						<td class="nr8">
							<select class="form-control input-sm" id="modify_purchase_cycle" name="modify_purchase_cycle"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="월">월</option>
								<option value="반기">반기</option>
								<option value="년">년</option>
								<option value="수시">수시</option>
							</select>
						</td>
						<td class="nr9"><input type="text" class="form-control input-sm"
							id="modify_current_stock" name="modify_current_stock" style="font-family: headline;" /></td>
						<td class="nr10"><input type="text" class="form-control input-sm"
							id="modify_safety_stock" name="modify_safety_stock" style="font-family: headline;" /></td>
						<td class="nr11"><input type="text" class="form-control input-sm"
							id="modify_shortage_stock" name="modify_shortage_stock" readonly style="font-family: headline;" /></td>
						<td class="nr12">
							<select class="form-control input-sm" id="modify_unit" name="modify_unit"
								style="margin-top: 5px; height: 30px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
								<option value="EA">EA</option>
								<option value="SET">SET</option>
							</select>
						</td>
						<td class="nr13"><input type="text" class="form-control input-sm"
							id="modify_storage_location" name="modify_storage_location" style="font-family: headline;" /></td>
						<td class="nr14"><input type="text" class="form-control input-sm"
							id="modify_rack_number" name="modify_rack_number" style="font-family: headline;" /></td>
						<td class="nr15"><input type="text" class="form-control input-sm"
							id="modify_purchase_request" name="modify_purchase_request" style="font-family: headline;" /></td>
						<td class="nr16"><input type="text" class="form-control input-sm"
							id="modify_remarks" name="modify_remarks" style="font-family: headline;" /></td>
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
						<th class="nr2">설비</th>
						<th class="nr3">부품명</th>
						<th class="nr4">사용처</th>
						<th class="nr5">규격</th>
						<th class="nr6">제작업체</th>
						<th class="nr7">교체</th>
						<th class="nr8">구매주기</th>
						<th class="nr9">현재고</th>
						<th class="nr10">안전재고</th>
						<th class="nr11">부족재고</th>
						<th class="nr12">단위</th>
						<th class="nr13">보관위치</th>
						<th class="nr14">랙번호</th>
						<th class="nr15">구매신청</th>
						<th class="nr16">비고</th>
					</tr>

				</thead>
				<!-- <tbody style="display : block; overflow-y: auto;"> -->
				<tbody style="font-weight: 600;">
					<tr>
						<td class="nr1" style="display:none"><input type="text" class="form-control input-sm"
							id="delete_cnt" name="delete_cnt" style="font-family: headline;" /></td>
						<td class="nr2"><input type="text" class="form-control input-sm"
							id="delete_seolbi" name="delete_seolbi" style="font-family: headline;" disabled/></td>
						<td class="nr3"><input type="text" class="form-control input-sm"
							id="delete_component_name" name="delete_component_name" style="font-family: headline;" disabled/></td>
						<td class="nr4"><input type="text" class="form-control input-sm"
							id="delete_usage_location" name="delete_usage_location" style="font-family: headline;" disabled/></td>
						<td class="nr5"><input type="text" class="form-control input-sm"
							id="delete_specifications" name="delete_specifications" style="font-family: headline;" disabled/></td>
						<td class="nr6"><input type="text" class="form-control input-sm"
							id="delete_manufacturer" name="delete_manufacturer" style="font-family: headline;" disabled/></td>
						<td class="nr7"><input type="text" class="form-control input-sm"
							id="delete_replacement_frequency" name="delete_replacement_frequency" style="font-family: headline;" disabled/></td>
						<td class="nr8"><input type="text" class="form-control input-sm"
							id="delete_purchase_cycle" name="delete_purchase_cycle" style="font-family: headline;" disabled/></td>
						<td class="nr9"><input type="text" class="form-control input-sm"
							id="delete_current_stock" name="delete_current_stock" style="font-family: headline;" disabled/></td>
						<td class="nr10"><input type="text" class="form-control input-sm"
							id="delete_safety_stock" name="delete_safety_stock" style="font-family: headline;" disabled/></td>
						<td class="nr11"><input type="text" class="form-control input-sm"
							id="delete_shortage_stock" name="delete_shortage_stock" style="font-family: headline;" disabled/></td>
						<td class="nr12"><input type="text" class="form-control input-sm"
							id="delete_unit" name="delete_unit" style="font-family: headline;" disabled/></td>
						<td class="nr13"><input type="text" class="form-control input-sm"
							id="delete_storage_location" name="delete_storage_location" style="font-family: headline;" disabled/></td>
						<td class="nr14"><input type="text" class="form-control input-sm"
							id="delete_rack_number" name="delete_rack_number" style="font-family: headline;" disabled/></td>
						<td class="nr15"><input type="text" class="form-control input-sm"
							id="delete_purchase_request" name="delete_purchase_request" style="font-family: headline;" disabled/></td>
						<td class="nr16"><input type="text" class="form-control input-sm"
							id="delete_remarks" name="delete_remarks" style="font-family: headline;" disabled/></td>
					</tr>
				</tbody>

			</table>

			<div class="text-center">
				<input type="button" class="btn small btn-primary"
					onclick="lineDelete();" value="삭제">
			</div>

		</form>
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
				<tr>
					<td colspan="2">*기존에 저장된 자료는 삭제됩니다.</td>
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

								<div style="width: 100%;" class="col-lg-12">
									<div class="box">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-list-alt"></i>
											</div>
											<h5 style="font-size: 14pt; font-family: headline;">
												설비관리 - SPARE 부품관리</h5>
										</header>
										<header style="background: white; height: 43px;">
											<form class="form-inline" role="form" id="searchform"
												name="searchform" method="post" autocomplete="off"
												style="padding: 0 10px;"
												>
												
													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">
															설비 : </label>
													</div>
													<div class="form-group">
														<select class="form-control input-sm" id="s_seolbi" name="s_seolbi"
															style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
															<option value="0">전체</option>
															<option value="1">연속로</option>
															<option value="2">소입로</option>
															<option value="3">배치로</option>
															<option value="4">변성로</option>
														</select>
													</div>
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
													<div class="form-group pull-right">
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="excelBtn">
																<i class="glyphicon glyphicon-save"></i> 엑셀다운로드
															</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="in_excel" onclick="excel_import_open();">
																<span class="glyphicon glyphicon-open"></span>엑셀업로드
															</button>
														</div>
													</div>


											</form>
										</header>

										<div id="collapse4" class="body"
											style="padding-top: 30px; padding-bottom: 0; background-color: white;">
											<table id="temp"
												class="table table-bordered table-hover table-responsive scrolltbody">
												<thead>
													<tr>
														<th class="nr1">no</th>
														<th class="nr2">설비</th>
														<th class="nr3">부품명</th>
														<th class="nr4">사용처</th>
														<th class="nr5">규격</th>
														<th class="nr6">제작업체</th>
														<th class="nr7">교체</th>
														<th class="nr8">구매주기</th>
														<th class="nr9">현재고</th>
														<th class="nr10">안전재고</th>
														<th class="nr11">부족재고</th>
														<th class="nr12">단위</th>
														<th class="nr13">보관위치</th>
														<th class="nr14">랙번호</th>
														<th class="nr15">구매신청</th>
														<th class="nr16">비고</th>
													</tr>

												</thead>
												<!-- <tbody id="spareList"
													style="display: block; overflow-y: auto;">
												</tbody> -->
												
												<tbody id="spareList">
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
			/* getSelect(); */
			getSpareList();
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
		function getSpareList() {
			$
					.ajax({
						type : "POST",
						url : "m04/s03/select_m04s03.jsp",
						cache : false,
						dataType : "json",
						data : {
							'time' : new Date().getTime(),
							'seolbi' : $("#s_seolbi").val()
						},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rsAr = rsJson.rows;

								var listHtml = "";
								for (var i = 0; i < rsAr.length; i++) {
									cntArray[i] = rsAr[i].cnt;
									listHtml += "<tr>";
									listHtml += '<td class="nr1">'
											+ rsAr[i].cnt + '</td>';
									listHtml += '<td class="nr2">'
											+ rsAr[i].seolbi + '</td>';
									listHtml += '<td class="nr3">'
											+ rsAr[i].component_name + '</td>';
									listHtml += '<td class="nr4">'
											+ rsAr[i].usage_location + '</td>';
									listHtml += '<td class="nr5">'
											+ rsAr[i].specifications + '</td>';
									listHtml += '<td class="nr6">'
											+ rsAr[i].manufacturer + '</td>';
									listHtml += '<td class="nr7">'
											+ rsAr[i].replacement_frequency + '</td>';
									listHtml += '<td class="nr8">'
											+ rsAr[i].purchase_cycle + '</td>';
									listHtml += '<td class="nr9">'
											+ rsAr[i].current_stock + '</td>';
									listHtml += '<td class="nr10">'
											+ rsAr[i].safety_stock + '</td>';
									listHtml += '<td class="nr11">'
											+ rsAr[i].shortage_stock + '</td>';
									listHtml += '<td class="nr12">'
											+ rsAr[i].unit + '</td>';
									listHtml += '<td class="nr13">'
											+ rsAr[i].storage_location + '</td>';
									listHtml += '<td class="nr14">'
											+ rsAr[i].rack_number + '</td>';
									listHtml += '<td class="nr15">'
											+ rsAr[i].purchase_request + '</td>';
									listHtml += '<td class="nr16">'
											+ rsAr[i].remarks + '</td>';
									listHtml += "</tr>";
								}

								$("#spareList").html(listHtml);

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
				url : "m04/s03/import_m04s03_excel.jsp",
				type : "post",
				enctype : "multipart/form-data",
				data : fileData,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {

					fileDialog.dialog("close");
					getSpareList();
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
			
					let request = $.ajax({
				    	type : "POST",
						url : "m04/s03/insert_m04s03.jsp",
						cache : false,
						dataType : "text",
						data : {
							"seolbi": $("#reg_seolbi").val(),
					        "component_name": $("#reg_component_name").val(),
					        "usage_location": $("#reg_usage_location").val(),
					        "specifications": $("#reg_specifications").val(),
					        "manufacturer": $("#reg_manufacturer").val(),
					        "replacement_frequency": $("#reg_replacement_frequency").val(),
					        "purchase_cycle": $("#reg_purchase_cycle").val(),
					        "current_stock": $("#reg_current_stock").val(),
					        "safety_stock": $("#reg_safety_stock").val(),
					        "shortage_stock": $("#reg_shortage_stock").val(),
					        "unit": $("#reg_unit").val(),
					        "storage_location": $("#reg_storage_location").val(),
					        "rack_number": $("#reg_rack_number").val(),
					        "purchase_request": $("#reg_purchase_request").val(),
					        "remarks": $("#reg_remarks").val()
				        },
				        success : function() {
							alert("등록 성공");
							getSpareList();
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
			
		}
		/* function lineRegister() {
			$
					.ajax({
						type : "POST",
						url : "m04/s03/insert_m04s03.jsp",
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
							getSpareList();
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
			
				let request = $.ajax({
			    	type : "POST",
					url : "m04/s03/modify_m04s03.jsp",
					cache : false,
					dataType : "text",
					data : {
						"cnt": $("#modify_cnt").val(),
						"seolbi": $("#modify_seolbi").val(),
						"component_name": $("#modify_component_name").val(),
						"usage_location": $("#modify_usage_location").val(),
						"specifications": $("#modify_specifications").val(),
						"manufacturer": $("#modify_manufacturer").val(),
						"replacement_frequency": $("#modify_replacement_frequency").val(),
						"purchase_cycle": $("#modify_purchase_cycle").val(),
						"current_stock": $("#modify_current_stock").val(),
						"safety_stock": $("#modify_safety_stock").val(),
						"shortage_stock": $("#modify_shortage_stock").val(),
						"unit": $("#modify_unit").val(),
						"storage_location": $("#modify_storage_location").val(),
						"rack_number": $("#modify_rack_number").val(),
						"purchase_request": $("#modify_purchase_request").val(),
						"remarks": $("#modify_remarks").val()
			        },
			        success : function() {
						alert("등록 성공");
						getSpareList();
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

		}
		
		/* function lineModify() {
			$
					.ajax({
						type : "POST",
						url : "m04/s03/insert_m04s03.jsp",
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
							getSpareList();
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
						url : "m04/s03/delete_m04s03.jsp",
						cache : false,
						dataType : "text",
						data : {
							"cnt": $("#delete_cnt").val(),
							
						},
						success : function() {
							alert("삭제 성공");
							getSpareList();
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

		
		$('#s_seolbi').change(function() {
			getSpareList();
		});

		$("#searchbtn").on("click", function() {
			getSpareList();
			$("#modifyForm")[0].reset();
		});

		$("#excelBtn").on("click", function() {

			var form = document.forms["searchform"];
			console.log(form);
			form.action = "m04/s03/export_m04s03_excel.jsp";

			form.submit();

		});

		$('#reg_safety_stock, #reg_current_stock').on('input', function() {
	        var safetyStock = parseInt($('#reg_safety_stock').val()) || 0;
	        var currentStock = parseInt($('#reg_current_stock').val()) || 0;

	        var shortageStock = safetyStock - currentStock;

	        $('#reg_shortage_stock').val(shortageStock);
	    });
		
		$('#modify_safety_stock, #modify_current_stock').on('input', function() {
	        var safetyStock = parseInt($('#modify_safety_stock').val()) || 0;
	        var currentStock = parseInt($('#modify_current_stock').val()) || 0;

	        var shortageStock = safetyStock - currentStock;

	        $('#modify_shortage_stock').val(shortageStock);
	    });
		
		
		
		function excel_import_open() {
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

		$("#spareList").delegate('tr', 'click', function() {

			var $row = $(this).closest("tr");
			$nr1 = $row.find(".nr1").text(); //cnt
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
			$nr15 = $row.find(".nr15").text();
			$nr16 = $row.find(".nr16").text();

			$("#modify_cnt").val($nr1);
			$("#modify_seolbi").val($nr2);
			$("#modify_component_name").val($nr3);
			$("#modify_usage_location").val($nr4);
			$("#modify_specifications").val($nr5);
			$("#modify_manufacturer").val($nr6);
			$("#modify_replacement_frequency").val($nr7);
			$("#modify_purchase_cycle").val($nr8);
			$("#modify_current_stock").val($nr9);
			$("#modify_safety_stock").val($nr10);
			$("#modify_shortage_stock").val($nr11);
			$("#modify_unit").val($nr12);
			$("#modify_storage_location").val($nr13);
			$("#modify_rack_number").val($nr14);
			$("#modify_purchase_request").val($nr15);
			$("#modify_remarks").val($nr16);
			
			$("#delete_cnt").val($nr1);
			$("#delete_seolbi").val($nr2);
			$("#delete_component_name").val($nr3);
			$("#delete_usage_location").val($nr4);
			$("#delete_specifications").val($nr5);
			$("#delete_manufacturer").val($nr6);
			$("#delete_replacement_frequency").val($nr7);
			$("#delete_purchase_cycle").val($nr8);
			$("#delete_current_stock").val($nr9);
			$("#delete_safety_stock").val($nr10);
			$("#delete_shortage_stock").val($nr11);
			$("#delete_unit").val($nr12);
			$("#delete_storage_location").val($nr13);
			$("#delete_rack_number").val($nr14);
			$("#delete_purchase_request").val($nr15);
			$("#delete_remarks").val($nr16);

			
			var index = 0;
			$("#spareList > tr").each(function() {
				if ($nr1 == cntArray[index]) {
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
			height : 300,
			width : 1950,
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
			height : 300,
			width : 1950,
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
			width : 1950,
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