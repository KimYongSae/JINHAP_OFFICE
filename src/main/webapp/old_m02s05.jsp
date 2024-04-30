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
    height: 621px;

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
	#o2sensor_list th {
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
		<div id="carousel-form" style="display:none;" title="성적서 파일">
		</div>
		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
		</div>
		<div id="confirm-form" style="display:none;" title="확인창">
			<span id="confirmSpan"></span>
		</div>		
		
		<div style="display:none;" id="file-form" title="파일 첨부" >
			<form class="form-horizontal" id="upload" name="upload" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
					<tr><td colspan="2">*PDF파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_date" name="import_date" class="file_input_textbox" readonly="readonly"
						onkeyup="auto_date_format(event, this);">
						<input type="hidden" id="import_cnt" name="import_cnt" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file" name="file" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center"><input type="button" class="btn small btn-primary" onclick="file_import();" value="적용"></td>
					</tr>
				</table>
			</form>			
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
        
<div class="content" style="height:810px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
				
				                            <!--Begin Datatables-->
<div class="row">
            
  <div style="width: 70%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-retweet"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">조건관리 - O₂센서 교체이력</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline;
						color:#8C8C8C; width: 90px; text-align: right;">교체일자 : </label>
					</div>
					<!-- 교체년도 -->
					<div class="form-group">
						<select class="form-control input-sm" 
							id="s_date" name="s_date" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;
							padding-top:1px; padding-bottom:1px;"
						></select>
					</div>             	

					<div class="form-group">
						<label class="control-label" style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 70px; text-align: right;">설비명 : </label>
					</div>
					<!-- 설비명 -->
					<div class="form-group">
						<select class="form-control input-sm datepicker" id="s_hogi" name="s_hogi" 
						style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;
							padding-top:1px; padding-bottom:1px;">
							<option value="">전체</option>
							<option value="1">Q01-HN01</option>
							<option value="2">Q01-HN02</option>
							<option value="3">Q01-HN03</option>
							<option value="4">Q01-HN04</option>
							<option value="5">Q01-HN05</option>
							<option value="6">Q01-HN06</option>
						</select>
					</div>
					
					
					<div class="form-group">
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="padding-top:1px; padding-bottom:1px;
							 margin-top:6px; height: 31px; width: 100px; 
							font-size:14pt; font-family:headline; font-weight:700;" 
							id="searchbtn">
							<i class="fa fa-search" aria-hidden="true"></i>검 색</button>					
						</div>
					</div>
				</form>
            </header>
            
            
            <div id="collapse4" class="body">
               <table id="o2sensor_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>		
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 120px; height: 50px; 
								font-size: 16pt; font-family:headline;">
								설비명
							</th>						
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 200px; height: 50px; 
								font-size: 16pt; font-family:headline;">
								교체일자
							</th>

							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 350px; height: 50px; 
								font-size: 16pt; font-family:headline;">
								성적서 파일명
							</th>						
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 250px; height: 50px; 
								font-size: 16pt; font-family:headline;">
								성적서 보기
							</th>	
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 250px; height: 50px; 
								font-size: 16pt; font-family:headline;">
								성적서 수정
							</th>							
																																																																											
						</tr>
					</thead>	
									
					<tbody id="o2sensor_contents">
						
					</tbody>
				</table>
            </div>
        </div>
    </div>
    
  <div style="width: 30%;" class="col-lg-12">
        <div class="box">
            <header >
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-cog"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">교체이력 등록</h5>
            </header>                    
            <div class="body2">
               <form class="form-inline" role="form" id="inputform" name="inputform" 
               		method="post" autocomplete="off">
  				<table>
    				<tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 160px; text-align: right; 
      					font-size:14pt; font-family: headline;">
      						<span class="asteriskField"></span>설비명</label></td>   
      					<td>
      					
      					<input type="hidden" id="i_cnt" name="i_cnt" />
						<input type="text" class="form-control input-sm" 
						id="i_hogi" name="i_hogi" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family :headline;
      					background-color:white;" 
      					placeholder="설비명" readonly="readonly"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      						style="padding-top:3px; width: 160px; text-align: right; 
      						font-size:14pt; font-family: headline;">
      						<span class="asteriskField"></span>이전 교체일자</label></td>    			
      					<td><input type="text" class="form-control input-sm datepicker" 
      					id="i_bdate" name="i_bdate" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family: headline;" 
      					placeholder="이전교체일자"
      					onkeyup="auto_date_format(event, this);"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 160px; text-align: right; 
      					font-size:14pt; font-family: headline;">
      						<span class="asteriskField"></span>교체일자</label></td>    			
      					<td><input type="text" class="form-control input-sm datepicker" 
      					id="i_date" name="i_date" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family: headline;" 
      					placeholder="교체일자"
      					onkeyup="auto_date_format(event, this);"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>     				
     				
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 160px; text-align: right; 
      					font-size:14pt; font-family: headline;">
      						<span class="asteriskField"></span>차기 교체일자</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_ndate" name="i_ndate" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family: headline; 
      					background-color:white;" 
      					placeholder="차기 교체일자" readonly="readonly"
      					onkeyup="auto_date_format(event, this);"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>     				     				

     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      						style="padding-top:3px; width: 160px; text-align: right; 
      						font-size:14pt;">
      						<span class="asteriskField"></span> 파일첨부</label></td>
      					<td>
      						<c:if test="${sessionScope.sid != 'worker' }">
		      					<button id="i_file" name="i_file" class="btn btn-default" type="button"
		      						style="width: 280px; height: 34px; margin-left:15px; font-size: 14pt;
		      						padding-top:1px; padding-bottom:1px;">성적서 첨부</button>
		      				</c:if>
      						<c:if test="${sessionScope.sid == 'worker' }">
		      					<button class="btn btn-default" type="button" disabled="disabled"
		      						style="width: 280px; height: 34px; margin-left:15px; font-size: 14pt;
		      						padding-top:1px; padding-bottom:1px;">성적서 첨부</button>
		      				</c:if>
      					</td> 
      					
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>     			     				
    				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      						style="padding-top:3px; width: 150px; text-align: right; 
      						font-size:14pt; font-family: headline; padding-right:0;">
      						<span class="asteriskField"></span>비고(특기사항)</label></td>    			
      					<td><textarea class="form-control input-sm" id="i_bigo" name="i_bigo" 
      					style="width: 340px; height: 110px; font-size: 14pt; 
      					 font-family: headline;resize:none;"  
      					placeholder="비고"></textarea></td> 
      					<td style="padding-bottom:40px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>     				
     				
	 			</table>
	 			<table>
     				<tr>   		
     					<c:if test="${sessionScope.sid != 'worker' }">	
	     					<td colspan="2" style="display: inline-block; padding-left:10px; padding-bottom:8px; padding-top:8px;">
								<button id="saveBtn" class="btn btn-default btn-sm" type="button" 
									style="width: 100px; height:40px; padding-top:1px; padding-bottom:1px; 
									font-size: 14pt; font-family: headline; font-weight:700; margin-left:60px;">
								<i class="fa fa-floppy-o"></i>  저 장</button>
	        				</td>
	
	     					<td colspan="2" style="display: inline-block; padding-left:10px; padding-bottom:8px; padding-top:8px;">
								<button id="editBtn" class="btn btn-default btn-sm" type="button" 
									style="width: 100px; height:40px; padding-top:1px; padding-bottom:1px; 
									font-size: 14pt; font-family: headline; font-weight:700; margin-left:40px;">
								<i class="fa fa-pencil-square-o"></i>  수 정</button>
	        				</td>
        				</c:if>

     					<c:if test="${sessionScope.sid == 'worker' }">
	     					<td colspan="2" style="display: inline-block; padding-left:10px; padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default btn-sm" type="button" disabled="disabled" 
									style="width: 100px; height:40px; padding-top:1px; padding-bottom:1px; 
									font-size: 14pt; font-family: headline; font-weight:700; margin-left:60px;">
								<i class="fa fa-floppy-o"></i>  저 장</button>
	        				</td>
	
	     					<td colspan="2" style="display: inline-block; padding-left:10px; padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default btn-sm" type="button" disabled="disabled"
									style="width: 100px; height:40px; padding-top:1px; padding-bottom:1px; 
									font-size: 14pt; font-family: headline; font-weight:700; margin-left:40px;">
								<i class="fa fa-pencil-square-o"></i>  수 정</button>
	        				</td>
        				</c:if>


      					<td colspan="2" style="display: inline-block; padding-left:10px;  padding-bottom:8px; padding-top:8px;">
        					<button class="btn btn-default btn-sm" type="button" 
        					style="width: 120px; height:40px; padding-top:1px; padding-bottom:1px;
        					font-size: 14pt; font-weight:700; font-family: headline; margin-left:40px;"
        					id="repeatBtn">
        					<i class="fa fa-repeat"></i>  새로고침</button>				
        				</td>
					</tr>
				</table>               		
              	</form>
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
	
	
	for(var j=-3; j<2; j++){
		var y_value = now.getFullYear() + j;
		$("#s_date").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
	}
	
	sid = '<%=session.getAttribute("sid")%>';
	$("#s_date").val(now.toISOString().substring(0, 4));
	getYearCount();
	
});
	
