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


<!-- 화면캡처 -->
<script src="resources/js/html2canvas.js"></script>


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

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css"/>

<link rel="stylesheet" href="resources/css/table_font_size.css"/>

<!-- 풀캘린더 사용 -->
<link rel="stylesheet" type="text/css" href="resources/css/fullcalendar.css"/>

<!-- Load D3 -->
<script src="resources/js/d3.min.js"></script>
 
 
<!-- Load billboard.js with base style -->
<link rel="stylesheet" href="resources/css/billboard5.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard5.js"></script>


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
    height: 35px;

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



.scrolltbody4 {
    display: block;
    width: 600px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody4 td { border: 1px solid #000; border-top: 0;}

.scrolltbody4 thead {
    display: block;
	width: 600px;
    overflow-x: hidden;
}

.scrolltbody4 tbody {
    display: block;
    width: 600px;
    height: 420px;

    overflow-x: hidden;
}

/*x-bar 테이블*/
.x_table {
    display: block;
    width: 260px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.x_table td { border: 1px solid #000; border-top: 0;}

.x_table thead {
    display: block;
    width: 260px;
    overflow-x: hidden;
}

.x_table tbody {
    display: block;
    width: 260px;
    height: 120px;
    overflow-x: hidden;
}



/*r-bar 테이블*/
.r_table {
    display: block;
    width: 260px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.r_table td { border: 1px solid #000; border-top: 0;}

.r_table thead {
    display: block;
    width: 260px;
    overflow-x: hidden;
}

.r_table tbody {
    display: block;
    width: 260px;
    height: 120px;
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
	 z-index: 20100; 
	}	
	
	
	@font-face{
		font-family:"headline";
		src:url("fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
	}	
	

	
	.line-class-data1 {stroke-width: 3px; }
	
	.line-class-data2 { stroke-dasharray:3 4; stroke-width: 3px; }
	
	
	
	#x_chart .bb-axis-x tspan{
		font-size:12pt;
		font-weight:700;
		font-family:headline;
	}
	
	#x_chart .bb-axis-y tspan{
		font-size:12pt;
		font-weight:700;
		font-family:headline;
	}		
	
	#r_chart .bb-axis-x tspan{
		font-size:12pt;
		font-weight:700;
		font-family:headline;
	}
	
	#r_chart .bb-axis-y tspan{
		font-size:12pt;
		font-weight:700;
		font-family:headline;
	}
	
	.bb-tooltip th{
		font-weight:700;
		font-family:headline;
		font-size:14pt;
	}
	
	
	g.bb-chart-text.bb-target.bb-target-c-up text{
		font-size:12pt;
		font-weight:700;
		font-family:headline;		
	}

	g.bb-chart-text.bb-target.bb-target-c-down text{
		font-size:12pt;
		font-weight:700;
		font-family:headline;		
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
						<th class="text-center cell" style="width: 200px; height: 30px; font-size: 14pt;">코멘트</th>
						<td>&nbsp;</td>						
					</tr>
					
					<tr style="height: 30px;">
						<td>&nbsp;</td>
						<td><textarea class="form-control input-sm" id="cmt_comment" name="cmt_comment" 
							style="width: 360px; height: 120px; font-size: 13pt;
							resize:none;"></textarea>
							
							
							<input type="hidden" class="form-control input-sm" id="cmt_time" name="cmt_time" 
							style="width: 160px; height: 30px; font-size: 14px; text-align: center; background-color:white;" 
							readonly="readonly"/>
						</td>
						<td>&nbsp;</td>
					</tr>
							
				</table>
			</form>				
		</div>

	<div id="loading" style="display:none;">
		<img id="loading-image" src="resources/img/loading2.gif" alt="Loading..." />
	</div>


	<div id="pnum-form" style="display:none;" title="품번 선택창">
			<div class="row">
				<form class="form-inline" role="form" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family: headline; font-weight:700; 
						color:#8C8C8C; width: 60px; text-align: right;">품 번 : </label>
					</div>
					
					
					<div class="form-group">
						<input class="form-control input-sm" id="p_pnum" name="p_pnum" 
						style="margin-top:5px; height: 30px; width: 200px; 
						font-size: 14pt; font-family: headline; font-weight:700;
						padding-top:1px; padding-bottom:1px;" 
						placeholder="품번 입력"/>
					</div>	
					
					<div class="form-group">
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="margin-top:6px; height: 31px; width: 120px; 
							font-size: 14pt; font-family: headline; font-weight:700;
							padding-top:1px; padding-bottom:1px;" 
							id="p_searchbtn">
							<i class="fa fa-search" aria-hidden="true"></i> 검 색</button>
						</div>
					</div>						
					
				</form>				
			</div>			
			<div class="row" style="margin-top:15px;">
               <table id="pnum_list" cellspacing="0" 
               
               class="table table-bordered table-hover table-responsive scrolltbody4">
					<thead>
						<tr>		
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 200px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								품번
							</th>
							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 300px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								품명
							</th>						
						</tr>
					</thead>
					<tbody id="pnum_contents">
						
					</tbody>
				</table>
			</div>
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
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-line-chart"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">품질관리 - Cpk 분석</h5>
            </header>
			<div id="collapse5" style="overflow:hidden;">
				<header style="background:white; height:43px;">
					<form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">

						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family: headline; font-weight:700; 
							color:#8C8C8C; width: 60px; text-align: right;">기 간 : </label>
						</div>
						<!-- 시작일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_sdate" name="s_sdate" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family: headline; font-weight:700;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						~
						
						<!-- 종료일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_edate" name="s_edate" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family: headline; font-weight:700;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>					

						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family: headline; font-weight:700; 
							color:#8C8C8C; width: 60px; text-align: right;">품 번 : </label>
						</div>
						
						
						<div class="form-group">
							<input class="form-control input-sm" id="s_pnum" name="s_pnum" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family: headline; font-weight:700;
							padding-top:1px; padding-bottom:1px;
							background-color:white; cursor: pointer;" 
							
							
							readonly="readonly"
							placeholder="품번 선택" onclick="pnum_open();"/>
						</div>	
						
						
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								style="margin-top:6px; height: 31px; width: 120px; 
								font-size: 14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px;" 
								id="searchbtn">
								<i class="fa fa-search" aria-hidden="true"></i> 검 색</button>
							</div>
						</div>				
<!-- 
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								style="margin-top:6px; height: 31px; width: 120px; 
								font-size: 14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px;" 
								id="capturehbtn">
								<i class="fa fa-file-image-o" aria-hidden="true"></i> 파일저장</button>
							</div>
						</div>				
 -->
																				
					</form>
				</header>
            
            <!--style="overflow-y:scroll; height:700px;"-->
				<div id="collapse4" class="body" style="overflow:auto; height:100%;">
					<div class="row">
					   <table id="manage_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
							<thead>
								<tr>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 140px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										품번
									</th>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 240px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										품명
									</th>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 240px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										규격
									</th>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 360px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										특성
									</th>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 100px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										상한
									</th>
									
									
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 100px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										하한
									</th>
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 140px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										일자
									</th>
									
									<th class="text-center cell" 
									style="background-color:#36FFFF; width: 120px; height: 30px; 
									font-size: 14pt; font-family: headline; font-weight: 700;">
										작성자
									</th>														
								</tr>
										
							</thead>					
							<tbody id="manage_contents">
								
							</tbody>
						</table>	
					</div>
					
					<div class="row">
						<div class="col-xs-2">
						<h4 style="padding-left:40px; margin-top:0; margin-bottom:1px;"><b>X 관리도</b></h4>
						   <table id="x_bar_list" cellspacing="0" 
						   class="table table-bordered table-hover table-responsive x_table">
								<thead>
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 70px; height: 30px; 
										font-size: 12pt; font-family: headline; font-weight: 700;
										">
											UCL
										</th>
										
										<th style="text-align: center; vertical-align: middle; padding: 1px; 
											height: 30px; width: 120px; word-break:break-all; 
											font-size: 12pt;"
											id="x_ucl">
											
										</th>																										
									</tr>
									
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 70px; height: 30px; 
										font-size: 12pt; font-family: headline; font-weight: 700;">
											CL
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 120px; word-break:break-all; font-size: 12pt;
										 font-family: headline; font-weight: 700;"
										id="x_cl">
											
										</th>																										
									</tr>
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 70px; height: 30px; 
										font-size:12pt; font-family: headline; font-weight: 700;">
											LCL
										</th>
										<td style="text-align: center; vertical-align: middle; padding: 5px; 
										height: 30px; width: 120px; word-break:break-all; 
										font-size: 12pt; font-family: headline; font-weight: 700;"
										id="x_lcl">
											
										</td>																										
									</tr>																
								</thead>
							</table>	
						</div>
						
						
						<div class="col-xs-10">
							<div id="x_chart" style="width:1300px; height:280px;"></div>
							
						</div>
					</div>
					
					
					<!-- R 관리도 -->
					<div class="row">
						<div class="col-xs-2">
							<h4 style="padding-left:40px; margin-top:0; margin-bottom:1px;"><b>R 관리도</b></h4>
						   <table id="r_bar_list" cellspacing="0" 
						   class="table table-bordered table-hover table-responsive r_table">
								<thead>
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 70px; height: 30px; 
										font-size: 12pt; font-family: headline; font-weight: 700;
										">
											UCL
										</th>
										
										<th style="text-align: center; vertical-align: middle; padding: 1px; 
											height: 30px; width: 120px; word-break:break-all; 
											font-size: 12pt;
											 font-family: headline; font-weight: 700;"
											id="r_ucl">
											
										</th>																										
									</tr>
									
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 70px; height: 30px; 
										font-size: 12pt; font-family: headline; font-weight: 700;">
											CL
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 1px; 
										height: 30px; width: 120px; word-break:break-all; font-size: 12pt;
										 font-family: headline; font-weight: 700;"
										id="r_cl">
											
										</th>																										
									</tr>															
								</thead>
							</table>	
						</div>
						
						
						<div class="col-xs-10">
							<div id="r_chart" style="width:1300px; height:140px;"></div>
							
						</div>
					</div>				
					
					
					<!-- 표 -->
						   <table id="value_bar_list" cellspacing="0" 
						   class="table table-bordered table-hover table-responsive value_table"
						   style="margin-bottom:0;">
								<thead>
									<tr>
										<th colspan="2" class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight: 700;">
										일자</th>
										
										
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all;
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date1">
										</th>
										<th style="text-align: center; vertical-align: middle;
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all;
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_date30">
										</th>
									</tr>
									
									
									<tr>
										<th colspan="2" class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight: 700;">
										시간</th>
										
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight: 700;"
											id="v_time20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight: 700;"
											id="v_time26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight: 700;"
											id="v_time30">
										</th>
									</tr>
									
									
									<tr>
										<th rowspan="3" class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;">
											데이터
										</th>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;">
											x1
										</th>			
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x1_30">
										</th>
									</tr>


									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;">
											x2
										</th>									
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_19">
										</th>
										<th style="text-align: center; vertical-align: middle;
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_25">
										</th>
										<th style="text-align: center; vertical-align: middle;
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x2_30">
										</th>
									</tr>
									
									<tr>
										<th class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt;">
											x3
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_x3_30">
										</th>
									</tr>	
									
									<tr>
										<th colspan="2" class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt;">
										X 평균</th>
										
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_xavg30">
										</th>
									</tr>
									
									
									
									<tr>
										<th colspan="2" class="text-center cell" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt;">
										Range</th>
										
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range1">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range2">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range3">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range4">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range5">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range6">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range7">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range8">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range9">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range10">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range11">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range12">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range13">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range14">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range15">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range16">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range17">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range18">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range19">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range20">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range21">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range22">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range23">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range24">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range25">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range26">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range27">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range28">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range29">
										</th>
										<th style="text-align: center; vertical-align: middle; 
											height: 20px; width: 24px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											id="v_range30">
										</th>									
									</tr>								
										
										
										
									<tr>
										<th colspan="2" rowspan="2" 
										style="background-color:#36FFFF; width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;
										 text-align: center;">
										관리한계공식</th>
										
										
										
										<th colspan="8" rowspan="2"
											style="background-color:#36FFFF; text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;">
											관리도계수표
										</th>
										
										
										
										<th colspan="14"
											style="background-color:#36FFFF;text-align: center; vertical-align: middle; padding: 5px; 
											height: 10px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;">
											X-R관리도 관리한계
										</th>
										
										<th colspan="8" rowspan="2"
											style="background-color:#36FFFF;text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;">
											공정능력분석
										</th>
									</tr>
									
									<tr>
										<th colspan="7"
											style="background-color:#36FFFF;text-align: center; vertical-align: middle; padding: 5px; 
											height: 10px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;">
											X 관리도
										</th>
										<th colspan="7"
											style="background-color:#36FFFF;text-align: center; vertical-align: middle; padding: 5px; 
											height: 10px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;">
											R 관리도
										</th>
									</tr>	
																
										
									<tr>
										<th colspan="2" rowspan="2" class="text-center cell" 
										style="width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;">
										X Bar 관리도한계<br />
										X Bar ±2R</th>
										
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											n
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_n">
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											관리상한(UCL)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_x_ucl">
										</th>	
																		
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											관리상한(UCL)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_r_ucl">
										</th>									
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											R/d2
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_r_d2">
										</th>								
									</tr>									
										
									<tr>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											d2
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_d2">
											
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											평균값(CL=X)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_x_cl">
										</th>	
																		
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											평균값(CL=R)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_r_cl">
										</th>									
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											CP
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_cp">
										</th>								
									</tr>
									
										<!-- 여기부터임 -->
									<tr>
										<th colspan="2" rowspan="2" class="text-center cell" 
										style="width: 40px; height: 20px; 
										font-size: 12pt; font-family: headline; font-weight:700;">
										R 관리도한계<br />
										D4R Bar, D3R Bar</th>
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											A2
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_a2">
											
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											관리하한(LCL)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_x_lcl">
										</th>	
																		
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="3">
											관리하한(LCL)
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_r_lcl">
										</th>									
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											k
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_k">
										</th>								
									</tr>		
										
									<tr>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											D4
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_d4">
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="3">
											
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4">
										</th>	
																		
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="3">
											
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4">
										</th>									
										
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 12pt; font-family: headline; font-weight:700;"
											colspan="4">
											CPk
										</th>
										<th style="text-align: center; vertical-align: middle; padding: 5px; 
											height: 20px; width: 30px; word-break:break-all; 
											font-size: 11pt; font-family: headline; font-weight:700;"
											colspan="4" id="limit_cpk">
										</th>	
																	
									</tr>
								</thead>
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

var x_chartData;
var r_chartData;
var commentDialog;
var commentForm;
var alertDialog;

var cmtArray;

/*인터벌*/
var caputre_date = "";
	
/*페이지 로드*/	
$(function(){
	fn_check();
//	getPno();

	commentForm = commentDialog.find( "form" ).on( "submit", function( event ) {
	      event.preventDefault();
	});	

	cmtArray = new Array();
	var now = new Date();
	var tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
	
	caputre_date = now.getFullYear()+date_set(now.getMonth()+1)+date_set(now.getDate())+"_"
					+date_set(now.getHours())+date_set(now.getMinutes());
	
	$("#s_date").val(tdate);
	//2020-11-15 임시
//	$("#s_sdate").val("2020-01-01");
//	$("#s_edate").val("2020-11-01");
//	xr_manageList();

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
			
			
			
			var codeArray = new Array();
			function pnum_open() {
				/*
				$.ajax({
						type : "POST",
						url : "l003001_pno.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
							"pnum":$("#p_pnum").val()},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								
								var rsAr = rsJson.rows;
								var listHtml = "";
									for(var i=0; i<rsAr.length; i++){
										codeArray[i] = rsAr[i].model_code;
										listHtml += "<tr>";
										listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 200px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].model_code+'</td>';
										listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 300px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].model_name+'</td>';
//										listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 200px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; display:none;">'+rsAr[i].code+'</td>';
//										listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 200px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; display:none;">'+rsAr[i].revcode+'</td>';
										listHtml += "</tr>";
										
									}
									$("#pnum_list tbody").html(listHtml);
									$("#loading").hide();
					   			
							} else if (rsJson && rsJson.status == "fail") {
								alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
							} else {
								alert("에러발생!");
							}
							
//							timer = setTimeout(function(){ o.run(); }, o.pollInterval);
							
						},	// success 끝
						error: function(req, status) {
							if (req.status == 0 || status == "timeout") {
								alert("네트워크 연결 확인 후 다시 시도해주세요.");
							} else {
								alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
							}
						},
						
					});
				*/
				};			
			
function init(){
//	getManageList();
}

function date_set(v){
	var result = "";
	if(v <= 9){
		result = "0"+v;			
	}else{
		result = v;
	}
	
	return result;
}

var getManageList = function(){	
	var listHtml = "";
	listHtml += "<tr>";
	listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">1</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 80px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">LC</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">81572-37001</td>';
	listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 240px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">LEVEL-F/F DR RELLHD</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 100px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">자동</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 360px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">전체형상① v/c 12.4 ±0.1(1월 KNOB 삽입폭)</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 100px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">12.40</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">0.10</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">0.10</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;"></td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">1회/초중종품</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">2016/04/25</td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">배복수</td>';
	listHtml += "</tr>";
	
	
	
	$("#manage_list tbody").html(listHtml);
}


		var dtArray = new Array();
		function xr_manageList(){
			var spnum = $("#s_pnum").val();
			var sdate = $("#s_sdate").val();
			var edate = $("#s_edate").val();

			if(spnum == '' || sdate == '' || edate == '' ){
				alert("날짜, 품번을 선택해주십시오.");
				return;
			}
			
			
		$.ajax({
			type : "POST",
			url : "l003001.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"spnum":spnum,
					"sdate":sdate,
					"edate":edate},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var xm_average = rsJson.xm_average;
					var xm_range = rsJson.xm_range;
					var xbar_average = rsJson.xbar_average;
					var range_average = rsJson.range_average;
					var x_Bar_UCL = rsJson.x_Bar_UCL;
					var x_Bar_CL = rsJson.x_Bar_CL;
					var x_Bar_LCL = rsJson.x_Bar_LCL;
					var r_UCL = rsJson.r_UCL;
					var r_CL = rsJson.r_CL;
					var r_Bar_d2 = rsJson.r_Bar_d2;
					var cp = rsJson.cp;
					var k = rsJson.k;
					var cpk = rsJson.cpk;
					var nn = rsJson.nn;
					var d2 = rsJson.d2;
					var a2 = rsJson.a2;
					var d4 = rsJson.d4;
					var rsAr = rsJson.rows;
					
					
					
					
					x_chartData = rsJson.chartx;
					r_chartData = rsJson.chartr;
					
					$("#x_ucl").text(x_Bar_UCL[0]);
					$("#x_cl").text(x_Bar_CL[0]);
					$("#x_lcl").text(x_Bar_LCL[0]);
					
					$("#limit_x_ucl").text(x_Bar_UCL[0]);
					$("#limit_x_cl").text(x_Bar_CL[0]);
					$("#limit_x_lcl").text(x_Bar_LCL[0]);
					
					$("#r_ucl").text(r_UCL[0]);
					$("#r_cl").text(r_CL[0]);
					
					$("#limit_r_ucl").text(r_UCL[0]);
					$("#limit_r_cl").text(r_CL[0]);
					$("#limit_r_lcl").text("-");
					
					
					
					var x = 0;
					for(var i=rsAr.length-1; i>=0; i--){
						dtArray[x] = rsAr[i].tdate+" "+rsAr[i].ttime;
						$("#v_date"+(x+1)).text(rsAr[i].tdate);
						$("#v_time"+(x+1)).text(rsAr[i].ttime);
						$("#v_x1_"+(x+1)).text(rsAr[i].x1);
						$("#v_x2_"+(x+1)).text(rsAr[i].x2);
						$("#v_x3_"+(x+1)).text(rsAr[i].x3);
						
						$("#v_xavg"+(x+1)).text(xm_average[i]);
						$("#v_range"+(x+1)).text(xm_range[i]);
						x++;
					}
					
					for(var j=rsAr.length+1; j<=30; j++){
						$("#v_date"+(j)).text("");
						$("#v_time"+(j)).text("");
						$("#v_x1_"+(j)).text('');
						$("#v_x2_"+(j)).text('');
						$("#v_x3_"+(j)).text('');
						
						$("#v_xavg"+(j)).text('');
						$("#v_range"+(j)).text('');
					}					
					
					var cArray = rsJson.cmtArray;
					
					cmtArray = cArray;
	
					
					var topp = rsJson.tops;
					for(var k1=0; k1<topp.length; k1++){
						var listHtml3 = "";
						listHtml3 += "<tr>";						
						listHtml3 += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].model_code+'</td>';
						listHtml3 += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 240px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].model_name+'</td>';
						listHtml3 += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 240px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].model_desc+'</td>';
						listHtml3 += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 360px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].special+'</td>';
						listHtml3 += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 100px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].max_value+'</td>';
						listHtml3 += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 100px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].min_value+'</td>';
						listHtml3 += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].c_date+'</td>';
						listHtml3 += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size: 12pt; font-family: headline; font-weight:700;">'+topp[0].create_user+'</td>';
						listHtml3 += "</tr>";						
					}
					$("#manage_list tbody").html(listHtml3);
					
					$("#limit_n").text(nn[0]);
					$("#limit_d2").text(d2[0]);
					$("#limit_a2").text(a2[0]);
					$("#limit_d4").text(d4[0]);
					
					
					$("#limit_r_d2").text(r_Bar_d2[0]);
					$("#limit_cp").text(cp[0]);
					$("#limit_k").text(k[0]);
					$("#limit_cpk").text(cpk[0]);
					
					xChart_load();
					rChart_load();
					
					/*
					if(typeof xChart == "undefined"){
						xChart_load();	
					}else{
						chart_xload();
					}
					
					if(typeof rChart == "undefined"){
						rChart_load();	
					}else{
						chart_rload();
					}
					*/
					
					$("#loading").hide();
					
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

		function chart_xload(){
			xChart.load({
		        json: x_chartData,
		        keys: {
		        	y:"avg",
		        	value:["avg","ucl","cl","lcl","usl","lsl","c_down","c_up"]
		        }
			});
		}

		function chart_rload(){
			rChart.load({
		        json: r_chartData,
		        keys: {
		        	y:"range",
					value:["range","ucl","cl"]
		        }
			});
		}		
		

		function partShot() {
			var imageDiv = document.getElementById("collapse5");
			
			var _height = imageDiv.style.height;
			var _width = imageDiv.style.width;
			imageDiv.style.height = "950px";
//			imageDiv.style.height = "1200px";


			//특정부분 스크린샷
			html2canvas(imageDiv,{
				foreignObjectRendering:true,
				windowWidth: imageDiv.scrollWidth,
				windowHeight: imageDiv.scrollHeight,
				x:0,y:0,
				imageTimeout:500
			})
			//id collapse4 부분만 스크린샷
			.then(function (canvas) {
				//jpg 결과값
				drawImg(canvas.toDataURL('image/png'));
				//이미지 저장
				saveAs(canvas.toDataURL(), caputre_date+'_cpk.png');
				
				imageDiv.style.height = _height;
				imageDiv.style.width = _width;
				})
		}

		
		
		function drawImg(imgData) {
			//imgData의 결과값을 console 로그롤 보실 수 있습니다.
			return new Promise(function reslove() {
				//내가 결과 값을 그릴 canvas 부분 설정
				var canvas = document.getElementById('canvas');

				var ctx = canvas.getContext('2d');
				//canvas의 뿌려진 부분 초기화
				ctx.clearRect(0, 0, canvas.width, canvas.height);
	
					var imageObj = new Image();
						imageObj.onload = function () {
						ctx.drawImage(imageObj, 10, 10);
						//canvas img를 그리겠다.
					};
				imageObj.src = imgData;
				//그릴 image데이터를 넣어준다.

			}, function reject() { });

		}
			
			
			function saveAs(uri, filename) {
				var link = document.createElement('a');
					if (typeof link.download === 'string') {
						link.href = uri;
						link.download = filename;
						document.body.appendChild(link);
						link.click();
						document.body.removeChild(link);
					} else {
						window.open(uri);
					}
					$("#loading").hide();
			}
	
		
/*이벤트*/	
$("#capturehbtn").on("click",function(){
	$("#loading").show();
	partShot();
	
});

 
 $("#p_searchbtn").on("click",function(){
//	 $("#loading").show();
//	 pnum_open();
 });
 
 
 $("#s_pnum").on("click",function(){
//	 $("#loading").show();
//	 pnum_open();
//	 pnumDialog.dialog("open"); 
 });
 
 
 $("#p_pnum").keydown(function(e){
	  if(e.keyCode == '13'){
		  pnum_open();
		} 
 });
 
 
$("#pnum_contents").delegate('tr','click', function() {
	
	
	var $row = $(this).closest("tr"),
		$nr1 = $row.find(".nr1").text();	//No
		$nr2 = $row.find(".nr2").text();	//model_code
		$nr3 = $row.find(".nr3").text();	//model_name
		$nr4 = $row.find(".nr4").text();	//code
		$nr5 = $row.find(".nr5").text();	//revcode

		
		$("#temp_code").val($nr2);
		$("#temp_name").val($nr3);
		$("#temp_pcode").val($nr4);
		$("#temp_revcode").val($nr5);
		
		
		
		
	var index = 0;
	$("#pnum_contents > tr").each(function(){
		if($nr2 == codeArray[index]){
			$(this).css("background-color","#B2CCFF");						
		}else{						
			$(this).css("background-color","#fff");
		}	
		index++;
	});
});
		
		
		
	$("#searchbtn").on("click",function(){
//		$("#loading").show();

//		xr_manageList();
		
		
		
	});
		
		
	
/*다이얼로그*/
	var pnumDialog = $("#pnum-form").dialog({
		autoOpen:false,
		height:650,
		width:640,
		modal:false,
		stack:false,
		buttons:{
			"선 택":function(){
				$("#s_pnum").val($("#temp_code").val());
				
				pnumDialog.dialog("close");
			},
			"닫 기":function(){
				$("#p_pnum").val("");
				pnumDialog.dialog("close");
			}
		}
	});
	
	
	
	
	commentDialog = $("#comment-form").dialog({
	      autoOpen: false,
	      height: 320,
	      width: 440,
	      modal: false,
	      stack:false,
	      buttons: {		    	  
		        "저 장": function() {
		        	var cmt_time = $("#cmt_time").val();		//클릭한 날짜+시간
		        	var cmt_comment = $("#cmt_comment").val();	//입력한 코멘트명
		        	var pno = $("#s_pnum").val();
		        	
		        	$.post("i003001_comment.jsp",{
		        		"time":cmt_time,
		        		"cmt":cmt_comment,
		        		"pno":pno
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
	var xChart;
	var rChart;
	
	
	
	function xChart_load(){
		xChart = bb.generate({
		      data: {
			        json: x_chartData,
			        keys: {
			        	y:"avg",
						value:["avg","ucl","cl","lcl","usl","lsl","c_down","c_up"]
			        },
			        colors:{
			        	"usl":"#FF0000",
			        	"lsl":"#FF0000",
			        	"ucl":"#0000FF",
			        	"lcl":"#0000FF",
			        	"cl":"#00FF00",
			        	"avg":"#000000",
			        	"c_down":"#8E4EB2",
			        	"c_up":"#E51BCD"
			        },			        
			        onclick: function(d){
//			        	console.log(d.index);
			        	
						$.ajax({
							type : "POST",
							url : "l003001_onclick.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"rowId":d.index,
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"pno":$("#s_pnum").val()
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
//										console.log("regtime : "+rows[i].regtime);
//										console.log("cmt : "+rows[i].cmt);
										$("#cmt_time").val(rows[i].regtime);
										$("#cmt_comment").val(rows[i].cmt);
										
										commentDialog.dialog("open");
										
									}
								}
							}
						});						
			        },
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "c_down" || id == "c_up"){
				    			 
//				    			console.log(v);
								if(v != null){
									//g.bb-chart-text.bb-target.bb-target-qun text
									//text 대신에 bb-text-(0 -> i)
//									console.log(i);
//									console.log(v);
									
									
//					console.log($("g.bb-chart-text.bb-target.bb-target-qun.bb-text-"+i));
									
									
//									console.log(c3_qunArray.shift());
									
									
									
									var v_temp = cmtArray.pop();
									
									if(typeof v_temp == 'undefined'){
										r_v = v_temp;
									}else{
										r_v = v_temp.replace("_","\n");
//										r_v = v_temp;
//										console.log(r_v);
									}
		
//									console.log(r_v);									
								}
				    		 }
				    		 
				    		 
				    		 return r_v;
				    	 }
				    	 ,position: {
					            "c_up": {x: 0, y: 5},
					            "c_down": {x: 0, y: 28}
					         }				    	 
				     },
		      },
		      legend: {
		    	    show: false
		    	  },
			  axis:{
		      	y: {			      
		    		tick:{
		    			count:3,
		    			format: function(x) { return x.toFixed(2); },
		    			text:{
		    				
		    				position:{
		    					y:8
		    				}
		    			}
		    		}
			      },
			    x:{
			    	tick:{
			    		format:function(x){
			    			return (x+1);
			    		}
			    	}
			    }

			  },
			  line: {
				    point: [
				      "avg","c_up","c_down"
				    ],
		    	   classes: 		    		   
		    		[
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data2",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1"
				    ]
				  },
			  tooltip:{
				  format:{
					  title:function(x){
//						  console.log(x);
						  return dtArray[x];
					  }
				  }
			  },
		      point: {
		    	     r: function(d) {
		    	    	 var r_val = "0";
		    	         if(d.id == "c_down" || d.id == "c_up"){
		    	        	 r_val = "5";
		    	         }else{
		    	        	 r_val = "4";
		    	         }
		    	         return r_val;
		    	     },
		    	     pattern:[
		    	      	"circle",
						"<polygon points='7.5 0 0 15 15 15'></polygon>",
						"<polygon points='15 7.5 7.5 20 0 7.5'></polygon>"
		    	      ]
		    	     
		      },
			  
			  bindto: "#x_chart"
			});
	}
	
	
	
	
	
	function rChart_load(){
		rChart = bb.generate({
		      data: {
			        json: r_chartData,
			        keys: {
			        	y:"range",
						value:["range","ucl","cl"]
			        }
		      },
		      legend: {
		    	    show: false
		    	  },
			  axis:{
		      	y: {			      
		    		tick:{
		    			count:3,
		    			format: function(x) { return x.toFixed(2); },
		    			text:{
		    				position:{
		    					y:8
		    				}
		    			}
		    			
		    		}
			      },
			    x:{
			    	tick:{
			    		format:function(x){
			    			return (x+1);
			    		}
			    	}
			    }
				  
			  },
			  line: {
				    point: [
				      "range"
				    ],
		    	   classes: 		    		   
			    		[
			    	     "line-class-data1",
			    	     "line-class-data2",
			    	     "line-class-data1"
					    ]				    
				  },
				  tooltip:{
					  format:{
						  title:function(x){
//							  console.log(x);
							  return dtArray[x];
						  }
					  }
				  },				  
			  bindto: "#r_chart"
			});
	}	
	
	
	
</script>

	<form action="" id="imgForm" name="imgForm" action="l003001_capture.jsp" method="post" >
		<input type="hidden" id="imgData" name="imgData"/>
	</form>

<input type="hidden" id="temp_code"/>
<input type="hidden" id="temp_name"/>
<input type="hidden" id="temp_pcode"/>
<input type="hidden" id="temp_revcode"/>
</body>
</html>