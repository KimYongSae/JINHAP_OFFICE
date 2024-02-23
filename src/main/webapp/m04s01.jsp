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
	width: 1900px;
	border-collapse: collapse;
	border: 0px solid #000;
}

.scrolltbody td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	height: 600px;
	overflow-x: hidden;
}

#loading-image {
	position: absolute;
	top: 20%;
	left: 20%;
	z-index: 100;
}

@font-face {
	font-family: "headline";
	src: url("fonts/headline.TTF") format("ttf");
	font-style: normal;
	font-weight: normal;
}
table th{
	background-color: #122d64 !important;
	color:#FFFFFF;
	border-color: #FFFFFF !important;
	text-align: center;
	font-size: 16pt;
	font-family: headline;
	font-weight: 700;
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

<div style="display: none;" id="file-form" title="파일 첨부">
		<form class="form-horizontal" id="excelImport" name="excelImport" method="post"
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

	<div id="wrap">

		<div id="header">
			<jsp:include page="/header-menu.jsp" />
		</div>


		<div id="body2">
			<div id="floater2" style="margin-top: 30px;">

				<jsp:include page="/body-menu.jsp" />
			</div>
			<div id="contents">

				<div class="content" style="height: 780px;">


					<div style="position: relative; left: -275px; top: -185px;">


						<div id="room1"
							style="width: 100%; height: 20px; position: absolute; left: 272px; top: 185px; font-size: 16px; font-weight: 600; color: black;">


							<!--Begin Datatables-->
							<div class="row">
								<hr class="bread_under">

								<div style="width: 100%;" class="col-lg-12">
									<div class="box" style="height: 750px;">
										<header>
											<div style="padding: 11px 14px;" class="icons">
												<i style="color: white;" class="fa fa-industry"></i>
											</div>
											<h5 style="font-size: 14pt; font-family: headline;">설비관리
												- 설비 보전 모니터링</h5>
										</header>
										<div class="col-lg-6">
											<header style="background: white; height: 90px;">
												<form class="form-inline" role="form" name="bupumSearchForm" id="bupumSearchForm" 
													method="post" autocomplete="off" style="height: 40px">
													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 60px; text-align: right;">호기
															: </label>
													</div>

													<div class="form-group">
														<select class="form-control input-sm" id="b_hogi"
															name="b_hogi"
															style="margin-top: 5px; height: 30px; width: 160px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
															<option value="">ALL</option>
															<option value="1호기">Q01-HN01</option>
															<option value="2호기">Q01-HN02</option>
															<option value="3호기">Q01-HN03</option>
															<option value="4호기">Q01-HN04</option>
															<option value="5호기">Q01-HN05</option>
															<option value="6호기">Q01-HN06</option>
														</select>
													</div>


													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 90px; text-align: right;">설비명
															: </label>
													</div>

													<div class="form-group">
														<select class="form-control input-sm" id="b_zone"
															name="b_zone"
															style="margin-top: 5px; height: 30px; width: 160px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
															<option value="">ALL</option>
															<option value="소입1">소입1</option>
															<option value="소입2">소입2</option>
															<option value="소입3">소입3</option>
															<option value="소입4">소입4</option>
															<option value="소입5">소입5</option>
															<option value="소려1">소려1</option>
															<option value="소려2">소려2</option>
															<option value="소려3">소려3</option>
															<option value="소려4">소려4</option>
															<option value="오일">오일</option>
															<option value="유조">유조</option>
															<option value="중간세정기">중간세정기</option>
															<option value="추출장치">추출장치</option>
															<option value="기타">기타</option>
														</select>
													</div>


													<div class="form-group pull-right">
														&nbsp;&nbsp;
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="bupumSearchbtn">
																<i class="fa fa-search"></i> 검 색
															</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																onclick="resetbupumList();">
																<i class="fa fa-refresh"></i> 초기화
															</button>
														</div>
													</div>

												</form>
												<form class="form-inline" role="form" name="//"
													method="post" autocomplete="off" style="height: 40px">

													<div class="form-group pull-right">
														&nbsp;&nbsp;
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="bupumExcelExport">
																<i class="glyphicon glyphicon-save"></i> 엑셀다운로드
															</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="bupumExcelImport" onclick="excel_import_open();">
																<span class="glyphicon glyphicon-open"></span>엑셀업로드
															</button>
														</div>

														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="reg_btn" onclick="bupumDialog.dialog('open');">
																부품등록</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="delete_bupum">부품삭제</button>
														</div>
													</div>
												</form>
											</header>

											<div id="collapse4" class="body">
												<table id="bupumTable"
													class="table table-bordered table-hover table-responsive">
													<colgroup>
														<col width="10%">
														<col width="30%">
														<col width="30%">
														<col width="30%">
													</colgroup>

													<tr
														style="height: 50px; background-color: #36FFFF; font-size: 15pt;">
														<th class="text-center cell">호기</th>
														<th class="text-center cell">설비명</th>
														<th class="text-center cell">부품명</th>
														<th class="text-center cell">상세내용</th>
													</tr>
													<tbody id="bupumTableBody">

													</tbody>
												</table>
											</div>



										</div>
										<div class="col-lg-6">
											<header style="background: white; height: 90px;">
												<form class="form-inline" role="form" name="searchform" id="historySearchForm"
													method="post" autocomplete="off" style="height: 40px">
													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; font-weight: 700; width: 50px; text-align: right;">기간
															: </label>
													</div>
													<div class="form-group">
														<input type="text"
															class="form-control input-sm datepicker" id="s_sdate"
															name="s_sdate"
															style="margin-top: 5px; height: 30px; width: 130px; font-size: 14pt; font-family: headline; font-weight: 700;"
															placeholder="예)2020-01-01"
															onkeyup="auto_date_format(event, this);" />
													</div>
													<span class="control-label"
														style="color: #8C8C8C; font-size: 13pt; font-family: headline;">~</span>

													<!-- 종료일 -->
													<div class="form-group">
														<input type="text"
															class="form-control input-sm datepicker" id="s_edate"
															name="s_edate"
															style="margin-top: 5px; height: 30px; width: 130px; font-size: 14pt; font-family: headline; font-weight: 700;"
															placeholder="예)2020-01-01"
															onkeyup="auto_date_format(event, this);" />
													</div>
													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 60px; text-align: right;">호기
															: </label>
													</div>

													<div class="form-group">
														<select class="form-control input-sm" id="bd_hogi"
															name="bd_hogi"
															style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
															<option value="">All</option>
															<option value="1호기">Q01-HN01</option>
															<option value="2호기">Q01-HN02</option>
															<option value="3호기">Q01-HN03</option>
															<option value="4호기">Q01-HN04</option>
															<option value="5호기">Q01-HN05</option>
															<option value="6호기">Q01-HN06</option>
														</select>
													</div>
													<div class="form-group">
														<label class="control-label"
															style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right;">부품
															: </label>
													</div>

													<div class="form-group">
														<select class="form-control input-sm" id="b_name"
															name="b_name"
															style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
															<option value="">All</option>
														</select>
													</div>


													<!-- 시작일 -->


													<div class="form-group pull-right">
														&nbsp;&nbsp;
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="bupumDetailSearchbtn">
																<i class="fa fa-search"></i> 검 색
															</button>
														</div>

													</div>

												</form>
												<form class="form-inline" role="form" name="//"
													method="post" autocomplete="off" style="height: 40px">

													<div class="form-group pull-right">
														&nbsp;&nbsp;
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="margin-top: 6px; height: 31px; width: 160px; font-size: 14pt; font-weight: 700; font-family: headline; padding-top: 1px; padding-bottom: 1px;"
																id="historyExcelExport">
																<i class="glyphicon glyphicon-save"></i> 엑셀다운로드
															</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="history_btn">이력등록</button>
														</div>
														<div class="form-group">
															<button class="btn btn-default pull-right btn-sm"
																type="button"
																style="padding-top: 1px; padding-bottom: 1px; margin-top: 6px; height: 31px; width: 100px; font-size: 14pt; font-weight: 700; font-family: headline;"
																id="delete_history">이력삭제</button>
														</div>
													</div>
												</form>

											</header>
											<div id="collapse4" class="body">
												<table id="tempTable2"
													class="table table-bordered table-hover table-responsive">
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
													</colgroup>

													<tr
														style="height: 50px; background-color: #36FFFF; font-size: 14pt;">
														<th class="text-center cell">호기</th>
														<th class="text-center cell">설비명</th>
														<th class="text-center cell">부품명</th>
														<th class="text-center cell">수리/교체일자</th>
														<th class="text-center cell">수리항목</th>
														<th class="text-center cell">메모</th>
													</tr>
													<tbody id="bupumDetailTableBody">

													</tbody>



												</table>
											</div>
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
	<div style="display: none;" id="bupum-form" title="부품등록">
		<form class="form-horizontal" id="upload" name="upload" method="post"
			enctype="multipart/form-data">
			<table class="no-style" style="width: 100%">
				<tr>
					<td><label class="control-label"
						style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 60px; text-align: right;">호기
							: </label> <select class="input-sm" id="breg_hogi" name="breg_hogi"
						style="margin-top: 5px; height: 30px; width: 160px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
							<!-- <option value="">설비선택</option> -->
							<option value="1호기">Q01-HN01</option>
							<option value="2호기">Q01-HN02</option>
							<option value="3호기">Q01-HN03</option>
							<option value="4호기">Q01-HN04</option>
							<option value="5호기">Q01-HN05</option>
							<option value="6호기">Q01-HN06</option>
					</select></td>
					<td><label class="control-label"
						style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 90px; text-align: right;">설비명
							: </label> <select class="input-sm" id="breg_sulbi" name="breg_sulbi"
						style="margin-top: 5px; height: 30px; width: 160px; font-size: 14pt; font-family: headline; padding-top: 1px; padding-bottom: 1px;">
							<!-- <option value="">설비선택</option> -->
							<option value="소입1">소입1</option>
							<option value="소입2">소입2</option>
							<option value="소입3">소입3</option>
							<option value="소입4">소입4</option>
							<option value="소입5">소입5</option>
							<option value="소려1">소려1</option>
							<option value="소려2">소려2</option>
							<option value="소려3">소려3</option>
							<option value="소려4">소려4</option>
							<option value="오일">오일</option>
							<option value="유조">유조</option>
							<option value="중간세정기">중간세정기</option>
							<option value="추출장치">추출장치</option>
							<option value="기타">기타</option>
					</select></td>

				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="breg_bname"
						name="breg_bname" class="form-control " placeholder="부품명을 입력하세요">

					</td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="breg_detail" name="breg_detail"
							class="form-control" rows="10" placeholder="상세내용을 입력하세요"></textarea>

					</td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="hidden"
						id="breg_code" placeholder="breg_code"> <input
						type="button" id="breg_save" class="btn small btn-primary"
						value="저장"></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="display: none;" id="history-form" title="이력등록">
		<form class="form-horizontal" id="history_upload"
			name="history_upload" method="post" enctype="multipart/form-data">
			<table class="no-style" style="width: 100%">
				<tr>
					<td><input type="text"
						class="form-control input-sm datepicker" id="history_date"
						name="history_date"
						style="margin-top: 5px; height: 30px; font-size: 14pt; font-family: headline;"
						placeholder="예)2020-01-01"
						onkeyup="auto_date_format(event, this);" /></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="history_type"
						class="form-control " placeholder="부품타입"></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="historyb_code"
						placeholder="historyb_code"> <input type="hidden"
						id="bd_code" placeholder="bd_code"> <textarea
							id="history_memo" class="form-control" rows="10"
							placeholder="상세내용을 입력하세요"></textarea></td>
				</tr>
				<tr height="5">
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						id="history_save" class="btn small btn-primary" value="저장">
					</td>
				</tr>
			</table>
		</form>
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

			var now = new Date();
			//오늘날짜(일별)
			tday = now.getFullYear() + "-" + date_set(now.getMonth() + 1) + "-"
					+ date_set(now.getDate());
			$("#history_date").val(tday);
			var yester = new Date();
			var m_temp = new Date();
			yester.setDate(m_temp.getDate() - 1);

			var ydate = yester.getFullYear() + "-"
					+ date_set(yester.getMonth() + 1) + "-"
					+ date_set(yester.getDate());

			$("#s_sdate").val(ydate);
			$("#s_edate").val(tday);
			getBupumList();
			getBupumDetailList();
			getDetailListName();
		});

		/*함수*/

		function date_set(v) {
			var result = "";
			if (v <= 9) {
				result = "0" + v;
			} else {
				result = v;
			}

			return result;
		}

		function auto_date_format(e, oThis) {

			var num_arr = [ 97, 98, 99, 100, 101, 102, 103, 104, 105, 96, 48,
					49, 50, 51, 52, 53, 54, 55, 56, 57 ]

			var key_code = (e.which) ? e.which : e.keyCode;
			if (num_arr.indexOf(Number(key_code)) != -1) {

				var len = oThis.value.length;
				if (len == 4)
					oThis.value += "-";
				if (len == 7)
					oThis.value += "-";

			}
		}

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
		function init() {

		}

		var cntArray = new Array();
		function getBupumList() {

			$
					.ajax({
						type : "POST",
						url : "m04/s01/m04s01_bupum_list.jsp",
						cache : false,
						dataType : "json",
						data : {
							"b_hogi" : $("#b_hogi").val(),
							"b_zone" : $("#b_zone").val()
						},
						success : function(rsJson) {
							console.log(rsJson);
							if (rsJson && rsJson.status == "ok") {

								var rsAr = rsJson.data;
								var listHtml = "";
								for (var i = 0; i < rsAr.length; i++) {

									cntArray[i] = rsAr[i].b_code;
									listHtml += "<tr>";
									listHtml += '<td class="text-center cell nr1" style="display:none;" >'
											+ rsAr[i].b_code + '</td>';
									listHtml += '<td class="text-center cell nr2" >'
											+ rsAr[i].b_hogi + '</td>';
									listHtml += '<td class="text-center cell nr3" >'
											+ rsAr[i].b_loc + '</td>';
									listHtml += '<td class="text-center cell nr4" >'
											+ rsAr[i].b_name + '</td>';
									listHtml += '<td class="text-center cell nr5" >'
											+ rsAr[i].b_detail + '</td>';
									listHtml += "</tr>";

								}
								//							console.log(listHtml);
								$("#bupumTableBody").html(listHtml);

							} else if (rsJson && rsJson.status == "fail") {
								alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
							} else {
								alert("에러발생!");
							}

							//					timer = setTimeout(function(){ o.run(); }, o.pollInterval);

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
		var cntbdArray = new Array();
		function getBupumDetailList() {

			$
					.ajax({
						type : "POST",
						url : "m04/s01/m04s01_bupum_dlist.jsp",
						cache : false,
						dataType : "json",
						data : {
							"s_sdate" : $("#s_sdate").val(),
							"s_edate" : $("#s_edate").val(),
							"bd_hogi" : $("#bd_hogi").val(),
							"b_name" : $("#b_name").val()
						},
						success : function(rsJson) {
							console.log(rsJson);
							if (rsJson && rsJson.status == "ok") {

								var rsAr = rsJson.data;
								var listHtml = "";
								for (var i = 0; i < rsAr.length; i++) {

									cntbdArray[i] = rsAr[i].bd_code;
									listHtml += "<tr>";
									listHtml += '<td class="text-center cell bd0" style="display:none" >'
											+ rsAr[i].bd_code + '</td>';
									listHtml += '<td class="text-center cell bd1" >'
											+ rsAr[i].b_hogi + '</td>';
									listHtml += '<td class="text-center cell bd2" >'
											+ rsAr[i].b_loc + '</td>';
									listHtml += '<td class="text-center cell bd3" >'
											+ rsAr[i].b_name + '</td>';
									listHtml += '<td class="text-center cell bd4" >'
											+ rsAr[i].bd_date + '</td>';
									listHtml += '<td class="text-center cell bd5" >'
											+ rsAr[i].bd_type + '</td>';
									listHtml += '<td class="text-center cell bd6" >'
											+ rsAr[i].bd_memo + '</td>';
									listHtml += "</tr>";

								}
								//							console.log(listHtml);
								$("#bupumDetailTableBody").html(listHtml);

							} else if (rsJson && rsJson.status == "fail") {
								alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
							} else {
								alert("에러발생!");
							}

							//					timer = setTimeout(function(){ o.run(); }, o.pollInterval);

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

		function getDetailListName() {
			var sdate = $("#s_sdate").val();
			var edate = $("#s_edate").val();

			var b_line = $("#bd_hogi").val();

			$
					.ajax({
						url : "m04/s01/m04s01_bupum_dname.jsp",
						type : "post",
						dataType : "json",
						data : {
							"sdate" : sdate,
							"edate" : edate,
							"b_line" : b_line
						},
						success : function(result) {
							if ($("#b_name").val() == null
									|| $("#b_name").val() == '') {
								var _option = "<option value=''>ALL</option>";

								var _rows = result.rows;
								for (var i = 0; i < _rows.length; i++) {
									_option += "<option value='"+_rows[i].b_name+"'>"
											+ _rows[i].b_name + "</option>"
								}

								$("#b_name").empty().append(_option);

							}
						}
					});
		}

		function getBcode() {
			$.ajax({
				url : "m04/s01/m04s01_bcode.jsp",
				type : "post",
				dataType : "json",
				success : function(rst) {
					console.log(rst);
					var breg_code = rst.b_code;

					$('#breg_code').val(breg_code);
				}
			});
		}

		function getbdcode() {
			$.ajax({
				url : "m04/s01/m04s01_bdcode.jsp",
				type : "post",
				dataType : "json",
				success : function(rst) {
					console.log(rst);
					var bd_code = rst.bd_code;

					$('#bd_code').val(bd_code);
				}
			});
		}
		
		function bupumExcelExport() {
			
			var form = document.forms["bupumSearchForm"];
			console.log(form);
			form.action = "m04/s01/export_m04s01_excel.jsp";
			form.submit();
		}
		
		function historyExcelExport() {
			
			var form = document.forms["historySearchForm"];
			console.log(form);
			form.action = "m04/s01/export_m04s01_history_excel.jsp";
			form.submit();
		}

		function excel_import_open() {
			getBcode();
			fileDialog.dialog("open");
		}
		
		function condition_excel_import() {
			console.log(excelImport.file1);

			var fileform = $("#excelImport")[0];
			var fileData = new FormData(fileform);
			fileData.append('b_code', $('#breg_code').val());
			
			if (excelImport.file1.value == "") {
				$("#alertSpan").text("파일을 업로드해주세요.");
				alertDialog.dialog("open");
				return false;
			} else if (!checkFileType(excelImport.file1.value)) {
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

			/* if(upload.file1.value.indexOf($("#hogiCode").val()) == -1){
			 $("#alertSpan").text("선택하신 파일이 해당 설비의 파일인지 확인해주세요.");
			  alertDialog.dialog("open");
			  return false;
			} */

			//document.upload.submit();
			//					  opener.getCodeDetail();
			//				 	  opener.getMachineCode();
			$.ajax({
				url : "m04/s01/import_m04s01_excel.jsp",
				type : "post",
				enctype : "multipart/form-data",
				data : fileData,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {

					fileDialog.dialog("close");
					getBupumList();
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
		
		
		

		/*이벤트*/
		$("#bupumSearchbtn").on("click", function() {
			getBupumList();
		});
		$("#bupumDetailSearchbtn").on("click", function() {
			getBupumDetailList();
		});

		$("#bd_hogi").change(function() {
			$("#b_name").val("");
			getDetailListName();

			getBupumDetailList();
		});
		$("#s_sdate").change(function() {
			$("#b_name").val("");
			getDetailListName();

			getBupumDetailList();
		});
		$("#s_edate").change(function() {
			$("#b_name").val("");
			getDetailListName();

			getBupumDetailList();
		});

		$("#reg_btn").on('click', function() {

			getBcode();

		});
		$("#history_btn").on('click', function() {

			if ($('#historyb_code').val()) {
				historyDialog.dialog('open');
				getbdcode();
			} else {
				alert("부품을 선택해야 이력을 등록할 수 있습니다.");
			}

		});

		$('#breg_save').click(function() {

			$.ajax({
				type : "POST",
				url : "m04/s01/insert_m04s01_bupum.jsp",
				data : {
					b_name : $('#breg_bname').val(),
					b_detail : $('#breg_detail').val(),
					b_hogi : $('#breg_hogi').val(),
					b_code : $('#breg_code').val(),
					b_loc : $('#breg_sulbi').val()
				},
				success : function(response) {
					alert("부품이 등록되었습니다.");
					getBupumList();
					bupumDialog.dialog("close");
				}
			});

		});

		function resetbupumList() {

			$("#b_hogi").val("");
			$("#b_zone").val("");

		}

		$("#bupumTableBody").delegate('tr', 'click', function() {

			var $row = $(this).closest("tr"), $nr1 = $row.find(".nr1").text(); //cnt
			$nr2 = $row.find(".nr2").text(); //작업자명
			$nr3 = $row.find(".nr3").text();
			$nr4 = $row.find(".nr4").text();
			$nr5 = $row.find(".nr5").text();

			$('#historyb_code').val($nr1);

			var index = 0;
			$("#bupumTableBody > tr").each(function() {
				if ($nr1 == cntArray[index]) {
					$(this).css("background-color", "#B2CCFF");
				} else {
					$(this).css("background-color", "#fff");
				}
				index++;
			});

		});

		$("#bupumDetailTableBody").delegate('tr', 'click', function() {

			var $row = $(this).closest("tr"), $bd0 = $row.find(".bd0").text(); //cnt
			$bd1 = $row.find(".bd1").text(); //cnt
			$bd2 = $row.find(".bd2").text(); //작업자명
			$bd3 = $row.find(".bd3").text();
			$bd4 = $row.find(".bd4").text();
			$bd5 = $row.find(".bd5").text();

			$('#bd_code').val($bd0);

			var index = 0;
			$("#bupumDetailTableBody > tr").each(function() {
				if ($bd0 == cntbdArray[index]) {
					$(this).css("background-color", "#B2CCFF");
				} else {
					$(this).css("background-color", "#fff");
				}
				index++;
			});

		});

		$('#history_save').click(function() {
			$.ajax({
				type : "POST",
				url : "m04/s01/insert_m04s01_history.jsp",
				data : {
					b_code : $('#historyb_code').val(),
					bd_date : $('#history_date').val(),
					//bd_loc: bd_loc,
					bd_type : $('#history_type').val(),
					bd_memo : $('#history_memo').val(),
					bd_code : $('#bd_code').val()
				},
				success : function(response) {
					alert("부품이력이 등록되었습니다.");
					getBupumDetailList();
					historyDialog.dialog("close");
				}
			});
		});

		$('#delete_bupum').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				if ($('#historyb_code').val()) {

					$.ajax({
						type : "POST",
						url : "m04/s01/delete_m04s01_bupum.jsp",
						data : {
							b_code : $('#historyb_code').val()
						},
						success : function(response) {
							alert("부품이 삭제되었습니다.");
							getBupumList();
							getBupumDetailList();
						}
					});

				} else {
					alert("부품을 먼저 선택해주세요");
				}

			}

		});
		$('#delete_history').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				if ($('#bd_code').val()) {

					$.ajax({
						type : "POST",
						url : "m04/s01/delete_m04s01_history.jsp",
						data : {
							bd_code : $('#bd_code').val()
						},
						success : function(response) {
							alert("부품이 삭제되었습니다.");
							getBupumList();
							getBupumDetailList();
						}
					});

				} else {
					alert("부품을 먼저 선택해주세요");
				}

			}

		});
		$('#bupumExcelExport').click(function(){
			bupumExcelExport();
		});
		
		$('#historyExcelExport').click(function(){
			historyExcelExport();
		});

		/*다이얼로그*/

		var bupumDialog;
		bupumDialog = $("#bupum-form").dialog({
			autoOpen : false,
			//autoOpen: true,
			height : 530,
			width : 600,
			modal : false,
			stack : false,
			close : function(event, ui) {
				var form = $("#upload")[0];
				form.reset();
			},
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						bupumDialog.dialog("close");
					});
				}
			}
		});
		history_upload
		var historyDialog;
		historyDialog = $("#history-form").dialog({
			autoOpen : false,
			//autoOpen: true,
			height : 530,
			width : 600,
			modal : false,
			stack : false,
			close : function(event, ui) {
				var form = $("#history_upload")[0];
				form.reset();
			},
			buttons : {
				"닫 기" : function() {
					setTimeout(function() {
						historyDialog.dialog("close");
					});
				}
			}
		});

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
		
		/*차트 불러오는 함수*/
	</script>

</body>
</html>