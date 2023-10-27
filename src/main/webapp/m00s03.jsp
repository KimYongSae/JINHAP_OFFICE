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
<link rel="stylesheet" href="resources/css/billboard4.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard4.js"></script>


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
    height: 561px;

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
		font-style:normal;
		font-weight:normal;
		src:url("fonts/headline.TTF") format("ttf");
	}
	
	/*3*/
	#chart3 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart3 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart3 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart3 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart3 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}
	
	/*4*/
	#chart4 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart4 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart4 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart4 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart4 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}	
	
	/*5*/
	#chart5 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart5 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart5 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart5 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart5 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}

	/*6*/
	#chart6 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart6 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart6 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart6 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart6 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}

	/*7*/	
	#chart7 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart7 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart7 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart7 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart7 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}	
	
	/*8*/
	#chart8 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart8 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart8 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart8 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart8 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}	
	
	/*9*/
	#chart9 .bb-title { 
		font-size: 30pt; 
		font-family:headline; 
		font-weight: bold;
		text-align:cetner;
	}
		
	#chart9 .bb-axis-x tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}
	
	#chart9 .bb-axis-y tspan{
		font-size:13pt;
		font-weight:700;
		font-family:headline;
	}	
	
	#chart9 .bb-axis-x tspan:last-child{x:-20;} 
	
	#chart9 .bb-xgrid {
		stroke: black; 
		stroke-dasharray:0;
	}	
	
	
	/*끝*/
	.line-class-data1 {stroke-width: 3px; }
	
	.line-class-data2 {stroke-width: 5px; }
	.line-class-data3 {stroke-width: 5px; }
	.line-class-data4 {stroke-width: 5px; }
	.line-class-data5 {stroke-width: 5px; }
	.line-class-data11 {stroke-width: 5px; }
	.line-class-data12 {stroke-width: 5px; }
	.line-class-data13 {stroke-width: 5px; }
	.line-class-data14 {stroke-width: 5px; }
	
	.line-class-temper1 {stroke-width: 7px; }
		
	g.bb-chart-text.bb-target.bb-target-tem text{
		font-size:20pt;
		font-weight:700;
		font-family:headline;		
	}

	g.bb-chart-text.bb-target.bb-target-qun text{
		font-size:20pt;
		font-weight:700;
		font-family:headline;		
	}

	g.bb-chart-text.bb-target.bb-target-sign text{
		font-size:20pt;
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
	<div id="loading" style="display:none;">
		<img id="loading-image" src="resources/img/loading2.gif" alt="Loading..." />
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
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">모니터링 - 연속로 트렌드</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 90px; text-align: right;">시작시간 : </label>
						</div>
						
						<!-- 발생일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" id="s_sdate" name="s_sdate" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="s_stime" name="s_stime" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="00:00:00"
							onkeyup="auto_time_format(event, this);"/>
						</div>						
						
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 90px; text-align: right;">종료시간 : </label>
						</div>						
						
						
						<!-- 해제일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_edate" name="s_edate" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="s_etime" name="s_etime" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="23:59:59"
							onkeyup="auto_time_format(event, this);"/>
						</div>						
						
						<!-- 설비 선택 -->
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 50px; text-align: right;">설비 : </label>
						</div>
						<div class="form-group">
							<select class="form-control input-sm datepicker" 
							id="s_hogi" name="s_hogi" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family:headline;
							padding-top:1px; padding-bottom:1px;"
							onchange="hogiChange();"
							>
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
								style="margin-top:6px; height: 31px; width: 120px; 
								font-size:14pt; font-family:headline; font-weight:700;
								padding-top:1px; padding-bottom:1px;" 
								id="searchbtn">
								<i class="fa fa-search"></i> 검 색</button>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 90px; text-align: right;">이력검색 : </label>
						</div>					
						
						<div class="form-group">
							<input style="width:30px;height:30px;" type="checkbox" 
							id="list_yn" name="list_yn" value="R">
							<!-- R : 실시간 -->
							<!-- H : 이력검색 -->						
						</div>	
						
															
				</form>
            </header>
            
            <div id="collapse4" class="body">
            	<div class="row" >
            		<div class="col-xs-10">
            			<div id="chart3"></div>
            			<div id="chart4"></div>
            			<div id="chart5"></div>
            			<div id="chart6"></div>
            			<div id="chart7"></div>
            			<div id="chart8"></div>
            			<div id="chart9"></div>
            		</div>
            		
            		
            		<div class="col-xs-2">
            			<div class="row">
	            			<div class="col-xs-7">
	            				<div id="legend3"></div>
	            				<div id="legend4"></div>
	            				<div id="legend5"></div>
	            				<div id="legend6"></div>
	            				<div id="legend7"></div>
	            				<div id="legend8"></div>
	            				<div id="legend9"></div>
	            			</div>
	            			
	            			<div class="col-xs-5">
	            				<div id="tooltip3"></div>
	            				<div id="tooltip4"></div>         				            				
	            				<div id="tooltip5"></div>
	            				<div id="tooltip6"></div>
	            				<div id="tooltip7"></div>
	            				<div id="tooltip8"></div>
	            				<div id="tooltip9"></div>
	            			</div>
	            		</div>
	            		
	            		
	            		
	            		<div class="row">
	            			<div class="col-xs-12">
								<label class="control-label" 
								style="font-size: 12pt; font-family:headline; 
										color:#8C8C8C; display:inline-block; 
										width: 60px; text-align: center;
										margin-bottom:1px;"> 날  짜 </label>	
										            			
								<input type="text" class="form-control input-sm" 
								id="n_date" name="n_date"  readonly="readonly" 
								style="margin-top:1px; height: 30px;
									font-size: 16pt; font-family:headlline;
									padding:1px; display:inline-block;
									width:150px; background-color:white;
									text-align:center;"/>
							</div>									            			
	            		</div>
	            		
	            		
	            		
	            		<div class="row">
	            			<div class="col-xs-12">
								<label class="control-label" 
								style="font-size: 12pt; font-family:headline; 
										color:#8C8C8C; display:inline-block; 
										width: 60px; text-align: center;
										margin-bottom:1px;"> 시  간 </label>	
										           
										            			
								<input type="text" class="form-control input-sm" 
								id="n_time" name="n_time" readonly="readonly" 
								style="margin-top:1px; height: 30px;
								font-size: 16pt; font-family:headline;
								padding:1px; display:inline-block;
								width:150px; background-color:white;
								text-align:center;"/>
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
	/*전역변수*/
	var jsonData3; var jsonData4; var jsonData5;
	var jsonData6; var jsonData7; var jsonData8; var jsonData9;
	
	var chart3; var chart4; var chart5;
	var chart6; var chart7; var chart8; var chart9;
	
	var x3=0; var x4=0; var x5=0;
	var x6=0; var x7=0; var x8=0; var x9=0;
	
	var c3_signArray; var c4_signArray; var c5_signArray;
	var c6_signArray; var c7_signArray; var c8_signArray; var c9_signArray;
	
	var c3_qunArray; var c4_qunArray; var c5_qunArray;
	var c6_qunArray; var c7_qunArray; var c8_qunArray; var c9_qunArray;
	
	var c3_temArray; var c4_temArray; var c5_temArray;
	var c6_temArray; var c7_temArray; var c8_temArray; var c9_temArray;
	

	
	function leadingZero(n, digits){
		var zero = "";
		n = n.toString();
		
		if(n.length < digits){
			for(i=0; i<digits - n.length; i++){
				zero += "0";
			}
		}
		return zero+n;
	}
	
	
	function date_search(){
		
		$.ajax({
			type : "POST",
			url : "lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					$("#s_sdate").val(rsAr[0].b_date);
					$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#s_edate").val(rsAr[0].a_date);
					$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					
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
		
		
		/*
		
		
		//현재시간 Date
		var now = new Date();
		
		var tdate1 = now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10);
		var tdate2 = now.toUTCString().substring(0, 4)+"-"+now.toUTCString().substring(5, 7)+"-"+now.toUTCString().substring(8, 10);
		var y = now.getFullYear();

		
		var m = now.getMonth()+1;
		var r_m = "";
		if(now.getMonth()+1 <=9){
			r_m = "0"+m;
		}else{
			r_m = m;
		}		
		

		var d = now.getDate();
		var r_d = "";
		if(now.getDate() <=9){
			r_d = "0"+d;
		}else{
			r_d = d;
		}		

//		console.log(tdate2);
//		console.log(tdate1);
		var tdate = y+"-"+r_m+"-"+r_d;
		
//		console.log(tdate);
		//시작일
		$("#s_sdate").val(tdate);
		
		//종료일
		$("#s_edate").val(tdate);

		var after_time = now.getTime() + (1000 * 60 * 60 * 1 );
		now.setTime(after_time);		
		
		//종료시간
		$("#s_etime").val(leadingZero(now.getHours(),2)+":"+"00:00");
		
		var before_time = now.getTime() - (1000 * 60 * 60 * 2 );
		now.setTime(before_time);
		
		//시작시간
		$("#s_stime").val(leadingZero(now.getHours(),2)+":"+"00:00");		
		*/
	}
	
	
	
	/*로드*/
	$(function(){
		fn_check();
		list_disable();
		
		
		
		c3_qunArray = new Array(); c4_qunArray = new Array(); c5_qunArray = new Array();
		c3_temArray = new Array(); c4_temArray = new Array(); c5_temArray = new Array();
		c3_signArray = new Array(); c4_signArray = new Array(); c5_signArray = new Array();

		c6_qunArray = new Array(); c7_qunArray = new Array(); c8_qunArray = new Array();
		c6_temArray = new Array(); c7_temArray = new Array(); c8_temArray = new Array();
		c6_signArray = new Array(); c7_signArray = new Array(); c8_signArray = new Array();
		c9_qunArray = new Array();
		c9_temArray = new Array();
		c9_signArray = new Array();
		
		$("#chart3").show(); $("#legend3").show(); $("#tooltip3").show();
		$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
		$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
		$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
		$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
		$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
		$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
		
//		date_search();
//		$("#loading").show();
		
/*
		$.ajax({
			type : "POST",
			url : "lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					$("#s_sdate").val(rsAr[0].b_date);
					$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#s_edate").val(rsAr[0].a_date);
					$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					
					date_interval = setInterval('start_date()',60000);					
					
					data_load3();
				
					
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
*/
		
		jsonData = new Object();
//		data_load3();
					
		
	});	
	
	
	/*함수*/
	
	
	
	function list_disable(){
		$("#s_sdate").attr("disabled",true);
		$("#s_stime").attr("disabled",true);
		
		$("#s_edate").attr("disabled",true);
		$("#s_etime").attr("disabled",true);
		
//		$("#s_hogi").attr("disabled",true);
		$("#searchbtn").attr("disabled",true);
	}
	
	function list_enable(){
		$("#s_sdate").removeAttr("disabled");
		$("#s_stime").removeAttr("disabled");
		
		$("#s_edate").removeAttr("disabled");
		$("#s_etime").removeAttr("disabled");
		
//		$("#s_hogi").removeAttr("disabled");
		$("#searchbtn").removeAttr("disabled");
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

	//3호기
	function chart3_generate(){
		chart3= bb.generate({
			size:{
				width:1460,
				height:660
			}				
			,title:{
				text: "HT-QT3",
				position:"center"
			},
		      data: {
		        json: jsonData3,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					value: 
						 [
						  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"
					     ]
		        },
		        onclick: function(d, element) {
//		        	console.log(d);
		        	
		        	
					$.ajax({
						type : "POST",
						url : "l000005_onover.jsp",
						cache : false,
						dataType : "json",
						data : {'time':new Date().getTime(),
								"sdate":$("#s_sdate").val(),
								"edate":$("#s_edate").val(),
								"stime":$("#s_stime").val(),
								"etime":$("#s_etime").val(),
								"rowId":d.index,
								"table":"3"
								},
						success : function(rsJson) {
							if (rsJson && rsJson.status == "ok") {
								var rows = rsJson.rows;
								for(var i=0; i<rows.length; i++){
									$("#n_date").val(rows[i].tdate1);
									$("#n_time").val(rows[i].ttime1);
								}
//								console.log(over_index);
							}
						}
					});
				},
			     labels:{
			    	 format: function(v,id,i,j){
			    		 
			    		 var r_v = "";
			    		 if(id == "qun"){
//			    			console.log(id);
							if(v != null){
								r_v = c3_qunArray.shift();
								
								
							}				    			
			    		 }else if(id == "tem"){
			    			 if(v != null){
			    				 //bb-chart-texts
			    				 //bb-target-tem 
			    				 // bb-text bb-text-30
//			    				 $("#chart3 .bb-chart-texts .bb-target-tem .bb-text-"+i).css("font-size","18pt;");
			    				 r_v = c3_temArray.shift();
//			    			 	console.log(j);
			    			 }
			    		 }else if(id == "sign"){
			    			 if(v != null){
			    				 r_v = c3_signArray.shift();
			    			 }
			    		 }

			    		 return r_v;
			    	 },
			    	 position: {
				            "qun": {x: -240, y: -10},
				            "tem": {x: -240, y: -10}
				         }
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
			    	 "fw":"#FFBB00",
			    	 "mw":"#ABF200",
			    	 "oil":"#800080",
			    	 "cp":"#993300",
			    	 "co2":"#456456",
			    	 "c_detect":"#654654",
			    	 "qun":"#8E4EB2",
			    	 "tem":"#E51BCD",
			    	 "sign":"#5D5D5D",
			     }			        
				
//			     ,labels:false
		      },			      
		      type:{
		    	  
		    	"q1":"line","q2":"line","q3":"line","q4":"line",
		    	"t1":"line","t2":"line","t3":"line","t4":"line",
		    	"fw":"line","mw":"line","oil":"line","cp":"line",
		    	"co2":"line","c_detect":"line",
		    	"qun":"scatter",
		    	"tem":"scatter",
		    	"sign":"scatter"
		      },line: {
		    	   classes: [
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",
		    	     "line-class-data1",

		    	     "line-class-qun1",
		    	     "line-class-temper1",
		    	     "line-class-end1"
		    	             ]
		    	          },
					      grid:{
						    	x:{
						    		show:true
						    	},
						    	front: false
						      },
		      point: {
		    	     r: function(d) {
		    	    	 var r_val = "0";
		    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
		    	        	 r_val = "5";
		    	         }else{
		    	        	 r_val = "0.01";
		    	         }
		    	         return r_val;
		    	     },
		    	     pattern:[
		    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
		    	      	"circle","circle","circle","circle","circle","circle","circle","circle",
		    	      	"circle","circle","circle","circle","circle","circle",
//		    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
						"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//		    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
						"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
		    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
		    	      ]
		    	     
		      },
		      axis: {
		    		  rotated: true,
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
						min:10,
						max:1200,
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
	              	},
	              	onzoom:function(domain){
//	              		console.log(domain); labels:false
//	              		chart3.config("data.labels.qun",true);
//	              		chart3.config("data.labels.tem",true);

//						console.log(chart3.data);
						
						
	              	}
	            },legend:{
	    		    contents: {
	  			      bindto: "#legend3",
	  			      template: function(title, color) {
	  					var result = "";
	  					var t_value = "";
	  						if(title == "q1"){
	  							t_value = "퀜칭 1";
	  						}else if(title == "q2"){
	  							t_value = "퀜칭 2";
	  						}else if(title == "q3"){
	  							t_value = "퀜칭 3";
	  						}else if(title == "q4"){
	  							t_value = "퀜칭 4";
	  						}else if(title == "t1"){
	  							t_value = "템퍼링 1";
	  						}else if(title == "t2"){
	  							t_value = "템퍼링 2";
	  						}else if(title == "t3"){
	  							t_value = "템퍼링 3";
	  						}else if(title == "t4"){
	  							t_value = "템퍼링 4";
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
	  						}else if(title == "c_detect"){
	  							t_value = "변성로";
	  						}else if(title == "qun"){
	  							t_value = "퀜칭투입";
	  						}else if(title == "tem"){
	  							t_value = "템퍼링투입";
	  						}else if(title == "sign"){
	  							t_value = "작업자싸인";
	  						}
	  						
	  						
	  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
					'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
					       		'}}'
					       }
					  },
		      bindto: "#chart3"
		    });		
	}
	
	//4호기
		function chart4_generate(){
			chart4= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT4",
					position:"center"
				},
			      data: {
			        json: jsonData4,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"4"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c4_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c4_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c4_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },
				    	 position: {
					            "qun": {x: -240, y: -10},
					            "tem": {x: -240, y: -10}
					         }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",
				    	 "co2":"#456456",
				    	 "c_detect":"#654654",
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
					
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line","q5":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter" 
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     },
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "q5"){
		  							t_value = "퀜칭 5";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart4"
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
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil",
						  "co2","c_detect",
						  "cp","qun","tem","sign"					      
					     ]
		        }
			});				
		}
		
		
		//5호기
		function chart5_generate(){
			chart5= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT5",
					position:"center"
				},
			      data: {
			        json: jsonData5,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"5"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c5_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c5_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c5_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },
				    	 position:{
				    		 "qun": {x: -240, y: -10},
				    		 "tem": {x: -240, y: -10}
				    	 }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",
				    	 "co2":"#456456",
				    	 "c_detect":"#654654",				    	 
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
					
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line","q5":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter"
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     }
			    	     ,
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "q5"){
		  							t_value = "퀜칭 5";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";	
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart5"
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
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil",
						  "co2","c_detect",
						  "cp","qun","tem","sign"					      
					     ]
		        }
			});				
		}		

		
		/*6호기*/
		function chart6_generate(){
			chart6= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT6",
					position:"center"
				},
			      data: {
			        json: jsonData6,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"6"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c6_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c6_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c6_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },position:{
				    		"qun":{x: -240, y:-10},
				    		"tem":{x: -240, y:-10}
				    	 }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",	
				    	 "co2":"#456456",
				    	 "c_detect":"#654654",
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
					
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line","q5":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter"
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     }
			    	     ,
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "q5"){
		  							t_value = "퀜칭 5";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart6"
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
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"					      
					     ]
		        }
			});				
		}		
	
		/*7호기*/
		function chart7_generate(){
			chart7= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT7",
					position:"center"
				},
			      data: {
			        json: jsonData7,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"7"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c7_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c7_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c7_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },
				    	 position:{
				    		 "qun":{x: -240, y: -10},
				    		 "tem":{x: -240, y: -10}
				    	 }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",
				    	 "co2":"#456456",				    	 
				    	 "c_detect":"#654654",
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
					
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter"
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     }
			    	     ,
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
		  					return result;
		  			     }
		  			    }
		  			},tooltip: {
					    init: {
						      show: true,
						      x:x7
						    },
						    doNotHide: true,
						      contents: {
						       	bindto: "#tooltip7",
						       	template: '{{' +
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart7"
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
						  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"					      
					     ]
		        }
			});				
		}		
		
		/*8호기*/
		function chart8_generate(){
			chart8= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT8",
					position:"center"
				},
			      data: {
			        json: jsonData8,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"8"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c8_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c8_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c8_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },
				    	 position:{
				    		 "qun":{x: -240, y: -10},
				    		 "tem":{x: -240, y: -10}
				    	 }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",
				    	 "co2":"#456456",				    	 
				    	 "c_detect":"#654654",
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter"
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     }
			    	     ,
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart8"
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
						  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"					      
					     ]
		        }
			});				
		}			
		

		
		/*9호기*/
		function chart9_generate(){
			chart9= bb.generate({
				size:{
					width:1460,
					height:660
				}				
				,title:{
					text: "HT-QT9",
					position:"center"
				},
			      data: {
			        json: jsonData9,
			        keys: {
			        	x:"date1",
			        	y:"q1",
						value: 
							 [
							  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
							  "co2","c_detect",
							  "qun","tem","sign"
						     ]
			        },
			        onclick: function(d, element) {
//			        	console.log(d);
			        	
			        	
						$.ajax({
							type : "POST",
							url : "l000005_onover.jsp",
							cache : false,
							dataType : "json",
							data : {'time':new Date().getTime(),
									"sdate":$("#s_sdate").val(),
									"edate":$("#s_edate").val(),
									"stime":$("#s_stime").val(),
									"etime":$("#s_etime").val(),
									"rowId":d.index,
									"table":"9"
									},
							success : function(rsJson) {
								if (rsJson && rsJson.status == "ok") {
									var rows = rsJson.rows;
									for(var i=0; i<rows.length; i++){
										$("#n_date").val(rows[i].tdate1);
										$("#n_time").val(rows[i].ttime1);
									}
//									console.log(over_index);
								}
							}
						});
					},
				     labels:{
				    	 format: function(v,id,i,j){
//				    		 console.log(id);
				    		 
				    		 var r_v = "";
				    		 if(id == "qun"){
				    			
								if(v != null){
//									console.log(v);
									
									r_v = c6_qunArray.shift();
									
								}				    			
				    		 }else if(id == "tem"){
				    			 if(v != null){
//				    				 r_v = "<span class='control-label' style='font-size:18pt;font-weight:700;font-family:headline;'>"+c4_temArray.shift()+"</span>";
				    				 r_v = c6_temArray.shift();
//				    			 	console.log(j);
				    			 }
				    		 }else if(id == "sign"){
				    			 if(v != null){
				    				 r_v = c6_signArray.shift();
				    			 }
				    		 }
				    		 return r_v;
				    	 },position:{
				    		"qun":{x: -240, y:-10},
				    		"tem":{x: -240, y:-10}
				    	 }
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
				    	 "fw":"#FFBB00",
				    	 "mw":"#ABF200",
				    	 "oil":"#800080",
				    	 "cp":"#993300",	
				    	 "co2":"#456456",
				    	 "c_detect":"#654654",
				    	 "qun":"#8E4EB2",
				    	 "tem":"#E51BCD",
				    	 "sign":"#5D5D5D",
				     }			        
					
//				     ,labels:false
			      },			      
			      type:{
			    	  
			    	"q1":"line","q2":"line","q3":"line","q4":"line","q5":"line",
			    	"t1":"line","t2":"line","t3":"line","t4":"line",
			    	"fw":"line","mw":"line","oil":"line","cp":"line",
			    	"co2":"line","c_detect":"line",
			    	"qun":"scatter",
			    	"tem":"scatter",
			    	"sign":"scatter"
			      },line: {
			    	   classes: [
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     "line-class-data1",
			    	     
			    	     "line-class-qun1",
			    	     "line-class-temper1",
			    	     "line-class-end1"
			    	             ]
			    	          },
						      grid:{
							    	x:{
							    		show:true
							    	},
							    	front: false
							      },
			      point: {
			    	     r: function(d) {
			    	    	 var r_val = "0";
			    	         if(d.id == "tem" || d.id == "qun" || d.id == "sign"){
			    	        	 r_val = "5";
			    	         }else{
			    	        	 r_val = "0.01";
			    	         }
			    	         return r_val;
			    	     }
			    	     ,
			    	     pattern:[
			    	             //<text x='20' y='-10' style='font-family:headline;font-size:10pt'></text>
			    	      	"circle","circle","circle","circle","circle","circle","circle","circle","circle",
			    	      	"circle","circle","circle","circle","circle","circle",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
//			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>",
							"<polygon points='25 7.5 7.5 0 7.5 15'></polygon>",
			    	      	"<g><circle cx='10' cy='25' r='10'></circle><rect x='5' y='20' width='10' height='10' style='fill:#fff'></rect></g>"
			    	      ]
			      },
			      axis: {
			    		  rotated: true,
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
							min:10,
							max:1200,
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
		  			      bindto: "#legend9",
		  			      template: function(title, color) {
		  					var result = "";
		  					var t_value = "";
		  						if(title == "q1"){
		  							t_value = "퀜칭 1";
		  						}else if(title == "q2"){
		  							t_value = "퀜칭 2";
		  						}else if(title == "q3"){
		  							t_value = "퀜칭 3";
		  						}else if(title == "q4"){
		  							t_value = "퀜칭 4";
		  						}else if(title == "q5"){
		  							t_value = "퀜칭 5";
		  						}else if(title == "t1"){
		  							t_value = "템퍼링 1";
		  						}else if(title == "t2"){
		  							t_value = "템퍼링 2";
		  						}else if(title == "t3"){
		  							t_value = "템퍼링 3";
		  						}else if(title == "t4"){
		  							t_value = "템퍼링 4";
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
		  						}else if(title == "c_detect"){
		  							t_value = "변성로";
		  						}else if(title == "qun"){
		  							t_value = "퀜칭투입";
		  						}else if(title == "tem"){
		  							t_value = "템퍼링투입";
		  						}else if(title == "sign"){
		  							t_value = "작업자싸인";
		  						}
		  						
		  						result += "<span style='width:140px;height:30px;display:block;color:white;background-color:" + color + ";padding-top:5px;padding-left:2px;margin:1px;font-size:18pt;'>"+t_value+"</span>";
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
						       	bindto: "#tooltip9",
						       	template: '{{' +
						'<span style=width:100px;height:30px;padding-top:5px;padding-left:10px;margin:1px;font-size:18pt;display:block;color:white;background-color:{=COLOR}> {=VALUE}</span>' +
						       		'}}'
						       }
						  },
			      bindto: "#chart9"
			    });
		}
		
		
		
		
		function chart9_load(){
			chart9.load({
		        json: jsonData9,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					 value: 
						 [
						  "q1","q2","q3","q4","q5","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"					      
					     ]
		        }
			});				
		}		
	
		
		
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

	    
	    function auto_time_format( e, oThis ){
	        
	        var num_arr = [ 
	            97, 98, 99, 100, 101, 102, 103, 104, 105, 96,
	            48, 49, 50, 51, 52, 53, 54, 55, 56, 57
	        ]
	        
	        var key_code = ( e.which ) ? e.which : e.keyCode;
	        if( num_arr.indexOf( Number( key_code ) ) != -1 ){
	        
	            var len = oThis.value.length;
	            if( len == 2 ) oThis.value += ":";
	            if( len == 5 ) oThis.value += ":";
	        
	        }
	    }	    

	//3호기 데이터 불러오는 함수
	function data_load3(){
		$.ajax({
			type : "POST",
			url : "l000005_3.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData3 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;
					
//					c3_qunArray = new Array();
//					c3_temArray = new Array();
//					c3_signArray = new Array();

					c3_qunArray = qArray;
					c3_temArray = tArray;
					c3_signArray = sArray;
					
					
					x3 = rows2.length -1;

					if(typeof chart3 == "undefined"){					
						chart3_generate();						
						start_interval = setInterval('start_chart()',60000);		
						$("#loading").hide();

					}else{
						chart3_load();
							
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
		
	//4호기 데이터 불러오는 함수
	function data_load4(){
		$.ajax({
			type : "POST",
			url : "l000005_4.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData4 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;

					c4_qunArray = qArray;
					c4_temArray = tArray;
					c4_signArray = sArray;

					x4 = rows2.length-1;
					
					
					if(typeof chart4 == "undefined"){
						chart4_generate();

					}else{
						chart4_load();
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

	//5호기 데이터 불러오는 함수
	function data_load5(){
		$.ajax({
			type : "POST",
			url : "l000005_5.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData5 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;
	
					c5_qunArray = qArray;
					c5_temArray = tArray;
					c5_signArray = sArray;
					
					x5 = rows2.length - 1;

					if(typeof chart5 == "undefined"){
						chart5_generate();

					}else{
						chart5_load();

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
	
	//6호기 데이터 불러오는 함수
	function data_load6(){
		$.ajax({
			type : "POST",
			url : "l000005_6.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData6 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;
					
					c6_qunArray = qArray;
					c6_temArray = tArray;
					c6_signArray = sArray;
						
						
					x6 = rows2.length -1;

					
					if(typeof chart6 == "undefined"){
						chart6_generate();
					}else{
						chart6_load();
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
	
	
	
	//7호기 데이터 불러오는 함수
	function data_load7(){
		$.ajax({
			type : "POST",
			url : "l000005_7.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData7 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;
	
					c7_qunArray = qArray;
					c7_temArray = tArray;
					c7_signArray = sArray;
						
						
					x7 = rows2.length -1;
					
					if(typeof chart7 == "undefined"){
						chart7_generate();
					}else{
						chart7_load();
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
	
	//8호기 데이터 불러오는 함수
	function data_load8(){
		$.ajax({
			type : "POST",
			url : "l000005_8.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData8 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;

					c8_qunArray = qArray;
					c8_temArray = tArray;
					c8_signArray = sArray;
						
						
					x8 = rows2.length -1;

					
					if(typeof chart8 == "undefined"){
						chart8_generate();
					}else{
						chart8_load();
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
	
	
	//9호기 데이터 불러오는 함수
	function data_load9(){
		$.ajax({
			type : "POST",
			url : "l000005_9.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val(),
					"stime":$("#s_stime").val(),
					"etime":$("#s_etime").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rows2 = rsJson.rows;
					jsonData9 = rows2;
					
					var qArray = rsJson.qarray;
					var tArray = rsJson.tarray;
					var sArray = rsJson.sarray;

					c9_qunArray = qArray;
					c9_temArray = tArray;
					c9_signArray = sArray;
						
						
					x9 = rows2.length -1;

					
					if(typeof chart9 == "undefined"){
						chart9_generate();
					}else{
						chart9_load();
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
	
	
	
		/*인터벌*/

		var start_interval;
		var start_interval2;
		var start_interval3;
		var start_interval4;
		var start_interval5;
		var start_interval6;
		var start_interval7;
		
		
		var date_interval;
		
		function start_date(){
			date_search();
		}
		 
		function start_chart(){
			
			
			data_load3();		
			
			
			setTimeout(function(){
				//3호기
				chart3_load();
			},500);
		 }
		
		function start_chart2(){
			
			data_load4();
			
			setTimeout(function(){
				//4호기
				chart4_load();				
			},500);
			
		 }			
		
		function start_chart3(){
			
			data_load5();
			
			setTimeout(function(){
				//5호기
				chart5_load();				
			},500);
			
		 }		

		function start_chart4(){
			
			data_load6();
			
			setTimeout(function(){
				//6호기
				chart6_load();				
			},500);
			
		 }		
		
		function start_chart5(){
			
			data_load7();

			setTimeout(function(){
				//7호기
				chart7_load();				
			},500);
			
		 }		
		
		
		function start_chart6(){
			
			data_load8();
			
			setTimeout(function(){
				//8호기
				chart8_load();				
			},500);
			
		 }		
		
		
		function start_chart7(){
			
			data_load9();
			
			setTimeout(function(){
				//9호기
				chart9_load();				
			},500);
			
		 }		
		
		
		function chart3_load(){
			chart3.load({
		        json: jsonData3,
		        keys: {
		        	x:"date1",
		        	y:"q1",
					 value: 
						 [
						  "q1","q2","q3","q4","t1","t2","t3","t4","fw","mw","oil","cp",
						  "co2","c_detect",
						  "qun","tem","sign"					      
					     ]
		        }
			});
		}
		
		
		/*이벤트*/
		
		$("#list_yn").on("click",function(){
			var h_number = $("#s_hogi").val();
//			console.log(h_number);
			
			
			
//			console.log($("#list_yn").is(":checked"));
			if($("#list_yn").is(":checked") == true){
				
				
				//히스토리컬
				list_enable();
				clearInterval(date_interval);

				
				clearInterval(start_interval);
				clearInterval(start_interval2);
				clearInterval(start_interval3);
				clearInterval(start_interval4);
				clearInterval(start_interval5);
				clearInterval(start_interval6);
				clearInterval(start_interval7);
				
				
			}else{
				//실시간
				list_disable();
				$("#loading").show();
				
				date_search();
				
				date_interval = setInterval('start_date()',60000);
				
					if(h_number == '1'){
						
						data_load3();
						
						setTimeout(function(){
							if(typeof chart3 == "undefined"){					
								chart3_generate();						
							}else{
								chart3_load();
									
							}		
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval);
							}else{
								//실시간
								start_interval = setInterval('start_chart()',60000);		
								clearInterval(start_interval2);
								clearInterval(start_interval3);
								clearInterval(start_interval4);
								clearInterval(start_interval5);
								clearInterval(start_interval6);
								clearInterval(start_interval7);
								
							}
							
							
							$("#chart3").show(); $("#legend3").show(); $("#tooltip3").show();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
							
							$("#loading").hide();
						},500);
						
						
					}else if(h_number == '2'){
						data_load4();
						
						setTimeout(function(){
							
							if(typeof chart4 == "undefined"){
								chart4_generate();

							}else{
								chart4_load();
							}				
							
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval2);
							}else{
								//실시간
								start_interval2 = setInterval('start_chart2()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval3);
								clearInterval(start_interval4);
								clearInterval(start_interval5);
								clearInterval(start_interval6);
								clearInterval(start_interval7);

							}
							
							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").show(); $("#legend4").show(); $("#tooltip4").show();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
							
							$("#loading").hide();
						},500);

					}else if(h_number == '3'){
						data_load5();
						
						setTimeout(function(){

							
							if(typeof chart5 == "undefined"){
								chart5_generate();

							}else{
								chart5_load();

							}						
							
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval3);
							}else{
								//실시간
								start_interval3 = setInterval('start_chart3()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval2);
								clearInterval(start_interval4);
								clearInterval(start_interval5);
								clearInterval(start_interval6);
								clearInterval(start_interval7);
							}
							
							
							
							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").show(); $("#legend5").show(); $("#tooltip5").show();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
							
							$("#loading").hide();
						},500);
						
					}else if(h_number == '4'){
						data_load6();
						
						setTimeout(function(){
							
							if(typeof chart6 == "undefined"){
								chart6_generate();
							}else{
								chart6_load();
							}						
//							console.log(start_interval);
			
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval4);
							}else{
								//실시간
								start_interval4 = setInterval('start_chart4()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval2);
								clearInterval(start_interval3);
								clearInterval(start_interval5);
								clearInterval(start_interval6);
								clearInterval(start_interval7);
//								console.log(start_interval);
							}
			

							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").show(); $("#legend6").show(); $("#tooltip6").show();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();

							$("#loading").hide();
							
							
						},500);
						
					}else if(h_number == '5'){
						data_load7();
						
						setTimeout(function(){
							if(typeof chart7 == "undefined"){
								chart7_generate();
							}else{
								chart7_load();
							}						
							
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval5);
							}else{
								//실시간
								start_interval5 = setInterval('start_chart5()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval2);
								clearInterval(start_interval3);
								clearInterval(start_interval4);
								clearInterval(start_interval6);
								clearInterval(start_interval7);
							}
								
							
							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").show(); $("#legend7").show(); $("#tooltip7").show();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
							

							$("#loading").hide();
							
						},500);
									
					}else if(h_number == '6'){
						data_load8();
						
						setTimeout(function(){
							
							if(typeof chart8 == "undefined"){
								chart8_generate();
							}else{
								chart8_load();
							}						
							
								
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval6);
							}else{
								//실시간
								start_interval6 = setInterval('start_chart6()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval2);
								clearInterval(start_interval3);
								clearInterval(start_interval4);
								clearInterval(start_interval5);
								clearInterval(start_interval7);
							}
								
							
							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").show(); $("#legend8").show(); $("#tooltip8").show();
							$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
							
							$("#loading").hide();
							
						},500);
						
					}else if(h_number == '7'){
						data_load9();
						
						setTimeout(function(){
							
							if(typeof chart9 == "undefined"){
								chart9_generate();
							}else{
								chart9_load();
							}						
							
								
							
							if($("#list_yn").is(":checked") == true){
								//이력검색
								clearInterval(start_interval7);
							}else{
								//실시간
								start_interval7 = setInterval('start_chart7()',60000);		
								clearInterval(start_interval);
								clearInterval(start_interval2);
								clearInterval(start_interval3);
								clearInterval(start_interval4);
								clearInterval(start_interval5);
								clearInterval(start_interval6);
							}
								
							
							$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
							$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
							$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
							$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
							$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
							$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
							$("#chart9").show(); $("#legend9").show(); $("#tooltip9").show();
							
							$("#loading").hide();
							
						},500);
						
					}

			}
		});
		
		
		/*
		
			if(num == 1){			
			}else if(num == 2){				
								
				
			}else if(num == 3){				
				
			}else if(num == 4){				
				
			}else if(num == 5){
			
			}else if(num == 6){
				
			}

		
		*/
		
		
		$("#searchbtn").on("click",function(){
			$("#loading").show();

			
			//날짜-시간 초기화
			$("#n_date").val("");
			$("#n_time").val("");
			
			
			var num = $("#s_hogi").val();
//			alert("넘버는 : "+num);


			if(num == 1){				
				data_load3();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval);
					}else{
						//실시간
						start_interval = setInterval('start_chart()',60000);		
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
						
					}
					
					
					$("#chart3").show(); $("#legend3").show(); $("#tooltip3").show();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
				},1000);

			}else if(num == 2){				
				data_load4();
				
				setTimeout(function(){					
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval2);
					}else{
						//실시간
						start_interval2 = setInterval('start_chart2()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);

					}
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").show(); $("#legend4").show(); $("#tooltip4").show();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
				},1000);
								
				
			}else if(num == 3){				
				data_load5();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval3);
					}else{
						//실시간
						start_interval3 = setInterval('start_chart3()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
					}
					
					
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").show(); $("#legend5").show(); $("#tooltip5").show();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
				},1000);
				
			}else if(num == 4){				
				data_load6();
				
				setTimeout(function(){
	
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval4);
					}else{
						//실시간
						start_interval4 = setInterval('start_chart4()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
//						console.log(start_interval);
					}
	

					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").show(); $("#legend6").show(); $("#tooltip6").show();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();

					$("#loading").hide();
					
					
				},1000);
				
			}else if(num == 5){
				data_load7();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval5);
					}else{
						//실시간
						start_interval5 = setInterval('start_chart5()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").show(); $("#legend7").show(); $("#tooltip7").show();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					

					$("#loading").hide();
					
				},1000);
				
			}else if(num == 6){
				data_load8();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval6);
					}else{
						//실시간
						start_interval6 = setInterval('start_chart6()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval7);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").show(); $("#legend8").show(); $("#tooltip8").show();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
					
				},1000);
				
			}else if(num == 7){
				data_load9();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval7);
					}else{
						//실시간
						start_interval7 = setInterval('start_chart7()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").show(); $("#legend9").show(); $("#tooltip9").show();
					
					$("#loading").hide();
					
				},1000);
				
			}
			
			
		});

		
		
		function hogiChange(){
			$("#loading").show();
			
			// 날짜-시간 초기화
			$("#n_date").val("");
			$("#n_time").val("");
			
			
			var num = $("#s_hogi").val();
			
			if(num == 1){				
				data_load3();
				
				setTimeout(function(){	
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval);
					}else{
						//실시간
						start_interval = setInterval('start_chart()',60000);		
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
						
					}
					
					
					$("#chart3").show(); $("#legend3").show(); $("#tooltip3").show();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
//					$("#chart3 .bb-title").text("HT-QT3");
					
					
					$("#loading").hide();
				},1000);

			}else if(num == 2){				
				data_load4();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval2);
					}else{
						//실시간
						start_interval2 = setInterval('start_chart2()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);

					}
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").show(); $("#legend4").show(); $("#tooltip4").show();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
				},1000);
						
						
				
			}else if(num == 3){				
				data_load5();
				
				setTimeout(function(){			
					
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval3);
					}else{
						//실시간
						start_interval3 = setInterval('start_chart3()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
					}
					
					
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").show(); $("#legend5").show(); $("#tooltip5").show();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
				},1000);
				
			}else if(num == 4){				
				data_load6();
				
				setTimeout(function(){
	
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval4);
					}else{
						//실시간
						start_interval4 = setInterval('start_chart4()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
//						console.log(start_interval);
					}
	

					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").show(); $("#legend6").show(); $("#tooltip6").show();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();

					$("#loading").hide();
					
					
				},1000);
				
			}else if(num == 5){
				data_load7();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval5);
					}else{
						//실시간
						start_interval5 = setInterval('start_chart5()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval6);
						clearInterval(start_interval7);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").show(); $("#legend7").show(); $("#tooltip7").show();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();

					$("#loading").hide();
					
				},1000);
				
			}else if(num == 6){
				data_load8();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval6);
					}else{
						//실시간
						start_interval6 = setInterval('start_chart6()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval7);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").show(); $("#legend8").show(); $("#tooltip8").show();
					$("#chart9").hide(); $("#legend9").hide(); $("#tooltip9").hide();
					
					$("#loading").hide();
					
				},1000);
				
			}else if(num == 7){
				data_load9();
				
				setTimeout(function(){
					
					if($("#list_yn").is(":checked") == true){
						//이력검색
						clearInterval(start_interval7);
					}else{
						//실시간
						start_interval7 = setInterval('start_chart7()',60000);		
						clearInterval(start_interval);
						clearInterval(start_interval2);
						clearInterval(start_interval3);
						clearInterval(start_interval4);
						clearInterval(start_interval5);
						clearInterval(start_interval6);
					}
						
					
					$("#chart3").hide(); $("#legend3").hide(); $("#tooltip3").hide();
					$("#chart4").hide(); $("#legend4").hide(); $("#tooltip4").hide();
					$("#chart5").hide(); $("#legend5").hide(); $("#tooltip5").hide();
					$("#chart6").hide(); $("#legend6").hide(); $("#tooltip6").hide();
					$("#chart7").hide(); $("#legend7").hide(); $("#tooltip7").hide();
					$("#chart8").hide(); $("#legend8").hide(); $("#tooltip8").hide();
					$("#chart9").show(); $("#legend9").show(); $("#tooltip9").show();
					
					$("#loading").hide();
					
				},1000);
				
			}
			
			
		}

		/*
		$("#s_hogi").on('change',function(){
			
			
		});
			*/
</script>

</body>
</html> 