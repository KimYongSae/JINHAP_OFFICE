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
    height: 255px;

    overflow-x: hidden;
}

.scrolltbody2 {
    display: block;
    width: 1900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody2 td { border: 1px solid #000; border-top: 0;}



.scrolltbody2 tbody {
    display: block;
    height: 240px;

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
<!-- 퀜칭 -->
		<div id="tdate-form" style="display:none;" title="보정일 등록">
			<form class="form-inline" role="form" id="dateform" name="dateform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						보정일: </label>
					</div>
					
					
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="i_tdate" name="i_tdate" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="보정일"/>
					</div>			
				</form>
					<input type="hidden" id="i_tid" name="i_tid" />
		</div>



		<div id="val-form" style="display:none;" title="보정값 등록">
			<form class="form-inline" role="form" id="valform" name="valform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						보정값: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="i_vval" name="i_vval" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="보정값"/>
					</div>			
				</form>
					<input type="hidden" id="i_vid" name="i_vid" />
		</div>
		
		

		<div id="special-form" style="display:none;" title="특기사항 등록">
			<form class="form-inline" role="form" id="specialform" name="specialform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						특기사항: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="i_sspecial" name="i_sspecial" 
	     					style="width: 280px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="특기사항"/>
					</div>			
				</form>
					<input type="hidden" id="i_sid" name="i_sid" />
		</div>

		<div id="bigo-form" style="display:none;" title="비고 등록">
			<form class="form-inline" role="form" id="bigoform" name="bigoform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						비고: </label>
					</div>
					
					<div class="form-group">
						<textarea class="form-control input-sm" 
						id="i_bbigo" name="i_bbigo" 
	     					style="width: 280px; height: 120px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;
	     					resize:none;" 
	     					placeholder="비고"></textarea>
					</div>			
				</form>
					<input type="hidden" id="i_bid" name="i_bid" />
		</div>

<!-- 템퍼링 -->

		<div id="tdate_t-form" style="display:none;" title="보정일 등록">
			<form class="form-inline" role="form" id="date_tform" name="date_tform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						보정일: </label>
					</div>
					
					
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="i_tdate_t" name="i_tdate_t" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="보정일"/>
					</div>			
				</form>
					<input type="hidden" id="i_tid_t" name="i_tid_t" />
		</div>



		<div id="val_t-form" style="display:none;" title="보정값 등록">
			<form class="form-inline" role="form" id="val_tform" name="val_tform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						보정값: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="i_vval_t" name="i_vval_t" 
	     					style="width: 140px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="보정값"/>
					</div>			
				</form>
					<input type="hidden" id="i_vid_t" name="i_vid_t" />
		</div>
		
		

		<div id="special_t-form" style="display:none;" title="특기사항 등록">
			<form class="form-inline" role="form" id="special_tform" name="special_tform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						특기사항: </label>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control input-sm" 
						id="i_sspecial_t" name="i_sspecial_t" 
	     					style="width: 280px; height: 34px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;" 
	     					placeholder="특기사항"/>
					</div>			
				</form>
					<input type="hidden" id="i_sid_t" name="i_sid_t" />
		</div>

		<div id="bigo_t-form" style="display:none;" title="비고 등록">
			<form class="form-inline" role="form" id="bigo_tform" name="bigo_tform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt;  font-family:headline; font-weight:700; 
							color:#8C8C8C; width: 80px; text-align: right;">
						비고: </label>
					</div>
					
					<div class="form-group">
						<textarea class="form-control input-sm" 
						id="i_bbigo_t" name="i_bbigo_t" 
	     					style="width: 280px; height: 120px; 
	     					font-size: 14pt; font-family :headline; font-weight:700;
	     					resize:none;" 
	     					placeholder="비고"></textarea>
					</div>			
				</form>
					<input type="hidden" id="i_bid_t" name="i_bid_t" />
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
        
<div class="content" style="height:813px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-line-chart"></i></div>
                <h5 style="font-size:14pt; font-family: headline;">조건관리 - 온도 조절계 보정 현황</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 90px; text-align: right;">교체일자 : </label>
					</div>
					
					<!-- 시작일 -->
					<div class="form-group">
						<select class="form-control input-sm" 
							id="s_date" name="s_date" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;
							padding-top:1px; padding-bottom:1px;"
						></select>
					</div>              	

					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 70px; text-align: right;">로 : </label>
					</div>
					
					<div class="form-group">
						<select class="form-control input-sm datepicker" 
						id="s_ro" name="s_ro" 
						style="margin-top:5px; height: 30px; width: 140px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;">
							<option value="q">소입로</option>
							<option value="t">소려로</option>
						</select>
					</div>
															
				</form>
            </header>
            
            
            
            
            
            <div id="collapse4" class="body">
            <div class="row" id="qun">
               <table id="qun_list" cellspacing="0" class="table table-bordered table-responsive scrolltbody">
					<thead>
						<tr>					
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								구분
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 1호기
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 2호기
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 3호기
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 6호기
							</th>																											
						</tr>
						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

						</tr>
					</thead>	
					
									
					<tbody id="qun_contents">
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정일
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q1_b_date');"
							id="q1_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q1_a_tdate');"
							id="q1_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q1_a_bdate');"
							id="q1_a_bdate">
								
							</th>												

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q2_b_date');"
							id="q2_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q2_a_tdate');"
							id="q2_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q2_a_bdate');"
							id="q2_a_bdate">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q3_b_date');"
							id="q3_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q3_a_tdate');"
							id="q3_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q3_a_bdate');"
							id="q3_a_bdate">
								
							</th>						
						
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q6_b_date');"
							id="q6_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q6_a_tdate');"
							id="q6_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q6_a_bdate');"
							id="q6_a_bdate">
								
							</th>						
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#1
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_b1_val');"
							id="q1_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a1_tval');"
							id="q1_a1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a1_bval');"
							id="q1_a1_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_b1_val');"
							id="q2_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a1_tval');"
							id="q2_a1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a1_bval');"
							id="q2_a1_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_b1_val');"
							id="q3_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a1_tval');"
							id="q3_a1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a1_bval');"
							id="q3_a1_bval">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_b1_val');"
							id="q6_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a1_tval');"
							id="q6_a1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a1_bval');"
							id="q6_a1_bval">
								
							</th>

						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#2
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_b2_val');"
							id="q1_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a2_tval');"
							id="q1_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a2_bval');"
							id="q1_a2_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_b2_val');"
							id="q2_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a2_tval');"
							id="q2_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a2_bval');"
							id="q2_a2_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_b2_val');"
							id="q3_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a2_tval');"
							id="q3_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a2_bval');"
							id="q3_a2_bval">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_b2_val');"
							id="q6_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a2_tval');"
							id="q6_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a2_bval');"
							id="q6_a2_bval">
								
							</th>

						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#3
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_b3_val');"
							id="q1_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a3_tval');"
							id="q1_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a3_bval');"
							id="q1_a3_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_b3_val');"
							id="q2_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a3_tval');"
							id="q2_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a3_bval');"
							id="q2_a3_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_b3_val');"
							id="q3_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a3_tval');"
							id="q3_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a3_bval');"
							id="q3_a3_bval">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_b3_val');"
							id="q6_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a3_tval');"
							id="q6_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a3_bval');"
							id="q6_a3_bval">
								
							</th>

						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#4
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_b4_val');"
							id="q1_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a4_tval');"
							id="q1_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a4_bval');"
							id="q1_a4_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_b4_val');"
							id="q2_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a4_tval');"
							id="q2_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a4_bval');"
							id="q2_a4_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_b4_val');"
							id="q3_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a4_tval');"
							id="q3_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a4_bval');"
							id="q3_a4_bval">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_b4_val');"
							id="q6_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a4_tval');"
							id="q6_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a4_bval');"
							id="q6_a4_bval">
								
							</th>
						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#5
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_b5_val');"
							id="q1_b5_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a5_tval');"
							id="q1_a5_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q1_a5_bval');"
							id="q1_a5_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_b5_val');"
							id="q2_b5_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a5_tval');"
							id="q2_a5_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q2_a5_bval');"
							id="q2_a5_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_b5_val');"
							id="q3_b5_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a5_tval');"
							id="q3_a5_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q3_a5_bval');"
							id="q3_a5_bval">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_b5_val');"
							id="q6_b5_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a5_tval');"
							id="q6_a5_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q6_a5_bval');"
							id="q6_a5_bval">
								
							</th>
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 45px; 
							font-size: 15pt; font-family:headline;">
								특기사항
							</th>
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q1_special');"
							id="q1_special">
								
							</th>
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q2_special');"
							id="q2_special">
								
							</th>
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q3_special');"
							id="q3_special">
							</th>														
						
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q6_special');"
							id="q6_special">
								
							</th>						
											
						</tr>
						
					</tbody>					
				</table>     
				
               <table id="qun_list2" cellspacing="0" 
               class="table table-bordered table-responsive scrolltbody">
					<thead>
						<tr>					
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								구분
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 4호기
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 5호기
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<!-- <th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								비고
							</th>	 -->																										
						</tr>
						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								상반기 보정
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								하반기 보정
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							
							<!-- 침탄로 -->
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>

							<!-- <th colspan="3" class="text-center cell" 
							style="background-color:#FFFFFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								비고입력
							</th> -->

						</tr>
					</thead>	
									
					<tbody id="qun_contents2" style= "height: 285px;">
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정일
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q4_b_date');"
							id="q4_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q4_a_tdate');"
							id="q4_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q4_a_bdate');"
							id="q4_a_bdate">
								
							</th>												

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q5_b_date');"
							id="q5_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q5_a_tdate');"
							id="q5_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q5_a_bdate');"
							id="q5_a_bdate">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q9_b_date');"
							id="q9_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q9_a_tdate');"
							id="q9_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('q9_a_bdate');"
							id="q9_a_bdate">
								
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('qc_b_date');"
							id="qc_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('qc_a_tdate');"
							id="qc_a_tdate">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg('qc_a_bdate');"
							id="qc_a_bdate">
								
							</th>	
							
							<!-- <th colspan="3" rowspan="5" class="text-center cell" 
							style="width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="bigo_reg('qbigo');"
							id="qbigo">
								
							</th> -->							
													
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#1-1
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b1-1_val');"
							id="q4_b1-1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a1-1_tval');"
							id="q4_a1-1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a1-1_bval');"
							id="q4_a1-1_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b1-1_val');"
							id="q5_b1-1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a1-1_tval');"
							id="q5_a1-1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a1-1_bval');"
							id="q5_a1-1_bval">
								
							</th>														
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b1-1_val');"
							id="q9_b1-1_val">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a1-1_tval');"
							id="q9_a1-1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a1-1_bval');"
							id="q9_a1-1_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_b1-1_val');"
							id="qc_b1-1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_a1-1_tval');"
							id="qc_a1-1_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_a1-1_bval');"
							id="qc_a1-1_bval">
								
							</th>


						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#1-2
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b1-2_val');"
							id="q4_b1-2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a1-2_tval');"
							id="q4_a1-2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a1-2_bval');"
							id="q4_a1-2_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b1-2_val');"
							id="q5_b1-2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a1-2_tval');"
							id="q5_a1-2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a1-2_bval');"
							id="q5_a1-2_bval">
								
							</th>														
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b1-2_val');"
							id="q9_b1-2_val">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a1-2_tval');"
							id="q9_a1-2_tval">
								
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a1-2_bval');"
							id="q9_a1-2_bval">
								
							</th>														

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_b1-2_val');"
							id="qc_b1-2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_a1-2_tval');"
							id="qc_a1-2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('qc_a1-2_bval');"
							id="qc_a1-2_bval">
								
							</th>


						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#2
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b2_val');"
							id="q4_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a2_tval');"
							id="q4_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a2_bval');"
							id="q4_a2_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b2_val');"
							id="q5_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a2_tval');"
							id="q5_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a2_bval');"
							id="q5_a2_bval">
								
							</th>														
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b2_val');"
							id="q9_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a2_tval');"
							id="q9_a2_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a2_bval');"
							id="q9_a2_bval">
								
							</th>
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								비고
							</th>
																		


						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#3
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b3_val');"
							id="q4_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a3_tval');"
							id="q4_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a3_bval');"
							id="q4_a3_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b3_val');"
							id="q5_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a3_tval');"
							id="q5_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a3_bval');"
							id="q5_a3_bval">
								
							</th>														
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b3_val');"
							id="q9_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a3_tval');"
							id="q9_a3_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a3_bval');"
							id="q9_a3_bval">
								
							</th>
																					
							<th colspan="3" rowspan="5" class="text-center cell" 
							style="width: 420px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="bigo_reg('qbigo');"
							id="qbigo">
								
							</th>
						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#4
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b4_val');"
							id="q4_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a4_tval');"
							id="q4_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a4_bval');"
							id="q4_a4_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b4_val');"
							id="q5_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a4_tval');"
							id="q5_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a4_bval');"
							id="q5_a4_bval">
								
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b4_val');"
							id="q9_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a4_tval');"
							id="q9_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a4_bval');"
							id="q9_a4_bval">
								
							</th>
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#5
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_b4_val');"
							id="q4_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a4_tval');"
							id="q4_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q4_a4_bval');"
							id="q4_a4_bval">
								
							</th>	
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_b4_val');"
							id="q5_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a4_tval');"
							id="q5_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q5_a4_bval');"
							id="q5_a4_bval">
								
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_b4_val');"
							id="q9_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a4_tval');"
							id="q9_a4_tval">
								
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg('q9_a4_bval');"
							id="q9_a4_bval">
								
							</th>
						</tr>		
										
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 45px; 
							font-size: 15pt; font-family:headline;">
								특기사항
							</th>
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q4_special');"
							id="q4_special">
								
							</th>
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q5_special');"
							id="q5_special">
							</th>
							
							<th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg('q9_special');"
							id="q9_special">
								
							</th>														
						
							<!-- <th colspan="3" class="text-center cell" 
							style="width: 140px; height: 45px; 
							font-size: 15pt; font-family:headline;">
							</th>	 -->					
						</tr>
						
					</tbody>					
				</table>				
				       
            </div>
            
            <!-- 템퍼링 -->
            <div class="row" id="tem" style="display:none;">
               <table id="tem_list" cellspacing="0" 
               class="table table-bordered table-responsive scrolltbody2">
					<thead>
						<tr>					
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								구분
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 1호기
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 2호기
							</th>	
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 3호기
							</th>	
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 4호기
							</th>	
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 5호기
							</th>																											
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								열처리 6호기
							</th>						
						</tr>
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정전
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정후
							</th>						
						</tr>						
					</thead>					
					<tbody id="tem_contents">
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								보정일
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t1_b_date');"
							id="t1_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t1_a_tdate');"
							id="t1_a_tdate">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t2_b_date');"
							id="t2_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t2_a_tdate');"
							id="t2_a_tdate">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t3_b_date');"
							id="t3_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t3_a_tdate');"
							id="t3_a_tdate">
							
							</th>														
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t4_b_date');"
							id="t4_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t4_a_tdate');"
							id="t4_a_tdate">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t5_b_date');"
							id="t5_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t5_a_tdate');"
							id="t5_a_tdate">
							
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t6_b_date');"
							id="t6_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t6_a_tdate');"
							id="t6_a_tdate">
							
							</th>
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#1
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_b1_val');"
							id="t1_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_a1_tval');"
							id="t1_a1_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_b1_val');"
							id="t2_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_a1_tval');"
							id="t2_a1_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_b1_val');"
							id="t3_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_a1_tval');"
							id="t3_a1_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_b1_val');"
							id="t4_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_a1_tval');"
							id="t4_a1_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_b1_val');"
							id="t5_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_a1_tval');"
							id="t5_a1_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_b1_val');"
							id="t6_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_a1_tval');"
							id="t6_a1_tval">
							
							</th>
						</tr>						
						

						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#2
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_b2_val');"
							id="t1_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_a2_tval');"
							id="t1_a2_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_b2_val');"
							id="t2_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_a2_tval');"
							id="t2_a2_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_b2_val');"
							id="t3_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_a2_tval');"
							id="t3_a2_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_b2_val');"
							id="t4_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_a2_tval');"
							id="t4_a2_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_b2_val');"
							id="t5_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_a2_tval');"
							id="t5_a2_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_b2_val');"
							id="t6_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_a2_tval');"
							id="t6_a2_tval">
							
							</th>
						</tr>


						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#3
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_b3_val');"
							id="t1_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_a3_tval');"
							id="t1_a3_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_b3_val');"
							id="t2_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_a3_tval');"
							id="t2_a3_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_b3_val');"
							id="t3_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_a3_tval');"
							id="t3_a3_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_b3_val');"
							id="t4_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_a3_tval');"
							id="t4_a3_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_b3_val');"
							id="t5_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_a3_tval');"
							id="t5_a3_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_b3_val');"
							id="t6_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_a3_tval');"
							id="t6_a3_tval">
							
							</th>
						</tr>


						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								#4
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_b4_val');"
							id="t1_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t1_a4_tval');"
							id="t1_a4_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_b4_val');"
							id="t2_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t2_a4_tval');"
							id="t2_a4_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_b4_val');"
							id="t3_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t3_a4_tval');"
							id="t3_a4_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_b4_val');"
							id="t4_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t4_a4_tval');"
							id="t4_a4_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_b4_val');"
							id="t5_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t5_a4_tval');"
							id="t5_a4_tval">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_b4_val');"
							id="t6_b4_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t6_a4_tval');"
							id="t6_a4_tval">
							
							</th>
						</tr>

						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 60px; 
							font-size: 15pt; font-family:headline;">
								특기사항
							</th>
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t1_special');"
							id="t1_special">
								
							</th>
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t2_special');"
							id="t2_special">
							</th>
							
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t3_special');"
							id="t3_special">
								
							</th>														
						
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t4_special');"
							id="t4_special">
								
							</th>						

							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t5_special');"
							id="t5_special">
								
							</th>

							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t6_special');"
							id="t6_special">
								
							</th>
						</tr>
					</tbody>
				</table>             	
            
            
            
               <table id="tem_list2" cellspacing="0" 
               	class="table table-bordered table-responsive scrolltbody2">
					<thead>
						<tr>	
							<th rowspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								구분
							</th>
							
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>						
										
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th colspan="2" class="text-center cell" 
							style="background-color:#24FCFF; width: 280px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th colspan="6" class="text-center cell" 
							style="background-color:#24FCFF; width: 1120px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								비고
							</th>
						</tr>
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>						
						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							 <th colspan="4" class="text-center cell" 
							style="background-color:#FFFFFF; width: 1120px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								비고입력
							</th> 
						</tr>						
					</thead>
					<tbody id="tem_contents2">
						<tr>
						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t9_b_date');"
							id="t9_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('t9_a_tdate');"
							id="t9_a_tdate">
							
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('tp_b_date');"
							id="tp_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('tp_a_tdate');"
							id="tp_a_tdate">
							
							</th>

							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('tc_b_date');"
							id="tc_b_date">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="date_reg_t('tc_a_tdate');"
							id="tc_a_tdate">
							
							</th>
							
							<th colspan="6" rowspan="5" class="text-center cell" 
							style="width: 1120px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="bigo_reg_t('tbigo');"
							id="tbigo">
								
								
							</th>							
							
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
							
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_b1_val');"
							id="t9_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_a1_tval');"
							id="t9_a1_tval">
							
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_b1_val');"
							id="tp_b1_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_a1_tval');"
							id="tp_a1_tval">
							
							</th>						

							<th rowspan="4" class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tc_b1_val');"
							id="tc_b1_val">
								
							</th>
							<th rowspan="4" class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tc_a1_tval');"
							id="tc_a1_tval">
							
							</th>						

						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_b2_val');"
							id="t9_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_a2_tval');"
							id="t9_a2_tval">
							
							</th>						
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_b2_val');"
							id="tp_b2_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_a2_tval');"
							id="tp_a2_tval">
							
							</th>						
						</tr>						

						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_b3_val');"
							id="t9_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_a3_tval');"
							id="t9_a3_tval">
							
							</th>						
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_b3_val');"
							id="tp_b3_val">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_a3_tval');"
							id="tp_a3_tval">
							
							</th>						
						</tr>						

						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 30px; 
							font-size: 15pt; font-family:headline;">
								
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_b4_val');"
							id="t9_b4_val">
								
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('t9_a4_tval');"
							id="t9_a4_tval">
							
							</th>						
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_b4_val');"
							id="tp_b4_val">
								
							</th>
							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="val_reg_t('tp_a4_tval');"
							id="tp_a4_tval">
							
							</th>						
						</tr>						
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 60px; 
							font-size: 15pt; font-family:headline;">
								
							</th>

							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('t9_special');"
							id="t9_special">
								
							</th>
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('tp_special');"
							id="tp_special">
								
							</th>
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline; cursor: pointer;"
							onclick="special_reg_t('tc_special');"
							id="tc_special">
							</th>
							
							<th colspan="2" class="text-center cell" 
							style="width: 140px; height: 60px; 
							font-size: 15pt; font-family:headline;">
							</th>							
							
						</tr>

						
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

/*인터벌*/
	
	
/*페이지 로드*/	
	var sid;
	$(function(){
		fn_check();
		var now = new Date();
		
		for(var j=-3; j<2; j++){
			var y_value = now.getFullYear() + j;
			$("#s_date").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
		}
		
		$("#s_date").val(now.getFullYear());
		sid = '<%=session.getAttribute("sid")%>';
		getYearCount();		
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

	var getYearCount = function(){
		//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~9호기 insert
		
		var ro = $("#s_ro").val();
		
		if(ro == "q"){
			$.post("m02/s03/count_m02m03_q.jsp",{
				"tdate":$("#s_date").val()
			},100);
			
			setTimeout(function(){
				getQunList();
			},300);			
		}else{
			$.post("m02/s03/count_m02m03_t.jsp",{
				"tdate":$("#s_date").val()
			},100);
			
			setTimeout(function(){
				getTemperList();
			},300);			
		}
		

	}

function init(){
	
}


var cntArray = new Array();
function getQunList(){
	$.ajax({
		type : "POST",
		url : "m02/s03/select_m02m03_qun.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"tdate":$("#s_date").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				var listHtml = "";
				
				$("#qbigo").text(rsAr[0].qbigo);
				
				
				//3
				$("#q1_b_date").text(rsAr[0].q1_b_date);
				$("#q1_a_tdate").text(rsAr[0].q1_a_tdate);
				$("#q1_a_bdate").text(rsAr[0].q1_a_bdate);
				$("#q1_special").text(rsAr[0].q1_special);

				$("#q1_b1_val").text(rsAr[1].q1_b1_val);
				$("#q1_a1_tval").text(rsAr[1].q1_a1_tval);
				$("#q1_a1_bval").text(rsAr[1].q1_a1_bval);
				$("#q1_b2_val").text(rsAr[2].q1_b2_val);
				$("#q1_a2_tval").text(rsAr[2].q1_a2_tval);
				$("#q1_a2_bval").text(rsAr[2].q1_a2_bval);
				$("#q1_b3_val").text(rsAr[3].q1_b3_val);
				$("#q1_a3_tval").text(rsAr[3].q1_a3_tval);
				$("#q1_a3_bval").text(rsAr[3].q1_a3_bval);
				$("#q1_b4_val").text(rsAr[4].q1_b4_val);
				$("#q1_a4_tval").text(rsAr[4].q1_a4_tval);
				$("#q1_a4_bval").text(rsAr[4].q1_a4_bval);
				$("#q1_b5_val").text(rsAr[5].q1_b5_val);
				$("#q1_a5_tval").text(rsAr[5].q1_a5_tval);
				$("#q1_a5_bval").text(rsAr[5].q1_a5_bval);
				
				//4
				$("#q2_b_date").text(rsAr[6].q2_b_date);
				$("#q2_a_tdate").text(rsAr[6].q2_a_tdate);
				$("#q2_a_bdate").text(rsAr[6].q2_a_bdate);
				$("#q2_special").text(rsAr[6].q2_special);

				$("#q2_b1_val").text(rsAr[7].q2_b1_val);
				$("#q2_a1_tval").text(rsAr[7].q2_a1_tval);
				$("#q2_a1_bval").text(rsAr[7].q2_a1_bval);
				$("#q2_b2_val").text(rsAr[8].q2_b2_val);
				$("#q2_a2_tval").text(rsAr[8].q2_a2_tval);
				$("#q2_a2_bval").text(rsAr[8].q2_a2_bval);
				$("#q2_b3_val").text(rsAr[9].q2_b3_val);
				$("#q2_a3_tval").text(rsAr[9].q2_a3_tval);
				$("#q2_a3_bval").text(rsAr[9].q2_a3_bval);
				$("#q2_b4_val").text(rsAr[10].q2_b4_val);
				$("#q2_a4_tval").text(rsAr[10].q2_a4_tval);
				$("#q2_a4_bval").text(rsAr[10].q2_a4_bval);
				$("#q2_b5_val").text(rsAr[11].q2_b5_val);
				$("#q2_a5_tval").text(rsAr[11].q2_a5_tval);
				$("#q2_a5_bval").text(rsAr[11].q2_a5_bval);
				
				
				
				//5
				$("#q3_b_date").text(rsAr[12].q3_b_date);
				$("#q3_a_tdate").text(rsAr[12].q3_a_tdate);
				$("#q3_a_bdate").text(rsAr[12].q3_a_bdate);
				$("#q3_special").text(rsAr[12].q3_special);

				$("#q3_b1_val").text(rsAr[13].q3_b1_val);
				$("#q3_a1_tval").text(rsAr[13].q3_a1_tval);
				$("#q3_a1_bval").text(rsAr[13].q3_a1_bval);
				$("#q3_b2_val").text(rsAr[14].q3_b2_val);
				$("#q3_a2_tval").text(rsAr[14].q3_a2_tval);
				$("#q3_a2_bval").text(rsAr[14].q3_a2_bval);
				$("#q3_b3_val").text(rsAr[15].q3_b3_val);
				$("#q3_a3_tval").text(rsAr[15].q3_a3_tval);
				$("#q3_a3_bval").text(rsAr[15].q3_a3_bval);
				$("#q3_b4_val").text(rsAr[16].q3_b4_val);
				$("#q3_a4_tval").text(rsAr[16].q3_a4_tval);
				$("#q3_a4_bval").text(rsAr[16].q3_a4_bval);
				$("#q3_b5_val").text(rsAr[17].q3_b5_val);
				$("#q3_a5_tval").text(rsAr[17].q3_a5_tval);
				$("#q3_a5_bval").text(rsAr[17].q3_a5_bval);
				
				
				//6
				$("#q4_b_date").text(rsAr[18].q4_b_date);
				$("#q4_a_tdate").text(rsAr[18].q4_a_tdate);
				$("#q4_a_bdate").text(rsAr[18].q4_a_bdate);
				$("#q4_special").text(rsAr[18].q4_special);

				$("#q4_b1-1_val").text(rsAr[19]["q4_b1-1_val"]);
				$("#q4_a1-1_tval").text(rsAr[19]["q4_a1-1_tval"]);
				$("#q4_a1-1_bval").text(rsAr[19]["q4_a1-1_bval"]);
				$("#q4_b1-2_val").text(rsAr[20]["q4_b1-2_val"]);
				$("#q4_a1-2_tval").text(rsAr[20]["q4_a1-2_tval"]);
				$("#q4_a1-2_bval").text(rsAr[20]["q4_a1-2_bval"]);

// 				$("#q4_b1-1_val").text(rsAr[19].q4_b1-1_val);
// 				$("#q4_a1-1_tval").text(rsAr[19].q4_a1-1_tval);
// 				$("#q4_a1-1_bval").text(rsAr[19].q4_a1-1_bval);
// 				$("#q4_b1-2_val").text(rsAr[20].q4_b1-2_val);
// 				$("#q4_a1-2_tval").text(rsAr[20].q4_a1-2_tval);
// 				$("#q4_a1-2_bval").text(rsAr[20].q4_a1-2_bval);
				$("#q4_b2_val").text(rsAr[21].q4_b2_val);
				$("#q4_a2_tval").text(rsAr[21].q4_a2_tval);
				$("#q4_a2_bval").text(rsAr[21].q4_a2_bval);
				$("#q4_b3_val").text(rsAr[22].q4_b3_val);
				$("#q4_a3_tval").text(rsAr[22].q4_a3_tval);
				$("#q4_a3_bval").text(rsAr[22].q4_a3_bval);
				$("#q4_b4_val").text(rsAr[23].q4_b4_val);
				$("#q4_a4_tval").text(rsAr[23].q4_a4_tval);
				$("#q4_a4_bval").text(rsAr[23].q4_a4_bval);
				$("#q4_b5_val").text(rsAr[24].q4_b5_val);
				$("#q4_a5_tval").text(rsAr[24].q4_a5_tval);
				$("#q4_a5_bval").text(rsAr[24].q4_a5_bval);
				
				
				//7
				$("#q5_b_date").text(rsAr[25].q5_b_date);
				$("#q5_a_tdate").text(rsAr[25].q5_a_tdate);
				$("#q5_a_bdate").text(rsAr[25].q5_a_bdate);
				$("#q5_special").text(rsAr[25].q5_special);

				$("#q5_b1-1_val").text(rsAr[26]["q5_b1-1_val"]);
				$("#q5_a1-1_tval").text(rsAr[26]["q5_a1-1_tval"]);
				$("#q5_a1-1_bval").text(rsAr[26]["q5_a1-1_bval"]);
				$("#q5_b1-2_val").text(rsAr[27]["q5_b1-2_val"]);
				$("#q5_a1-2_tval").text(rsAr[27]["q5_a1-2_tval"]);
				$("#q5_a1-2_bval").text(rsAr[27]["q5_a1-2_bval"]);
				
				
// 				$("#q5_b1-1_val").text(rsAr[26].q5_b1-1_val);
// 				$("#q5_a1-1_tval").text(rsAr[26].q5_a1-1_tval);
// 				$("#q5_a1-1_bval").text(rsAr[26].q5_a1-1_bval);
// 				$("#q5_b1-2_val").text(rsAr[27].q5_b1-2_val);
// 				$("#q5_a1-2_tval").text(rsAr[27].q5_a1-2_tval);
// 				$("#q5_a1-2_bval").text(rsAr[27].q5_a1-2_bval);
				$("#q5_b2_val").text(rsAr[28].q5_b2_val);
				$("#q5_a2_tval").text(rsAr[28].q5_a2_tval);
				$("#q5_a2_bval").text(rsAr[28].q5_a2_bval);
				$("#q5_b3_val").text(rsAr[29].q5_b3_val);
				$("#q5_a3_tval").text(rsAr[29].q5_a3_tval);
				$("#q5_a3_bval").text(rsAr[29].q5_a3_bval);
				$("#q5_b4_val").text(rsAr[30].q5_b4_val);
				$("#q5_a4_tval").text(rsAr[30].q5_a4_tval);
				$("#q5_a4_bval").text(rsAr[30].q5_a4_bval);
				$("#q5_b5_val").text(rsAr[31].q5_b5_val);
				$("#q5_a5_tval").text(rsAr[31].q5_a5_tval);
				$("#q5_a5_bval").text(rsAr[31].q5_a5_bval);
				
				
				//8
				$("#q6_b_date").text(rsAr[32].q6_b_date);
				$("#q6_a_tdate").text(rsAr[32].q6_a_tdate);
				$("#q6_a_bdate").text(rsAr[32].q6_a_bdate);
				$("#q6_special").text(rsAr[32].q6_special);

				$("#q6_b1_val").text(rsAr[33].q6_b1_val);
				$("#q6_a1_tval").text(rsAr[33].q6_a1_tval);
				$("#q6_a1_bval").text(rsAr[33].q6_a1_bval);
				$("#q6_b2_val").text(rsAr[34].q6_b2_val);
				$("#q6_a2_tval").text(rsAr[34].q6_a2_tval);
				$("#q6_a2_bval").text(rsAr[34].q6_a2_bval);
				$("#q6_b3_val").text(rsAr[35].q6_b3_val);
				$("#q6_a3_tval").text(rsAr[35].q6_a3_tval);
				$("#q6_a3_bval").text(rsAr[35].q6_a3_bval);
				$("#q6_b4_val").text(rsAr[36].q6_b4_val);
				$("#q6_a4_tval").text(rsAr[36].q6_a4_tval);
				$("#q6_a4_bval").text(rsAr[36].q6_a4_bval);
				$("#q6_b5_val").text(rsAr[37].q6_b5_val);
				$("#q6_a5_tval").text(rsAr[37].q6_a5_tval);
				$("#q6_a5_bval").text(rsAr[37].q6_a5_bval);
				
				
				

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

function getTemperList(){
	$.ajax({
		type : "POST",
		url : "m02/s03/select_m02m03_temper.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"tdate":$("#s_date").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;

				$("#tbigo").text(rsAr[0].tbigo);
				
				//3
				$("#t1_b_date").text(rsAr[0].t1_b_date);
				$("#t1_a_tdate").text(rsAr[0].t1_a_tdate);
				$("#t1_special").text(rsAr[0].t1_special);

				$("#t1_b1_val").text(rsAr[1].t1_b1_val);
				$("#t1_a1_tval").text(rsAr[1].t1_a1_tval);
				$("#t1_b2_val").text(rsAr[2].t1_b2_val);
				$("#t1_a2_tval").text(rsAr[2].t1_a2_tval);
				$("#t1_b3_val").text(rsAr[3].t1_b3_val);
				$("#t1_a3_tval").text(rsAr[3].t1_a3_tval);
				$("#t1_b4_val").text(rsAr[4].t1_b4_val);
				$("#t1_a4_tval").text(rsAr[4].t1_a4_tval);			

				//4
				$("#t2_b_date").text(rsAr[5].t2_b_date);
				$("#t2_a_tdate").text(rsAr[5].t2_a_tdate);
				$("#t2_special").text(rsAr[5].t2_special);

				$("#t2_b1_val").text(rsAr[6].t2_b1_val);
				$("#t2_a1_tval").text(rsAr[6].t2_a1_tval);
				$("#t2_b2_val").text(rsAr[7].t2_b2_val);
				$("#t2_a2_tval").text(rsAr[7].t2_a2_tval);
				$("#t2_b3_val").text(rsAr[8].t2_b3_val);
				$("#t2_a3_tval").text(rsAr[8].t2_a3_tval);
				$("#t2_b4_val").text(rsAr[9].t2_b4_val);
				$("#t2_a4_tval").text(rsAr[9].t2_a4_tval);			
				
				//5
				$("#t3_b_date").text(rsAr[10].t3_b_date);
				$("#t3_a_tdate").text(rsAr[10].t3_a_tdate);
				$("#t3_special").text(rsAr[10].t3_special);

				$("#t3_b1_val").text(rsAr[11].t3_b1_val);
				$("#t3_a1_tval").text(rsAr[11].t3_a1_tval);
				$("#t3_b2_val").text(rsAr[12].t3_b2_val);
				$("#t3_a2_tval").text(rsAr[12].t3_a2_tval);
				$("#t3_b3_val").text(rsAr[13].t3_b3_val);
				$("#t3_a3_tval").text(rsAr[13].t3_a3_tval);
				$("#t3_b4_val").text(rsAr[14].t3_b4_val);
				$("#t3_a4_tval").text(rsAr[14].t3_a4_tval);			

				//6
				$("#t4_b_date").text(rsAr[15].t4_b_date);
				$("#t4_a_tdate").text(rsAr[15].t4_a_tdate);
				$("#t4_special").text(rsAr[15].t4_special);

				$("#t4_b1_val").text(rsAr[16].t4_b1_val);
				$("#t4_a1_tval").text(rsAr[16].t4_a1_tval);
				$("#t4_b2_val").text(rsAr[17].t4_b2_val);
				$("#t4_a2_tval").text(rsAr[17].t4_a2_tval);
				$("#t4_b3_val").text(rsAr[18].t4_b3_val);
				$("#t4_a3_tval").text(rsAr[18].t4_a3_tval);
				$("#t4_b4_val").text(rsAr[19].t4_b4_val);
				$("#t4_a4_tval").text(rsAr[19].t4_a4_tval);			

				//7
				$("#t5_b_date").text(rsAr[20].t5_b_date);
				$("#t5_a_tdate").text(rsAr[20].t5_a_tdate);
				$("#t5_special").text(rsAr[20].t5_special);

				$("#t5_b1_val").text(rsAr[21].t5_b1_val);
				$("#t5_a1_tval").text(rsAr[21].t5_a1_tval);
				$("#t5_b2_val").text(rsAr[22].t5_b2_val);
				$("#t5_a2_tval").text(rsAr[22].t5_a2_tval);
				$("#t5_b3_val").text(rsAr[23].t5_b3_val);
				$("#t5_a3_tval").text(rsAr[23].t5_a3_tval);
				$("#t5_b4_val").text(rsAr[24].t5_b4_val);
				$("#t5_a4_tval").text(rsAr[24].t5_a4_tval);			
				
				//8
				$("#t6_b_date").text(rsAr[25].t6_b_date);
				$("#t6_a_tdate").text(rsAr[25].t6_a_tdate);
				$("#t6_special").text(rsAr[25].t6_special);

				$("#t6_b1_val").text(rsAr[26].t6_b1_val);
				$("#t6_a1_tval").text(rsAr[26].t6_a1_tval);
				$("#t6_b2_val").text(rsAr[27].t6_b2_val);
				$("#t6_a2_tval").text(rsAr[27].t6_a2_tval);
				$("#t6_b3_val").text(rsAr[28].t6_b3_val);
				$("#t6_a3_tval").text(rsAr[28].t6_a3_tval);
				$("#t6_b4_val").text(rsAr[29].t6_b4_val);
				$("#t6_a4_tval").text(rsAr[29].t6_a4_tval);
				
				//9
				
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

//퀜칭

	function date_reg(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_tid").val(row_id);
			tdateDialog.dialog("open");			
		}
	}

	function val_reg(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_vid").val(row_id);
			valDialog.dialog("open");
		}
	}	
	
	
	function special_reg(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_sid").val(row_id);
			specialDialog.dialog("open");
		}
	}	

	
	
	function bigo_reg(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_bid").val(row_id);
			bigoDialog.dialog("open");
		}
	}	

//템퍼링

	function date_reg_t(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_tid_t").val(row_id);
			tdate_tDialog.dialog("open");
		}
	}

	function val_reg_t(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_vid_t").val(row_id);
			val_tDialog.dialog("open");
		}
	}	
	
	
	function special_reg_t(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_sid_t").val(row_id);
			special_tDialog.dialog("open");
		}
	}	
	
	function bigo_reg_t(row_id){
		if(sid != "worker"){
			$("#"+row_id).css("background-color","#CEFBC9");
			$("#i_bid_t").val(row_id);
			bigo_tDialog.dialog("open");
		}
	}

	
/*이벤트*/	
		
$("#s_date").change(function(){
	
	getYearCount();
});


$("#s_ro").change(function(){
	var ro = $("#s_ro").val();
	getYearCount();
	if(ro == "q"){
		$("#tem").hide();
		$("#qun").show();
//		getQunList();
	}else{
		$("#tem").show();
		$("#qun").hide();
//		getTemperList();
	}
});



$("#qun_contents").delegate('tr','click', function() {
	
	
	var $row = $(this).closest("tr"),
		$nr = $row.find(".nr").text();		//cnt
		$nr1 = $row.find(".nr1").text();	//No.
		$nr2 = $row.find(".nr2").text();	//년도
		$nr3 = $row.find(".nr3").text();	//설비명
		$nr4 = $row.find(".nr4").text();	//존구분
		$nr5 = $row.find(".nr5").text();	//전날짜
		$nr6 = $row.find(".nr6").text();	//전값
		$nr7 = $row.find(".nr7").text();	//상반기
		$nr8 = $row.find(".nr8").text();	//후날짜
		$nr9 = $row.find(".nr9").text();	//후값
		$nr10 = $row.find(".nr10").text();	//하반기
		$nr11 = $row.find(".nr11").text();	//후날짜
		$nr12 = $row.find(".nr12").text();	//후값
		$nr13 = $row.find(".nr13").text();	//비고
		
		
	var index = 0;
	$("#qun_contents > tr").each(function(){
		if($nr == cntArray[index]){
			$(this).css("background-color","#B2CCFF");						
		}else{						
			$(this).css("background-color","#fff");
		}	
		index++;
	});
});		
		
		
$("#tem_contents").delegate('tr','click', function() {
	
	
	var $row = $(this).closest("tr"),
		$nr = $row.find(".nr").text();		//cnt
		$nr1 = $row.find(".nr1").text();	//No.
		$nr2 = $row.find(".nr2").text();	//년도
		$nr3 = $row.find(".nr3").text();	//설비명
		$nr4 = $row.find(".nr4").text();	//존구분
		$nr5 = $row.find(".nr5").text();	//전날짜
		$nr6 = $row.find(".nr6").text();	//전값
		$nr7 = $row.find(".nr7").text();	//상반기
		$nr8 = $row.find(".nr8").text();	//후날짜
		$nr9 = $row.find(".nr9").text();	//후값
		$nr10 = $row.find(".nr10").text();	//하반기
		$nr11 = $row.find(".nr11").text();	//후날짜
		$nr12 = $row.find(".nr12").text();	//후값
		$nr13 = $row.find(".nr13").text();	//비고
		
		
	var index = 0;
	$("#tem_contents > tr").each(function(){
		if($nr == cntArray[index]){
			$(this).css("background-color","#B2CCFF");						
		}else{						
			$(this).css("background-color","#fff");
		}	
		index++;
	});
});			
		
	$("#saveBtn").on("click",function(){
		
	});
/*다이얼로그*/
 

//퀜칭

	var tdateDialog;
	tdateDialog = $("#tdate-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				
				$.post("m02/s03/insert_m02s03_tdate_q.jsp",{
					"id":$("#i_tid").val(),
					"tdate":$("#i_tdate").val(),
					"year1":$("#s_date").val()
				},150);
				
				
				setTimeout(function(){
					tdateDialog.dialog("close");
					$("#"+$("#i_tid").val()).css("background-color","#FFFFFF");
					getQunList();
					var dForm = $("#dateform")[0];
					dForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_tid").val()).css("background-color","#FFFFFF");
				var dForm = $("#dateform")[0];
				dForm.reset();
				tdateDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_tid").val()).css("background-color","#FFFFFF");  
	      }
	});

	
	var valDialog;
	valDialog = $("#val-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				valDialog.dialog("close");
				
				$.post("m02/s03/insert_m02s03_val_q.jsp",{
					"id":$("#i_vid").val(),
					"vval":$("#i_vval").val(),
					"year1":$("#s_date").val()
				},150);
				
				setTimeout(function(){
					$("#"+$("#i_vid").val()).css("background-color","#FFFFFF");
					getQunList();
					var vForm = $("#valform")[0];
					vForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_vid").val()).css("background-color","#FFFFFF");
				var vForm = $("#valform")[0];
				vForm.reset();
				valDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_vid").val()).css("background-color","#FFFFFF");  
	      }
	});	

	var specialDialog;
	specialDialog = $("#special-form").dialog({
		autoOpen:false,
		height:180,
		width:420,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				specialDialog.dialog("close");
				
				$.post("m02/s03/insert_m02s03_special_q.jsp",{
					"id":$("#i_sid").val(),
					"sspecial":$("#i_sspecial").val(),
					"year1":$("#s_date").val()
				},150);
				
				
				setTimeout(function(){
					$("#"+$("#i_sid").val()).css("background-color","#FFFFFF");
					getQunList();
					var sForm = $("#specialform")[0];
					sForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_sid").val()).css("background-color","#FFFFFF");
				var sForm = $("#specialform")[0];
				sForm.reset();
				specialDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_sid").val()).css("background-color","#FFFFFF");  
	      }
	});		

	
	
	var bigoDialog;
	bigoDialog = $("#bigo-form").dialog({
		autoOpen:false,
		height:260,
		width:420,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				
				
				
				$.post("m02/s03/insert_m02s03_bigo_q.jsp",{
					"bbigo":$("#i_bbigo").val(),
					"year1":$("#s_date").val()
				},150);
				
				bigoDialog.dialog("close");
				
				setTimeout(function(){
					$("#"+$("#i_bid").val()).css("background-color","#FFFFFF");
					getQunList();
					var bForm = $("#bigoform")[0];
					bForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_bid").val()).css("background-color","#FFFFFF");
				var bForm = $("#bigoform")[0];
				bForm.reset();
				bigoDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_bid").val()).css("background-color","#FFFFFF");  
	      }
	});		
	
//템퍼링

	var tdate_tDialog;
	tdate_tDialog = $("#tdate_t-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				
				$.post("m02/s03/insert_m02s03_tdate_t.jsp",{
					"id":$("#i_tid_t").val(),
					"tdate":$("#i_tdate_t").val(),
					"year1":$("#s_date").val()
				},150);
				
				
				setTimeout(function(){
					tdate_tDialog.dialog("close");
					$("#"+$("#i_tid_t").val()).css("background-color","#FFFFFF");
					getTemperList();
					var d_tForm = $("#date_tform")[0];
					d_tForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_tid_t").val()).css("background-color","#FFFFFF");
				var d_tForm = $("#date_tform")[0];
				d_tForm.reset();
				tdate_tDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_tid_t").val()).css("background-color","#FFFFFF");  
	      }
	});

	
	var val_tDialog;
	val_tDialog = $("#val_t-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				val_tDialog.dialog("close");
				
				$.post("m02/s03/insert_m02s03_val_t.jsp",{
					"id":$("#i_vid_t").val(),
					"vval":$("#i_vval_t").val(),
					"year1":$("#s_date").val()
				},150);
				
				setTimeout(function(){
					$("#"+$("#i_vid_t").val()).css("background-color","#FFFFFF");
					getTemperList();
					var v_tForm = $("#val_tform")[0];
					v_tForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_vid_t").val()).css("background-color","#FFFFFF");
				var v_tForm = $("#val_tform")[0];
				v_tForm.reset();
				val_tDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_vid_t").val()).css("background-color","#FFFFFF");  
	      }
	});	

	var special_tDialog;
	special_tDialog = $("#special_t-form").dialog({
		autoOpen:false,
		height:180,
		width:420,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				special_tDialog.dialog("close");
				
				$.post("m02/s03/insert_m02s03_special_t.jsp",{
					"id":$("#i_sid_t").val(),
					"sspecial":$("#i_sspecial_t").val(),
					"year1":$("#s_date").val()
				},150);
				
				
				setTimeout(function(){
					$("#"+$("#i_sid_t").val()).css("background-color","#FFFFFF");
					getTemperList();
					var s_tForm = $("#special_tform")[0];
					s_tForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_sid_t").val()).css("background-color","#FFFFFF");
				var s_tForm = $("#special_tform")[0];
				s_tForm.reset();
				special_tDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_sid_t").val()).css("background-color","#FFFFFF");  
	      }
	});		

	
	
	var bigo_tDialog;
	bigo_tDialog = $("#bigo_t-form").dialog({
		autoOpen:false,
		height:260,
		width:420,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				
				
				
				$.post("m02/s03/insert_m02s03_bigo_t.jsp",{
					"bbigo":$("#i_bbigo_t").val(),
					"year1":$("#s_date").val()
				},150);
				
				bigo_tDialog.dialog("close");
				
				setTimeout(function(){
					$("#"+$("#i_bid_t").val()).css("background-color","#FFFFFF");
					getTemperList();
					var b_tForm = $("#bigo_tform")[0];
					b_tForm.reset();
					
				},500);
				
			},
			"닫 기":function(){
				$("#"+$("#i_bid_t").val()).css("background-color","#FFFFFF");
				var b_tForm = $("#bigo_tform")[0];
				b_tForm.reset();
				bigo_tDialog.dialog("close");
			}
		},
	      close: function() {
	    	  $("#"+$("#i_bid_t").val()).css("background-color","#FFFFFF");  
	      }
	});		
	
	
/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>