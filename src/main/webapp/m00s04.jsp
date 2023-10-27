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
    height: 590px;

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
                <h5 style="font-size:14pt; font-family:headline;">조건관리 - 로 온도/CO2/CP 모니터링</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
							style="font-size: 14pt; font-family: headline;
							color:#8C8C8C; width: 70px; text-align: right;">설비명 : </label>
					</div>
					<!-- 설비명 -->
					<div class="form-group">
						<select class="form-control input-sm" 
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
							id="trend_btn" onclick="div_change('t');">
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
            </header>
            
            <div id="collapse4" class="body">
				
					<div id="monitoring_chart" style="display:none;"></div>
				            
               <table id="monitoring_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
					
					
						<tr>
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 160px; height: 40px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								구 분
							</th>
							
							<th colspan="5" class="text-center cell" 
							style="background-color:#24FCFF; width: 475px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								퀜칭로
							</th>
							
							<th colspan="4" class="text-center cell" 
							style="background-color:#24FCFF; width: 380px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								템퍼링로
							</th>
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 90px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								전세정기
							</th>
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 90px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								중간<br />세정기
							</th>
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 80px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								유조온도
							</th>
							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 70px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								냉각조
							</th>													
							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 115px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								변성로<br /> 온도
							</th>					

							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 110px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								CO₂
							</th>


							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 60px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								CP
							</th>
						</tr>
												
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#1
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#2
							</th>														
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#3
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#4
							</th>														
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#5
							</th>
							

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#1
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#2
							</th>														
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#3
							</th>
							
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 95px; height: 30px; 
							font-size: 14pt; font-weight:700; font-family: headline;">
								#4
							</th>																											
						</tr>		
														
					</thead>
					
					<tbody id="monitoring_contents">
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t4_spec"></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q3_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h3_cp"></th>														
						
						</tr>
					<!-- 4호기 -->
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t4_spec"></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q4_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h4_cp"></th>														
						
						</tr>					
					<!-- 5호기 -->
					
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t4_spec"></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q5_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h5_cp"></th>														
						
						</tr>					
					
					<!-- 6호기 -->
					
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t4_spec"></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q6_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h6_cp"></th>														
						
						</tr>					
					
					<!-- 7호기 -->
					
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t4_spec"></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q7_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h7_cp"></th>														
						
						</tr>					
					
					<!-- 8호기 -->
					
						<tr>							
							<th rowspan="2" class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 80px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_hogi"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>SPEC</th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t1_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t2_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t3_spec"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t4_spec"></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>							
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell q8_zero" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_cp_spec"></th>

						</tr>
						<tr>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 60px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							>ACT</th>						
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_q1"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_q2"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_q3"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_q4"></th>
							<th  class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_q5"></th>
							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t1"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t3"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 95px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_t4"></th>
								
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_bw"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 90px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_mw"></th>							
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 80px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_oil"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 70px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_cold"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 115px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_detect"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 110px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_co2"></th>
							<th class="text-center cell" 
							style="background-color:#FFFFFF; width: 100px; height: 40px; 
							font-size: 15pt; font-family:headline; font-weight:700;"
							id="h8_cp"></th>														
						
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
/*	
	getMonitoringList();
*/	
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
		getMonitoringList3();
		getMonitoringList4();
		getMonitoringList5();
		getMonitoringList6();
		getMonitoringList7();
		getMonitoringList8();
	}


	function getMonitoringList3(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list3.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					if(rsAr.length != 0){
						$("#h3_hogi").text("HT-"+rsAr[0].hogi);
						if(rsAr[0].t1 != 0){
							$("#h3_t1_spec").text((eval(rsAr[0].t1)-50)+"-"+(eval(rsAr[0].t1)+10));	
						}else{
							$("#h3_t1_spec").text("");
						}
						
						if(rsAr[0].t2 != 0){
							$("#h3_t2_spec").text((eval(rsAr[0].t2)-5)+"-"+(eval(rsAr[0].t2)+5));	
						}else{
							$("#h3_t2_spec").text("");
						}
						
						if(rsAr[0].t3 != 0){
							$("#h3_t3_spec").text((eval(rsAr[0].t3)-5)+"-"+(eval(rsAr[0].t3)+5));	
						}else{
							$("#h3_t3_spec").text("");
						}
						
						if(rsAr[0].t4 != 0){
							$("#h3_t4_spec").text((eval(rsAr[0].t4)-5)+"-"+(eval(rsAr[0].t4)+5));	
						}else{
							$("#h3_t4_spec").text("");
						}
						
						
						if(rsAr[0].cp != 0){
							$("#h3_cp_spec").text(((eval(rsAr[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr[0].cp)/1000)+0.03).toFixed(2));	
						}else{
							$("#h3_cp_spec").text("");
						}						
						
//						$("#h3_cp_spec").text(((eval(rsAr[0].cp)/1000)+0.03).toFixed(2));
//						$("#h3_cp_spec").text("설정±0.03");
						

						$("#h3_q1").text(rsAr[0].q1);
						
						if((rsAr[0].q1 < 730) || (rsAr[0].q1 > 900) ){
							$("#h3_q1").css("background-color","#FF0000");
						}else{
							$("#h3_q1").css("background-color","#FFFFFF");
						}						
						
						$("#h3_q2").text(rsAr[0].q2);

						if((rsAr[0].q2 < 825) || (rsAr[0].q2 > 900) ){
							$("#h3_q2").css("background-color","#FF0000");
						}else{
							$("#h3_q2").css("background-color","#FFFFFF");
						}
						
						$("#h3_q3").text(rsAr[0].q3);

						if((rsAr[0].q3 < 871) || (rsAr[0].q3 > 889) ){
							$("#h3_q3").css("background-color","#FF0000");
						}else{
							$("#h3_q3").css("background-color","#FFFFFF");
						}						
						
						$("#h3_q4").text(rsAr[0].q4);
						
						if((rsAr[0].q4 < 871) || (rsAr[0].q4 > 889) ){
							$("#h3_q4").css("background-color","#FF0000");
						}else{
							$("#h3_q4").css("background-color","#FFFFFF");
						}
						$("#h3_q5").text("");		//퀜칭
						
						$("#h3_t1").text(rsAr[0].t1);
						$("#h3_t2").text(rsAr[0].t2);
						$("#h3_t3").text(rsAr[0].t3);
						$("#h3_t4").text(rsAr[0].t4);		//템퍼링
						
						$("#h3_bw").text(rsAr[0].fw);		//전세정기
						if((rsAr[0].fw < 60) ){
							$("#h3_bw").css("background-color","#FF0000");
						}else{
							$("#h3_bw").css("background-color","#FFFFFF");
						}
						
						
						$("#h3_mw").text(rsAr[0].mw);		//중간세정기
						if((rsAr[0].mw < 50) ){
							$("#h3_mw").css("background-color","#FF0000");
						}else{
							$("#h3_mw").css("background-color","#FFFFFF");
						}
						
						$("#h3_oil").text(rsAr[0].oil);		//유조
						if((rsAr[0].oil < 60) || (rsAr[0].oil > 80) ){
							$("#h3_oil").css("background-color","#FF0000");
						}else{
							$("#h3_oil").css("background-color","#FFFFFF");
						}
						
						$("#h3_heat").text('');	//가열경보				
						
						$("#h3_cold").text(rsAr[0].cold);	//냉각조
						$("#h3_detect").text(rsAr[0].detect);//변성로
						if((rsAr[0].detect < 1030) || (rsAr[0].detect > 1100) ){
							$("#h3_detect").css("background-color","#FF0000");
						}else{
							$("#h3_detect").css("background-color","#FFFFFF");
						}						
						
						
						$("#h3_co").text("");				//CO
						$("#h3_co2").text((eval(rsAr[0].co2)).toFixed(3));		//CO2
						if((rsAr[0].co2 < 0.3) || (rsAr[0].co2 > 0.4) ){
							$("#h3_co2").css("background-color","#FF0000");
						}else{
							$("#h3_co2").css("background-color","#FFFFFF");
						}						
						
						$("#h3_cp").text((eval(rsAr[0].cp)/1000).toFixed(2));	//CP
					}else{
						$("#h3_hogi").text("HT-"+"QT3");
						
						$("#h3_hogi").css("background-color","#D2D2D2");
						$(".q3_zero").text("");
						
						//3
						if(rsAr[0].t1 != 0){
							$("#h3_t1_spec").text((eval(rsAr[0].t1)-50)+"-"+(eval(rsAr[0].t1)+10));	
						}else{
							$("#h3_t1_spec").text("");
						}
						
						if(rsAr[0].t2 != 0){
							$("#h3_t2_spec").text((eval(rsAr[0].t2)-5)+"-"+(eval(rsAr[0].t2)+5));	
						}else{
							$("#h3_t2_spec").text("");
						}
						
						if(rsAr[0].t3 != 0){
							$("#h3_t3_spec").text((eval(rsAr[0].t3)-5)+"-"+(eval(rsAr[0].t3)+5));	
						}else{
							$("#h3_t3_spec").text("");
						}
						
						if(rsAr[0].t4 != 0){
							$("#h3_t4_spec").text((eval(rsAr[0].t4)-5)+"-"+(eval(rsAr[0].t4)+5));	
						}else{
							$("#h3_t4_spec").text("");
						}
					}	
						
//					$("#monitoring_list tbody").html(listHtml);
					
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

	//4

	function getMonitoringList4(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list4.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr2 = rsJson.rows2;

					
					
						//4호기
						if(rsAr2.length != 0){
							$("#h4_hogi").text("HT-"+rsAr2[0].hogi);
							if(rsAr2[0].t1 != 0){
								$("#h4_t1_spec").text((eval(rsAr2[0].t1)-50)+"-"+(eval(rsAr2[0].t1)+10));	
							}else{
								$("#h4_t1_spec").text("");
							}
							
							if(rsAr2[0].t2 != 0){
								$("#h4_t2_spec").text((eval(rsAr2[0].t2)-5)+"-"+(eval(rsAr2[0].t2)+5));	
							}else{
								$("#h4_t2_spec").text("");
							}
							
							if(rsAr2[0].t3 != 0){
								$("#h4_t3_spec").text((eval(rsAr2[0].t3)-5)+"-"+(eval(rsAr2[0].t3)+5));	
							}else{
								$("#h4_t3_spec").text("");
							}
							
							if(rsAr2[0].t4 != 0){
								$("#h4_t4_spec").text((eval(rsAr2[0].t4)-5)+"-"+(eval(rsAr2[0].t4)+5));	
							}else{
								$("#h4_t4_spec").text("");
							}
//							$("#h4_cp_spec").text(((eval(rsAr2[0].cp)/1000)+0.03).toFixed(2));
//							$("#h4_cp_spec").text("설정±0.03");
						
							if(rsAr2[0].cp != 0){
								$("#h4_cp_spec").text(((eval(rsAr2[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr2[0].cp)/1000)+0.03).toFixed(2));	
							}else{
								$("#h4_cp_spec").text("");
							}	

							$("#h4_q1").text(rsAr2[0].q1);
							
							if((rsAr2[0].q1 < 730) || (rsAr2[0].q1 > 900) ){
								$("#h4_q1").css("background-color","#FF0000");
							}else{
								$("#h4_q1").css("background-color","#FFFFFF");
							}						
							
							$("#h4_q2").text(rsAr2[0].q2);

							if((rsAr2[0].q2 < 825) || (rsAr2[0].q2 > 900) ){
								$("#h4_q2").css("background-color","#FF0000");
							}else{
								$("#h4_q2").css("background-color","#FFFFFF");
							}
							
							$("#h4_q3").text(rsAr2[0].q3);

							if((rsAr2[0].q3 < 871) || (rsAr2[0].q3 > 889) ){
								$("#h4_q3").css("background-color","#FF0000");
							}else{
								$("#h4_q3").css("background-color","#FFFFFF");
							}						
							
							$("#h4_q4").text(rsAr2[0].q4);
							
							if((rsAr2[0].q4 < 871) || (rsAr2[0].q4 > 889) ){
								$("#h4_q4").css("background-color","#FF0000");
							}else{
								$("#h4_q4").css("background-color","#FFFFFF");
							}
							$("#h4_q5").text(rsAr2[0].q5);		//퀜칭
							
							$("#h4_t1").text(rsAr2[0].t1);
							$("#h4_t2").text(rsAr2[0].t2);
							$("#h4_t3").text(rsAr2[0].t3);
							$("#h4_t4").text(rsAr2[0].t4);		//템퍼링
							
							$("#h4_bw").text(rsAr2[0].fw);		//전세정기
							if((rsAr2[0].fw < 60) ){
								$("#h4_bw").css("background-color","#FF0000");
							}else{
								$("#h4_bw").css("background-color","#FFFFFF");
							}
							
							
							$("#h4_mw").text(rsAr2[0].mw);		//중간세정기
							if((rsAr2[0].mw < 50) ){
								$("#h4_mw").css("background-color","#FF0000");
							}else{
								$("#h4_mw").css("background-color","#FFFFFF");
							}
							
							$("#h4_oil").text(rsAr2[0].oil);		//유조
							if((rsAr2[0].oil < 60) || (rsAr2[0].oil > 80) ){
								$("#h4_oil").css("background-color","#FF0000");
							}else{
								$("#h4_oil").css("background-color","#FFFFFF");
							}
							
							$("#h4_heat").text("");	//가열경보				
							
							$("#h4_cold").text("");	//냉각조
							$("#h4_detect").text(rsAr2[0].detect);//변성로
							if((rsAr2[0].detect < 1030) || (rsAr2[0].detect > 1100) ){
								$("#h4_detect").css("background-color","#FF0000");
							}else{
								$("#h4_detect").css("background-color","#FFFFFF");
							}						
							
							$("#h4_co").text("");				//CO
							$("#h4_co2").text((eval(rsAr2[0].co2)).toFixed(3));		//CO2
							if((rsAr2[0].co2 < 0.3) || (rsAr2[0].co2 > 0.4) ){
								$("#h4_co2").css("background-color","#FF0000");
							}else{
								$("#h4_co2").css("background-color","#FFFFFF");
							}						
							
							$("#h4_cp").text((eval(rsAr2[0].cp)/1000).toFixed(2));	//CP
						}else{
							$("#h4_hogi").text("HT-"+"QT4");
							
							$("#h4_hogi").css("background-color","#D2D2D2");
							$(".q4_zero").text("");
							
							if(rsAr2[0].t1 != 0){
								$("#h4_t1_spec").text((eval(rsAr2[0].t1)-50)+"-"+(eval(rsAr2[0].t1)+10));	
							}else{
								$("#h4_t1_spec").text("");
							}
							
							if(rsAr2[0].t2 != 0){
								$("#h4_t2_spec").text((eval(rsAr2[0].t2)-5)+"-"+(eval(rsAr2[0].t2)+5));	
							}else{
								$("#h4_t2_spec").text("");
							}
							
							if(rsAr2[0].t3 != 0){
								$("#h4_t3_spec").text((eval(rsAr2[0].t3)-5)+"-"+(eval(rsAr2[0].t3)+5));	
							}else{
								$("#h4_t3_spec").text("");
							}
							
							if(rsAr2[0].t4 != 0){
								$("#h4_t4_spec").text((eval(rsAr2[0].t4)-5)+"-"+(eval(rsAr2[0].t4)+5));	
							}else{
								$("#h4_t4_spec").text("");
							}							
							
						}	
//					$("#monitoring_list tbody").html(listHtml);
					
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
	
	//5
	
	function getMonitoringList5(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list5.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr3 = rsJson.rows3;
						console.log(rsAr3.length);
						
						if(rsAr3.length != 0){
							//5호기
							
								$("#h5_hogi").text("HT-"+rsAr3[0].hogi);
								if(rsAr3[0].t1 != 0){
									$("#h5_t1_spec").text((eval(rsAr3[0].t1)-50)+"-"+(eval(rsAr3[0].t1)+10));	
								}else{
									$("#h5_t1_spec").text("");
								}
								
								if(rsAr3[0].t2 != 0){
									$("#h5_t2_spec").text((eval(rsAr3[0].t2)-5)+"-"+(eval(rsAr3[0].t2)+5));	
								}else{
									$("#h5_t2_spec").text("");
								}
								
								if(rsAr3[0].t3 != 0){
									$("#h5_t3_spec").text((eval(rsAr3[0].t3)-5)+"-"+(eval(rsAr3[0].t3)+5));	
								}else{
									$("#h5_t3_spec").text("");
								}
								
								if(rsAr3[0].t4 != 0){
									$("#h5_t4_spec").text((eval(rsAr3[0].t4)-5)+"-"+(eval(rsAr3[0].t4)+5));	
								}else{
									$("#h5_t4_spec").text("");
								}
//								$("#h5_cp_spec").text(((eval(rsAr3[0].cp)/1000)+0.03).toFixed(2));
//								$("#h5_cp_spec").text("설정±0.03");
	
								if(rsAr3[0].cp != 0){
									$("#h5_cp_spec").text(((eval(rsAr3[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr3[0].cp)/1000)+0.03).toFixed(2));	
								}else{
									$("#h5_cp_spec").text("");
								}	


								$("#h5_q1").text(rsAr3[0].q1);
								
								if((rsAr3[0].q1 < 730) || (rsAr3[0].q1 > 900) ){
									$("#h5_q1").css("background-color","#FF0000");
								}else{
									$("#h5_q1").css("background-color","#FFFFFF");
								}						
								
								$("#h5_q2").text(rsAr3[0].q2);

								if((rsAr3[0].q2 < 825) || (rsAr3[0].q2 > 900) ){
									$("#h5_q2").css("background-color","#FF0000");
								}else{
									$("#h5_q2").css("background-color","#FFFFFF");
								}
								
								$("#h5_q3").text(rsAr3[0].q3);

								if((rsAr3[0].q3 < 871) || (rsAr3[0].q3 > 889) ){
									$("#h5_q3").css("background-color","#FF0000");
								}else{
									$("#h5_q3").css("background-color","#FFFFFF");
								}						
								
								$("#h5_q4").text(rsAr3[0].q4);
								
								if((rsAr3[0].q4 < 871) || (rsAr3[0].q4 > 889) ){
									$("#h5_q4").css("background-color","#FF0000");
								}else{
									$("#h5_q4").css("background-color","#FFFFFF");
								}
								$("#h5_q5").text(rsAr3[0].q5);		//퀜칭
								
								$("#h5_t1").text(rsAr3[0].t1);
								$("#h5_t2").text(rsAr3[0].t2);
								$("#h5_t3").text(rsAr3[0].t3);
								$("#h5_t4").text(rsAr3[0].t4);		//템퍼링
								
								$("#h5_bw").text(rsAr3[0].fw);		//전세정기
								if((rsAr3[0].fw < 60) ){
									$("#h5_bw").css("background-color","#FF0000");
								}else{
									$("#h5_bw").css("background-color","#FFFFFF");
								}
								
								
								$("#h5_mw").text(rsAr3[0].mw);		//중간세정기
								if((rsAr3[0].mw < 50) ){
									$("#h5_mw").css("background-color","#FF0000");
								}else{
									$("#h5_mw").css("background-color","#FFFFFF");
								}
								
								$("#h5_oil").text(rsAr3[0].oil);		//유조
								if((rsAr3[0].oil < 60) || (rsAr3[0].oil > 80) ){
									$("#h5_oil").css("background-color","#FF0000");
								}else{
									$("#h5_oil").css("background-color","#FFFFFF");
								}
								
								
								
								$("#h5_heat").text('');	//가열경보				
								
								$("#h5_cold").text("");	//냉각조
								$("#h5_detect").text(rsAr3[0].detect);//변성로
								if((rsAr3[0].detect < 1030) || (rsAr3[0].detect > 1100) ){
									$("#h5_detect").css("background-color","#FF0000");
								}else{
									$("#h5_detect").css("background-color","#FFFFFF");
								}						
								
								$("#h5_co").text("");				//CO
								$("#h5_co2").text((eval(rsAr3[0].co2)).toFixed(3));		//CO2
								if((rsAr3[0].co2 < 0.3) || (rsAr3[0].co2 > 0.4) ){
									$("#h5_co2").css("background-color","#FF0000");
								}else{
									$("#h5_co2").css("background-color","#FFFFFF");
								}						
								
								$("#h5_cp").text((eval(rsAr3[0].cp)/1000).toFixed(2));	//CP
						}else{
							$("#h5_hogi").text("HT-"+"QT5");
							$("#h5_hogi").css("background-color","#D2D2D2");
							$(".q5_zero").text("");
							
							
							if(rsAr3[0].t1 != 0){
								$("#h5_t1_spec").text((eval(rsAr3[0].t1)-50)+"-"+(eval(rsAr3[0].t1)+10));	
							}else{
								$("#h5_t1_spec").text("");
							}
							
							if(rsAr3[0].t2 != 0){
								$("#h5_t2_spec").text((eval(rsAr3[0].t2)-5)+"-"+(eval(rsAr3[0].t2)+5));	
							}else{
								$("#h5_t2_spec").text("");
							}
							
							if(rsAr3[0].t3 != 0){
								$("#h5_t3_spec").text((eval(rsAr3[0].t3)-5)+"-"+(eval(rsAr3[0].t3)+5));	
							}else{
								$("#h5_t3_spec").text("");
							}
							
							if(rsAr3[0].t4 != 0){
								$("#h5_t4_spec").text((eval(rsAr3[0].t4)-5)+"-"+(eval(rsAr3[0].t4)+5));	
							}else{
								$("#h5_t4_spec").text("");
							}
							
							
						}
							
//					$("#monitoring_list tbody").html(listHtml);
					
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

	
	//6

	function getMonitoringList6(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list6.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr4 = rsJson.rows4;

					
						if(rsAr4.length != 0){
							//6호기
								$("#h6_hogi").text("HT-"+rsAr4[0].hogi);
								if(rsAr4[0].t1 != 0){
									$("#h6_t1_spec").text((eval(rsAr4[0].t1)-50)+"-"+(eval(rsAr4[0].t1)+10));	
								}else{
									$("#h6_t1_spec").text("");
								}
								
								if(rsAr4[0].t2 != 0){
									$("#h6_t2_spec").text((eval(rsAr4[0].t2)-5)+"-"+(eval(rsAr4[0].t2)+5));	
								}else{
									$("#h6_t2_spec").text("");
								}
								
								if(rsAr4[0].t3 != 0){
									$("#h6_t3_spec").text((eval(rsAr4[0].t3)-5)+"-"+(eval(rsAr4[0].t3)+5));	
								}else{
									$("#h6_t3_spec").text("");
								}
								
								if(rsAr4[0].t4 != 0){
									$("#h6_t4_spec").text((eval(rsAr4[0].t4)-5)+"-"+(eval(rsAr4[0].t4)+5));	
								}else{
									$("#h6_t4_spec").text("");
								}
//								$("#h6_cp_spec").text(((eval(rsAr4[0].cp)/1000)+0.03).toFixed(2));
//								$("#h6_cp_spec").text("설정±0.03");
	
								if(rsAr4[0].cp != 0){
									$("#h6_cp_spec").text(((eval(rsAr4[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr4[0].cp)/1000)+0.03).toFixed(2));	
								}else{
									$("#h6_cp_spec").text("");
								}	


								$("#h6_q1").text(rsAr4[0].q1);
								
								if((rsAr4[0].q1 < 740) || (rsAr4[0].q1 > 910) ){
									$("#h6_q1").css("background-color","#FF0000");
								}else{
									$("#h6_q1").css("background-color","#FFFFFF");
								}						
								
								$("#h6_q2").text(rsAr4[0].q2);

								if((rsAr4[0].q2 < 835) || (rsAr4[0].q2 > 910) ){
									$("#h6_q2").css("background-color","#FF0000");
								}else{
									$("#h6_q2").css("background-color","#FFFFFF");
								}
								
								$("#h6_q3").text(rsAr4[0].q3);

								if((rsAr4[0].q3 < 881) || (rsAr4[0].q3 > 889) ){
									$("#h6_q3").css("background-color","#FF0000");
								}else{
									$("#h6_q3").css("background-color","#FFFFFF");
								}						
								
								$("#h6_q4").text(rsAr4[0].q4);
								
								if((rsAr4[0].q4 < 881) || (rsAr4[0].q4 > 889) ){
									$("#h6_q4").css("background-color","#FF0000");
								}else{
									$("#h6_q4").css("background-color","#FFFFFF");
								}
								$("#h6_q5").text(rsAr4[0].q5);		//퀜칭
								
								$("#h6_t1").text(rsAr4[0].t1);
								$("#h6_t2").text(rsAr4[0].t2);
								$("#h6_t3").text(rsAr4[0].t3);
								$("#h6_t4").text(rsAr4[0].t4);		//템퍼링
								
								$("#h6_bw").text(rsAr4[0].fw);		//전세정기
								if((rsAr4[0].fw < 60) ){
									$("#h6_bw").css("background-color","#FF0000");
								}else{
									$("#h6_bw").css("background-color","#FFFFFF");
								}
								
								
								$("#h6_mw").text(rsAr4[0].mw);		//중간세정기
								if((rsAr4[0].mw < 50) ){
									$("#h6_mw").css("background-color","#FF0000");
								}else{
									$("#h6_mw").css("background-color","#FFFFFF");
								}
								
								$("#h6_oil").text(rsAr4[0].oil);		//유조
								if((rsAr4[0].oil < 60) || (rsAr4[0].oil > 80) ){
									$("#h6_oil").css("background-color","#FF0000");
								}else{
									$("#h6_oil").css("background-color","#FFFFFF");
								}
								
								$("#h6_heat").text('');	//가열경보				
								
								$("#h6_cold").text(rsAr4[0].cold);	//냉각조
								$("#h6_detect").text(rsAr4[0].detect);//변성로
								if((rsAr4[0].detect < 1030) || (rsAr4[0].detect > 1100) ){
									$("#h6_detect").css("background-color","#FF0000");
								}else{
									$("#h6_detect").css("background-color","#FFFFFF");
								}						
								
								$("#h6_co").text("");				//CO
								$("#h6_co2").text((eval(rsAr4[0].co2)).toFixed(3));		//CO2
								if((rsAr4[0].co2 < 0.3) || (rsAr4[0].co2 > 0.4) ){
									$("#h6_co2").css("background-color","#FF0000");
								}else{
									$("#h6_co2").css("background-color","#FFFFFF");
								}						
								
								$("#h6_cp").text((eval(rsAr4[0].cp)/1000).toFixed(2));	//CP
						}else{
							$("#h6_hogi").text("HT-"+"QT6");
							$("#h6_hogi").css("background-color","#D2D2D2");
							$(".q6_zero").text("");
							
							
							if(rsAr4[0].t1 != 0){
								$("#h6_t1_spec").text((eval(rsAr4[0].t1)-50)+"-"+(eval(rsAr4[0].t1)+10));	
							}else{
								$("#h6_t1_spec").text("");
							}
							
							if(rsAr4[0].t2 != 0){
								$("#h6_t2_spec").text((eval(rsAr4[0].t2)-5)+"-"+(eval(rsAr4[0].t2)+5));	
							}else{
								$("#h6_t2_spec").text("");
							}
							
							if(rsAr4[0].t3 != 0){
								$("#h6_t3_spec").text((eval(rsAr4[0].t3)-5)+"-"+(eval(rsAr4[0].t3)+5));	
							}else{
								$("#h6_t3_spec").text("");
							}
							
							if(rsAr4[0].t4 != 0){
								$("#h6_t4_spec").text((eval(rsAr4[0].t4)-5)+"-"+(eval(rsAr4[0].t4)+5));	
							}else{
								$("#h6_t4_spec").text("");
							}
						}
							
//					$("#monitoring_list tbody").html(listHtml);
					
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
	
	//7

	function getMonitoringList7(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list7.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr5 = rsJson.rows5;
					
						if(rsAr5.length != 0){
							//7호기
								$("#h7_hogi").text("HT-"+rsAr5[0].hogi);
								if(rsAr5[0].t1 != 0){
									$("#h7_t1_spec").text((eval(rsAr5[0].t1)-50)+"-"+(eval(rsAr5[0].t1)+10));	
								}else{
									$("#h7_t1_spec").text("");
								}
								
								if(rsAr5[0].t2 != 0){
									$("#h7_t2_spec").text((eval(rsAr5[0].t2)-5)+"-"+(eval(rsAr5[0].t2)+5));	
								}else{
									$("#h7_t2_spec").text("");
								}
								
								if(rsAr5[0].t3 != 0){
									$("#h7_t3_spec").text((eval(rsAr5[0].t3)-5)+"-"+(eval(rsAr5[0].t3)+5));	
								}else{
									$("#h7_t3_spec").text("");
								}
								
								if(rsAr5[0].t4 != 0){
									$("#h7_t4_spec").text((eval(rsAr5[0].t4)-5)+"-"+(eval(rsAr5[0].t4)+5));	
								}else{
									$("#h7_t4_spec").text("");
								}
//								$("#h7_cp_spec").text(((eval(rsAr5[0].cp)/1000)+0.03).toFixed(2));
//								$("#h7_cp_spec").text("설정±0.03");
								
								if(rsAr5[0].cp != 0){
									$("#h7_cp_spec").text(((eval(rsAr5[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr5[0].cp)/1000)+0.03).toFixed(2));	
								}else{
									$("#h7_cp_spec").text("");
								}	


								$("#h7_q1").text(rsAr5[0].q1);
								
								if((rsAr5[0].q1 < 730) || (rsAr5[0].q1 > 900) ){
									$("#h7_q1").css("background-color","#FF0000");
								}else{
									$("#h7_q1").css("background-color","#FFFFFF");
								}						
								
								$("#h7_q2").text(rsAr5[0].q2);

								if((rsAr5[0].q2 < 825) || (rsAr5[0].q2 > 900) ){
									$("#h7_q2").css("background-color","#FF0000");
								}else{
									$("#h7_q2").css("background-color","#FFFFFF");
								}
								
								$("#h7_q3").text(rsAr5[0].q3);

								if((rsAr5[0].q3 < 871) || (rsAr5[0].q3 > 889) ){
									$("#h7_q3").css("background-color","#FF0000");
								}else{
									$("#h7_q3").css("background-color","#FFFFFF");
								}						
								
								$("#h7_q4").text(rsAr5[0].q4);
								
								if((rsAr5[0].q4 < 871) || (rsAr5[0].q4 > 889) ){
									$("#h7_q4").css("background-color","#FF0000");
								}else{
									$("#h7_q4").css("background-color","#FFFFFF");
								}
								$("#h7_q5").text("");		//퀜칭
								
								$("#h7_t1").text(rsAr5[0].t1);
								$("#h7_t2").text(rsAr5[0].t2);
								$("#h7_t3").text(rsAr5[0].t3);
								$("#h7_t4").text(rsAr5[0].t4);		//템퍼링
								
								$("#h7_bw").text(rsAr5[0].fw);		//전세정기
								if((rsAr5[0].fw < 60) ){
									$("#h7_bw").css("background-color","#FF0000");
								}else{
									$("#h7_bw").css("background-color","#FFFFFF");
								}
								
								
								$("#h7_mw").text(rsAr5[0].mw);		//중간세정기
								if((rsAr5[0].mw < 50) ){
									$("#h7_mw").css("background-color","#FF0000");
								}else{
									$("#h7_mw").css("background-color","#FFFFFF");
								}
								
								$("#h7_oil").text(rsAr5[0].oil);		//유조
								if((rsAr5[0].oil < 60) || (rsAr5[0].oil > 80) ){
									$("#h7_oil").css("background-color","#FF0000");
								}else{
									$("#h7_oil").css("background-color","#FFFFFF");
								}
								
								$("#h7_heat").text('');	//가열경보				
								
								$("#h7_cold").text(rsAr5[0].cold);	//냉각조
								$("#h7_detect").text(rsAr5[0].detect);//변성로
								if((rsAr5[0].detect < 1030) || (rsAr5[0].detect > 1100) ){
									$("#h7_detect").css("background-color","#FF0000");
								}else{
									$("#h7_detect").css("background-color","#FFFFFF");
								}						
								
								$("#h7_co").text("");				//CO
								$("#h7_co2").text((eval(rsAr5[0].co2)).toFixed(3));		//CO2
								if((rsAr5[0].co2 < 0.3) || (rsAr5[0].co2 > 0.4) ){
									$("#h7_co2").css("background-color","#FF0000");
								}else{
									$("#h7_co2").css("background-color","#FFFFFF");
								}						
								
								$("#h7_cp").text((eval(rsAr5[0].cp)/1000).toFixed(2));	//CP
						}else{
							$("#h7_hogi").text("HT-"+"QT7");
							$("#h7_hogi").css("background-color","#D2D2D2");
							$(".q7_zero").text("");
							
							
							if(rsAr5[0].t1 != 0){
								$("#h7_t1_spec").text((eval(rsAr5[0].t1)-50)+"-"+(eval(rsAr5[0].t1)+10));	
							}else{
								$("#h7_t1_spec").text("");
							}
							
							if(rsAr5[0].t2 != 0){
								$("#h7_t2_spec").text((eval(rsAr5[0].t2)-5)+"-"+(eval(rsAr5[0].t2)+5));	
							}else{
								$("#h7_t2_spec").text("");
							}
							
							if(rsAr5[0].t3 != 0){
								$("#h7_t3_spec").text((eval(rsAr5[0].t3)-5)+"-"+(eval(rsAr5[0].t3)+5));	
							}else{
								$("#h7_t3_spec").text("");
							}
							
							if(rsAr5[0].t4 != 0){
								$("#h7_t4_spec").text((eval(rsAr5[0].t4)-5)+"-"+(eval(rsAr5[0].t4)+5));	
							}else{
								$("#h7_t4_spec").text("");
							}
						}
						
						
//					$("#monitoring_list tbody").html(listHtml);
					
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
	
	//8

	function getMonitoringList8(){
//		console.log("t");
		
		$.ajax({
			type : "POST",
			url : "l002001_list8.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr6 = rsJson.rows6;

					
						
						
						if(rsAr6.length != 0){
							//8호기
								$("#h8_hogi").text("HT-"+rsAr6[0].hogi);
								if(rsAr6[0].t1 != 0){
									$("#h8_t1_spec").text((eval(rsAr6[0].t1)-50)+"-"+(eval(rsAr6[0].t1)+10));	
								}else{
									$("#h8_t1_spec").text("");
								}
								
								if(rsAr6[0].t2 != 0){
									$("#h8_t2_spec").text((eval(rsAr6[0].t2)-5)+"-"+(eval(rsAr6[0].t2)+5));	
								}else{
									$("#h8_t2_spec").text("");
								}
								
								if(rsAr6[0].t3 != 0){
									$("#h8_t3_spec").text((eval(rsAr6[0].t3)-5)+"-"+(eval(rsAr6[0].t3)+5));	
								}else{
									$("#h8_t3_spec").text("");
								}
								
								if(rsAr6[0].t4 != 0){
									$("#h8_t4_spec").text((eval(rsAr6[0].t4)-5)+"-"+(eval(rsAr6[0].t4)+5));	
								}else{
									$("#h8_t4_spec").text("");
								}
								
								
								
//								$("#h8_cp_spec").text(((eval(rsAr6[0].cp)/1000)+0.03).toFixed(2));
//								$("#h8_cp_spec").text("설정±0.03");
								if(rsAr6[0].cp != 0){
									$("#h8_cp_spec").text(((eval(rsAr6[0].cp)/1000)-0.03).toFixed(2)+"-"+((eval(rsAr6[0].cp)/1000)+0.03).toFixed(2));	
								}else{
									$("#h8_cp_spec").text("");
								}	
								

								$("#h8_q1").text(rsAr6[0].q1);
								
								if((rsAr6[0].q1 < 740) || (rsAr6[0].q1 > 910) ){
									$("#h8_q1").css("background-color","#FF0000");
								}else{
									$("#h8_q1").css("background-color","#FFFFFF");
								}						
								
								$("#h8_q2").text(rsAr6[0].q2);

								if((rsAr6[0].q2 < 835) || (rsAr6[0].q2 > 910) ){
									$("#h8_q2").css("background-color","#FF0000");
								}else{
									$("#h8_q2").css("background-color","#FFFFFF");
								}
								
								$("#h8_q3").text(rsAr6[0].q3);

								if((rsAr6[0].q3 < 881) || (rsAr6[0].q3 > 889) ){
									$("#h8_q3").css("background-color","#FF0000");
								}else{
									$("#h8_q3").css("background-color","#FFFFFF");
								}						
								
								$("#h8_q4").text(rsAr6[0].q4);
								
								if((rsAr6[0].q4 < 881) || (rsAr6[0].q4 > 889) ){
									$("#h8_q4").css("background-color","#FF0000");
								}else{
									$("#h8_q4").css("background-color","#FFFFFF");
								}
								
								
								$("#h8_q5").text("");		//퀜칭
								
								$("#h8_t1").text(rsAr6[0].t1);
								$("#h8_t2").text(rsAr6[0].t2);
								$("#h8_t3").text(rsAr6[0].t3);
								$("#h8_t4").text(rsAr6[0].t4);		//템퍼링
								
								$("#h8_bw").text(rsAr6[0].fw);		//전세정기
								if((rsAr6[0].fw < 60) ){
									$("#h8_bw").css("background-color","#FF0000");
								}else{
									$("#h8_bw").css("background-color","#FFFFFF");
								}
								
								
								$("#h8_mw").text(rsAr6[0].mw);		//중간세정기
								if((rsAr6[0].mw < 50) ){
									$("#h8_mw").css("background-color","#FF0000");
								}else{
									$("#h8_mw").css("background-color","#FFFFFF");
								}
								
								$("#h8_oil").text(rsAr6[0].oil);		//유조
								if((rsAr6[0].oil < 60) || (rsAr6[0].oil > 80) ){
									$("#h8_oil").css("background-color","#FF0000");
								}else{
									$("#h8_oil").css("background-color","#FFFFFF");
								}
								
								$("#h8_heat").text('');	//가열경보				
								
								$("#h8_cold").text(rsAr6[0].cold);	//냉각조
								$("#h8_detect").text(rsAr6[0].detect);//변성로
								if((rsAr6[0].detect < 1030) || (rsAr6[0].detect > 1100) ){
									$("#h8_detect").css("background-color","#FF0000");
								}else{
									$("#h8_detect").css("background-color","#FFFFFF");
								}						
								
								$("#h8_co").text("");				//CO
								$("#h8_co2").text((eval(rsAr6[0].co2)).toFixed(3));		//CO2
								if((rsAr6[0].co2 < 0.3) || (rsAr6[0].co2 > 0.4) ){
									$("#h8_co2").css("background-color","#FF0000");
								}else{
									$("#h8_co2").css("background-color","#FFFFFF");
								}						
								
								$("#h8_cp").text((eval(rsAr6[0].cp)/1000).toFixed(2));	//CP
						}else{
							$("#h8_hogi").text("HT-"+"QT8");
							$("#h8_hogi").css("background-color","#D2D2D2");
							$(".q8_zero").text("");
							
							
							if(rsAr6[0].t1 != 0){
								$("#h8_t1_spec").text((eval(rsAr6[0].t1)-50)+"-"+(eval(rsAr6[0].t1)+10));	
							}else{
								$("#h8_t1_spec").text("");
							}
							
							if(rsAr6[0].t2 != 0){
								$("#h8_t2_spec").text((eval(rsAr6[0].t2)-5)+"-"+(eval(rsAr6[0].t2)+5));	
							}else{
								$("#h8_t2_spec").text("");
							}
							
							if(rsAr6[0].t3 != 0){
								$("#h8_t3_spec").text((eval(rsAr6[0].t3)-5)+"-"+(eval(rsAr6[0].t3)+5));	
							}else{
								$("#h8_t3_spec").text("");
							}
							
							if(rsAr6[0].t4 != 0){
								$("#h8_t4_spec").text((eval(rsAr6[0].t4)-5)+"-"+(eval(rsAr6[0].t4)+5));	
							}else{
								$("#h8_t4_spec").text("");
							}
						}	
//					$("#monitoring_list tbody").html(listHtml);
					
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
	
	
	
	/*
	
	*/

	function data_load3(){
		$.ajax({
			type : "POST",
			url : "l002001_chart3.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData3 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x3 = i;
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

	function data_load4(){
		$.ajax({
			type : "POST",
			url : "l002001_chart4.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData4 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x4 = i;
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
	
	function data_load5(){
		$.ajax({
			type : "POST",
			url : "l002001_chart5.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData5 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x5 = i;
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
	
	
	function data_load6(){
		$.ajax({
			type : "POST",
			url : "l002001_chart6.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData6 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x6 = i;
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
	
	function data_load7(){
		$.ajax({
			type : "POST",
			url : "l002001_chart7.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData7 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x7 = i;
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
	
	function data_load8(){
		$.ajax({
			type : "POST",
			url : "l002001_chart8.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					jsonData8 = rsAr;
					for(var i=0; i<rsAr.length; i++){
						x8 = i;
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
	
	
	function chart3_generate(){
		chart3= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "3호기",
				position:"center"
			},
		      data: {
		        json: jsonData3,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"3"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"3"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("3");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#993300",
			    	 "detect":"#993300"

			     }			        
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend3",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x3
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip3",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart3"
		    });			
	}

	function chart4_generate(){
		chart4= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "4호기",
				position:"center"
			},
		      data: {
		        json: jsonData4,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"4"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"4"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("4");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "q5":"#993300",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#008000",
			    	 "detect":"#993300"

			     }			        
				
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend4",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x4
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip4",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart4"
		    });			
	}	
	
	function chart5_generate(){
		chart5= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "5호기",
				position:"center"
			},
		      data: {
		        json: jsonData5,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"5"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"5"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("5");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "q5":"#993300",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#008000",
			    	 "detect":"#993300"

			     }			        
				
				
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend5",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x5
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip5",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart5"
		    });			
	}	
	
	

	function chart6_generate(){
		chart6= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "6호기",
				position:"center"
			},
		      data: {
		        json: jsonData6,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"6"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"6"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("6");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "q5":"#993300",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#800080",
			    	 "detect":"#008000"
			     }			        
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend6",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x6
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip6",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart6"
		    });			
	}	

	
	function chart7_generate(){
		chart7= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "7호기",
				position:"center"
			},
		      data: {
		        json: jsonData7,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"7"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"7"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("7");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#FF0000",
			    	 "detect":"#0000FF"
			     }			        
				
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend7",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x6
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip7",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart7"
		    });			
	}
	
	
	function chart8_generate(){
		chart8= bb.generate({
			size:{
				height:630
			},
			title:{
				text: "8호기",
				position:"center"
			},
		      data: {
		        json: jsonData8,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","t1","t2","t3","t4",
						  "oil","cp","co2","detect"
						  
					     ]
		        },
		        onover: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"8"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate);
									$("#n_time").val(rows[i].ttime);
								}
//								console.log(over_index);
							}
						}
					});
				},
				onclick: function(d){
//					console.log(d);
					$.ajax({
						type : "POST",
						url : "l002001_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"rowId":d.index,
								"table":"8"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#cmt_date").val(rows[i].tdate+" "+rows[i].ttime);
									$("#cmt_comment").val(rows[i].cmt);
								}
							}
						}
					});						
					
					
					commentDialog.dialog("open");
					$("#cmt_comment").focus();
					//설비명
					$("#cmt_hogi").val("8");
					$("#cmt_zone").val(d.id);
//					console.log(d);
				},
			     colors:{
			    	 "q1":"#FF0000",
			    	 "q2":"#000000",
			    	 "q3":"#0000FF",
			    	 "q4":"#008000",
			    	 "t1":"#FF0000",
			    	 "t2":"#000000",
			    	 "t3":"#0000FF",
			    	 "t4":"#008000",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#008000",
			    	 "detect":"#800080"
			     }			        
				
				
		      },
		      point :{
		    	  r: 0.03
		      },
		      axis: {
					x: {
				    		label: {
				    			position:"outer-middle"
				    		},
							type: "category",
						    tick: {
						        centered: true,
					            outer: false,
						        tooltip: true,
						        count:12
						      }
					     },
					y: {			    
			            label:{
			            	position:"outer-center"
			            }, 
			            tick:{
			              tooltip: true
			            }
		          }					      
	        	},zoom: {
	            	enabled: {
	                	type: "drag"
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend8",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링4";
	  						}else if(title == "fw"){
	  							t_value = "전세정기";
	  						}else if(title == "mw"){
	  							t_value = "중간세정기";
	  						}else if(title == "oil"){
	  							t_value = "유조";
	  						}else if(title == "cp"){
	  							t_value = "CP";
	  						}else if(title == "co2"){
	  							t_value = "CO₂";
	  						}else if(title == "detect"){
	  							t_value = "변성로";
	  						}
	  						result += "<span style='width:120px;height:35px;display:block;color:white;background-color:" + color + ";padding-top:10px;margin:1px;font-size:14pt;'>"+t_value+"</span>";
	  					return result;
	  			     }
	  			    }
	  			},tooltip: {
				    init: {
					      show: true,
					      x:x8
					    },
					    doNotHide: true,
					      contents: {
					       	bindto: "#tooltip8",
					       	template: '{{' +
					'<span style=width:50px;height:35px;padding-top:10px;margin:1px;font-size:14pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					    
					  },
		      bindto: "#chart8"
		    });			
	}	
	
	
	function chart3_load(){
		chart3.load({
	        json: jsonData3,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}
	
	function chart4_load(){
		chart4.load({
	        json: jsonData4,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}	
	
	function chart5_load(){
		chart5.load({
	        json: jsonData5,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}	
	
	function chart6_load(){
		chart6.load({
	        json: jsonData6,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}	
	
	function chart7_load(){
		chart7.load({
	        json: jsonData7,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}	
	
	function chart8_load(){
		chart8.load({
	        json: jsonData8,
	        keys: {
	        	x:"date1",
	        	y:"q1",
				value: 
					 [
					  "q1","q2","q3","q4","t1","t2","t3","t4",
					  "fw","mw","oil","cp","co2","detect"
				     ]
	        }
		});
	}	
	
	/*
 chart3 = bb.generate({
  title: {
	    text: "QT3"
	  },
	size:{
		height:620
	},
	data: {
	    columns: [
		["퀜칭로1", 850,851,852,853,854,855,856],
		["퀜칭로2", 870,871,872,873,874,875,876],
		["퀜칭로3", 880,881,882,883,884,885,886],
		["퀜칭로4", 880,881,882,883,884,885,886],
		["퀜칭로5", 0,0,0,0,0,0,0],
		["템퍼링로1", 540,541,542,543,544,545,546],
		["템퍼링로2", 560,561,562,563,564,565,566],
		["템퍼링로3", 565,566,567,568,569,570,571],
		["템퍼링로4", 565,566,567,568,569,570,571],
		["전세정기", 65,66,67,68,69,70,71],
		["중간세정기", 55,56,57,58,59,60,61],
		["유조", 70,71,72,73,74,75,76],
		["가열경보", 0,0,0,0,0,0,0],
		["퀜칭과온", 0,0,0,0,0,0,0],
		["냉각조", 0,0,0,0,0,0,0],
		["변성로", 1130,1132,1133,1134,1135,1136,1137],
		["CO₂",0.35,0.36,0.37,0.38,0.39,0.4,0.41],
		["CO",21,21.05,21,21,22,23,21],
		["CP",0.3,0.31,0.32,0.33,0.34,0.35,0.36]
	    ],axes: {
	        "CO₂":"y2",
	        "CO":"y2",
	        "CP": "y2"
	      },types: {
	    	  "CO₂":"spline",
	    	  "CO": "spline",
	    	  "CP": "spline"
	        }	      
	  },
	  point:{
		  pattern:[
		           "circle","circle","circle","circle","circle","circle","circle","circle","circle","circle",
		           "circle","circle","circle","circle","circle","circle",
		           "<g><circle cx='10' cy='10' r='10'></circle><rect x='5' y='5' width='10' height='10' style='fill:#fff'></rect></g>",
		           "<g><circle cx='10' cy='10' r='10'></circle><rect x='5' y='5' width='10' height='10' style='fill:#fff'></rect></g>",
		           "<g><circle cx='10' cy='10' r='10'></circle><rect x='5' y='5' width='10' height='10' style='fill:#fff'></rect></g>"
		         ]
	  }
	  ,legend: {
		    contents: {
			      bindto: "#legend",
			      template: function(title, color) {
					var result = "";
						result += "<span style='width:100px;height:30px;display:block;color:white;background-color:" + color + ";padding:10px;margin:1px;'>"+title+"</span>";
					return result;
			     }
			    }
			},tooltip: {
				    init: {
				      show: true
				    },
				    doNotHide: true,
				      contents: {
				       	bindto: "#tooltip",
				       	template: '{{' +
				'<span style=width:120px;height:30px;padding:10px;margin:1px;font-size:13px;display:block;color:white;background-color:{=COLOR}>{=NAME} : {=VALUE}</span>' +
				       		'}}'
				       }
				  },
				  axis:{
				    y2: {
				      show: true
				    }
				  },
	  bindto: "#chart3"
	});
	*/
/*이벤트*/	

$("#s_hogi").change(function(){
	var h = $("#s_hogi").val();
	$("#n_date").val("");
	$("#n_time").val("");
	
	if(h == "3"){
		if(typeof chart3 == "undefined"){
			data_load3();
			start_interval = setInterval('start_chart()',60000);
			//3호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart3_generate();							
			},400);

		}else{
			//3호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load3();
			setTimeout(function(){
				chart3_load();
			},400);
		}
		
		
		$("#chart3").show(); $("#chart3_right").show();
		$("#chart4").hide(); $("#chart4_right").hide();
		
		$("#chart5").hide(); $("#chart5_right").hide();
		$("#chart6").hide(); $("#chart6_right").hide();
		
		$("#chart7").hide(); $("#chart7_right").hide();
		$("#chart8").hide(); $("#chart8_right").hide();
		
		start_chart();			
		
		start_interval = setInterval('start_chart()',60000);
		clearInterval(start_interval2);
		clearInterval(start_interval3);
		clearInterval(start_interval4);	
		clearInterval(start_interval5);	
		clearInterval(start_interval6);	
			
	}else if(h == "4"){
		if(typeof chart4 == "undefined"){
			data_load4();
			start_interval2 = setInterval('start_chart2()',60000);					
			//4호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart4_generate();							
			},400);

		}else{
			//4호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load4();
			setTimeout(function(){
				chart4_load();
			},400);
		}
		
		
		$("#chart3").hide(); $("#chart3_right").hide();
		$("#chart4").show(); $("#chart4_right").show();
		
		$("#chart5").hide(); $("#chart5_right").hide();
		$("#chart6").hide(); $("#chart6_right").hide();
		
		$("#chart7").hide(); $("#chart7_right").hide();
		$("#chart8").hide(); $("#chart8_right").hide();
		
		start_chart2();			
		
		start_interval2 = setInterval('start_chart2()',60000);
		clearInterval(start_interval);
		clearInterval(start_interval3);
		clearInterval(start_interval4);	
		clearInterval(start_interval5);	
		clearInterval(start_interval6);	
	}else if(h == "5"){
		if(typeof chart5 == "undefined"){
			data_load5();
			start_interval3 = setInterval('start_chart3()',60000);					
			//4호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart5_generate();							
			},400);

		}else{
			//4호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load5();
			setTimeout(function(){
				chart5_load();
			},400);
		}
		
		
		$("#chart3").hide(); $("#chart3_right").hide();
		$("#chart4").hide(); $("#chart4_right").hide();
		
		$("#chart5").show(); $("#chart5_right").show();
		$("#chart6").hide(); $("#chart6_right").hide();
		
		$("#chart7").hide(); $("#chart7_right").hide();
		$("#chart8").hide(); $("#chart8_right").hide();
		
		start_chart3();			
		
		start_interval3 = setInterval('start_chart3()',60000);
		clearInterval(start_interval);
		clearInterval(start_interval2);
		clearInterval(start_interval4);	
		clearInterval(start_interval5);	
		clearInterval(start_interval6);			
	}else if(h == "6"){
		if(typeof chart6 == "undefined"){
			data_load6();
			start_interval4 = setInterval('start_chart4()',60000);					
			//4호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart6_generate();							
			},400);

		}else{
			//4호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load6();
			setTimeout(function(){
				chart6_load();
			},400);
		}
		
		
		$("#chart3").hide(); $("#chart3_right").hide();
		$("#chart4").hide(); $("#chart4_right").hide();
		
		$("#chart5").hide(); $("#chart5_right").hide();
		$("#chart6").show(); $("#chart6_right").show();
		
		$("#chart7").hide(); $("#chart7_right").hide();
		$("#chart8").hide(); $("#chart8_right").hide();
		
		start_chart4();			
		
		start_interval4 = setInterval('start_chart4()',60000);
		clearInterval(start_interval);
		clearInterval(start_interval2);
		clearInterval(start_interval3);	
		clearInterval(start_interval5);	
		clearInterval(start_interval6);		
	}else if(h == "7"){
		if(typeof chart7 == "undefined"){
			data_load7();
			start_interval5 = setInterval('start_chart5()',60000);					
			//4호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart7_generate();							
			},400);

		}else{
			//4호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load7();
			setTimeout(function(){
				chart7_load();
			},400);
		}
		
		
		$("#chart3").hide(); $("#chart3_right").hide();
		$("#chart4").hide(); $("#chart4_right").hide();
		
		$("#chart5").hide(); $("#chart5_right").hide();
		$("#chart6").hide(); $("#chart6_right").hide();
		
		$("#chart7").show(); $("#chart7_right").show();
		$("#chart8").hide(); $("#chart8_right").hide();
		
		start_chart5();			
		
		start_interval5 = setInterval('start_chart5()',60000);
		clearInterval(start_interval);
		clearInterval(start_interval2);
		clearInterval(start_interval3);	
		clearInterval(start_interval4);	
		clearInterval(start_interval6);		
	}else if(h == "8"){
		if(typeof chart8 == "undefined"){
			data_load8();
			start_interval6 = setInterval('start_chart6()',60000);					
			//4호기 차트가 undefined라면 추가
			setTimeout(function(){
				chart8_generate();							
			},400);

		}else{
			//4호기 차트가 undefined가 아니라면 데이터만 갱신
			data_load8();
			setTimeout(function(){
				chart8_load();
			},400);
		}
		
		
		$("#chart3").hide(); $("#chart3_right").hide();
		$("#chart4").hide(); $("#chart4_right").hide();
		
		$("#chart5").hide(); $("#chart5_right").hide();
		$("#chart6").hide(); $("#chart6_right").hide();
		
		$("#chart7").hide(); $("#chart7_right").hide();
		$("#chart8").show(); $("#chart8_right").show();
		
		start_chart6();			
		
		start_interval6 = setInterval('start_chart6()',60000);
		clearInterval(start_interval);
		clearInterval(start_interval2);
		clearInterval(start_interval3);	
		clearInterval(start_interval4);	
		clearInterval(start_interval5);			
	}

	
});

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