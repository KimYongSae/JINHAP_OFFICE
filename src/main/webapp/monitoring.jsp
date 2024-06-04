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
div[aria-describedby="alarm-form3"]{
	top:200px !important;
}

div[aria-describedby="alarm-form4"]{
	top:470px !important;
}

div[aria-describedby="alarm-form5"]{
	top:740px !important;
}

.ui-dialog-titlebar{display:none;}

</style>


</head>

<body onload="init();" data-offset="60" data-target=".navbar">
<!--
	<div id="seolbiManage-form" style="display:none;" title="설비일상점검 ">
		<img id="seolbiManageImg" src="resources/img/heat_seolbimanage.png" alt="" 
		style="width:1000px; height:600px;" />
	</div>
-->
	<div id="error1-form" style="display:none;" title="확인창">
		<span id="error1Span"></span>
	</div>
	<div id="error2-form" style="display:none;" title="확인창">
		<span id="error2Span_1"></span>
		<span id="error2Span_2"></span>
	</div>


	<!-- 3호기 알람폼 -->
	<div id="alarm-form3" style="display:none; background-color:#FFE400; overflow:hidden;" title="알람창">
		<div class="row" style="height:110px; margin-top:20px;">
			<br>
			<span style="font-size:70pt; font-family:headline; font-weight:700; vertical-align: middle;
				text-align: left; color:#FF0000;"
				id="v_hogi3"></span> &nbsp;&nbsp;
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:58px;
				text-align:center; color:#FF0000;"
				id="v_time3"></span><br>
		</div>
		<div class="row" style="height:100px; margin-top:12px;">
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:300px;
				text-align: justify; color:#FF0000;"
				id="v_cmt3"></span>
		</div>
	    <input type="hidden" id="v_cnt3" />
	</div>

	<!-- 4호기 알람폼 -->
	<div id="alarm-form4" style="display:none; background-color:#FFE400; overflow:hidden;" title="알람창">
		<div class="row" style="height:110px; margin-top:20px;">
			<br>
			<span style="font-size:70pt; font-family:headline; font-weight:700; padding-top:50px; vertical-align: middle;
				text-align: left; color:#FF0000;"
				id="v_hogi4"></span> &nbsp;&nbsp;
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:58px;
				text-align:center; color:#FF0000;"
				id="v_time4"></span><br>
		</div>
		<div class="row" style="height:100px; margin-top:12px;">
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:300px;
				text-align: justify; color:#FF0000;"
				id="v_cmt4"></span>
		</div>
	    <input type="hidden" id="v_cnt4" />
	</div>


	<!-- 5호기 알람폼 -->
	<div id="alarm-form5" style="display:none; background-color:#FFE400; overflow:hidden;" title="알람창">
		<div class="row" style="height:110px; margin-top:20px;">
		<br>
			<span style="font-size:70pt; font-family:headline; font-weight:700; padding-top:50px; vertical-align: middle;
				text-align: left; color:#FF0000;"
				id="v_hogi5"></span> &nbsp;&nbsp;
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:58px;
				text-align:center; color:#FF0000;"
				id="v_time5"></span><br>
		</div>
		<div class="row" style="height:100px; margin-top:12px;">
			<span style="font-size:70pt; font-family:headline; font-weight:700; margin-left:300px;
				text-align: justify; color:#FF0000;"
				id="v_cmt5"></span>
		</div>
	    <input type="hidden" id="v_cnt5" />
	</div>


		<div id="kghr-form" style="display:none; background-color:#FFE400;" title="알람창">			
			<div class="row" style="height:180px;">					
				<h1 style="font-size:90pt; font-family:headline; font-weight:700;
					text-align:center; margin-bottom:15px; color:#FF0000;"
					id="v_date2"></h1>
			</div>
			
			<div class="row" style="height:180px;">					
				<h1 style="font-size:90pt; font-family:headline; font-weight:700;
					text-align:center; margin-bottom:15px; color:#FF0000;"
					id="v_time2"></h1>
			</div>
			
			
			<div class="row" style="height:180px;">
				<h1 style="font-size:90pt; font-family:headline; font-weight:700;
					text-align:center; color:#FF0000;"
					id="v_cmt2"></h1>
			</div>

			<div class="row" style="height:180px;">
				<h1 style="font-size:90pt; font-family:headline; font-weight:700;
					text-align:center; color:#FF0000;"
					id="v_cmt22"></h1>
			</div>

		
      		<input type="hidden" id="v_cnt2" />
		</div>


<div id="wrap">

    <div id="header">
		<jsp:include page="header-menu-monitoring.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-bottom:-240px;">
		
	</div>
	<div id="contents">
        
        
        
<div class="content" style="height:960px;"> 
	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
				                            <!--Begin Datatables-->
		<div class="row">
		  <div style="width: 100%; " class="col-lg-12">
		        <div class="box">
			            <div id="collapse4" class="body">
			            	<iframe id="monitor" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>

							<iframe id="monitor2" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>
			            	
							<iframe id="monitor3" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>

							<iframe id="monitor4" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>
			            	
							<iframe id="monitor5" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>
			            	
							<iframe id="monitor6" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>			            				            	
			            	
							<iframe id="monitor7" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>			            				            	
							<iframe id="monitor8" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:910px;">
			            	</iframe>			            				            	
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

	
			<!-- 로그인 끝 -->
		<div id="footer">
		
		<img src="resources/images/jinhap4.gif" style="height:30px;"/>&nbsp;(주)진합&nbsp;&nbsp; <!-- 써니 로고 -->
		Copyright 2023. All Rights Reserved.
			
		</div>
