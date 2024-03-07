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
.scrolltbody {
    display: block;
    width: 1900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}

.scrolltbody tbody {
    display: block;
    /* height: 590px; */

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
	
#chart3 .bb-title { font-size: 22px; font-weight: bold; }
#chart4 .bb-title { font-size: 22px; font-weight: bold; }
#chart5 .bb-title { font-size: 22px; font-weight: bold; }
#chart6 .bb-title { font-size: 22px; font-weight: bold; }
#chart7 .bb-title { font-size: 22px; font-weight: bold; }
#chart8 .bb-title { font-size: 22px; font-weight: bold; }
	
	
	@font-face{
		font-family:"headline";
		src:url("fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
	}	
	
	.tableHeader {
	    background-color: #122d64;
	    color:#FFFFFF;
	    height: 50px;
	    font-size: 20pt;
	    font-family: headline;
	    font-weight: 700;
	    text-align: center;
	    border-color: #FFFFFF !important;
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
		<div style="display:none;" id="alert-form" title="확인창" >
			<span id="alertSpan"></span>
		</div>

		<div style="display:none;" id="comment-form" title="코멘트 등록창" >
			<form class="form-inline" role="form" method="post" autocomplete="off">
				<table style="border: 1px solid #0074; margin-top:15px; margin-left:15px;">
					<tr style="height: 30px;">
						<td>&nbsp;</td>
						<th class="text-center cell" style="width: 160px; height: 30px; font-size: 13px;">날짜</th>
						<td>&nbsp;</td>
						<th class="text-center cell" style="width: 200px; height: 30px; font-size: 13px;">코멘트</th>
						<td>&nbsp;</td>						
					</tr>
					
					<tr style="height: 30px;">
						<td>&nbsp;</td>
						<td><input type="text" class="form-control input-sm" id="cmt_date" name="cmt_date" 
							style="width: 160px; height: 30px; font-size: 14px; text-align: center; background-color:white;" 
							readonly="readonly"/></td>
						<td>&nbsp;</td>
						<td><input type="text" class="form-control input-sm" id="cmt_comment" name="cmt_comment" 
							style="width: 200px; height: 30px; font-size: 14px;"/>
							<input type="hidden" class="form-control input-sm" id="cmt_hogi" name="cmt_hogi" 
							style="width: 200px; height: 30px; font-size: 14px;"/>
							<input type="hidden" class="form-control input-sm" id="cmt_zone" name="cmt_zone" 
							style="width: 200px; height: 30px; font-size: 14px;"/></td>
						<td>&nbsp;</td>
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
        
<div class="content" style="height:800px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-desktop"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">모니터링 - 온도/CP 상태감시</h5>
            </header>
            <!-- <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
							style="font-size: 14pt; font-family: headline;
							color:#8C8C8C; width: 70px; text-align: right;">설비명 : </label>
					</div>
					설비명
					<div class="form-group">
						<select class="form-control input-sm" disabled
						id="s_hogi" name="s_hogi" 
						style="padding-top:1px; padding-botom:1px;
							margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family: headline;">
							<option value="1">HT-01</option>
							<option value="2">HT-02</option>
							<option value="3">HT-03</option>
							<option value="4">HT-04</option>
							<option value="5">HT-05</option>
							<option value="6">HT-06</option>
						</select>
					</div> 	                	
                	
					<div class="form-group">
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="padding-top:1px; padding-bottom:1px;
							margin-top:6px; height: 31px; width: 100px; 
							font-size:13pt; font-family: headline; font-weight:700;" 
							id="trend_btn" onclick="location.href='m00s04_trend.jsp';">
							<i class="fa fa-line-chart" aria-hidden="true"></i>트렌드</button>
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="padding-top:1px; padding-bottom:1px;
							 margin-top:6px; height: 31px; width: 100px; 
							 font-size:13pt; font-family: headline; font-weight:700;" 
							id="data_btn" onclick="div_change('d');">
							<i class="fa fa-table" aria-hidden="true"></i>데이터</button>							
						</div>
					</div>																				
				</form>
            </header> -->
            
            <div id="collapse4" class="body" style="padding-top:50px">
				
					<div id="monitoring_chart" style="display:none;"></div>
				            
               <table id="monitoring_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
					
					
						<tr>
							<th rowspan="2" class="text-center cell tableHeader" 
							style=" width: 170px; height: 40px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								구 분
							</th>
							
							<th colspan="5" class="text-center cell tableHeader" 
							style="  height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								퀜칭로
							</th>
							
							<th colspan="4" class="text-center cell tableHeader" 
							style="  height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								템퍼링로
							</th>
							<th rowspan="2" class="text-center cell tableHeader" 
							style=" width: 130px; height: 60px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								중간<br />세정기
							</th>
							<th rowspan="2" class="text-center cell tableHeader" 
							style=" width: 130px; height: 60px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								유조온도
							</th>
											
							<th rowspan="2" class="text-center cell tableHeader" 
							style=" width: 150px; height: 60px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								CP
							</th>
						</tr>
												
						<tr>
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#1
							</th>
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#2
							</th>														
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#3
							</th>
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#4
							</th>														
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#5
							</th>
							

							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#1
							</th>
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#2
							</th>														
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#3
							</th>
							
							<th class="text-center cell tableHeader" 
							style=" width: 130px; height: 35px; 
							font-size: 20pt; font-weight:700; font-family: headline;">
								#4
							</th>																
						</tr>		
														
					</thead>
					
					<tbody id="monitoring_contents">
					<!-- 1호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_hogi">열처리<br>1호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 150px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h1_sp_cp"></th>														
						
						</tr>
					<!-- 2호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_hogi">열처리<br>2호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h2_sp_cp"></th>														
						
						</tr>
					<!-- 3호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_hogi">열처리<br>3호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h3_sp_cp"></th>														
						
						</tr>
					<!-- 4호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_hogi">열처리<br>4호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h4_sp_cp"></th>														
						
						</tr>
					<!-- 5호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_hogi">열처리<br>5호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h5_sp_cp"></th>														
						
						</tr>
					<!-- 6호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 90px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_hogi">열처리<br>6호기</th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 13pt; font-family:headline; font-weight:700;"
							>현재값</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_q1_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_q2_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_q3_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_q4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_mw"></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_pv_cp"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 45px; 
							font-size: 10pt; font-family:headline; font-weight:700;"
							>기준범위</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_q1_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_q2_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_q3_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_q4_spec"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_q5_spec"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_t4_spec"></th>
					
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 130px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 45px; 
							font-size: 17pt; font-family:headline; font-weight:700;"
							id="h6_sp_cp"></th>														
						
						</tr>
								
					
					</tbody>
					
				</table>
				
				
				
					<div class="row">
						<div class="col-xs-11">
							<div id="chart3" style="display:none;"></div>
							<div id="chart4" style="display:none;"></div>
							<div id="chart5" style="display:none;"></div>
							<div id="chart6" style="display:none;"></div>
							<div id="chart7" style="display:none;"></div>
							<div id="chart8" style="display:none;"></div>
						</div>
						<div class="col-xs-1">
							<div class="row">
								<div id="chart3_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend3"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip3"></div>
									</div>				
								</div>
								
								<div id="chart4_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend4"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip4"></div>
									</div>				
								</div>
								
								<div id="chart5_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend5"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip5"></div>
									</div>				
								</div>								
																
								<div id="chart6_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend6"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip6"></div>
									</div>				
								</div>								

								<div id="chart7_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend7"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip7"></div>
									</div>				
								</div>	
								
								<div id="chart8_right"
								style="height:520px; display: none;">
									<div class="col-xs-8">
										<div id="legend8"></div>
									</div>									
									<div class="col-xs-3">
										<div id="tooltip8"></div>
									</div>				
								</div>									
								
							</div>	
							
	            		<div class="row" id="date_div" style="display:none;">
	            			<div class="col-xs-7">
								<label class="control-label" 
								style="font-size: 12pt; font-family:headline; 
										color:#8C8C8C; display:inline-block; 
										width: 140px; text-align: center;"> 날  짜 </label>	
										            			
								<input type="text" class="form-control input-sm" 
								id="n_date" name="n_date"  readonly="readonly" 
								style="margin-top:5px; height: 30px;
									font-size: 13pt; font-family:headlline;
									padding:1px;
									width:110px; background-color:white;"/>
							</div>									            			
	            		</div>
	            		
	            		
	            		
	            		
	            		<div class="row" id="time_div" style="display:none;">
	            			<div class="col-xs-7">
								<label class="control-label" 
								style="font-size: 12pt; font-family:headline; 
										color:#8C8C8C; display:inline-block; 
										width: 140px; text-align: center;"> 시  간 </label>	
										            			
								<input type="text" class="form-control input-sm" 
								id="n_time" name="n_time" readonly="readonly" 
								style="margin-top:5px; height: 30px;
								font-size: 13pt; font-family:headline;
								padding:1px;
									width:110px; background-color:white;"/>
							</div>									            			
	            		</div>							
							
												
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
	var jsonData3; var jsonData4; var jsonData5; 
	var jsonData6; var jsonData7; var jsonData8;
	var chart3; var chart4; var chart5;
	var chart6; var chart7; var chart8;
	var x3=0; var x4=0; var x5=0; var x6=0; var x7=0; var x8=0;
	var commentDialog;
	var alertDialog;
	
	var commentForm;
	
/*인터벌*/
		var start_interval;
		var start_interval2;
		var start_interval3;
		var start_interval4;
		var start_interval5;
		var start_interval6;
		
		var start_interval7;
		
/*페이지 로드*/	
$(function(){
	
//	fn_check();
/*	
	commentForm = commentDialog.find( "form" ).on( "submit", function( event ) {
	      event.preventDefault();
	});	
	
	$("#s_hogi").attr("disabled",true);
	start_interva7 = setInterval('getMonitoringList()',60000);
*/	
});

function date_set(v){
	var result = "";
	if(v <= 9){
		result = "0"+v;			
	}else{
		result = v;
	}
	
	return result;
}
	
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

function init(){

	getMonitoringList();

	setInterval(getMonitoringList, 10000);
	
	$("#trend_btn").show();
	$("#data_btn").hide();
	
}

function start_chart(){
	
	data_load3();			
	
	//3호기
	chart3_load();
 }

function start_chart2(){
	
	data_load4();			
	
	//3호기
	chart4_load();
 }

function start_chart3(){
	
	data_load5();			
	
	//3호기
	chart5_load();
 }
 
function start_chart4(){
	
	data_load6();			
	
	//3호기
	chart6_load();
 }
 
function start_chart5(){
	
	data_load7();			
	
	//3호기
	chart7_load();
 }
 
function start_chart6(){
	
	data_load8();			
	
	//3호기
	chart8_load();
 }

function div_change(value){
	if(value == 't'){
		$("#monitoring_list").hide();
		
		data_load3();
		setTimeout(function(){
			chart3_generate();
			$("#chart3").show();
			$("#chart3_right").show();			
		},400);
		
		$("#trend_btn").hide();
		$("#data_btn").show();
		$("#s_hogi").attr("disabled",false);
		clearInterval(start_interva7);
		$("#date_div").show();
		$("#time_div").show();
		
		
	}else{
		$("#monitoring_list").show();
		
		$("#chart3").hide();
		$("#chart3_right").hide();
		$("#chart4").hide();
		$("#chart4_right").hide();
		$("#chart5").hide();
		$("#chart5_right").hide();
		$("#chart6").hide();
		$("#chart6_right").hide();
		$("#chart7").hide();
		$("#chart7_right").hide();
		$("#chart8").hide();
		$("#chart8_right").hide();
		
		$("#trend_btn").show();
		$("#data_btn").hide();
		
		$("#s_hogi").val("3");
		$("#s_hogi").attr("disabled",true);
		start_interva7 = setInterval('getMonitoringList()',60000);
		$("#date_div").hide();
		$("#time_div").hide();
	}
}

	function getMonitoringList(){
		getMonitoringList1();
		getMonitoringList2();
		getMonitoringList3();
		getMonitoringList4();
		getMonitoringList5();
		getMonitoringList6();
	}


	function getMonitoringList1(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht1.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h1_pv_q1_spec").text(rsAr.q1_pv);
					$("#h1_pv_q2_spec").text(rsAr.q2_pv);
					$("#h1_pv_q3_spec").text(rsAr.q3_pv);
					$("#h1_pv_q4_spec").text(rsAr.q4_pv);
					$("#h1_pv_q5_spec").text(rsAr.q5_pv);
					$("#h1_pv_t1_spec").text(rsAr.t1_pv);
					$("#h1_pv_t2_spec").text(rsAr.t2_pv);
					$("#h1_pv_t3_spec").text(rsAr.t3_pv);
					$("#h1_pv_t4_spec").text(rsAr.t4_pv);
					$("#h1_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h1_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h1_pv_cp").text(rsAr.cp_pv.toFixed(3));
					
					// 퀜칭로 온도범위
					$("#h1_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h1_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h1_pv_q1_spec").css("background-color", "");
					}
					$("#h1_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h1_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h1_pv_q2_spec").css("background-color", "");
					}
					$("#h1_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h1_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h1_pv_q3_spec").css("background-color", "");
					}
					$("#h1_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h1_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h1_pv_q4_spec").css("background-color", "");
					}
					$("#h1_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h1_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h1_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h1_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h1_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h1_pv_t1_spec").css("background-color", "");
					}
					$("#h1_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h1_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h1_pv_t2_spec").css("background-color", "");
					}
					$("#h1_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h1_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h1_pv_t3_spec").css("background-color", "");
					}
					$("#h1_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h1_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h1_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h1_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h1_pv_mw").css("background-color", "red");
					} else{
						$("#h1_pv_mw").css("background-color", "");
					}
					
					$("#h1_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h1_pv_oil").css("background-color", "red");
					} else{
						$("#h1_pv_oil").css("background-color", "");
					}
					
					$("#h1_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h1_pv_cp").css("background-color", "red");
					} else{
						$("#h1_pv_cp").css("background-color", "");
					}
					
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
	function getMonitoringList2(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht2.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h2_pv_q1_spec").text(rsAr.q1_pv);
					$("#h2_pv_q2_spec").text(rsAr.q2_pv);
					$("#h2_pv_q3_spec").text(rsAr.q3_pv);
					$("#h2_pv_q4_spec").text(rsAr.q4_pv);
					$("#h2_pv_q5_spec").text(rsAr.q5_pv);
					$("#h2_pv_t1_spec").text(rsAr.t1_pv);
					$("#h2_pv_t2_spec").text(rsAr.t2_pv);
					$("#h2_pv_t3_spec").text(rsAr.t3_pv);
					$("#h2_pv_t4_spec").text(rsAr.t4_pv);
					$("#h2_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h2_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h2_pv_cp").text(rsAr.cp_pv.toFixed(3)); // cp
					
					// 퀜칭로 온도범위
					$("#h2_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h2_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h2_pv_q1_spec").css("background-color", "");
					}
					$("#h2_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h2_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h2_pv_q2_spec").css("background-color", "");
					}
					$("#h2_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h2_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h2_pv_q3_spec").css("background-color", "");
					}
					$("#h2_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h2_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h2_pv_q4_spec").css("background-color", "");
					}
					$("#h2_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h2_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h2_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h2_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h2_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h2_pv_t1_spec").css("background-color", "");
					}
					$("#h2_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h2_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h2_pv_t2_spec").css("background-color", "");
					}
					$("#h2_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h2_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h2_pv_t3_spec").css("background-color", "");
					}
					$("#h2_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h2_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h2_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h2_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h2_pv_mw").css("background-color", "red");
					} else{
						$("#h2_pv_mw").css("background-color", "");
					}
					
					$("#h2_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h2_pv_oil").css("background-color", "red");
					} else{
						$("#h2_pv_oil").css("background-color", "");
					}
					
					$("#h2_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h2_pv_cp").css("background-color", "red");
					} else{
						$("#h2_pv_cp").css("background-color", "");
					}
					
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
	function getMonitoringList3(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht3.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h3_pv_q1_spec").text(rsAr.q1_pv);
					$("#h3_pv_q2_spec").text(rsAr.q2_pv);
					$("#h3_pv_q3_spec").text(rsAr.q3_pv);
					$("#h3_pv_q4_spec").text(rsAr.q4_pv);
					$("#h3_pv_q5_spec").text(rsAr.q5_pv);
					$("#h3_pv_t1_spec").text(rsAr.t1_pv);
					$("#h3_pv_t2_spec").text(rsAr.t2_pv);
					$("#h3_pv_t3_spec").text(rsAr.t3_pv);
					$("#h3_pv_t4_spec").text(rsAr.t4_pv);
					$("#h3_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h3_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h3_pv_cp").text(rsAr.cp_pv.toFixed(3)); // cp
					
					$("#h3_sp_q1_spec").text(rsAr.q1_sp);
					$("#h3_sp_q2_spec").text(rsAr.q2_sp);
					$("#h3_sp_q3_spec").text(rsAr.q3_sp);
					$("#h3_sp_q4_spec").text(rsAr.q4_sp);
					$("#h3_sp_q5_spec").text(rsAr.q5_sp);
					$("#h3_sp_t1_spec").text(rsAr.t1_sp);
					$("#h3_sp_t2_spec").text(rsAr.t2_sp);
					$("#h3_sp_t3_spec").text(rsAr.t3_sp);
					$("#h3_sp_t4_spec").text(rsAr.t4_sp);
					$("#h3_sp_mw").text(rsAr.a_sp); // 중간세정기
					$("#h3_sp_oil").text(rsAr.oil_sp);	// 유조
					$("#h3_sp_cp").text(rsAr.cp_sp.toFixed(3)); // cp
					
					/* // 퀜칭로 온도범위
					$("#h3_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h3_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h3_pv_q1_spec").css("background-color", "");
					}
					$("#h3_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h3_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h3_pv_q2_spec").css("background-color", "");
					}
					$("#h3_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h3_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h3_pv_q3_spec").css("background-color", "");
					}
					$("#h3_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h3_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h3_pv_q4_spec").css("background-color", "");
					}
					$("#h3_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h3_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h3_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h3_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h3_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h3_pv_t1_spec").css("background-color", "");
					}
					$("#h3_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h3_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h3_pv_t2_spec").css("background-color", "");
					}
					$("#h3_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h3_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h3_pv_t3_spec").css("background-color", "");
					}
					$("#h3_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h3_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h3_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h3_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h3_sp_mw").css("background-color", "red");
					} else{
						$("#h3_sp_mw").css("background-color", "");
					}
					
					$("#h3_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h3_sp_oil").css("background-color", "red");
					} else{
						$("#h3_sp_oil").css("background-color", "");
					}
					
					$("#h3_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h3_sp_cp").css("background-color", "red");
					} else{
						$("#h3_sp_cp").css("background-color", "");
					} */
					
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
	function getMonitoringList4(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht4.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h4_pv_q1_spec").text(rsAr.q1_pv);
					$("#h4_pv_q2_spec").text(rsAr.q2_pv);
					$("#h4_pv_q3_spec").text(rsAr.q3_pv);
					$("#h4_pv_q4_spec").text(rsAr.q4_pv);
					$("#h4_pv_q5_spec").text(rsAr.q5_pv);
					$("#h4_pv_t1_spec").text(rsAr.t1_pv);
					$("#h4_pv_t2_spec").text(rsAr.t2_pv);
					$("#h4_pv_t3_spec").text(rsAr.t3_pv);
					$("#h4_pv_t4_spec").text(rsAr.t4_pv);
					$("#h4_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h4_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h4_pv_cp").text(rsAr.cp_pv.toFixed(3)); // cp
					
					// 퀜칭로 온도범위
					$("#h4_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h4_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h4_pv_q1_spec").css("background-color", "");
					}
					$("#h4_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h4_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h4_pv_q2_spec").css("background-color", "");
					}
					$("#h4_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h4_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h4_pv_q3_spec").css("background-color", "");
					}
					$("#h4_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h4_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h4_pv_q4_spec").css("background-color", "");
					}
					$("#h4_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h4_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h4_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h4_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h4_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h4_pv_t1_spec").css("background-color", "");
					}
					$("#h4_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h4_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h4_pv_t2_spec").css("background-color", "");
					}
					$("#h4_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h4_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h4_pv_t3_spec").css("background-color", "");
					}
					$("#h4_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h4_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h4_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h4_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h4_pv_mw").css("background-color", "red");
					} else{
						$("#h4_pv_mw").css("background-color", "");
					}
					
					$("#h4_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h4_pv_oil").css("background-color", "red");
					} else{
						$("#h4_pv_oil").css("background-color", "");
					}
					
					$("#h4_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h4_pv_cp").css("background-color", "red");
					} else{
						$("#h4_pv_cp").css("background-color", "");
					}
					
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
	function getMonitoringList5(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht5.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h5_pv_q1_spec").text(rsAr.q1_pv);
					$("#h5_pv_q2_spec").text(rsAr.q2_pv);
					$("#h5_pv_q3_spec").text(rsAr.q3_pv);
					$("#h5_pv_q4_spec").text(rsAr.q4_pv);
					$("#h5_pv_q5_spec").text(rsAr.q5_pv);
					$("#h5_pv_t1_spec").text(rsAr.t1_pv);
					$("#h5_pv_t2_spec").text(rsAr.t2_pv);
					$("#h5_pv_t3_spec").text(rsAr.t3_pv);
					$("#h5_pv_t4_spec").text(rsAr.t4_pv);
					$("#h5_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h5_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h5_pv_cp").text(rsAr.cp_pv.toFixed(3)); // cp
					
					// 퀜칭로 온도범위
					$("#h5_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h5_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h5_pv_q1_spec").css("background-color", "");
					}
					$("#h5_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h5_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h5_pv_q2_spec").css("background-color", "");
					}
					$("#h5_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h5_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h5_pv_q3_spec").css("background-color", "");
					}
					$("#h5_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h5_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h5_pv_q4_spec").css("background-color", "");
					}
					$("#h5_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h5_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h5_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h5_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h5_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h5_pv_t1_spec").css("background-color", "");
					}
					$("#h5_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h5_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h5_pv_t2_spec").css("background-color", "");
					}
					$("#h5_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h5_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h5_pv_t3_spec").css("background-color", "");
					}
					$("#h5_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h5_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h5_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h5_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h5_pv_mw").css("background-color", "red");
					} else{
						$("#h5_pv_mw").css("background-color", "");
					}
					
					$("#h5_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h5_pv_oil").css("background-color", "red");
					} else{
						$("#h5_pv_oil").css("background-color", "");
					}
					
					$("#h5_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h5_pv_cp").css("background-color", "red");
					} else{
						$("#h5_pv_cp").css("background-color", "");
					}
					
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
	function getMonitoringList6(){
				
		$.ajax({
			type : "POST",
			url : "m00/s04/select_m00s04_ht6.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					console.log(rsAr);
					$("#h6_pv_q1_spec").text(rsAr.q1_pv);
					$("#h6_pv_q2_spec").text(rsAr.q2_pv);
					$("#h6_pv_q3_spec").text(rsAr.q3_pv);
					$("#h6_pv_q4_spec").text(rsAr.q4_pv);
					$("#h6_pv_q5_spec").text(rsAr.q5_pv);
					$("#h6_pv_t1_spec").text(rsAr.t1_pv);
					$("#h6_pv_t2_spec").text(rsAr.t2_pv);
					$("#h6_pv_t3_spec").text(rsAr.t3_pv);
					$("#h6_pv_t4_spec").text(rsAr.t4_pv);
					$("#h6_pv_mw").text(rsAr.a_pv); // 중간세정기
					$("#h6_pv_oil").text(rsAr.oil_pv);	// 유조
					$("#h6_pv_cp").text(rsAr.cp_pv.toFixed(3)); // cp
					
					// 퀜칭로 온도범위
					$("#h6_sp_q1_spec").text((rsAr.q1_sp-150)+"~"+(rsAr.q1_sp+50));
					if((rsAr.q1_pv < rsAr.q1_sp-150) || (rsAr.q1_pv > rsAr.q1_sp+50)){
						$("#h6_pv_q1_spec").css("background-color", "red");
					} else{
						$("#h6_pv_q1_spec").css("background-color", "");
					}
					$("#h6_sp_q2_spec").text((rsAr.q2_sp-100)+"~"+(rsAr.q2_sp+30));
					if((rsAr.q2_pv < rsAr.q2_sp-100) || (rsAr.q2_pv > rsAr.q2_sp+30)){
						$("#h6_pv_q2_spec").css("background-color", "red");
					} else{
						$("#h6_pv_q2_spec").css("background-color", "");
					}
					$("#h6_sp_q3_spec").text((rsAr.q3_sp-10)+"~"+(rsAr.q3_sp+10));
					if((rsAr.q3_pv < rsAr.q3_sp-10) || (rsAr.q3_pv > rsAr.q3_sp+10)){
						$("#h6_pv_q3_spec").css("background-color", "red");
					} else{
						$("#h6_pv_q3_spec").css("background-color", "");
					}
					$("#h6_sp_q4_spec").text((rsAr.q4_sp-10)+"~"+(rsAr.q4_sp+10));
					if((rsAr.q4_pv < rsAr.q4_sp-10) || (rsAr.q4_pv > rsAr.q4_sp+10)){
						$("#h6_pv_q4_spec").css("background-color", "red");
					} else{
						$("#h6_pv_q4_spec").css("background-color", "");
					}
					$("#h6_sp_q5_spec").text((rsAr.q5_sp-10)+"~"+(rsAr.q5_sp+10));
					if((rsAr.q5_pv < rsAr.q5_sp-10) || (rsAr.q5_pv > rsAr.q5_sp+10)){
						$("#h6_pv_q5_spec").css("background-color", "red");
					} else{
						$("#h6_pv_q5_spec").css("background-color", "");
					}
					
					// 템퍼링로 온도범위
					$("#h6_sp_t1_spec").text((rsAr.t1_sp-200)+"~"+(rsAr.t1_sp+20));
					if((rsAr.t1_pv < rsAr.t1_sp-200) || (rsAr.t1_pv > rsAr.t1_sp+20)){
						$("#h6_pv_t1_spec").css("background-color", "red");
					} else{
						$("#h6_pv_t1_spec").css("background-color", "");
					}
					$("#h6_sp_t2_spec").text((rsAr.t2_sp-50)+"~"+(rsAr.t2_sp+20));
					if((rsAr.t2_pv < rsAr.t2_sp-50) || (rsAr.t2_pv > rsAr.t2_sp+20)){
						$("#h6_pv_t2_spec").css("background-color", "red");
					} else{
						$("#h6_pv_t2_spec").css("background-color", "");
					}
					$("#h6_sp_t3_spec").text((rsAr.t3_sp-10)+"~"+(rsAr.t3_sp+10));
					if((rsAr.t3_pv < rsAr.t3_sp-10) || (rsAr.t3_pv > rsAr.t3_sp+10)){
						$("#h6_pv_t3_spec").css("background-color", "red");
					} else{
						$("#h6_pv_t3_spec").css("background-color", "");
					}
					$("#h6_sp_t4_spec").text((rsAr.t4_sp-10)+"~"+(rsAr.t4_sp+10));
					if((rsAr.t4_pv < rsAr.t4_sp-10) || (rsAr.t4_pv > rsAr.t4_sp+10)){
						$("#h6_pv_t4_spec").css("background-color", "red");
					} else{
						$("#h6_pv_t4_spec").css("background-color", "");
					}
					
					//중간세정기 유조 cp
					$("#h6_sp_mw").text((rsAr.a_sp-10)+"~"+(rsAr.a_sp+10));
					if((rsAr.a_pv < rsAr.a_sp-10) || (rsAr.a_pv > rsAr.a_sp+10)){
						$("#h6_pv_mw").css("background-color", "red");
					} else{
						$("#h6_pv_mw").css("background-color", "");
					}
					
					$("#h6_sp_oil").text((rsAr.oil_sp-10)+"~"+(rsAr.oil_sp+10));
					if((rsAr.oil_pv < rsAr.oil_sp-10) || (rsAr.oil_pv > rsAr.oil_sp+10)){
						$("#h6_pv_oil").css("background-color", "red");
					} else{
						$("#h6_pv_oil").css("background-color", "");
					}
					
					$("#h6_sp_cp").text((rsAr.cp_sp-0.05).toFixed(3)+"~"+(rsAr.cp_sp+0.05).toFixed(3));
					if((rsAr.cp_pv.toFixed(3) < (rsAr.cp_sp-0.05).toFixed(3)) || (rsAr.cp_pv.toFixed(3) > (rsAr.cp_sp+0.05).toFixed(3))){
						$("#h6_pv_cp").css("background-color", "red");
					} else{
						$("#h6_pv_cp").css("background-color", "");
					}
					
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
	
	*/

	

/*이벤트*/	


/*다이얼로그*/
		commentDialog = $("#comment-form").dialog({
	      autoOpen: false,
	      height: 220,
	      width: 440,
	      modal: false,
	      stack:false,
	      buttons: {		    	  
		        "저 장": function() {
		        	var cmt_hogi = $("#cmt_hogi").val();		//설비명
		        	var cmt_date = $("#cmt_date").val();		//클릭한 날짜+시간
		        	var cmt_comment = $("#cmt_comment").val();	//입력한 코멘트명
		        	var cmt_zone = $("#cmt_zone").val();		//존 위치
		        	
		        	$.post("i002001.jsp",{
		        		"hogi":cmt_hogi,
		        		"date":cmt_date,
		        		"cmt":cmt_comment,
		        		"zone":cmt_zone
		        	},150);
		        	
		        	setTimeout(function(){
//		        		alert("등록완료");
						commentDialog.dialog("close");
						$("#alertSpan").text("코멘트 등록이 완료되었습니다.");
						alertDialog.dialog("open");
		        	},200);
		        	
		        },			        
        	"닫 기": function() {
        		commentDialog.dialog( "close" );
        }
	      },
	      close: function() {
	    	  commentForm[ 0 ].reset();
	      }
		});
	
	alertDialog = $("#alert-form").dialog({
		  autoOpen: false,
		  height: 150,
		  width: 280,
		  modal: false,
		  stack:false,
		  buttons: {
		        "확 인": function() {	        	
		        	setTimeout( function(){		
	     				alertDialog.dialog( "close" );
	                }, 100);	        	
		        }
			  }
		});	

/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>