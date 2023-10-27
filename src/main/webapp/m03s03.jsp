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
    height: 610px;

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
	
[aria-describedby="image-form"]{
	z-index:20000 !important;
}
	
	@font-face{
		font-family:"headline";
		src:url("fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
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

		<div id="confirm-form" style="display:none;" title="확인창">
			<span id="confirmSpan"></span>
		</div>	

		<div id="chk-form" style="display:none;" title="합격/불합격 판정">
			<form class="form-inline" role="form" id="chkform" name="chkform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; color:#8C8C8C; width: 30px; text-align: right;
						margin-left:80px;">
            				<input style="width:30px;height:30px;" type="checkbox" checked="checked" 
            				id="c_chk_y" name="c_chk" value="합격">
          				</label>					
					
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; font-weight:700; 
						width: 70px; ">합격</label>
						
						<label class="control-label" 
						style="font-size: 14pt; color:#8C8C8C; width: 30px; text-align: right;">
            				<input style="width:30px;height:30px;" type="checkbox" 
            				id="c_chk_n" name="c_chk" value="불합격">
          				</label>
          				
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; font-weight:700; 
						width: 70px; ">불합격</label> 
					</div>			
				</form>
					<input type="hidden" id="c_cnt" name="c_cnt" />
					<input type="hidden" id="c_gb" name="c_gb" />
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

		<div style="display:none;" id="file-form" title="파일 첨부" >
			<form class="form-horizontal" id="upload" name="upload" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*PDF, 엑셀파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_cnt" name="import_cnt" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_gb" name="import_gb" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file" name="file" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="file_import();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>
		
		<div style="display:none;" id="file-form_bungi" title="파일 첨부" >
			<form class="form-horizontal" id="upload_bungi" name="upload_bungi" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*PDF, 엑셀파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath_bungi" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_cnt_bungi" name="import_cnt_bungi" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_gb_bungi" name="import_gb_bungi" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file_bungi" name="file_bungi" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath_bungi').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="file_import_bungi();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>
		
		
		<div style="display:none;" id="image-form" title="파일 미리보기" >
			<iframe id="image_view" style="width:100%; height:100%; display:none;" > 
			
			</iframe>			
		</div>

		<div id="memo-form" style="display:none;" title="메모등록">
			<form class="form-inline" role="form" id="memoform" name="memoform" 
			method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 60px; text-align: right;">
						메모: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="m_memo" name="m_memo" 
	     					style="width: 280px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="메모"/>
					</div>			
				</form>
					<input type="hidden" id="m_cnt" name="m_cnt" />
					<input type="hidden" id="m_gb" name="m_gb" />
		</div>

		<div id="chk-form_bungi" style="display:none;" title="합격/불합격 판정">
			<form class="form-inline" role="form" id="chkform_bungi" name="chkform_bungi" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; color:#8C8C8C; width: 30px; text-align: right;
						margin-left:80px;">
            				<input style="width:30px;height:30px;" type="checkbox" checked="checked" 
            				id="c_chk_y_bungi" name="c_chk_bungi" value="합격">
          				</label>					
					
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; font-weight:700; 
						width: 70px; ">합격</label>
						
						<label class="control-label" 
						style="font-size: 14pt; color:#8C8C8C; width: 30px; text-align: right;">
            				<input style="width:30px;height:30px;" type="checkbox" 
            				id="c_chk_n_bungi" name="c_chk_bungi" value="불합격">
          				</label>
          				
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; font-weight:700; 
						width: 70px; ">불합격</label> 
					</div>			
				</form>
					<input type="hidden" id="c_cnt_bungi" name="c_cnt_bungi" />
					<input type="hidden" id="c_gb_bungi" name="c_gb_bungi" />
		</div>


		<div id="tdate-form_bungi" style="display:none;" title="측정일 등록">
			<form class="form-inline" role="form" id="dateform_bungi" name="dateform_bungi" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						측정일: </label>
					</div>
					
					
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="t_date_bungi" name="t_date_bungi" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="측정일"/>
					</div>			
				</form>
					<input type="hidden" id="t_cnt_bungi" name="t_cnt_bungi" />
					<input type="hidden" id="t_gb_bungi" name="t_gb_bungi" />
		</div>


		<div id="memo-form_bungi" style="display:none;" title="메모등록">
			<form class="form-inline" role="form" id="memoform_bungi" name="memoform_bungi" 
			method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 60px; text-align: right;">
						메모: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="m_memo_bungi" name="m_memo_bungi" 
	     					style="width: 280px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="메모"/>
					</div>			
				</form>
					<input type="hidden" id="m_cnt_bungi" name="m_cnt_bungi" />
					<input type="hidden" id="m_gb_bungi" name="m_gb_bungi" />
		</div>

		
		<div id="confirm-form_bungi" style="display:none;" title="확인창">
			<span id="confirmSpan_bungi"></span>
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
        
<div class="content" style="height:800px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">품질관리 - 열전대 비교측정</h5>
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
            	<div id="tus_before" style="display:none;">
	               <table id="tus_list" cellspacing="0" 
	               class="table table-bordered table-responsive scrolltbody">
						<thead>
							<tr>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 80px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									설비명
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 100px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									로
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
							
							</tr>
							
						</thead>
						<tbody id="tus_contents">
						
						</tbody>
					</table>
				</div>
				<div id="tus_after" style="display:none;">
	               <table id="tus_list_bungi" cellspacing="0" 
	               class="table table-bordered table-responsive scrolltbody">
						<thead>
							<tr>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 80px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									설비명
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 100px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									로
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 360px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									1분기
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 360px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									2분기
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 360px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									3분기
								</th>
								<th class="text-center cell" 
								style="background-color:#36FFFF; width: 360px; height: 30px; 
								font-size: 16pt; font-family:headline;">
									4분기
								</th>					
							
							</tr>
							
						</thead>
						<tbody id="tus_contents_bungi">
						
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
	
	
	for(var j=-3; j<2; j++){
		var y_value = now.getFullYear() + j;
		$("#s_year").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
	}
	
	$("#s_year").val(now.getFullYear());
	
	
	sid = '<%=session.getAttribute("sid")%>';
	if(eval($("#s_year").val()) <= 2020){
		getYearCount();	
	}else{
		getYearCount_bungi();
	}
	
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


 	function getYearCount(){
		//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
		$.post("m03/s03/count_m03s03.jsp",{
			"tdate":$("#s_year").val()
		},100);
	
		setTimeout(function(){
			//여기서 년도가 2020년 이전인지 이후인지 비교
			//테이블 show, hide 추가필요
			
				//2020년 까지
				$("#tus_before").show();
				$("#tus_after").hide();
				getFileList();
		},300);
	}

 	function getYearCount_bungi(){
		//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
		$.post("m03/s03/count_m03s03_bungi.jsp",{
			"tdate":$("#s_year").val()
		},100);
	
		setTimeout(function(){
			
			//2020년 이후
			$("#tus_before").hide();
			$("#tus_after").show();
			getFileList_bungi();
		},300);
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


function file_import(){
	var fileform = $("#upload")[0];
	var fileData = new FormData(fileform);

	fileDialog.dialog("close");
	
	 if (fileform.file.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }
	 

		if(!checkFileTypePDF(fileform.file.value)) {
		  $("#alertSpan").text("PDF,엑셀 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			fileform.reset();
	  return false;   
	 }	
	
	var path = $("#filePath").val();
	if(path != ''){
	
		$.ajax({
			url:"m03/s03/insert_m03s03_file.jsp",
			type:"post",
			enctype:"multipart/form-data",
			data:fileData,
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				var zone = $("#s_zone").val();
				
				fileDialog.dialog("close");
				getFileList();
				
				fileform.reset();
			}
		});
	}
	
}

function file_import_bungi(){
	var fileform = $("#upload_bungi")[0];
	var fileData = new FormData(fileform);

	fileDialog_bungi.dialog("close");
	
	 if (fileform.file_bungi.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }
	 

		if(!checkFileTypePDF(fileform.file_bungi.value)) {
		  $("#alertSpan").text("PDF,엑셀 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			fileform.reset();
	  return false;   
	 }	
	
	var path = $("#filePath_bungi").val();
	if(path != ''){
	
		$.ajax({
			url:"m03/s03/insert_m03s03_file_bungi.jsp",
			type:"post",
			enctype:"multipart/form-data",
			data:fileData,
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				var zone = $("#s_zone").val();
				
				fileDialog_bungi.dialog("close");
				getFileList_bungi();
				
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
	 	}else if(fileFormat = ".xlsx"){
	 		return true;	 
	 	}else if(fileFormat = ".xls"){
	 		return true;
	 	}else{
	 		return false;
	 }   
	}

function getFileList(){
	$.ajax({
		type : "POST",
		url : "m03/s03/select_m03s03.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
			"year1":$("#s_year").val(),
			"zone":$("#s_zone").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				
				var listHtml = "";
				var fname_a = "";
				var fname_b = "";
					//퀜칭
					for(var i=0; i<rsAr.length; i++){
						listHtml += "<tr>";
						listHtml += '<td rowspan="4" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 100px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
						listHtml += '<td rowspan="4" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 100px; width: 100px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].zone+'</td>';
						
						//1월 
							if(rsAr[i].file_yn_1 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',1); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';	
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}
						//2
							if(rsAr[i].file_yn_2 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',2); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}						
							
						//3
							if(rsAr[i].file_yn_3 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',3); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//4
							if(rsAr[i].file_yn_4 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',4); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//5
							if(rsAr[i].file_yn_5 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',5); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//6
							if(rsAr[i].file_yn_6 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',6); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//7
							if(rsAr[i].file_yn_7 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',7); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//8
							if(rsAr[i].file_yn_8 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',8); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//9
							if(rsAr[i].file_yn_9 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',9); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}	
						//10
							if(rsAr[i].file_yn_10 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',10); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//11
							if(rsAr[i].file_yn_11 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',11); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}	
						//12
							if(rsAr[i].file_yn_12 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+',12); return false; event.cancelBubble = true; style="width: 55px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}	
						
						listHtml += "</tr>";

						
						
						listHtml += "<tr>";
						//1
						if(rsAr[i].tdate_1 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].tdate_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>측정일</td>';
						}
						//2
						if(rsAr[i].tdate_2 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].tdate_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//3
						if(rsAr[i].tdate_3 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].tdate_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//4
						if(rsAr[i].tdate_4 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].tdate_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//5
						if(rsAr[i].tdate_5 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+rsAr[i].tdate_5+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//6
						if(rsAr[i].tdate_6 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+rsAr[i].tdate_6+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//7
						if(rsAr[i].tdate_7 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+rsAr[i].tdate_7+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//8
						if(rsAr[i].tdate_8 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+rsAr[i].tdate_8+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//9
						if(rsAr[i].tdate_9 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+rsAr[i].tdate_9+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//10
						if(rsAr[i].tdate_10 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+rsAr[i].tdate_10+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//11
						if(rsAr[i].tdate_11 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+rsAr[i].tdate_11+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//12
						if(rsAr[i].tdate_12 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+rsAr[i].tdate_12+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>측정일</td>';
						}						
						
						listHtml += "</tr>";
						
						listHtml += "<tr>";
						//1
//						console.log(rsAr[i].chk_1);
						if(rsAr[i].chk_1 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].chk_1+'</td>';	
						}else if(rsAr[i].chk_1 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].chk_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>불/합 판정</td>';
						}
						
						//2
						if(rsAr[i].chk_2 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].chk_2+'</td>';	
						}else if(rsAr[i].chk_2 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].chk_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//3
						if(rsAr[i].chk_3 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].chk_3+'</td>';	
						}else if(rsAr[i].chk_3 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].chk_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//4
						if(rsAr[i].chk_4 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].chk_4+'</td>';	
						}else if(rsAr[i].chk_4 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].chk_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//5
						if(rsAr[i].chk_5 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+rsAr[i].chk_5+'</td>';	
						}else if(rsAr[i].chk_5 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+rsAr[i].chk_5+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//6
						if(rsAr[i].chk_6 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+rsAr[i].chk_6+'</td>';	
						}else if(rsAr[i].chk_6 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+rsAr[i].chk_6+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//7
						if(rsAr[i].chk_7 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+rsAr[i].chk_7+'</td>';	
						}else if(rsAr[i].chk_7 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+rsAr[i].chk_7+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//8
						if(rsAr[i].chk_8 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+rsAr[i].chk_8+'</td>';	
						}else if(rsAr[i].chk_8 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+rsAr[i].chk_8+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//9
						if(rsAr[i].chk_9 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+rsAr[i].chk_9+'</td>';	
						}else if(rsAr[i].chk_9 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+rsAr[i].chk_9+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//10
						if(rsAr[i].chk_10 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+rsAr[i].chk_10+'</td>';	
						}else if(rsAr[i].chk_10 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+rsAr[i].chk_10+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//11
						if(rsAr[i].chk_11 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+rsAr[i].chk_11+'</td>';	
						}else if(rsAr[i].chk_11 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+rsAr[i].chk_11+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//12
						if(rsAr[i].chk_12 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+rsAr[i].chk_12+'</td>';	
						}else if(rsAr[i].chk_12 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+rsAr[i].chk_12+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						
						
						listHtml += "</tr>";
						
						//메모
						listHtml += "<tr>";
						
						//1
						if(rsAr[i].memo_1 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].memo_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>메모입력</td>';
						}
						//2
						if(rsAr[i].memo_2 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].memo_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//3
						if(rsAr[i].memo_3 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].memo_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//4
						if(rsAr[i].memo_4 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].memo_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//5
						if(rsAr[i].memo_5 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>'+rsAr[i].memo_5+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',5); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//6
						if(rsAr[i].memo_6 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>'+rsAr[i].memo_6+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',6); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//7
						if(rsAr[i].memo_7 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>'+rsAr[i].memo_7+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',7); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//8
						if(rsAr[i].memo_8 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>'+rsAr[i].memo_8+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',8); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//9
						if(rsAr[i].memo_9 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>'+rsAr[i].memo_9+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',9); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//10
						if(rsAr[i].memo_10 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>'+rsAr[i].memo_10+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',10); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//11
						if(rsAr[i].memo_11 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>'+rsAr[i].memo_11+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',11); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//12
						if(rsAr[i].memo_12 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>'+rsAr[i].memo_12+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg('+rsAr[i].cnt+',12); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						
						
						listHtml += "</tr>";
						
						
					}
					
					$("#tus_list tbody").html(listHtml);
					
	
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


function getFileList_bungi(){
	$.ajax({
		type : "POST",
		url : "m03/s03/select_m03s03_bungi.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
			"year1":$("#s_year").val(),
			"zone":$("#s_zone").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				
				var listHtml = "";
				var fname_a = "";
				var fname_b = "";
					//퀜칭
					for(var i=0; i<rsAr.length; i++){
						listHtml += "<tr>";
						listHtml += '<td rowspan="4" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 100px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
						listHtml += '<td rowspan="4" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 100px; width: 100px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].zone+'</td>';
						
						//1분기
							if(rsAr[i].file_yn_1 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true; style="width: 175px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}
						//2분기
							if(rsAr[i].file_yn_2 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true; style="width: 175px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}						
							
						//3분기
							if(rsAr[i].file_yn_3 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true; style="width: 175px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						//4분기
							if(rsAr[i].file_yn_4 == 'Y'){
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileOpen_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file1.png">'
								+'</td>';
								if(sid != "worker"){
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;">'+
									'<button type="button" class="btn btn-default" onclick=delFile_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true; style="width: 175px; font-size:14pt; font-family:headline; font-weight:700; padding-right:0; padding-left:0;"><i class="fa fa-remove"></i>삭제</button>'
									+'</td>';
								}else{
									listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';									
								}
							}else{
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=fileAdd_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+
								'<img src="resources/img/file0.png">'
								+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:14pt; font-family:headline;"></td>';
							}							
						
						listHtml += "</tr>";

						
						
						
						listHtml += "<tr>";
						//1분기
						if(rsAr[i].tdate_1 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].tdate_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>측정일</td>';
						}
						//2분기
						if(rsAr[i].tdate_2 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].tdate_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//3분기
						if(rsAr[i].tdate_3 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].tdate_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>측정일</td>';
						}						
						//4분기
						if(rsAr[i].tdate_4 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].tdate_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=tdateReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>측정일</td>';
						}						
						
						listHtml += "</tr>";
						
						listHtml += "<tr>";
						//1분기
//						console.log(rsAr[i].chk_1);
						if(rsAr[i].chk_1 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].chk_1+'</td>';	
						}else if(rsAr[i].chk_1 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].chk_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>불/합 판정</td>';
						}
						
						//2분기
						if(rsAr[i].chk_2 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].chk_2+'</td>';	
						}else if(rsAr[i].chk_2 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].chk_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//3분기
						if(rsAr[i].chk_3 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].chk_3+'</td>';	
						}else if(rsAr[i].chk_3 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].chk_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						//4분기
						if(rsAr[i].chk_4 == '합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:blue;" onclick=chkReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].chk_4+'</td>';	
						}else if(rsAr[i].chk_4 == '불합격'){
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer; color:red;" onclick=chkReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].chk_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=chkReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>불/합 판정</td>';
						}						
						
						
						listHtml += "</tr>";
						
						//메모
						listHtml += "<tr>";
						
						//1분기
						if(rsAr[i].memo_1 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>'+rsAr[i].memo_1+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',1); return false; event.cancelBubble = true;>메모입력</td>';
						}
						//2분기
						if(rsAr[i].memo_2 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>'+rsAr[i].memo_2+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',2); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//3분기
						if(rsAr[i].memo_3 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>'+rsAr[i].memo_3+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',3); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						//4분기
						if(rsAr[i].memo_4 != ''){
							listHtml += '<td colspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>'+rsAr[i].memo_4+'</td>';
						}else{
							listHtml += '<td colspan="2"class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 360px; word-break:break-all; font-size:14pt; font-family:headline; cursor: pointer;" onclick=memoReg_bungi('+rsAr[i].cnt+',4); return false; event.cancelBubble = true;>메모입력</td>';
						}						
						
						listHtml += "</tr>";
						
						
					}
					
					$("#tus_list_bungi tbody").html(listHtml);
					
	
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




function fileAdd(c_val, gb){
	if(sid != "worker"){
		$("#import_cnt").val(c_val);
		$("#import_gb").val(gb);
		
		fileDialog.dialog("open");
	}
}



function fileAdd_bungi(c_val, gb){
	if(sid != "worker"){
		$("#import_cnt_bungi").val(c_val);
		$("#import_gb_bungi").val(gb);
		
		fileDialog_bungi.dialog("open");
	}
}


var fileDel_cnt = 0;
var fileDel_gb = 0;

var fileDel_cnt_bungi = 0;
var fileDel_gb_bungi = 0;


function delFile(c_val,gb){
	fileDel_cnt = c_val;
	fileDel_gb = gb;
	$("#confirmSpan").text("파일을 삭제하시겠습니까?");
	confirmDialog.dialog("open");
	
}

function delFile_bungi(c_val,gb){
	fileDel_cnt_bungi = c_val;
	fileDel_gb_bungi = gb;
	$("#confirmSpan_bungi").text("파일을 삭제하시겠습니까?");
	confirmDialog_bungi.dialog("open");
	
}



/*이벤트*/	
		
//사용안함
$("#fileSelect").on("click",function(){
	fileDialog.dialog("open");
});
//사용안함	
$("#searchbtn").on("click",function(){
	getFileList();
});

$("#c_chk_y").on("click",function(){
	$("#c_chk_n").prop("checked",false);
});

$("#c_chk_n").on("click",function(){
	$("#c_chk_y").prop("checked",false);
});	

$("#s_zone").change(function(){
	
	if(eval($("#s_year").val()) <= 2020){
		$("#tus_before").show();
		$("#tus_after").hide();

		getFileList();	
	}else{
		$("#tus_before").hide();
		$("#tus_after").show();
		
		getFileList_bungi();
	}
	
});


$("#s_year").change(function(){
	if(eval($("#s_year").val()) <= 2020){
		$("#tus_before").show();
		$("#tus_after").hide();

		getYearCount();	
	}else{
		$("#tus_before").hide();
		$("#tus_after").show();
		
		getYearCount_bungi();
	}
	
});

function tableChange_gb(gb_year){
	if(gb_year <= 2020){
		
	}else{
		
	}
}

function fileOpen(c_val, gb){
	$.ajax({
		type : "POST",
		url : "m03/s03/select_m03s03_fileCheck.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"cnt":c_val,
				"gb":gb},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
//				console.log(rsAr[0].filename);
								
				//var file = "/JINHAP_OFFICE/upload/"+encodeURIComponent(rsAr[0].filename);
				var file = "D:/file/m03s03/"+encodeURIComponent(rsAr[0].filename);
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


function fileOpen_bungi(c_val, gb){
	$.ajax({
		type : "POST",
		url : "m03/s03/select_m03s03_fileCheck_bungi.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"cnt":c_val,
				"gb":gb},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
//				console.log(rsAr[0].filename);
								
				//var file = "/JINHAP_OFFICE/upload/"+encodeURIComponent(rsAr[0].filename);
				var file = "D:/file/m03s03/"+encodeURIComponent(rsAr[0].filename);
				$("#image_view").attr("src",(decodeURIComponent(file)));
				$("#image_view").show();
//				$("#image_view").attr("name","열전대비교측정결과표(SAT)");
				
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

	
	function tdateReg(c_val, gb){
		if(sid != "worker"){
			$("#t_cnt").val(c_val);
			$("#t_gb").val(gb);
			
			tdateDialog.dialog("open");
		}		
	}

	function chkReg(c_val, gb){
		if(sid != "worker"){
			$("#c_cnt").val(c_val);
			$("#c_gb").val(gb);
			
			chkDialog.dialog("open");
		}
	}
	
	function memoReg(c_val, gb){
		if(sid != "worker"){
			$("#m_cnt").val(c_val);
			$("#m_gb").val(gb);
			
			memoDialog.dialog("open");
		}		
	}	
	
	function tdateReg_bungi(c_val, gb){
		if(sid != "worker"){
			$("#t_cnt_bungi").val(c_val);
			$("#t_gb_bungi").val(gb);
			
			tdateDialog_bungi.dialog("open");
		}
	}

	function chkReg_bungi(c_val, gb){
		if(sid != "worker"){
			$("#c_cnt_bungi").val(c_val);
			$("#c_gb_bungi").val(gb);
			
			chkDialog_bungi.dialog("open");
		}
	}
	
	function memoReg_bungi(c_val, gb){
		if(sid != "worker"){
			$("#m_cnt_bungi").val(c_val);
			$("#m_gb_bungi").val(gb);
			
			memoDialog_bungi.dialog("open");
		}
	}	
	
	
/*다이얼로그*/
//파일선택 다이얼로그

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
				
				$.post("m03/s03/insert_m03s03_tdate.jsp",{
					"cnt":$("#t_cnt").val(),
					"gb":$("#t_gb").val(),
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

	
	var chkDialog;
	chkDialog = $("#chk-form").dialog({
		autoOpen:false,
		height:180,
		width:340,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				chkDialog.dialog("close");
				
				$.post("m03/s03/insert_m03s03_chk.jsp",{
					"cnt":$("#c_cnt").val(),
					"gb":$("#c_gb").val(),
					"chk":$("input:checkbox[name='c_chk']:checked").val()
				},150);
				
				setTimeout(function(){
					getFileList();
					var cForm = $("#chkform")[0];
					cForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				var cForm = $("#chkform")[0];
				cForm.reset();
				chkDialog.dialog("close");
			}
		}
	});	
	
	var confirmDialog;
	confirmDialog = $("#confirm-form").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"삭 제":function(){
				$.post("m03/s03/delete_m03s03_file.jsp",{
					"cnt":fileDel_cnt,
					"gb":fileDel_gb
				},250);
				
				setTimeout(function(){
					$("#alertSpan").text("파일이 삭제되었습니다.");
					alertDialog.dialog("open");
					getFileList();
					fileDel_cnt = 0;
					fileDel_gb = 0;
				},400);					
				confirmDialog.dialog("close");
				
			},
			"취 소":function(){
				confirmDialog.dialog("close");
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

	
	

	var memoDialog;
	memoDialog = $("#memo-form").dialog({
		autoOpen:false,
		height:180,
		width:400,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				memoDialog.dialog("close");
				var zone = $("#s_zone").val();
				
				
				$.post("m03/s03/insert_m03s03_memo.jsp",{
					"cnt":$("#m_cnt").val(),
					"gb":$("#m_gb").val(),
					"memo":$("#m_memo").val()
				},150);
				
				setTimeout(function(){
					getFileList();
					var mForm = $("#memoform")[0];
					mForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				var mForm = $("#memoform")[0];
				mForm.reset();
				memoDialog.dialog("close");
			}
		}
	});
	
//2020-12-15 분기

	var tdateDialog_bungi;
	tdateDialog_bungi = $("#tdate-form_bungi").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				tdateDialog_bungi.dialog("close");
				var zone = $("#s_zone").val();
				
				$.post("m03/s03/insert_m03s03_tdate_bungi.jsp",{
					"cnt":$("#t_cnt_bungi").val(),
					"gb":$("#t_gb_bungi").val(),
					"tdate":$("#t_date_bungi").val()
				},150);
				
				setTimeout(function(){
					getFileList_bungi();
					var dForm = $("#dateform_bungi")[0];
					dForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				var dForm = $("#dateform_bungi")[0];
				dForm.reset();
				tdateDialog_bungi.dialog("close");
			}
		}
	});

	
	var chkDialog_bungi;
	chkDialog_bungi = $("#chk-form_bungi").dialog({
		autoOpen:false,
		height:180,
		width:340,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				chkDialog_bungi.dialog("close");
				
				$.post("m03/s03/insert_m03s03_chk_bungi.jsp",{
					"cnt":$("#c_cnt_bungi").val(),
					"gb":$("#c_gb_bungi").val(),
					"chk":$("input:checkbox[name='c_chk_bungi']:checked").val()
				},150);
				
				setTimeout(function(){
					getFileList_bungi();
					var cForm = $("#chkform_bungi")[0];
					cForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				var cForm = $("#chkform_bungi")[0];
				cForm.reset();
				chkDialog_bungi.dialog("close");
			}
		}
	});	

	var memoDialog_bungi;
	memoDialog_bungi = $("#memo-form_bungi").dialog({
		autoOpen:false,
		height:180,
		width:400,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				memoDialog_bungi.dialog("close");
				var zone = $("#s_zone").val();
				
				$.post("m03/s03/insert_m03s03_memo_bungi.jsp",{
					"cnt":$("#m_cnt_bungi").val(),
					"gb":$("#m_gb_bungi").val(),
					"memo":$("#m_memo_bungi").val()
				},150);
				
				
				setTimeout(function(){
					getFileList_bungi();
					var mForm = $("#memoform_bungi")[0];
					mForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				var mForm = $("#memoform_bungi")[0];
				mForm.reset();
				memoDialog_bungi.dialog("close");
			}
		}
	});

	var confirmDialog_bungi;
	confirmDialog_bungi = $("#confirm-form_bungi").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"삭 제":function(){
				$.post("m03/s03/delete_m03s03_file_bungi.jsp",{
					"cnt":fileDel_cnt_bungi,
					"gb":fileDel_gb_bungi
				},250);
				
				setTimeout(function(){
					$("#alertSpan").text("파일이 삭제되었습니다.");
					alertDialog.dialog("open");
					getFileList_bungi();
					fileDel_cnt_bungi = 0;
					fileDel_gb_bungi = 0;
				},400);					
				confirmDialog_bungi.dialog("close");
				
			},
			"취 소":function(){
				confirmDialog_bungi.dialog("close");
			}
		}
	});
	

	var fileDialog_bungi;
	fileDialog_bungi = $("#file-form_bungi").dialog({
		  autoOpen: false,
		  height: 280,
		  width: 380,
		  modal: false,
		  stack:false,
		  buttons: {		
		        "닫 기": function() {
		        	setTimeout( function() 
		              {				
		        		fileDialog_bungi.dialog("close");
		              });
		        }
			  }
		});
	
	
/*차트 불러오는 함수*/
			
</script>

</body>
</html>