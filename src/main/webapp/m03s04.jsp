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
		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
		</div>
		
		<div id="loading" style="display:none;">
			<img id="loading-image" src="resources/img/loading.gif" alt="Loading..." />
		</div>
		
		<div style="display:none;" id="image-form" title="파일 미리보기" >
			<iframe id="image_view" style="width:100%; height:100%; display:none;" > 
			
			</iframe>			
		</div>

		<div id="graph-form" style="display:none;" title="그래프">
			<div class="row">
			
				<div class="col-xs-6">
					<div id="run_chart"></div>
				</div>
				
				<div class="col-xs-6">
					<div id="history_chart"></div>				
				</div>
			</div>

		</div>
		
		<div style="display:none;" id="file-form" title="파일 첨부" >
			<form class="form-horizontal" action="i003002_import.jsp" name="upload" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*엑셀파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_date" name="import_date" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_cnt" name="import_cnt" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="ppk_sheet" name="ppk_sheet"/>
						
						
						<div class="file_input_div">
							<input type="file" id="file1" name="file1" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center"><input type="button" class="btn small btn-primary" onclick="ppk_import();" value="전송"></td>
					</tr>
				</table>
			</form>			
		</div>		
		
		<div style="display:none;" id="file2-form" title="파일 첨부" >
			<form class="form-horizontal" id="upload2" name="upload2" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*PDF파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath2" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_cnt2" name="import_cnt2" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file2" name="file2" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath2').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="file_import2();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>		
		
		<div id="tdate-form" style="display:none;" title="측정일 등록">
			<form class="form-inline" role="form" id="dateform" name="dateform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						측정일: </label>
					</div>
					
					
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="t_date" name="t_date" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="측정일"/>
					</div>			
				</form>
					<input type="hidden" id="t_cnt" name="t_cnt" />
					<input type="hidden" id="t_gb" name="t_gb" />
		</div>		
		
		<div style="display:none;" id="ppk-form" title="Ppk " >
		<form class="form-inline" role="form" id="ppk_form" name="ppk_form" 
				method="post" autocomplete="off">		
		
					<table style="border: 1px solid #0074; margin-top:15px; margin-left:5px;">
						<tr style="height: 40px; border: 1px solid #0074;">
						
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 13pt; font-family: headline;">
							시험월</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 12pt; font-family:headline;">
							공정명<br />Process Name</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 12pt; font-family: headline;">
							측정항목<br />Part No</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 220px; height: 30px; 
							font-size: 12pt; font-family: headline;">
							품명<br />Part Name</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 12pt; font-family: headline;">
							측정자<br />Evaluator</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 12pt; font-family: headline;">
							평가일자<br />Date</th>
							<td>&nbsp;</td>
							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 12pt; font-family: headline;">
							샘플링수<br />Sample N</th>
							<td>&nbsp;</td>

							<th class="text-center cell" 
							style="width: 110px; height: 30px; 
							font-size: 13pt; font-family: headline;">내려받기</th>
							<td>&nbsp;</td>	
							<th class="text-center cell" style="width: 110px; height: 30px; 
							font-size: 13pㅅ; font-family: headline;">
							그래프 보기
							</th>
							<td>&nbsp;</td>														
						</tr>
						
						
						
						<tr style="height: 40px; border: 1px solid #0074;">
							<td>
								<input type="hidden" id="export_hogi" name="export_hogi" />
								<input type="hidden" id="ppk_cnt" name="ppk_cnt" value="0" />
								<input type="text" class="form-control input-sm" id="ppk_day" name="ppk_day" 
										style="width: 110px; height: 30px; 
										font-size: 13pt; text-align: center; font-family: headline;
										background-color:white;"
										readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_proname" name="ppk_proname" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center;
								 font-family: headline; 
								 background-color:white;"
								 readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_pno" name="ppk_pno" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center; 
								font-family: headline;
								background-color:white;"
								readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_pname" name="ppk_pname" 
								style="width: 220px; height: 30px; 
								font-size: 13pt; text-align: center; font-family: headline;"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_writer" name="ppk_writer" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center; font-family: headline;"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_date" name="ppk_date" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center; font-family: headline;"/>
							</td>
							<td>&nbsp;</td>					
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_sampleN" name="ppk_sampleN" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center;
								background-color:white;"
								readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
									
									
							<!-- 내려받기 : ppk_export -->
							<td>
								<button type="button" class="btn btn-success" id="ppk_export">
									<i class="fa fa-file"></i>내려받기
								</button>							
							</td>
							<td>&nbsp;</td>
							<td>
								<button type="button" class="btn btn-default" id="ppk_graph">
									<i class="fa fa-search"></i>그래프보기
								</button>							
							</td>

							<td>&nbsp;</td>								
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							검사항목<br />Evaluation Item</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							계측기명<br />Measuring Inst.</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							측정단위<br />Unit</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 220px; height: 30px; font-size: 13px;">
							규격<br />Specification</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							규격상한<br />Upp.Tol</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							규격하한<br />Low.Tol</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							공차유형<br />Tol.type</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							</th>
							<td>&nbsp;</td>							
							<th class="text-center cell" style="width: 110px; height: 30px; font-size: 13px;">
							시간당 장입량<br />kg/hr</th>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<td>
								<input type="text" class="form-control input-sm" id="ppk_item" name="ppk_item" 
										style="width: 110px; height: 30px; font-size: 13pt; 
										text-align: center;
										background-color:white;"
										readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_measure" name="ppk_measure" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center;
								background-color:white;"
								readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_unit" name="ppk_unit" 
								style="width: 110px; height: 30px; 
								font-size: 13pt; text-align: center;
								background-color:white;"
								readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_spec" name="ppk_spec" 
								style="width: 220px; height: 30px; font-size: 13pt; text-align: center;
								background-color:white;"
								readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_uppTol" name="ppk_uppTol" 
								style="width: 110px; height: 30px; font-size: 13pt; text-align: center;"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_lowTol" name="ppk_lowTol" 
								style="width: 110px; height: 30px; font-size: 13pt; text-align: center;"/>
							</td>
							<td>&nbsp;</td>					
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_tolType" name="ppk_tolType" 
								style="width: 110px; height: 30px; font-size: 13pt; text-align: center;
									background-color:white;"
									readonly="readonly"/>
									
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_tolType2" name="ppk_tolType2" 
								style="width: 110px; height: 30px; font-size: 13pt; text-align: center;
									background-color:white;"
									readonly="readonly"/>
							</td>
							<td>&nbsp;</td>
							<td>
								<input type="text" class="form-control input-sm" 
								id="ppk_kg_hr" name="ppk_kg_hr" 
								style="width: 110px; height: 30px; font-size: 13pt; text-align: center;
									"/>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					
					<table id="ppk_inputDialog" style="border: 1px solid #0074; margin-top:5px; margin-left:5px;">
						
						<tr style="height: 30px; border: 1px solid #0074;">
							<th class="text-center cell" style="width: 80px; height: 30px; font-size: 13px;">측정값</th>
							<td>&nbsp;</td>						
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">1</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">2</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">3</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">4</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">5</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">6</th>
							<td>&nbsp;</td>								
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">7</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">8</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">9</th>
							<td>&nbsp;</td>
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;">10</th>
							<td>&nbsp;</td>
						</tr>
						
						
						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" style="width: 80px; height: 30px; font-size: 13px;">1~10</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val1" name="ppk_val1" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val2" name="ppk_val2" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val3" name="ppk_val3" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val4" name="ppk_val4" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val5" name="ppk_val5" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val6" name="ppk_val6" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val7" name="ppk_val7" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val8" name="ppk_val8" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val9" name="ppk_val9" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val10" name="ppk_val10" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>
						
						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" style="width: 80px; height: 30px; font-size: 13px;">11~20</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val11" name="ppk_val11" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val12" name="ppk_val12" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val13" name="ppk_val13" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val14" name="ppk_val14" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val15" name="ppk_val15" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val16" name="ppk_val16" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val17" name="ppk_val17" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val18" name="ppk_val18" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val19" name="ppk_val19" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val20" name="ppk_val20" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>						



						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">21~30</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val21" name="ppk_val21" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val22" name="ppk_val22" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val23" name="ppk_val23" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val24" name="ppk_val24" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val25" name="ppk_val25" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val26" name="ppk_val26" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val27" name="ppk_val27" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val28" name="ppk_val28" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val29" name="ppk_val29" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val30" name="ppk_val30" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">31~40</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val31" name="ppk_val31" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val32" name="ppk_val32" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val33" name="ppk_val33" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val34" name="ppk_val34" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val35" name="ppk_val35" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val36" name="ppk_val36" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val37" name="ppk_val37" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val38" name="ppk_val38" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val39" name="ppk_val39" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val40" name="ppk_val40" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">41~50</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val41" name="ppk_val41" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val42" name="ppk_val42" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val43" name="ppk_val43" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val44" name="ppk_val44" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val45" name="ppk_val45" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val46" name="ppk_val46" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val47" name="ppk_val47" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val48" name="ppk_val48" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val49" name="ppk_val49" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val50" name="ppk_val50" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">51~60</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val51" name="ppk_val51" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val52" name="ppk_val52" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val53" name="ppk_val53" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val54" name="ppk_val54" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val55" name="ppk_val55" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val56" name="ppk_val56" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val57" name="ppk_val57" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val58" name="ppk_val58" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val59" name="ppk_val59" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val60" name="ppk_val60" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">61~70</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val61" name="ppk_val61" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val62" name="ppk_val62" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val63" name="ppk_val63" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val64" name="ppk_val64" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val65" name="ppk_val65" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val66" name="ppk_val66" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val67" name="ppk_val67" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val68" name="ppk_val68" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val69" name="ppk_val69" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val70" name="ppk_val70" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">71~80</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val71" name="ppk_val71" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val72" name="ppk_val72" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val73" name="ppk_val73" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val74" name="ppk_val74" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val75" name="ppk_val75" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val76" name="ppk_val76" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val77" name="ppk_val77" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val78" name="ppk_val78" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val79" name="ppk_val79" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val80" name="ppk_val80" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">81~90</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val81" name="ppk_val81" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val82" name="ppk_val82" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val83" name="ppk_val83" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val84" name="ppk_val84" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val85" name="ppk_val85" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val86" name="ppk_val86" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val87" name="ppk_val87" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val88" name="ppk_val88" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val89" name="ppk_val89" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val90" name="ppk_val90" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>

						<tr style="height: 40px; border: 1px solid #0074;">
							<th class="text-center cell text-center" 
								style="width: 80px; height: 30px; font-size: 13px;">91~100</th>
							<td>&nbsp;</td>											
							<td><input type="text" class="form-control input-sm" id="ppk_val91" name="ppk_val91" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val92" name="ppk_val92" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val93" name="ppk_val93" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val94" name="ppk_val94" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val95" name="ppk_val95" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val96" name="ppk_val96" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>							
							<td><input type="text" class="form-control input-sm" id="ppk_val97" name="ppk_val97" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val99" name="ppk_val98" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val99" name="ppk_val99" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
							<td><input type="text" class="form-control input-sm" id="ppk_val100" name="ppk_val100" 
								style="width: 60px; height: 30px; font-size: 13pt; text-align: center;"/></td>
							<td>&nbsp;</td>
						</tr>
					</table>			
					
							
					
					<table style="border: 1px solid #0074; margin-top:10px; margin-left:5px;">
						<tr style="height: 30px; border: 1px solid #0074;">
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Min</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_min"></th>
										
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Max</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_max"></th>

							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Aver.</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_aver"></th>

							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Dev.</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_dev"></th>

							<th class="text-center cell" style="width: 80px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">추정 불량율</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 100px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_fail"></th>
						</tr>
						
						
						<tr style="height: 30px; border: 1px solid #0074;">
							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Pp</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_pp"></th>

							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Ppu</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_ppu"></th>

							<th class="text-center cell" style="width: 60px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Ppl</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_ppl"></th>

							<th class="text-center cell" style="width: 80px; height: 30px; font-size: 13px;
								border: 1px solid #0074; background-color:#36FFFF;">Ppk</th>
								
							<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 100px; word-break:break-all; font-size:15pt; font-family:headline; font-size: 10pt;
										border: 1px solid #0074;" id="ppk_r_ppk"></th>						
						
						</tr>
						
					</table>					
					
			</form>					
		</div>