</div>


	<script>
	/*전역변수*/
		
	var kghr_interval = null;
	
	var alarm_interval3 = null;
	var alarm_interval4 = null;
	var alarm_interval5 = null;
	
	var alarm3_chk = false;
	var alarm4_chk = false;
	var alarm5_chk = false;
	
	var pageInterval = null;
	var dateSearchInterval = null;
	
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
		var now = new Date();
		
		
		var y = now.getFullYear();
		var m = date_set(now.getMonth()+1);
		var d = date_set(now.getDate());
		
		var ho = date_set(now.getHours());
		var mi = date_set(now.getMinutes());
		var ss = date_set(now.getSeconds());

/*		
		if(ho+":"+mi == '09:00'){
			//주간에 설비 실시시간 안내시작~
			
		}else if(ho+":"+mi == '10:30'){
			//주간에 설비 실시시간 안내종료~
			
		}else if(ho+":"+mi == '20:30'){
			//야간에 설비 실시시간 안내시작~
			
		}else if(ho+":"+mi == '22:00'){
			//야간에 설비 실시시간 안내종료~
			
		}
*/
	//테스트용	
/*	
		if(ho+":"+mi == '09:00'){
			//주간에 설비 실시시간 안내시작~
			seolbiManageDialog.dialog("open");
		}else if(ho+":"+mi == '10:30'){
			//주간에 설비 실시시간 안내종료~
			seolbiManageDialog.dialog("close");
		}else if(ho+":"+mi == '20:29'){
			//야간에 설비 실시시간 안내시작~
			seolbiManageDialog.dialog("open");
		}else if(ho+":"+mi == '20:30'){
			//야간에 설비 실시시간 안내종료~
			seolbiManageDialog.dialog("close");
		}
*/		
		
	}
	
	
	
	/*
 style="width:700px;"	
 

		size:{
			width:707,
			height:630
		},
	*/
	
	var page_idx = 0;
	var alarm_idx = 0;
	
	var a_cnt = 0;		//알람 인터벌실행시 보여줘야 할 알람이 있는지 없는지 구분
	var k_cnt = 0;		//장입량 인터벌실행시 보여줘야 할 알람이 있는지 없는지 구분
	var all_cnt = 0;	//알람, 장입량 구분값 합산
	
	/*로드*/
	$(function(){

		
		$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide(); 
		$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
		
		
		
		$("#monitor").attr("src","m01s00_monitor.jsp");
//		$("#monitor").attr("src","m01s01_monitor_1.jsp");
	
//		$("#monitor").attr("src","m01s05_ht6_monitor.jsp");
//		$("#monitor").attr("src","s000005_kiosk1.jsp");
//		$("#monitor").attr("src","s001007_kiosk1.jsp");
		
		setTimeout(function(){
			$("#monitor").show();
		},450);
		
//			console.log(pageInterval);
			pageInterval = setInterval('page_switch()',1000);
//			console.log(pageInterval);

//			kghr_interval = setInterval('kghr_list()',1000);

			
//			alarm_interval3 = setInterval('alarm_list3()',1000);
//			alarm_interval4 = setInterval('alarm_list4()',1000);
//			alarm_interval5 = setInterval('alarm_list5()',1000);

			
//			dateSearchInterval = setInterval("date_search()",1000);

	});
	
	
	/*함수*/
	function date_set(v){
		var result = "";
		if(v <= 9){
			result = "0"+v;			
		}else{
			result = v;
		}
		
		return result;
	}	
	
	
	function page_switch(){
		page_idx++;
		console.log(page_idx);
		
		if(page_idx == 22){
			$("#monitor2").attr("src","m01s01_monitor.jsp");	
		}else if(page_idx == 32){
			$("#monitor3").attr("src","m01s02_ht1_monitor.jsp");
		}else if(page_idx == 42){				
			$("#monitor4").attr("src","m01s02_ht2_monitor.jsp");
		}else if(page_idx == 52){
			$("#monitor5").attr("src","m01s02_ht3_monitor.jsp");
		}else if(page_idx == 62){
			$("#monitor6").attr("src","m01s02_ht4_monitor.jsp");
		}else if(page_idx == 72){
			$("#monitor7").attr("src","m01s02_ht5_monitor.jsp");
		}else if(page_idx == 82){
			$("#monitor8").attr("src","m01s02_ht6_monitor.jsp");
		} else if(page_idx == 92){
			$("#monitor").attr("src","m01s00_monitor.jsp");	
		}
	
		
		if(page_idx == 30){				
			$("#monitor").hide(); $("#monitor2").show(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
		}else if(page_idx == 40){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").show();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
		}else if(page_idx == 50){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").show(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
		}else if(page_idx == 60){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").show(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
		}else if(page_idx == 70){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").show(); $("#monitor7").hide(); $("#monitor8").hide();
		}else if(page_idx == 80){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").show(); $("#monitor8").hide();
		}else if(page_idx == 90){
			$("#monitor").hide(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").show();
		}else if(page_idx == 100){
			$("#monitor").show(); $("#monitor2").hide(); $("#monitor3").hide();
			$("#monitor4").hide(); $("#monitor5").hide(); $("#monitor6").hide(); $("#monitor7").hide(); $("#monitor8").hide();
			page_idx = 0;
		}
	
	}
	
	

	
		
</script>

</body>
</html>