/*함수*/	

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

function init(){
	
}

	var getYearCount = function(){
		//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
		$.post("m02/s05/count_m02s05.jsp",{
			"tdate":$("#s_date").val()
		},100);
		
		setTimeout(function(){
//			getPpk();
	//		getPpkList();
			getDetailList();
		},300);
	}
	
	var cntArray = new Array();
	function getDetailList(){
		$.ajax({
			type : "POST",
			url : "m02/s05/select_m02s05.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"tdate":$("#s_date").val(),
					"hogi":$("#s_hogi").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var listHtml = "";
	
					for(var i=0; i<rsAr.length; i++){
						var fname_a =  rsAr[i].filename.substring(0,rsAr[i].filename.lastIndexOf('_'));
						var fname_b =  rsAr[i].filename.substring(rsAr[i].filename.lastIndexOf('.'),rsAr[i].filename.length);						
						cntArray[i] = rsAr[i].cnt;
						listHtml += "<tr>";
						listHtml += '<td class="nr" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+rsAr[i].cnt+'</td>';
						listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';						
						listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 200px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].change_date+'</td>';
						listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 350px; word-break:break-all; font-size:15pt; font-family:headline;">'+fname_a+fname_b+'</td>';
						
						listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 350px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+rsAr[i].filename+'</td>';
					
						if(rsAr[i].file_yn == 'Y'){
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 250px; word-break:break-all; font-size:14pt; font-family:headline;">'+
							'<button type="button" class="btn btn-default" onclick=viewFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true; style="width:160px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-search"></i>성적서보기</button>'
							+'</td>';
						}else{
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 250px; word-break:break-all; font-size:15pt; font-family:headline;"></td>';							
						}

						if(rsAr[i].file_yn == 'Y'){
							if(sid != "worker"){
								listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 250px; word-break:break-all; font-size:14pt; font-family:headline;">'+
								'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true; style="width:160px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-remove"></i>성적서수정</button>'
								+'</td>';
							}else{
								listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 250px; word-break:break-all; font-size:15pt; font-family:headline;"></td>';
							}
						}else{
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 250px; word-break:break-all; font-size:15pt; font-family:headline;"></td>';							
						}						
						
						
						listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:16pt; font-family:headline; display:none;">'+rsAr[i].change_bdate+'</td>';
						listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:16pt; font-family:headline; display:none;">'+rsAr[i].change_ndate+'</td>';
						listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 90px; width: 60px; word-break:break-all; font-size:16pt; font-family:headline; display:none;">'+rsAr[i].bigo1+'</td>';
						listHtml += "</tr>";						
					}					
					
					$("#o2sensor_list tbody").html(listHtml);
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
	
	function file_import(){
		
		var upload = document.upload;
		
		 if (upload.file.value == "") {   
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		
		if(!checkFileTypePDF(upload.file.value)) {
			$("#loading").hide();
		  $("#alertSpan").text("PDF 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			upload.reset();
	  return false;   
	 }
		
		fileDialog.dialog("close");
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

	var confirmDialog;
	confirmDialog = $("#confirm-form").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"삭 제":function(){
				$.post("m02/s05/delete_m02s05_file.jsp",{
					"cnt":fileDel_cnt
				},250);
				
				setTimeout(function(){
					$("#alertSpan").text("파일이 삭제되었습니다.");
					alertDialog.dialog("open");
					getDetailList();
					$("#filePath").val("");
					fileDel_cnt = 0;
				},400);					
				confirmDialog.dialog("close");
				
			},
			"취 소":function(){
				confirmDialog.dialog("close");
			}
		}
	});
	
	
	var carouselDialog;
	carouselDialog = $("#carousel-form").dialog({
		  autoOpen: false,
		  height: 800,
		  width: 1200,
		  modal: false,
		  stack:false,
	      open: function(event, ui){
	    	  $('.ui-dialog').css('zIndex', 20010);
	      },
		  buttons: {		
		        "닫 기": function() {
		        	setTimeout( function() 
		              {				
		        		carouselDialog.dialog("close");
		              });
		        }
			  }		
	});
	
	function viewFile(c_val){
		$.ajax({
			type : "POST",
			url : "m02/s05/select_m02s05_file.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"cnt":c_val},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;		
					
					
					var _iframe = "<iframe src='/JINHAP_OFFICE/file/m02s05/"+rsAr[0].filename+"' style='width:100%; height:780px;'></iframe>";
					
					
					$("#carousel-form").empty().append(_iframe);					
					
					
					carouselDialog.dialog("open");	
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
	
	var fileDel_cnt = 0;
	function delFile(c_val){
		fileDel_cnt = c_val;
		$("#confirmSpan").text("파일을 삭제하시겠습니까?");
		confirmDialog.dialog("open");
		
	}	
	
/*이벤트*/	


$("#s_date").change(function(){
	getYearCount();
});

$("#s_hogi").change(function(){
	getDetailList();
});


$("#o2sensor_contents").delegate('tr','click', function() {
	
	
	var $row = $(this).closest("tr"),
		$nr = $row.find(".nr").text();		//cnt
		$nr2 = $row.find(".nr2").text();	//년도
		$nr3 = $row.find(".nr3").text();	//교체일
		$nr4 = $row.find(".nr4").text();	//호기
		$nr5 = $row.find(".nr5").text();	//설비+존위치
		$nr6 = $row.find(".nr6").text();	//변환 파일명
		$nr7 = $row.find(".nr7").text();	//실제 파일명
		$nr8 = $row.find(".nr8").text();	//파일보기
		$nr10 = $row.find(".nr10").text();	//이전 교체일
		$nr11 = $row.find(".nr11").text();	//차기 교체일
		$nr12 = $row.find(".nr12").text();	//비고
		
		
		$("#i_cnt").val($nr);
		$("#import_cnt").val($nr);
		
		
		
		$("#i_date").val($nr3);
		$("#i_bdate").val($nr10);
		$("#i_ndate").val($nr11);
		$("#i_hogi").val($nr4);
		$("#i_zone").val($nr5);
		
		$("#i_bigo").val($nr12);
		
		if($nr7 == ''){
			$("#i_file").attr("disabled",false);
		}else{
			$("#i_file").attr("disabled",true);
		}
		
		if($nr3 == '' && $nr7 == '' ){
			$("#editBtn").attr("disabled",true);
		}else{
			$("#editBtn").attr("disabled",false);
		}
		
	var index = 0;
	$("#o2sensor_contents > tr").each(function(){
		if($nr == cntArray[index]){
			$(this).css("background-color","#B2CCFF");						
		}else{						
			$(this).css("background-color","#fff");
		}	
		index++;
	});
});
		
	$("#i_file").on("click",function(){
		fileDialog.dialog("open");
	});
	
	
	$("#saveBtn").on("click",function(){
		$("#alertSpan").text("저장되었습니다.");
		var ihogi = $("#i_hogi").val();
		
		if(ihogi == ''){
			
			return;
		}
		
		var fileform = $("#upload")[0];
		var fileData = new FormData(fileform);

		var path = $("#filePath").val();
		if(path != '' && path != null){
		
			$.ajax({
				url:"m02/s05/insert_m02s05_file.jsp",
				type:"post",
				enctype:"multipart/form-data",
				data:fileData,
				processData:false,
				contentType:false,
				cache:false,
				success:function(data){
					
				}
			});
		}
		
		
		$.post("m02/s05/insert_m02s05.jsp",{
			"cnt":$("#i_cnt").val(),
			"bdate":$("#i_bdate").val(),
			"ndate":$("#i_ndate").val(),
			"date1":$("#i_date").val(),
			"bigo":$("#i_bigo").val()
		},200);
		
		
		setTimeout(function(){			
			getDetailList();
			alertDialog.dialog("open");
			fileform.reset();
		},600);
		
		
	});
	
	$("#editBtn").on("click",function(){
		$("#alertSpan").text("수정되었습니다.");
		var ihogi = $("#i_hogi").val();
		
		if(ihogi == ''){
			
			return;
		}
		
		var fileform = $("#upload")[0];
		var fileData = new FormData(fileform);

		var path = $("#filePath").val();
		if(path != '' && path != null){
		
			$.ajax({
				url:"m02/s05/insert_m02s05_file.jsp",
				type:"post",
				enctype:"multipart/form-data",
				data:fileData,
				processData:false,
				contentType:false,
				cache:false,
				success:function(data){
					
				}
			});
		}
		
		
		$.post("m02/s05/insert_m02s05.jsp",{
			"cnt":$("#i_cnt").val(),
			"bdate":$("#i_bdate").val(),
			"ndate":$("#i_ndate").val(),
			"date1":$("#i_date").val(),
			"bigo":$("#i_bigo").val()
		},200);
		
		
		setTimeout(function(){			
			getDetailList();
			alertDialog.dialog("open");
			fileform.reset();
		},600);
				
	});
	
	$("#repeatBtn").on("click",function(){
		$("#inputform")[0].reset();
	});
	
	
	
	
	$("#i_date").change(function(){
		var i_date = $("#i_date").val();
		
		if(i_date != ''){
//now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10)			
			var nDate = new Date(i_date);
			var nYear;
			if($("#i_hogi").val() == "침탄로"){
				nYear = nDate.getFullYear()+1;
			}else{
				nYear = nDate.getFullYear()+2;	
			}
			var nMonth = (nDate.getMonth()+1);
			var rMonth = "";
			if(nMonth <=9){
				rMonth = "0"+nMonth;
			}else{
				rMonth = nMonth;
			}
			
			var nDay = nDate.getDate();
			var rDay = "";
			if(nDay <=9){
				rDay = "0"+nDay;
			}else{
				rDay = nDay;
			}
			
			$("#i_ndate").val(nYear+"-"+rMonth);
			
		}else{
			$("#i_ndate").val("");
		}
		
	});
	
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>