<div id="wrap">

    <div id="header">
		<jsp:include page="header-menu.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-top:30px;">
		
		<jsp:include page="body-menu.jsp"/>
	</div>
	<div id="contents">
        
        
        
<div class="content" style="height:810px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">품질관리 - Ppk 분석</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" style="font-size: 14pt; color:#8C8C8C; 
						width: 60px; text-align: right; font-family:headline;">년 도 : </label>
					</div>
					
					<div class="form-group">
						<select class="form-control input-sm" id="s_year" name="s_year" 
						style="margin-top:5px; height: 30px; width: 160px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;">
						</select>
					</div>
					
					
					<!-- 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<label class="control-label" style="padding-top: 6px; font-size: 14pt; color:#8C8C8C; width: 120px; text-align: right;">
							<span class="glyphicon glyphicon-stop" style="color:#D9E5FF;"></span>&nbsp;파일 첨부
						</label>
					</div>
					
					<div class="form-group">
						<label class="control-label" style="padding-top: 6px; font-size: 14pt; color:#8C8C8C; width: 120px; text-align: right;">
							<span class="glyphicon glyphicon-stop" style="color:#FFFFFF;"></span>&nbsp;수기 입력
						</label>
					</div>	
					 -->
					 
					 										
				</form>
            </header>
            
            <div id="collapse4" class="body">
               <table id="ppk_list" cellspacing="0" class="table table-bordered table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 60px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								구분
							</th>
							
							
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								1월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								2월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								3월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								4월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								5월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								6월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								7월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								8월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								9월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								10월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								11월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								12월
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								평 균
							</th>										
						</tr>
					</thead>
					<tbody id="ppk_contents">
					
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
	$(".datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	});

	//timepicker 초기화
    $(".timepicker").timepicker({
        timeFormat:'HH:mm:ss',
        controlType:'select',
        currentText: "현재시간",
        oneLine:true
    });	
	
/*전역변수*/	
var tdate;
var sid;
/*인터벌*/
	
	
/*페이지 로드*/	
	$(function(){
		fn_check();
		//현재시간 Date
		var now = new Date();
		
		tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
		
		for(var j=-3; j<2; j++){
			var y_value = now.getFullYear() + j;
			$("#s_year").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
		}
		
		
		sid = '<%=session.getAttribute("sid")%>';
		$("#s_year").val(now.getFullYear());
		getYearCount();
	});
	
	
	
/*함수*/	
  			var fn_check = function() {
				
				
				$.ajax({
					 method: "POST",
					 url: "set_chk.jsp",
					 contentType: "application/json; charset=utf-8",
					 data: {'time':new Date().getTime()},
					 
					 success : function(data) {
						
						var rsJson = JSON.parse(data);
						var rsAr = rsJson.data;
							
						if ($.isArray(rsAr)){

							if (rsAr[0].sec == "")
							{
								alert("로그인 정보가 없습니다.");
							    location.href="index.jsp";
							}
							
							$("#user_span").html("<font color='#428bca'><strong><a href = 'javascript:popupOpen();'>" + rsAr[0].sec + "</a></strong></font> 님이 로그인중입니다. ");

							if (rsAr[0].lev == "관리자")
							{
								//alert("확인");
								$("#pwd").attr("disabled",false).attr("readonly",false);
							}
						}
						
					 }
				}).done(function( msg ) {
				
			  });

			};	
	function date_set(v){
		var result = "";
		if(v <= 9){
			result = "0"+v;			
		}else{
			result = v;
		}
		
		return result;
	}
	

 
 
function init(){
//	getPpkList();
	
}

var getYearCount = function(){
	//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
	$.post("m03/s04/count_m03s04.jsp",{
		"tdate":$("#s_year").val()
	},100);
	
	setTimeout(function(){
		getPpk();
//		getPpkList();
	},300);
}

function tdateReg(c_val, gb){
	$("#t_cnt").val(c_val);
	$("#t_gb").val(gb);
	
	tdateDialog.dialog("open");
	
}


function ppkAdd(c_val){
	
	$("#import_cnt2").val(c_val);
	
	file2Dialog.dialog("open");
	
}

var getPpk = function(){
	$.ajax({
		type : "POST",
		url : "m03/s04/select_m03s04.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"tdate":$("#s_year").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var h1s = rsJson.h1;
				var h2s = rsJson.h2;
				var h3s = rsJson.h3;
				var h4s = rsJson.h4;
				var h5s = rsJson.h5;
				var h6s = rsJson.h6;
				
				var sum1 = 0; var sum1_idx = 0; var sum1_result = 0;
				var sum2 = 0; var sum2_idx = 0; var sum2_result = 0;
				var sum3 = 0; var sum3_idx = 0; var sum3_result = 0;
				var sum4 = 0; var sum4_idx = 0; var sum4_result = 0;
				var sum5 = 0; var sum5_idx = 0; var sum5_result = 0;
				var sum6 = 0; var sum6_idx = 0; var sum6_result = 0;
				
				var listHtml = "";
					for(var i=0; i<12; i++){
						if(h1s[i].val != ''){
							sum1+=eval(h1s[i].val);
							sum1_idx++;
						}
					}
					if(sum1 == 0 && sum1_idx == 0){
						sum1_result = 0;
					}else{
						sum1_result = (eval(sum1)/sum1_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">1호기</td>';
					
					
					
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h1_'+h1s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[0].val+'</td>';
					listHtml += '<td id="h1_'+h1s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[1].val+'</td>';
					listHtml += '<td id="h1_'+h1s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[2].val+'</td>';
					listHtml += '<td id="h1_'+h1s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[3].val+'</td>';
					listHtml += '<td id="h1_'+h1s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[4].val+'</td>';
					listHtml += '<td id="h1_'+h1s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[5].val+'</td>';
					listHtml += '<td id="h1_'+h1s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[6].val+'</td>';
					listHtml += '<td id="h1_'+h1s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[7].val+'</td>';
					listHtml += '<td id="h1_'+h1s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[8].val+'</td>';
					listHtml += '<td id="h1_'+h1s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[9].val+'</td>';
					listHtml += '<td id="h1_'+h1s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[10].val+'</td>';
					listHtml += '<td id="h1_'+h1s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h1s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum1_result+'</td>';
					listHtml += "</tr>";
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					
					//'<img src="resources/img/file1.png">'
					listHtml += '<td id="h1_2_'+h1s[0].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[0].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h1_2_'+h1s[1].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[1].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[2].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[2].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[3].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[3].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[4].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[4].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[5].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[5].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[6].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[6].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[7].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[7].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[8].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[8].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[9].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[9].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[10].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[10].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h1_2_'+h1s[11].cnt+'" class="b_img" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;  border-top: 0.1px dotted gray;" onclick=ppkOpen('+h1s[11].cnt+',0); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h1s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
//					$(".b_img").css("border-bottom","0.1px dotted gray");
//					$(".b_img").css("border-top","0.1px dotted gray");					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[0].date+'</td>';
					listHtml += '<td class="nr4  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[1].date+'</td>';
					listHtml += '<td class="nr5  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[2].date+'</td>';
					listHtml += '<td class="nr6  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[3].date+'</td>';
					listHtml += '<td class="nr7  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[4].date+'</td>';
					listHtml += '<td class="nr8  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[5].date+'</td>';
					listHtml += '<td class="nr9  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[6].date+'</td>';
					listHtml += '<td class="nr10  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[7].date+'</td>';
					listHtml += '<td class="nr11  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[8].date+'</td>';
					listHtml += '<td class="nr12  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[9].date+'</td>';
					listHtml += '<td class="nr13  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[10].date+'</td>';
					listHtml += '<td class="nr14  b_date" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h1s[11].date+'</td>';
					listHtml += "</tr>";					
		
					
					//2
					for(var i=0; i<12; i++){
						if(h2s[i].val != ''){
							sum2+=eval(h2s[i].val);
							sum2_idx++;
						}
					}
					if(sum2 == 0 && sum2_idx == 0){
						sum2_result = 0;
					}else{
						sum2_result = (eval(sum2)/sum2_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">2호기</td>';
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h2_'+h2s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[0].val+'</td>';
					listHtml += '<td id="h2_'+h2s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[1].val+'</td>';
					listHtml += '<td id="h2_'+h2s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[2].val+'</td>';
					listHtml += '<td id="h2_'+h2s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[3].val+'</td>';
					listHtml += '<td id="h2_'+h2s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[4].val+'</td>';
					listHtml += '<td id="h2_'+h2s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[5].val+'</td>';
					listHtml += '<td id="h2_'+h2s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[6].val+'</td>';
					listHtml += '<td id="h2_'+h2s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[7].val+'</td>';
					listHtml += '<td id="h2_'+h2s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[8].val+'</td>';
					listHtml += '<td id="h2_'+h2s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[9].val+'</td>';
					listHtml += '<td id="h2_'+h2s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[10].val+'</td>';
					listHtml += '<td id="h2_'+h2s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h2s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum2_result+'</td>';
					listHtml += "</tr>";

					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					

					listHtml += '<td id="h2_2_'+h2s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[0].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h2_2_'+h2s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[1].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[2].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[3].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[4].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[5].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[6].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[7].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[8].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[9].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[10].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h2_2_'+h2s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h2s[11].cnt+',1); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h2s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[0].date+'</td>';
					listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[1].date+'</td>';
					listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[2].date+'</td>';
					listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[3].date+'</td>';
					listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[4].date+'</td>';
					listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[5].date+'</td>';
					listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[6].date+'</td>';
					listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[7].date+'</td>';
					listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[8].date+'</td>';
					listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[9].date+'</td>';
					listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[10].date+'</td>';
					listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h2s[11].date+'</td>';
					listHtml += "</tr>";					

					
					//3
					
					for(var i=0; i<12; i++){
						if(h3s[i].val != ''){
							sum3+=eval(h3s[i].val);
							sum3_idx++;
						}
					}
					if(sum3 == 0 && sum3_idx == 0){
						sum3_result = 0;
					}else{
						sum3_result = (eval(sum3)/sum3_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">3호기</td>';
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h3_'+h3s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[0].val+'</td>';
					listHtml += '<td id="h3_'+h3s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[1].val+'</td>';
					listHtml += '<td id="h3_'+h3s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[2].val+'</td>';
					listHtml += '<td id="h3_'+h3s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[3].val+'</td>';
					listHtml += '<td id="h3_'+h3s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[4].val+'</td>';
					listHtml += '<td id="h3_'+h3s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[5].val+'</td>';
					listHtml += '<td id="h3_'+h3s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[6].val+'</td>';
					listHtml += '<td id="h3_'+h3s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[7].val+'</td>';
					listHtml += '<td id="h3_'+h3s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[8].val+'</td>';
					listHtml += '<td id="h3_'+h3s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[9].val+'</td>';
					listHtml += '<td id="h3_'+h3s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[10].val+'</td>';
					listHtml += '<td id="h3_'+h3s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h3s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum3_result+'</td>';
					listHtml += "</tr>";

					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					

					listHtml += '<td id="h3_2_'+h3s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[0].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h3_2_'+h3s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[1].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[2].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[3].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[4].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[5].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[6].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[7].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[8].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[9].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[10].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h3_2_'+h3s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h3s[11].cnt+',2); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h3s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[0].date+'</td>';
					listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[1].date+'</td>';
					listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[2].date+'</td>';
					listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[3].date+'</td>';
					listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[4].date+'</td>';
					listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[5].date+'</td>';
					listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[6].date+'</td>';
					listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[7].date+'</td>';
					listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[8].date+'</td>';
					listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[9].date+'</td>';
					listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[10].date+'</td>';
					listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h3s[11].date+'</td>';
					listHtml += "</tr>";					
					
					
					
					//4
					for(var i=0; i<12; i++){
						if(h4s[i].val != ''){
							sum4+=eval(h4s[i].val);
							sum4_idx++;
						}
					}
					if(sum4 == 0 && sum4_idx == 0){
						sum4_result = 0;
					}else{
						sum4_result = (eval(sum4)/sum4_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">4호기</td>';
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h4_'+h4s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[0].val+'</td>';
					listHtml += '<td id="h4_'+h4s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[1].val+'</td>';
					listHtml += '<td id="h4_'+h4s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[2].val+'</td>';
					listHtml += '<td id="h4_'+h4s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[3].val+'</td>';
					listHtml += '<td id="h4_'+h4s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[4].val+'</td>';
					listHtml += '<td id="h4_'+h4s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[5].val+'</td>';
					listHtml += '<td id="h4_'+h4s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[6].val+'</td>';
					listHtml += '<td id="h4_'+h4s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[7].val+'</td>';
					listHtml += '<td id="h4_'+h4s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[8].val+'</td>';
					listHtml += '<td id="h4_'+h4s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[9].val+'</td>';
					listHtml += '<td id="h4_'+h4s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[10].val+'</td>';
					listHtml += '<td id="h4_'+h4s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h4s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum4_result+'</td>';
					listHtml += "</tr>";

					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					

					listHtml += '<td id="h4_2_'+h4s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[0].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h4_2_'+h4s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[1].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[2].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[3].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[4].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[5].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[6].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[7].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[8].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[9].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[10].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h4_2_'+h4s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h4s[11].cnt+',3); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h4s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[0].date+'</td>';
					listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[1].date+'</td>';
					listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[2].date+'</td>';
					listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[3].date+'</td>';
					listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[4].date+'</td>';
					listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[5].date+'</td>';
					listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[6].date+'</td>';
					listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[7].date+'</td>';
					listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[8].date+'</td>';
					listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[9].date+'</td>';
					listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[10].date+'</td>';
					listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h4s[11].date+'</td>';
					listHtml += "</tr>";					
					
					
					
					//5
					for(var i=0; i<12; i++){
						if(h5s[i].val != ''){
							sum5+=eval(h5s[i].val);
							sum5_idx++;
						}
					}
					if(sum5 == 0 && sum5_idx == 0){
						sum5_result = 0;
					}else{
						sum5_result = (eval(sum5)/sum5_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">5호기</td>';
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h5_'+h5s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[0].val+'</td>';
					listHtml += '<td id="h5_'+h5s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[1].val+'</td>';
					listHtml += '<td id="h5_'+h5s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[2].val+'</td>';
					listHtml += '<td id="h5_'+h5s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[3].val+'</td>';
					listHtml += '<td id="h5_'+h5s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[4].val+'</td>';
					listHtml += '<td id="h5_'+h5s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[5].val+'</td>';
					listHtml += '<td id="h5_'+h5s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[6].val+'</td>';
					listHtml += '<td id="h5_'+h5s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[7].val+'</td>';
					listHtml += '<td id="h5_'+h5s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[8].val+'</td>';
					listHtml += '<td id="h5_'+h5s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[9].val+'</td>';
					listHtml += '<td id="h5_'+h5s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[10].val+'</td>';
					listHtml += '<td id="h5_'+h5s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h5s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum5_result+'</td>';
					listHtml += "</tr>";

					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					

					listHtml += '<td id="h5_2_'+h5s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[0].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h5_2_'+h5s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[1].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[2].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[3].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[4].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[5].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[6].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[7].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[8].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[9].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[10].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h5_2_'+h5s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h5s[11].cnt+',4); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h5s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[0].date+'</td>';
					listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[1].date+'</td>';
					listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[2].date+'</td>';
					listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[3].date+'</td>';
					listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[4].date+'</td>';
					listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[5].date+'</td>';
					listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[6].date+'</td>';
					listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[7].date+'</td>';
					listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[8].date+'</td>';
					listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[9].date+'</td>';
					listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[10].date+'</td>';
					listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h5s[11].date+'</td>';
					listHtml += "</tr>";					

					
					//6
					for(var i=0; i<12; i++){
						if(h6s[i].val != ''){
							sum6+=eval(h6s[i].val);
							sum6_idx++;
						}
					}
					if(sum6 == 0 && sum6_idx == 0){
						sum6_result = 0;
					}else{
						sum6_result = (eval(sum6)/sum6_idx).toFixed(2);
					}
					listHtml += "<tr>";
					listHtml += '<td rowspan="3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">6호기</td>';
					
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">Ppk</td>';
					listHtml += '<td id="h6_'+h6s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[0].val+'</td>';
					listHtml += '<td id="h6_'+h6s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[1].val+'</td>';
					listHtml += '<td id="h6_'+h6s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[2].val+'</td>';
					listHtml += '<td id="h6_'+h6s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[3].val+'</td>';
					listHtml += '<td id="h6_'+h6s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[4].val+'</td>';
					listHtml += '<td id="h6_'+h6s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[5].val+'</td>';
					listHtml += '<td id="h6_'+h6s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[6].val+'</td>';
					listHtml += '<td id="h6_'+h6s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[7].val+'</td>';
					listHtml += '<td id="h6_'+h6s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[8].val+'</td>';
					listHtml += '<td id="h6_'+h6s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[9].val+'</td>';
					listHtml += '<td id="h6_'+h6s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[10].val+'</td>';
					listHtml += '<td id="h6_'+h6s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray;">'+h6s[11].val+'</td>';
					listHtml += '<td rowspan="3" class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+sum6_result+'</td>';
					listHtml += "</tr>";

					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">데이터 등록</td>';					

					listHtml += '<td id="h6_2_'+h6s[0].cnt+'" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[0].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[0].f+'.png">'+'</td>';	
					listHtml += '<td id="h6_2_'+h6s[1].cnt+'" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[1].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[1].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[2].cnt+'" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[2].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[2].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[3].cnt+'" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[3].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[3].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[4].cnt+'" class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[4].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[4].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[5].cnt+'" class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[5].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[5].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[6].cnt+'" class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[6].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[6].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[7].cnt+'" class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[7].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[7].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[8].cnt+'" class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[8].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[8].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[9].cnt+'" class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[9].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[9].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[10].cnt+'" class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[10].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[10].f+'.png">'+'</td>';
					listHtml += '<td id="h6_2_'+h6s[11].cnt+'" class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; cursor: pointer; border-bottom: 0.1px dotted gray; border-top: 0.1px dotted gray;" onclick=ppkOpen('+h6s[11].cnt+',5); return false; event.cancelBubble = true;>'+'<img src="resources/img/file'+h6s[11].f+'.png">'+'</td>';
					listHtml += "</tr>";					
					
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">평가일</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[0].date+'</td>';
					listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[1].date+'</td>';
					listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[2].date+'</td>';
					listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[3].date+'</td>';
					listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[4].date+'</td>';
					listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[5].date+'</td>';
					listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[6].date+'</td>';
					listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[7].date+'</td>';
					listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[8].date+'</td>';
					listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[9].date+'</td>';
					listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[10].date+'</td>';
					listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline; border-top: 0.1px dotted gray;">'+h6s[11].date+'</td>';
					listHtml += "</tr>";					



					
		
	   			$("#ppk_list tbody").html(listHtml);

	   							   			
	   			//console.log(detailTable);
			} else if (rsJson && rsJson.status == "fail") {
				alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
			} else {
				alert("에러발생!");
			}
			
//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
			
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

//listHtml += '<td style="text-align: center; height: 20px; width: 100px;"><button type="button" class="btn btn-default" onclick=viewFile("20190103_3호기Cpk.pdf"); return false; event.cancelBubble = true;><span class="glyphicon glyphicon-search"></span>파일보기</button></td>';

function viewFile(fileName){
	var file = "/sunil/data/qa/"+(decodeURIComponent(fileName));
	
//	console.log((decodeURIComponent(file)));
	
	$("#image_view").attr("src",(decodeURIComponent(file)));
	$("#image_view").show();
	
	imageDialog.dialog("open");
}

	function ppkOpen(c_val,sheet_num){
		//	console.log("3호기 : "+c_val);
		//컬럼을 선택해서 받아온 cnt값을 기준으로 설비-년도-월 받아와서 input태그에 표시
		//수치값 입력은 3~4개 예시로
		
		//c_val값으로 fileCheck실행
		//file_yn이 Y이면 이미지 다이얼로그
		//file_yn이 N이면 아래의 값 등록 창
		
		
		
		$("#ppk_sheet").val(sheet_num);
		$.ajax({
			type : "POST",
			url : "m03/s04/fileCheck_m03s04.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"cnt":c_val},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
//					console.log(rsAr[0].filename);
					/*			
					if(rsAr[0].file_yn == "Y"){
						//iframe태그 아이디 : image_view
						var file = "/sunil/upload/"+encodeURIComponent(rsAr[0].filename);
						$("#image_view").attr("src",(decodeURIComponent(file)));
						$("#image_view").show();
						
						
						imageDialog.dialog("open");
					}else{
							
					}
					*/
					
					
					
					valueDialog(c_val);
					
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

	function valueDialog(c_val){
		$.ajax({
			type : "POST",
			url : "m03/s04/month_m03s04.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"cnt":c_val},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					//설비명과 년 월 가져오기
					var rsAr = rsJson.rows;
					var values = rsJson.values;
					var ppks = rsJson.ppk;
					$("#export_hogi").val(rsAr[0].hogi);
					$("#ppk_cnt").val(rsAr[0].cnt);
					$("#ppk_day").val(rsAr[0].year1+"-"+rsAr[0].month1);
					$("#ppk_proname").val(rsAr[0].proname);
					$("#ppk_pno").val(rsAr[0].pno);
					$("#ppk_pname").val(rsAr[0].pname);
					$("#ppk_writer").val(rsAr[0].writer);
					$("#ppk_date").val(rsAr[0].date1);
					$("#ppk_sampleN").val(rsAr[0].sampleN);
					$("#ppk_item").val(rsAr[0].item);
					$("#ppk_measure").val(rsAr[0].measure);
					$("#ppk_unit").val(rsAr[0].unit);
					$("#ppk_spec").val(rsAr[0].spec);
					$("#ppk_uppTol").val(rsAr[0].upp);
					$("#ppk_lowTol").val(rsAr[0].low);
					$("#ppk_tolType").val(rsAr[0].tolType);
					$("#ppk_kg_hr").val(rsAr[0].kg_hr);
					
					/*
					$("#ppk_val1").val(rsAr[0].ppk_val1);
					$("#ppk_val2").val(rsAr[0].ppk_val2);
					$("#ppk_val3").val(rsAr[0].ppk_val3);
					*/

					$("#import_date").val(rsAr[0].year1+"-"+rsAr[0].month1);
					$("#import_cnt").val(rsAr[0].cnt);
					
					for(var i=0; i<values.length; i++){
//						console.log(values[i]);
						
						$("#ppk_val"+(i+1)).val(values[i]);
					}
//					console.log(ppks);


					$("#ppk_r_min").text(ppks.min);
					$("#ppk_r_max").text(ppks.max);
					$("#ppk_r_aver").text(ppks.average);
					$("#ppk_r_dev").text(ppks.dev);
					$("#ppk_r_pp").text(ppks.pp);
					$("#ppk_tolType").val(ppks.tolType);
					$("#ppk_spec").val(ppks.spec);
					$("#ppk_r_ppu").text(ppks.ppu);
					$("#ppk_r_ppl").text(ppks.ppl);
					$("#ppk_r_ppk").text(ppks.ppk);
					$("#ppk_tolType2").val(ppks.tolType2);
					$("#ppk_r_fail").text(ppks.totalPPm);
					
					ppkDialog.dialog("open");
					
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
	
/*
function cpkOpen(c_value){
	if(c_value == 'h3_1'){
//		alert("3호기 1월");
		$("#cpk_val").val($("#h3_1val").text());
		$("#cpk_day").val($("#h3_1day").text());		
	}else if(c_value == 'h3_2'){
//		alert("3호기 2월");
		$("#cpk_val").val($("#h3_2val").text());
		$("#cpk_day").val($("#h3_2day").text());
	}else{
//		alert("3호기 3월");
		$("#cpk_val").val($("#h3_3val").text());
		$("#cpk_day").val($("#h3_3day").text());
	}
	cpkDialog.dialog("open");
}
*/



	function ppk_import(){
		//전송을 누르면 파일선택창이 닫히게
		fileDialog.dialog("close");
		//전송을 누르면 로딩이미지 보이게		
		$("#loading").show();
		var upload = document.upload;
		
		 if (upload.file1.value == "") {   
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 

   		if(!checkFileTypeExcel(upload.file1.value)) {
   			$("#loading").hide();
			  $("#alertSpan").text("엑셀파일만 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("엑셀만해");
				
				upload.reset();
		  return false;   
		 }		 
		 
		 
		 
//		 alert("굿");
		 
		 upload.submit();
		 
	}




function file_import2(){
	//전송을 누르면 파일선택창이 닫히게
	file2Dialog.dialog("close");
	//전송을 누르면 로딩이미지 보이게		
	$("#loading").show();
	var upload = document.upload2;
	
	 if (upload.file2.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }
	 

		if(!checkFileTypePDF(upload.file2.value)) {
			$("#loading").hide();
		  $("#alertSpan").text("PDF 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			upload.reset();
	  return false;   
	 }		 
	 
	 
	 
//	 alert("굿");
	 
	 upload.submit();
	 
}


	function checkFileTypeExcel(filePath){   
		  
		 var fileLen = filePath.length;   
		 var fileFormat = filePath.substring(filePath.lastIndexOf('.'),filePath.length);   
		 fileFormatfileFormat = fileFormat.toLowerCase();   
		 
		 if (fileFormat == ".xls"){
			 return true;    
		 	}else if(fileFormat == ".xlsx"){
		 		return true;
			}else{ 
		 		return false;
		 }   
		}
	
	function checkFileTypePDF(filePath){   
		  
		 var fileLen = filePath.length;   
		 var fileFormat = filePath.substring(filePath.lastIndexOf('.'),filePath.length);   
		 fileFormatfileFormat = fileFormat.toLowerCase();   
		 
		 if (fileFormat == ".pdf"){
			 return true;    
		 	}else{ 
		 		return false;
		 }   
		}	

/*이벤트*/

$("#ppk_importView").on("click",function(){
	fileDialog.dialog("open");
	
});

$("#ppk_inputDialog input").focusout(function(){
	var value = $(this).val();
	
	if(value.indexOf(".") == -1){
		if(value.length == 2){
			$(this).val(value+".0");
		}else if(value.length == 3){
			var v = value;
			var r_v = v.substring(0,2)+"."+v.substring(2,3);
			$(this).val(r_v);
		}		
	}
	
});

$("#s_year").change(function(){
	getYearCount();
});

var export_ppk = new Array();
$("#ppk_export").on("click",function(){
	$("#loading").show();
	
	  for(var i=0; i<100; i++){
		  export_ppk[i] = $("#ppk_val"+(i+1)).val();
		  
		  if($("#ppk_val"+(i+1)).val() != ''){
		  	
		  }
	  }
	  
	  jQuery.ajaxSettings.traditional = true;
	
	var ppk_cnt = $("#ppk_cnt").val();
//	alert(ppk_cnt);
//	return;




	$.post("m03/s04/export_m03s04.jsp",{
		"export_hogi":$("#export_hogi").val(),
		"ppk_cnt":ppk_cnt,
		"ppk_proname":$("#ppk_proname").val(),
		"ppk_pno":$("#ppk_pno").val(),
		"ppk_pname":$("#ppk_pname").val(),
		"ppk_writer":$("#ppk_writer").val(),
		"ppk_date":$("#ppk_date").val(),
		"ppk_sampleN":$("#ppk_sampleN").val(),
		"ppk_item":$("#ppk_item").val(),
		"ppk_measure":$("#ppk_measure").val(),
		"ppk_unit":$("#ppk_unit").val(),
		"ppk_spec":$("#ppk_spec").val(),
		"ppk_uppTol":$("#ppk_uppTol").val(),
		"ppk_lowTol":$("#ppk_lowTol").val(),
		"ppk_kg_hr":$("#ppk_kg_hr").val(),
		"ppk_tolType":$("#ppk_tolType").val(),
		"export_ppk":export_ppk
	},100);
	
	setTimeout(function(){
			$.ajax({
				type : "POST",
				url : "m03/s04/fileCheck_m03s04.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						"cnt":ppk_cnt},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;		
						
//						rsAr[0].filename
						$('#downloadLink').prop('href', '/JINHAP_OFFICE/upload/'+rsAr[0].filename); 
				
						$('#downloadLink').prop('download', rsAr[0].filename);
				
						$('#downloadLink')[0].click();

						$("#loading").hide();
					} else if (rsJson && rsJson.status == "fail") {
						alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
					} else {
						alert("에러발생!");
					}
					
//					timer = setTimeout(function(){ o.run(); }, o.pollInterval);
					
				},	// success 끝
				error: function(req, status) {
					if (req.status == 0 || status == "timeout") {
						alert("네트워크 연결 확인 후 다시 시도해주세요.");
					} else {
						alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
					}
				},
				
			});				
					
		
		
//		var link = $("a");
//		link.href = "/sunil";
	},1000);
});



	var runChart; var historyChart;
	var runJson; var historyJson;

	$("#ppk_graph").on("click",function(){
		
		
		$.ajax({
			type : "POST",
			url : "m03/s04/graph_m03s04.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"cnt":$("#ppk_cnt").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var rsAr2 = rsJson.rows2;
					
					runJson = rsAr;	
					historyJson = rsAr2;
//					console.log(runJson);
					
				
					
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
			
		
		
		setTimeout(function(){
			runChart_generate();
			historyChart_generate();
			graphDialog.dialog("open");
		},300);	
		
	});
	
	function runChart_generate(){
		runChart = bb.generate({
			size:{
				width:700,
				height:600
			},title:{
				text: "\n개별치 연속그래프\n(Run Chart)",
				position:"center"
			},
			data: {
		        json: runJson,
		        keys: {
		        	x:"xval",
		        	y:"val",
					value:["val","upp","low","dif"]
		        },
		        
		        colors:{
		        	"val":"#0000FF",
		        	"upp":"#FF0000",
		        	"low":"#FF0000",
		        	"dif":"#FF0000"
		        },
		        type: "line"
			},
			legend:{
				show:false
			},
		      point: {
		    	     r: function(d) {
		    	    	 var r_val = "0";
		    	         if(d.id == "val"){
		    	        	 r_val = "3";
		    	         }else{
		    	        	 r_val = "0.03";
		    	         }
		    	         return r_val;
		    	     }
		      },
			 bindto:"#run_chart"
		});			
	}
	
	function historyChart_generate(){
		historyChart = bb.generate({
			size:{
				width:700,
				height:600
			},title:{
				text: "\n히스토그램\n(Histogram)",
				position:"center"
			},
			data: {
		        json: historyJson,
		        keys: {
		        	x:"xval",
		        	y:"i",
					value:["xval","h","i","j","k","l"]
		        },
		        colors:{
		        	"h":"#0000FF",
		        	"k":"#0000FF",
		        	"l":"#0000FF",
		        	"i":"#FF0000",
		        	"j":"#FF0000"
		        },
		        type:"line"
			},	        
			legend:{
				show:false
			},
			point:{
				r:0.03
			},
			 bindto:"#history_chart"
		});			
	}
	
	
/*다이얼로그*/
 


var fileDialog;
	fileDialog = $("#file-form").dialog({
		  autoOpen: false,
		  height: 280,
		  width: 380,
		  modal: false,
		  stack:false,
		  buttons: {		
		        "닫 기": function() {
		        	setTimeout( function() 
		              {				
		        		fileDialog.dialog("close");
		              });
		        }
			  }
		});

	var file2Dialog;
	file2Dialog = $("#file2-form").dialog({
		  autoOpen: false,
		  height: 280,
		  width: 380,
		  modal: false,
		  stack:false,
		  buttons: {		
		        "닫 기": function() {
		        	setTimeout( function() 
		              {				
		        		file2Dialog.dialog("close");
		              });
		        }
			  }
		});	
	
	
var imageDialog;			

imageDialog = $("#image-form").dialog({
  autoOpen: false,
  height: 950,
  width: 1400,
  modal: false,
  stack:false,
  buttons: {		
        "닫 기": function() {
        	setTimeout( function() 
              {				
        		imageDialog.dialog("close");
              });
        }
	  }
});

var ppk_valArray = new Array();

var ppkDialog;			
var ppkForm;

ppkDialog = $("#ppk-form").dialog({
  autoOpen: false,
  height: 850,
  width: 1300,
  modal: false,
  stack:false,
  open: function(event, ui){
	  $('.ui-dialog').css('zIndex', 20003);
  },
  buttons: {
      "저 장": function() {
    	  if(sid != "worker"){
	    	  var p_cnt = $("#ppk_cnt").val();
	    	  var proname = $("#ppk_proname").val();			//공정명
	    	  var pno = $("#ppk_pno").val();					//측정항목
	    	  var pname = $("#ppk_pname").val();				//품명
	    	  var writer = $("#ppk_writer").val();				//측정자
	    	  var date = $("#ppk_date").val();					//평가일자
	    	  var sampleN = $("#ppk_sampleN").val();			//샘플링 수
	    	  var item = $("#ppk_item").val();					//검사항목
	    	  var measure = $("#ppk_measure").val();			//계측기명
	    	  var unit = $("#ppk_unit").val();					//측정단위
	    	  var spec = $("#ppk_spec").val();					//규격
	    	  var upp = $("#ppk_uppTol").val();					//규격상한
	    	  var low = $("#ppk_lowTol").val();					//규격하한
	    	  var type = $("#ppk_tolType").val();				//공차유형
	    	  var kg_hr = $("#ppk_kg_hr").val();				//시간당 장입량
	    	  
	    	  for(var i=0; i<100; i++){
	    		  ppk_valArray[i] = $("#ppk_val"+(i+1)).val();
	    		  
	    		  if($("#ppk_val"+(i+1)).val() != ''){
	    		  	
	    		  }
	    	  }
	    	  
	    	  jQuery.ajaxSettings.traditional = true;
	    	  
	    	  $.post("m03/s04/insert_m03s04.jsp",{
	    		  "cnt":p_cnt,
	    		  "tdate":tdate,
	    		  "ppkArray":ppk_valArray,
	    		  "proname":proname,
	    		  "pno":pno,
	    		  "pname":pname,
	    		  "writer":writer,
	    		  "date":date,
	    		  "sampleN":sampleN,
	    		  "item":item,
	    		  "measure":measure,
	    		  "unit":unit,
	    		  "spec":spec,
	    		  "upp":upp,
	    		  "low":low,
	    		  "type":type,
	    		  "kg_hr":kg_hr
	    	  },100);
	    	  
	    	  setTimeout(function(){
	    		  ppkDialog.dialog("close");
	    		  getPpk();
	    	  },300);
    	  }
      },      
        "닫 기": function() {
        	setTimeout( function() 
              {				
        		ppkDialog.dialog("close");
              });
        }
	  }
});

ppkForm = ppkDialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
//      addUser();
});

var tdateDialog;
tdateDialog = $("#tdate-form").dialog({
	autoOpen:false,
	height:180,
	width:300,
	modal:false,
	stack:false,
	buttons:{
		"등 록":function(){
			tdateDialog.dialog("close");
			
			$.post("i003002_tdate.jsp",{
				"cnt":$("#t_cnt").val(),
				"tdate":$("#t_date").val()
			},150);
			
			setTimeout(function(){
				getPpk();
				var dForm = $("#dateform")[0];
				dForm.reset();
				
			},500);
			
		},
		"닫 기":function(){
			var dForm = $("#dateform")[0];
			dForm.reset();
			tdateDialog.dialog("close");
		}
	}
});

var alertDialog;
alertDialog = $("#alert-form").dialog({
	autoOpen:false,
	height:150,
	width:300,
	modal:false,
	stack:false,
	buttons:{
		"확 인":function(){
			alertDialog.dialog("close");
		}
	}
});	

	var graphDialog;
	graphDialog = $("#graph-form").dialog({
		autoOpen:false,
		height:800,
		width:1600,
		modal:false,
		stack:false,
		buttons:{
			"닫 기":function(){
				graphDialog.dialog("close");
			}
		}
	});	

/*차트 불러오는 함수*/
	
			
</script>
<a style="display:none;" id="downloadLink" href="#" download="#"></a>

</body>
</html>