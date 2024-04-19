<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.scrolltbody {
    display: block;
    width: 1900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}



.scrolltbody tbody {
    display: block;
    height: 150px;

    overflow-x: hidden;
}

/*값 보여주는곳에서 코멘트목록 사용*/
.scrolltbody2 {
    display: block;
    width: 400px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody2 td { border: 1px solid #000; border-top: 0;}

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

.scrolltbody3 td { border: 1px solid #000; border-top: 0;}

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
		display:inline-block;
		padding-left:10px;
	} 
	
	#loading-image {  
	 position: absolute;  
	 top: 50%;  
	 left: 50%; 
	 z-index: 100; 
	}	
	
	
	
	@font-face{
		font-family:"headline";
		src:url("fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
	}		
	
[aria-describedby="image-form"]{
	z-index:20000 !important;
}

	#file_list1 th {
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
if (i<10) {i = "0" + i};  // add zero in front of numbers < 10 
	return i;
}

function checkDate(i) {
 	i = i+1 ;  // to adjust real month
   	return i;
}

// 실시간 날짜 end

function writeCheck()
  {
   var form = document.writeform;
  
  form.submit();
  }
var fn_logout = function () {
	
	if (!confirm("로그아웃 하시겠습니까?")) {
		return;
	}
	
	$.ajax({
		 method: "POST",
		 url: "logout_ok.jsp",
		 contentType: "application/json; charset=utf-8",
		 data: {'time':new Date().getTime()},
		 success : function(data) {
			var rsJson = JSON.parse(data);
			var rsBoolean = rsJson.isSuccess;
			
			if (rsBoolean) {
				
				alert("로그아웃 되었습니다.");
				location.href="index.jsp";
				
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

		<div id="confirm1-form" style="display:none;" title="확인창">
			<span id="confirm1Span"></span>
		</div>
		
		<div id="confirm2-form" style="display:none;" title="확인창">
			<span id="confirm2Span"></span>
		</div>		
		
		<div id="tdate-form" style="display:none;" title="샘플 채취일 등록">
			<form class="form-inline" role="form" id="dateform" name="dateform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						채취일: </label>
					</div>
					
					
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="t_date" name="t_date" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="채취일"/>
					</div>			
				</form>
					<input type="hidden" id="t_year" name="t_year" />
					<input type="hidden" id="t_bungi" name="t_bungi" />
		</div>		

		<div style="display:none;" id="report-form" title="보고서 파일 첨부" >
			<form class="form-horizontal" id="report_form" name="report_form" method="post" 
			enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*PDF파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="report_file" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="report_year" name="report_year" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="report_bungi" name="report_bungi" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="report" name="report" class="file_input_hidden form-control" onchange="javascript:document.getElementById('report_file').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="report_import();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>
		
		<div style="display:none;" id="graph-form" title="냉각그래프 파일 첨부" >
			<form class="form-horizontal" id="graph_form" name="graph_form" method="post" 
			enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*이미지파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="graph_file" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="graph_year" name="graph_year" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="graph_bungi" name="graph_bungi" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="graph_hogi" name="graph_hogi" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="graph" name="graph" class="file_input_hidden form-control" onchange="javascript:document.getElementById('graph_file').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="graph_import();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>		


		<div style="display:none;" id="image-form" title="파일 미리보기" >
			<iframe id="image_view" style="width:100%; height:100%; display:none;" > 
			
			</iframe>			
		</div>

<div id="wrap">

    <div id="header">
		<jsp:include page="/header-menu.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-top:30px;">
		
		<jsp:include page="/body-menu.jsp"/>
	</div>
	<div id="contents">
        
<div class="content" style="height:800px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list"></i></div>
                <h5 style="font-size:14pt; font-family: headline;">조건관리 - 열처리유 성상 분석</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt;  font-family:headline;font-weight:700; 
								color:#8C8C8C; width: 70px; text-align: right;">
							기간 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm" 
							id="s_year" name="s_year"
							style="margin-top:5px; height: 30px; width: 160px; 
								font-size: 14pt; font-family:headline;font-weight:700;
								padding-top:1px; padding-bottom:1px;">
							</select>
						</div>						
				</form>
            </header>
            
            <div id="collapse4" class="body">
            
            <div class="row">
            
            <div class="col-xs-12">
               <table id="file_list1" cellspacing="0" class="table table-bordered table-responsive scrolltbody">
					<thead>
						<tr>
							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 280px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								구분
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 350px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								1분기
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 350px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								2분기
							</th>							

							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 350px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								3분기
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 350px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								4분기
							</th>
						</tr>
						
						<tr>	
							<th colspan="2" class="text-center cell" 
							style="background-color:#36FFFF; width: 240px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								채취일
							</th>
							<td colspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 140px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="tdate1">
								
							</td>

							<td colspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 140px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="tdate2">
								
							</td>
		
							<td colspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 140px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="tdate3">
								
							</td>
						
							<td colspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 140px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="tdate4">
								
							</td>
						
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								분석보고서
							</th>						

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								전설비
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report2d">
								
							</td>

		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="report4d">
								
							</td>

						
						</tr>
						
						<tr>
							<th rowspan="6" class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								냉각시험<br />그래프
							</th>						

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								1호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph1_4d">
								
							</td>
						</tr>

						<tr>

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								2호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph2_4d">
								
							</td>
						
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								3호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph3_4d">
								
							</td>
						
						</tr>
						
						<tr>

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								4호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph4_4d">
								
							</td>
						
						
						</tr>
						
						<tr>

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								5호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph5_4d">
								
							</td>
						
						
						</tr>
						
						<tr>

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;">
								6호
							</th>						

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_1">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_1d">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_2">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_2d">
								
							</td>


		
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_3">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_3d">
								
							</td>

						
							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_4">
								
							</td>

							<td class="text-center cell" 
							style="background-color:#FFFFFF; width: 120px; height: 60px; 
							font-size: 16pt; font-family:headline;"
							id="graph6_4d">
								
							</td>
						
						
						</tr>
						
						

						
					</thead>					
					<tbody id="file_contents1">
						
					</tbody>
				</table>
				</div>			
				
								
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
		
		<img src="resources/images/jinhap4.gif" style="height:30px;"/>&nbsp;(주)진합&nbsp;&nbsp; <!-- 써니 로고 -->
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
var sid;
/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	
	fn_check();
	var now = new Date();
	
	tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
	
	
	for(var j=-2; j<2; j++){
		var y_value = now.getFullYear() + j;
		$("#s_year").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
	}
	
	$("#s_year").val(now.getFullYear());
	sid = '<%=session.getAttribute("sid")%>';
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
	
}



function auto_date_format( e, oThis ){
    
    var num_arr = [ 
        97, 98, 99, 100, 101, 102, 103, 104, 105, 96,
        48, 49, 50, 51, 52, 53, 54, 55, 56, 57
    ]
    
    var key_code = ( e.which ) ? e.which : e.keyCode;
    if( num_arr.indexOf( Number( key_code ) ) != -1 ){
    
        var len = oThis.value.length;
        if( len == 4 ) oThis.value += "-";
        if( len == 7 ) oThis.value += "-";
    
    }
    
}

function getYearCount(){
	//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
	$.post("m02/s04/count_m02s04.jsp",{
		"tdate":$("#s_year").val()
	},100);

	
	setTimeout(function(){
		getFileList();
		
//		getPpkList();
	},300);
}


	
function tdate_reg(bungi){
	if(sid != "worker"){
		$("#t_year").val($("#s_year").val());
		$("#t_bungi").val(bungi);
		
		tdateDialog.dialog("open");
	}
}	

function report_reg(bungi){
	if(sid != "worker"){
		$("#report_year").val($("#s_year").val());
		$("#report_bungi").val(bungi);
		
		reportDialog.dialog("open");
	}
}

function graph_reg(hogi, bungi){
	if(sid != "worker"){
		$("#graph_year").val($("#s_year").val());
		$("#graph_hogi").val(hogi);
		$("#graph_bungi").val(bungi);
		
		graphDialog.dialog("open");
	}
}

function report_import(){
	var fileform = $("#report_form")[0];
	var fileData = new FormData(fileform);

	//전송을 누르면 파일선택창이 닫히게
	reportDialog.dialog("close");
	
	 if (fileform.report.value == "") {
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }

	 
		if(!checkFileTypePDF(fileform.report.value)) {
			$("#loading").hide();
		  $("#alertSpan").text("PDF 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			fileform.reset();
	  return false;   
	 }		
	
	
	var path = $("#report_file").val();
	if(path != ''){
	
		$.ajax({
			url:"m02/s04/insert_m02s04_report.jsp",
			type:"post",
			enctype:"multipart/form-data",
			data:fileData,
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				
				reportDialog.dialog("close");
				getFileList();
				
				fileform.reset();
			}
		});
	}
	
}



function graph_import(){
	var fileform = $("#graph_form")[0];
	var fileData = new FormData(fileform);

	graphDialog.dialog("close");
	
	 if (fileform.graph.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }

		if(!checkFileTypeImage(fileform.graph.value)) {
			$("#loading").hide();
		  $("#alertSpan").text("이미지 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			fileform.reset();
	  return false;   
	 }	
	
	var path = $("#graph_file").val();
	if(path != ''){
	
		$.ajax({
			url:"m02/s04/insert_m02s04_graph.jsp",
			type:"post",
			enctype:"multipart/form-data",
			data:fileData,
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				
				graphDialog.dialog("close");
				getFileList();
				
				fileform.reset();
			}
		});
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


function checkFileTypeImage(filePath){   
	  
	 var fileLen = filePath.length;   
	 var fileFormat = filePath.substring(filePath.lastIndexOf('.'),filePath.length);   
	 fileFormatfileFormat = fileFormat.toLowerCase();   
	 
	 	if (fileFormat == ".png"){
		 	return true;    
	 	}else if(fileFormat == ".jpg"){
	 		 return true;
	 	}else{
	 		return false;
	 	}   
	}

var report_del_bungi = 0;

function report_del(bungi){
	report_del_bungi = bungi;
	$("#confirm1Span").text("파일을 삭제하시겠습니까?");
	confirm1Dialog.dialog("open");
	
}

var graph_del_bungi = 0;
var graph_del_hogi = 0;

function graph_del(hogi,bungi){
	graph_del_bungi = bungi;
	graph_del_hogi = hogi;
	$("#confirm2Span").text("파일을 삭제하시겠습니까?");
	confirm2Dialog.dialog("open");
	
}

	function getFileList(){
		$.ajax({
			type : "POST",
			url : "m02/s04/select_m02s04.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				"year1":$("#s_year").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var listHtml = "";
					
					
					for(var i=0; i<rsAr.length; i++){
						
						
						switch(eval(rsAr[i].bungi)){
							case 1: 
								$("#tdate1").attr("onclick","onclick=tdate_reg(1); return false; event.cancelBubble = true;");
								$("#tdate1").text(rsAr[i].tdate);
								if(rsAr[i].file_report_yn == 'Y'){
									$("#report1").empty();
									$("#report1d *").remove();
									
									$("#report1").attr("onclick","reportOpen(1); return false; event.cancelBubble = true;");
									$("#report1").append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#report1d").append('<button type="button" class="btn btn-default" onclick=report_del(1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#report1").empty();
									$("#report1d *").remove();
									
									$("#report1").attr("onclick","onclick=report_reg(1); return false; event.cancelBubble = true;");
									$("#report1").append('<img src="resources/img/file0.png">');
								}
								
								if(rsAr[i].file_graph_yn1 == 'Y'){
									$("#graph1_1").empty();
									$("#graph1_"+rsAr[i].bungi+"d *").remove();
									
									$("#graph1_"+rsAr[i].bungi).attr("onclick","graphOpen(1,1); return false; event.cancelBubble = true;");
									$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									if(sid != "worker"){
										$("#graph1_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(1,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph1_1").empty();
									$("#graph1_"+rsAr[i].bungi+"d *").remove();
									
									$("#graph1_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(1,1); return false; event.cancelBubble = true;");
									$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');
									
									
								}

								if(rsAr[i].file_graph_yn2 == 'Y'){
									$("#graph2_1").empty();
									$("#graph2_"+rsAr[i].bungi+"d *").remove();
									
									$("#graph2_"+rsAr[i].bungi).attr("onclick","graphOpen(2,1); return false; event.cancelBubble = true;");
									$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#graph2_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(2,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph2_1").empty();
									$("#graph2_"+rsAr[i].bungi+"d *").remove();									
									
									$("#graph2_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(2,1); return false; event.cancelBubble = true;");
									$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
								}
								
								if(rsAr[i].file_graph_yn3 == 'Y'){
									$("#graph3_1").empty();
									$("#graph3_"+rsAr[i].bungi+"d *").remove();	
									
									$("#graph3_"+rsAr[i].bungi).attr("onclick","graphOpen(3,1); return false; event.cancelBubble = true;");
									$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#graph3_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(3,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph3_1").empty();
									$("#graph3_"+rsAr[i].bungi+"d *").remove();										
									
									$("#graph3_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(3,1); return false; event.cancelBubble = true;");
									$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
								}								
								
								if(rsAr[i].file_graph_yn4 == 'Y'){
									$("#graph4_1").empty();									
									$("#graph4_"+rsAr[i].bungi+"d *").remove();
									
									$("#graph4_"+rsAr[i].bungi).attr("onclick","graphOpen(4,1); return false; event.cancelBubble = true;");
									$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#graph4_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(4,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph4_1").empty();
									$("#graph4_"+rsAr[i].bungi+"d *").remove();
									
									$("#graph4_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(4,1); return false; event.cancelBubble = true;");
									$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
								}								
								
								if(rsAr[i].file_graph_yn5 == 'Y'){
									$("#graph5_1").empty();
									$("#graph5_"+rsAr[i].bungi+"d *").remove();
									
									
									$("#graph5_"+rsAr[i].bungi).attr("onclick","graphOpen(5,1); return false; event.cancelBubble = true;");
									$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#graph5_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(5,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph5_1").empty();
									$("#graph5_"+rsAr[i].bungi+"d *").remove();
									
									
									$("#graph5_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(5,1); return false; event.cancelBubble = true;");
									$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
								}								
								
								if(rsAr[i].file_graph_yn6 == 'Y'){
									$("#graph6_1").empty();
									$("#graph6_"+rsAr[i].bungi+"d *").remove();
									
									
									$("#graph6_"+rsAr[i].bungi).attr("onclick","graphOpen(6,1); return false; event.cancelBubble = true;");
									$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
									
									if(sid != "worker"){
										$("#graph6_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(6,1); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
									}
								}else{
									$("#graph6_1").empty();
									$("#graph6_"+rsAr[i].bungi+"d *").remove();
									
									
									$("#graph6_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(6,1); return false; event.cancelBubble = true;");
									$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
								}
								
								
							break;
						case 2: 
						
						$("#tdate2").attr("onclick","onclick=tdate_reg(2); return false; event.cancelBubble = true;");
						$("#tdate2").text(rsAr[i].tdate); 
						if(rsAr[i].file_report_yn == 'Y'){
							$("#report2").empty();
							$("#report2d *").remove();
							
							$("#report2").attr("onclick","reportOpen(2); return false; event.cancelBubble = true;");
							$("#report2").append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#report2d").append('<button type="button" class="btn btn-default" onclick=report_del(2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}

						}else{
							$("#report2").empty();
							$("#report2d *").remove();
							
							$("#report2").attr("onclick","onclick=report_reg(2); return false; event.cancelBubble = true;");
							$("#report2").append('<img src="resources/img/file0.png">');

						}						
						
						
						if(rsAr[i].file_graph_yn1 == 'Y'){
							$("#graph1_2").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","graphOpen(1,2); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph1_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(1,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph1_2").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(1,2); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');
							
							
						}

						if(rsAr[i].file_graph_yn2 == 'Y'){
							$("#graph2_2").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","graphOpen(2,2); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph2_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(2,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph2_2").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();									
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(2,2); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
						if(rsAr[i].file_graph_yn3 == 'Y'){
							$("#graph3_2").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();	
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","graphOpen(3,2); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph3_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(3,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph3_2").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();										
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(3,2); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn4 == 'Y'){
							$("#graph4_2").empty();									
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","graphOpen(4,2); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph4_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(4,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph4_2").empty();
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(4,2); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn5 == 'Y'){
							$("#graph5_2").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","graphOpen(5,2); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph5_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(5,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph5_2").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(5,2); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn6 == 'Y'){
							$("#graph6_2").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","graphOpen(6,2); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph6_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(6,2); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph6_2").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(6,2); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
							break;
						case 3: 
						
						$("#tdate3").attr("onclick","onclick=tdate_reg(3); return false; event.cancelBubble = true;");
						$("#tdate3").text(rsAr[i].tdate);
						
						
						if(rsAr[i].file_report_yn == 'Y'){
							$("#report3").empty();
							$("#report3d *").remove();
							
							$("#report3").attr("onclick","reportOpen(3); return false; event.cancelBubble = true;");
							$("#report3").append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#report3d").append('<button type="button" class="btn btn-default" onclick=report_del(3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}

						}else{
							$("#report3").empty();
							$("#report3d *").remove();							
							
							$("#report3").attr("onclick","onclick=report_reg(3); return false; event.cancelBubble = true;");
							$("#report3").append('<img src="resources/img/file0.png">');

						}						
						
						
						if(rsAr[i].file_graph_yn1 == 'Y'){
							$("#graph1_3").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","graphOpen(1,3); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph1_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(1,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph1_3").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(1,3); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');
							
							
						}

						if(rsAr[i].file_graph_yn2 == 'Y'){
							$("#graph2_3").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","graphOpen(2,3); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph2_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(2,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph2_3").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();									
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(2,3); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
						if(rsAr[i].file_graph_yn3 == 'Y'){
							$("#graph3_3").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();	
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","graphOpen(3,3); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph3_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(3,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph3_3").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();										
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(3,3); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn4 == 'Y'){
							$("#graph4_3").empty();									
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","graphOpen(4,3); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph4_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(4,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph4_3").empty();
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(4,3); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn5 == 'Y'){
							$("#graph5_3").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","graphOpen(5,3); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph5_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(5,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph5_3").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(5,3); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn6 == 'Y'){
							$("#graph6_3").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","graphOpen(6,3); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph6_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(6,3); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph6_3").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(6,3); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
							break;
						case 4: 
						
						$("#tdate4").attr("onclick","onclick=tdate_reg(4); return false; event.cancelBubble = true;");
						$("#tdate4").text(rsAr[i].tdate);
						
						
						if(rsAr[i].file_report_yn == 'Y'){
							$("#report4").empty();
							$("#report4d *").remove();
							
							$("#report4").attr("onclick","reportOpen(4); return false; event.cancelBubble = true;");
							$("#report4").append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#report4d").append('<button type="button" class="btn btn-default" onclick=report_del(4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}

						}else{
							$("#report4").empty();
							$("#report4d *").remove();
							
							$("#report4").attr("onclick","onclick=report_reg(4); return false; event.cancelBubble = true;");
							$("#report4").append('<img src="resources/img/file0.png">');

						}						
						
						
						if(rsAr[i].file_graph_yn1 == 'Y'){
							$("#graph1_4").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","graphOpen(1,4); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph1_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(1,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph1_4").empty();
							$("#graph1_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph1_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(1,4); return false; event.cancelBubble = true;");
							$("#graph1_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');
							
							
						}

						if(rsAr[i].file_graph_yn2 == 'Y'){
							$("#graph2_4").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","graphOpen(2,4); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph2_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(2,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph2_4").empty();
							$("#graph2_"+rsAr[i].bungi+"d *").remove();									
							
							$("#graph2_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(2,4); return false; event.cancelBubble = true;");
							$("#graph2_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
						if(rsAr[i].file_graph_yn3 == 'Y'){
							$("#graph3_4").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();	
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","graphOpen(3,4); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph3_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(3,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph3_4").empty();
							$("#graph3_"+rsAr[i].bungi+"d *").remove();										
							
							$("#graph3_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(3,4); return false; event.cancelBubble = true;");
							$("#graph3_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn4 == 'Y'){
							$("#graph4_4").empty();									
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","graphOpen(4,4); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph4_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(4,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph4_4").empty();
							$("#graph4_"+rsAr[i].bungi+"d *").remove();
							
							$("#graph4_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(4,4); return false; event.cancelBubble = true;");
							$("#graph4_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn5 == 'Y'){
							$("#graph5_4").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","graphOpen(5,4); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph5_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(5,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph5_4").empty();
							$("#graph5_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph5_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(5,4); return false; event.cancelBubble = true;");
							$("#graph5_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}								
						
						if(rsAr[i].file_graph_yn6 == 'Y'){
							$("#graph6_4").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","graphOpen(6,4); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file1.png">');
							
							if(sid != "worker"){
								$("#graph6_"+rsAr[i].bungi+"d").append('<button type="button" class="btn btn-default" onclick=graph_del(6,4); return false; event.cancelBubble = true; style="width: 100px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>');
							}
						}else{
							$("#graph6_4").empty();
							$("#graph6_"+rsAr[i].bungi+"d *").remove();
							
							
							$("#graph6_"+rsAr[i].bungi).attr("onclick","onclick=graph_reg(6,4); return false; event.cancelBubble = true;");
							$("#graph6_"+rsAr[i].bungi).append('<img src="resources/img/file0.png">');									
						}
						
							break;
						}
					}

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

/*이벤트*/	
// $("#fileSelect").on("click",function(){
// 	fileDialog.dialog("open");
// });
		
$("#searchbtn").on("click",function(){
	getFileList();
});

	$("#s_year").change(function(){
		getYearCount();
	});


		$("#s_zone").change(function(){
			getFileList();
		});
		
		

		function reportOpen(bungi){
			$.ajax({
				type : "POST",
				url : "m02/s04/select_m02s04_fileCheck_report.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						"year":$("#s_year").val(),
						"bungi":bungi},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
//						console.log(rsAr[0].filename);
										
						// var file = "/JINHAP_OFFICE/upload/"+encodeURIComponent(rsAr[0].filename);
						var file = "/JINHAP_OFFICE/file/m02s04/"+encodeURIComponent(rsAr[0].filename);
						$("#image_view").attr("src",(decodeURIComponent(file)));
						$("#image_view").show();
						
						
						imageDialog.dialog("open");
						
						
						
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
	
		
		function graphOpen(hogi,bungi){
			$.ajax({
				type : "POST",
				url : "m02/s04/select_m02s04_fileCheck_graph.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						"year":$("#s_year").val(),
						"hogi":hogi,
						"bungi":bungi},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
//						console.log(rsAr[0].filename);
						
						console.log(rsAr[0]);
						// var file = "/JINHAP_OFFICE/upload/"+encodeURIComponent(rsAr[0].filename);
						var file = "/JINHAP_OFFICE/file/m02s04/"+encodeURIComponent(rsAr[0].filename);
						$("#image_view").attr("src",(decodeURIComponent(file)));
						$("#image_view").show();
						
						
						imageDialog.dialog("open");
						
						
						
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
		
/*다이얼로그*/

var imageDialog;			

imageDialog = $("#image-form").dialog({
  autoOpen: false,
  height: 900,
  width: 1100,
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

var reportDialog;
reportDialog = $("#report-form").dialog({
	  autoOpen: false,
	  height: 280,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		reportDialog.dialog("close");
	              });
	        }
		  }
	});

var graphDialog;
graphDialog = $("#graph-form").dialog({
	  autoOpen: false,
	  height: 280,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		graphDialog.dialog("close");
	              });
	        }
		  }
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
			var zone = $("#s_zone").val();
			
			$.post("m02/s04/insert_m02s04_tdate.jsp",{
				"year":$("#t_year").val(),
				"bungi":$("#t_bungi").val(),
				"tdate":$("#t_date").val()
			},150);
			
			setTimeout(function(){
				getFileList();
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

var confirm1Dialog;
confirm1Dialog = $("#confirm1-form").dialog({
	autoOpen:false,
	height:150,
	width:300,
	modal:false,
	stack:false,
	buttons:{
		"삭 제":function(){
			$.post("m02/s04/delete_m02s04_report.jsp",{
				"year":$("#s_year").val(),
				"bungi":report_del_bungi
			},250);
			
			setTimeout(function(){
				$("#alertSpan").text("파일이 삭제되었습니다.");
				alertDialog.dialog("open");
				getFileList();
				report_del_bungi = 0;
			},400);					
			confirm1Dialog.dialog("close");
			
		},
		"취 소":function(){
			confirm1Dialog.dialog("close");
		}
	}
});

var confirm2Dialog;
confirm2Dialog = $("#confirm2-form").dialog({
	autoOpen:false,
	height:150,
	width:300,
	modal:false,
	stack:false,
	buttons:{
		"삭 제":function(){
			$.post("m02/s04/delete_m02s04_graph.jsp",{
				"year":$("#s_year").val(),
				"hogi":graph_del_hogi,
				"bungi":graph_del_bungi
			},250);
			
			
			
			setTimeout(function(){
				$("#alertSpan").text("파일이 삭제되었습니다.");
				alertDialog.dialog("open");
				getFileList();
				graph_del_hogi = 0;
				graph_del_bungi = 0;
			},400);					
			confirm2Dialog.dialog("close");
			
		},
		"취 소":function(){
			confirm2Dialog.dialog("close");
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

/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>