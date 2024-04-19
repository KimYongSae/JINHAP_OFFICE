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

<!-- 하이차트 -->

<script type="text/javascript" src="resources/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="resources/js/highchart/exporting.js"></script>
<script type="text/javascript" src="resources/js/highchart/offline-exporting.js"></script>

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
	.highcharts-menu {
	  font-size: 16px; /* 메뉴의 글꼴 크기를 더 크게 조정 */
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
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">모니터링 - 온도/CP 경향모니터링</h5>
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
								style="margin-top:6px; height: 31px; width: 120px; 
								font-size:14pt; font-family:headline; font-weight:700;
								padding-top:1px; padding-bottom:1px;" 
								id="searchbtn">
								<i class="fa fa-search"></i> 검 색</button>
							</div>
						</div>
						
						<!-- <div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 90px; text-align: right;">이력검색 : </label>
						</div>					
						
						<div class="form-group">
							<input style="width:30px;height:30px;" type="checkbox" 
							id="list_yn" name="list_yn" value="R">
							R : 실시간
							H : 이력검색						
						</div> -->	
						
															
				</form>
            </header>
            
            <div id="collapse4" class="body">
            	<div id="container" style="width: 1800px; height: 650px;"></div>
            	
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

<div style="display:none;" id="memo-form" title="메모" >
			<form class="form-horizontal" id="upload" name="upload" method="post" enctype="multipart/form-data">
				<table class = "no-style" style="width:100%">
					<tr><td colspan="2">
					<input type="text" disabled id="datePicker" class="datepicker form-control" placeholder="날짜"></td></tr>
					<tr><td colspan="2"><span id="hourInput">시</span><span id="minuteInput">분</span></td></tr>
					<tr><td colspan="2">
					<div class="input-group">
					  <input type="text" style="width:170px"id="quenching" class="form-control" placeholder="소입">
					  <input type="text" style="width:170px"id="tempering" class="form-control" placeholder="소려">
					</div>
					<div class="input-group">
					  <input type="text" style="width:170px"id="cp" class="form-control" placeholder="CP">
					  <input type="text" style="width:170px"id="worker" class="form-control" placeholder="작업자">
					</div>

					</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<textarea id="memoText" rows="5" style="resize:none" class="form-control" placeholder="메모를 입력하세요"></textarea>
                        <input type="hidden" id="MemoC" />
			
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" id="saveMemo" class="btn small btn-primary" value="저장">
					<input type="button" id="deleteMemoButton" class="btn small btn-danger" value="삭제">
					<input type="hidden" id="bupumModalDatatimeDisplay" />
                    <input type="hidden" id="bupumModalDatatimeClick" />
					</td>
					</tr>
				</table>
			</form>			
</div>


	<script>
	/*전역변수*/ 
	
	var q1_pv, q2_pv, q3_pv, q4_pv, q5_pv;
	var t1_pv, t2_pv, t4_pv, t4_pv;
	var oil_pv, a_pv, cp_pv;

	var q1_pvJson, q2_pvJson, q3_pvJson, q5_pvJson, q4_pvJson;
 	var t1_pvJson, t2_pvJson, t3_pvJson, t4_pvJson;
 	var oil_pvJson, a_pvJson, cp_pvJson; 
 	
	var q1_mvJson, q2_mvJson, q3_mvJson, q5_mvJson, q4_mvJson;
 	var t1_mvJson, t2_mvJson, t3_mvJson, t4_mvJson;
 	var oil_mvJson, a_mvJson, cp_mvJson;
 	var lot_Json;
	
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
			url : "util/lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					//$("#s_sdate").val(rsAr[0].b_date);
					$("#s_sdate").val(rsAr[0].y_date);
					//$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
					$("#s_stime").val("08:00:00");
					//$("#s_stime").val(rsAr[0].n_time);
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#s_edate").val(rsAr[0].n_date);
					//$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					//$("#s_etime").val(rsAr[0].n_time);
					$("#s_etime").val("08:00:00");
					
				} else if (rsJson && rsJson.status == "fail") {
					alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				} else {
					alert("에러발생!");
				}
				
//				timer = setTimeout(function(){ o.run(); }, o.pollInterval);
				getChartDataLoad();
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
		date_search();
		
		//setInterval(getChartData, 10000);
		/*setTimeout(getChart, 500); */
					
		
	});	
	/* $(window).on("load", function() {
		console.log($("#sdate").val());
		getChartData();
		getChart();
	}); */
	
	/*함수*/
	
	$("#searchbtn").on("click",function(){
		getChartData();
		getChart();
	})
	
	
	
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
		
		var date_interval;
		
		function start_date(){
			date_search();
		}
		
		/*이벤트*/
		
		/*차트*/
		
		function unix_timestamp(t){
       var date = new Date(t*1000);
       var year = date.getFullYear();
       var month = "0" + (date.getMonth()+1);
       var day = "0" + date.getDate();
       var hour = "0" + date.getHours();
       var minute = "0" + date.getMinutes();
       var second = "0" + date.getSeconds();
       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + "</br> " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
   }
		
		function unix_timestamp_tooltip(t){
		       var date = new Date(t*1000);
		       var year = date.getFullYear();
		       var month = "0" + (date.getMonth()+1);
		       var day = "0" + date.getDate();
		       var hour = "0" + date.getHours();
		       var minute = "0" + date.getMinutes();
		       var second = "0" + date.getSeconds();
		       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
		   }   
		   
		   function unix_timestamp_onClick(t){
		       var date = new Date(t*1000);
		       var year = date.getFullYear();
		       var month = "0" + (date.getMonth()+1);
		       var day = "0" + date.getDate();
		       var hour = "0" + date.getHours();
		       var minute = "0" + date.getMinutes();
		       var second = "0" + date.getSeconds();
		       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
		   }   
		   
		
		function getChart(){
       
       const chart = Highcharts.chart('container', {
           chart: {
               type: "spline",
               panning: true,
               panKey: "shift",
               zoomType: "x",
               styleMode: true
           },
           time: {
               timezone: "Indonesian",
               useUTC: true
           },
           title: {
               text: ' '
           },
           tooltip: {
               formatter: function() {
            	   
                   var seriesName = this.series.name;
                   var formattedDate = unix_timestamp_tooltip(this.x);
                   
                   if (seriesName === 'LOT') {
                       return formattedDate + '<br>' + seriesName + ' : ' + this.point.label;
                   } else {
                       return formattedDate + '<br>' + seriesName + ' : ' + this.y;
                   }
               }
           },
           yAxis: [{
               crosshair: {
                   width: 3,
                   color: '#5D5D5D',
                   zIndex: 5
               },
               title: {
                   text: 'Temper(℃)'
               },
               labels: {
                   style: {
                       fontSize: "14pt"
                   }
               },
               min: 0,
               max: 1000,
               endOnTick: false
           },
           {   
               opposite: false, // 기존 y축의 반대편에 배치
               title: {
                   text: 'CP' 
               },
               min: 0, 
               max: 1, 
               endOnTick: false,
               labels: {
                   formatter: function () {
                       return this.value; // 레이블 포맷
                   }
               }
           }
           ],
           xAxis: {
               crosshair: {
                   width: 3,
                   color: '#5D5D5D',
                   zIndex: 5
               },
               labels: {
                   formatter: function () {
                       return unix_timestamp(this.value);
//                  return this.value;
                   },
                   style: {
                       fontSize: "11pt"
                   }
               },
               tickmarkPlacement: 'on',
               startOnTick: false
           },
           /* legend: {
               layout: 'vertical',
               align: 'right',
               verticalAlign: 'middle'
           }, */
           plotOptions: {
               series: {
                   dataLabels: {
                       dataLabels: {
                    	   enabled: true,
                           format: '{point.label}',
                           useHTML: true,
                           
                       },
                       selected: true,
                       cursor: 'pointer',
                       marker: {
                           radius: 1
                       },
                       style:{
                      	 fontSize: '15px'  
                         }
                   },
                  
                   point: {
                       events: {
                          click: function () {
                             
                             
                              // 클릭된 데이터 포인트의 날짜와 값
                              var clickedDate = unix_timestamp_onClick(this.x);  // 함수 적용
                              var clickedValueY = this.y;
                              var clickedValueX = this.x;
                              console.log(this);
                             /*  console.log(clickedDate);
                              console.log(clickedValueY);
                              console.log(clickedValueX);
                              console.log(this.series.name);
                              
                              console.log(this.dataLabel); */
                              if(typeof this.dataLabel != 'undefined'){
                                 //$("#memoText").val(this.dataLabel.textStr);
                                 $("#memoText").val("");
                                 $("#quenching").val("");
                                 $("#tempering").val("");
                                 $("#cp").val("");
                                 $("#worker").val("");
                                 
                                 var parts = this.dataLabel.textStr.split("<br/>");
                                 parts.forEach(function(part) {
                                	    var keyValue = part.split(":");
                                	    var key = keyValue[0].trim().toLowerCase();
                                	    var value = keyValue.length > 1 ? keyValue[1].trim() : "";
                                	    // 3. 해당하는 input 태그에 값 할당
                                	    if (key === "메모") {
                                	        $("#memoText").val(value);   
                                	    } else if (key === "소입") {
                                	        $("#quenching").val(value);
                                	    } else if (key === "소려") {
                                	    	$("#tempering").val(value);
                                	    } else if (key === "cp") {
                                	    	$("#cp").val(value);
                                	    } else if (key === "작업자") {
                                	    	$("#worker").val(value);
                                	    }
                                	});
                                 
                              }else{
                                 $("#memoText").val("");
                                 $("#quenching").val("");
                                 $("#tempering").val("");
                                 $("#cp").val("");
                                 $("#worker").val("");
                              }
                              
                              $("#MemoC").val(this.series.name);
                                             
                              
                              // 모달을 열고
                              fileDialog.dialog("open");
                              /* $("#memoModal").show();
                              $(document).keyup(function(e) {
                                  if (e.key === "Escape") { // ESC 키를 누르면
                                      $("#memoModal").hide(); // 모달 창을 닫습니다.
                                  }
                              });
                              $("#closeModal").click(function() {
                              $("#memoModal").hide();
                              }); */
                              // 날짜와 시간을 분리
                              var dateParts = clickedDate.split(" ")[0];
                              var timeParts = clickedDate.split(" ")[1].split(":");

                              // 날짜 선택기와 시간 텍스트에 클릭된 데이터 포인트의 날짜를 설정
                              $("#datePicker").val(dateParts); // YYYY-MM-DD 형식
                              $("#hourInput").text(timeParts[0] + '시');
                              $("#minuteInput").text(timeParts[1] + '분');
                          
                             

                              $("#bupumModalDatatimeClick").val(clickedDate);
                              $("#bupumModalDatatimeClick").val(clickedDate);
                              // 메모 입력 필드에 클릭된 데이터 포인트의 값을 설정
                             
                              $("#yInput").val(clickedValueY);
                              $("#xInput").val(clickedValueX);
                              
                          }
                     

                       }
                   }
               }
           },
           
           series: [
        	   q1_pvJson, q2_pvJson, q3_pvJson, q4_pvJson, q5_pvJson, 
        	   t1_pvJson, t2_pvJson, t3_pvJson, t4_pvJson,
        	   oil_pvJson, a_pvJson,
        	   $.extend({}, cp_pvJson, { yAxis: 1 }),
        	   
        	   q1_mvJson, q2_mvJson, q3_mvJson, q4_mvJson, q5_mvJson, 
        	   t1_mvJson, t2_mvJson, t3_mvJson, t4_mvJson,
        	   oil_mvJson, a_mvJson,
        	   $.extend({}, cp_mvJson, { yAxis: 1 }),
        	   lot_Json
        	  
        	]
,
            
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 700
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        },
        exporting: {
            enabled: true
        },
        legend: {
            itemStyle: {
                fontSize: "11pt"
            },
            layout: 'horizontal',
	        verticalAlign: 'top',
	        align: 'right',
	        x:-50
        }
        
    });
}
		
		
		function getChartData(){
		      
	      console.log("init getChartData");
	      
	      $.ajax({
	         url:"m00/s04_trend/select_m00s04_trend.jsp",
	         type:"post",
	         dataType:"json",
	         data:{            
	            "sdate":$("#s_sdate").val(),
	            "edate":$("#s_edate").val(),
	            "stime":$("#s_stime").val(),
	            "etime":$("#s_etime").val(),
	            "hogi":$("#s_hogi").val()
	         },
	         success:function(result){
	            //console.log(result.data);

	            
	           datetimeJson = result.data.datetime;
	          /*  tic1_pvJson = result.data.tic1_pv;

	            tic1_pvJson = result.data.tic1_pv;
	            tic2_pvJson = result.data.tic2_pv;
	            tic3_pvJson = result.data.tic3_pv;
	            tic1_spJson = result.data.tic1_sp;
	            tic2_spJson = result.data.tic2_sp;
	            tic3_spJson = result.data.tic3_sp;
	            
	            
	            tic1_pvMv = result.data.tic1_pvMv;
	            tic2_pvMv = result.data.tic2_pvMv;
	            tic3_pvMv = result.data.tic3_pvMv;
	            tic1_spMv = result.data.tic1_spMv;
	            tic2_spMv = result.data.tic2_spMv;
	            tic3_spMv = result.data.tic3_spMv;    */     
	            
	            q1_pvJson = result.data.q1_pv;
	            q2_pvJson = result.data.q2_pv;
	            q3_pvJson = result.data.q3_pv;
	            q4_pvJson = result.data.q4_pv;
	            q5_pvJson = result.data.q5_pv;
	            t1_pvJson = result.data.t1_pv;
	            t2_pvJson = result.data.t2_pv;
	            t3_pvJson = result.data.t3_pv;
	            t4_pvJson = result.data.t4_pv;
	            oil_pvJson = result.data.oil_pv;
	            a_pvJson = result.data.a_pv;
	            cp_pvJson = result.data.cp_pv;
	            
	            q1_mvJson = result.data.q1_Mv;
	            q2_mvJson = result.data.q2_Mv;
	            q3_mvJson = result.data.q3_Mv;
	            q4_mvJson = result.data.q4_Mv;
	            q5_mvJson = result.data.q5_Mv;
	            t1_mvJson = result.data.t1_Mv;
	            t2_mvJson = result.data.t2_Mv;
	            t3_mvJson = result.data.t3_Mv;
	            t4_mvJson = result.data.t4_Mv;
	            oil_mvJson = result.data.oil_Mv;
	            a_mvJson = result.data.a_Mv;
	            cp_mvJson = result.data.cp_Mv;
	            lot_Json = result.data.lot;
	            
	            
	            var chart = $("#container").highcharts();
	            
	            if(typeof chart != 'undefined'){
	            
/* 	               chart.series[0].update(tic1_pvJson,false);
	               chart.series[1].update(tic2_pvJson,false);
	               chart.series[2].update(tic1_spJson,false);
	               chart.series[3].update(tic2_spJson,false);
	            chart.series[4].update(tic1_pvMv,false);
	            chart.series[5].update(tic2_pvMv,false);            
	            chart.series[6].update(tic1_spMv,false);
	            chart.series[7].update(tic2_spMv,false); */
	            chart.series[0].update(q1_pvJson,false);
	            chart.series[1].update(q2_pvJson,false);
	            chart.series[2].update(q3_pvJson,false);
	            chart.series[3].update(q4_pvJson,false);
	            chart.series[4].update(q5_pvJson,false);
	            chart.series[5].update(t1_pvJson,false);
	            chart.series[6].update(t2_pvJson,false);
	            chart.series[7].update(t3_pvJson,false);
	            chart.series[8].update(t4_pvJson,false);
	            chart.series[9].update(oil_pvJson,false);
	            chart.series[10].update(a_pvJson,false);
	            chart.series[11].update(cp_pvJson,false);
	            chart.series[12].update(q1_mvJson,false);
	            chart.series[13].update(q2_mvJson,false);
	            chart.series[14].update(q3_mvJson,false);
	            chart.series[15].update(q4_mvJson,false);
	            chart.series[16].update(q5_mvJson,false);
	            chart.series[17].update(t1_mvJson,false);
	            chart.series[18].update(t2_mvJson,false);
	            chart.series[19].update(t3_mvJson,false);
	            chart.series[20].update(t4_mvJson,false);
	            chart.series[21].update(oil_mvJson,false);
	            chart.series[22].update(a_mvJson,false);
	            chart.series[23].update(cp_mvJson,false);
	            chart.series[24].update(lot_Json,false);
	            
	            
	               chart.redraw();
	              
	            }else{
	               console.log("언디파인드");
	               
	            }
	         }
	      });
	   }
		function getChartDataLoad(){
		      
//	      console.log("sdate : "+$("#sdate").val());
	      
	      $.ajax({
	         url:"m00/s04_trend/select_m00s04_trend.jsp",
	         type:"post",
	         dataType:"json",
	         data:{            
	            "sdate":$("#s_sdate").val(),
	            "edate":$("#s_edate").val(),
	            "stime":$("#s_stime").val(),
	            "etime":$("#s_etime").val(),
	            "hogi":$("#s_hogi").val()
	         },
	         success:function(result){
	            //console.log(result.data);

	            
	           datetimeJson = result.data.datetime;
	          /*  tic1_pvJson = result.data.tic1_pv;

	            tic1_pvJson = result.data.tic1_pv;
	            tic2_pvJson = result.data.tic2_pv;
	            tic3_pvJson = result.data.tic3_pv;
	            tic1_spJson = result.data.tic1_sp;
	            tic2_spJson = result.data.tic2_sp;
	            tic3_spJson = result.data.tic3_sp;
	            
	            
	            tic1_pvMv = result.data.tic1_pvMv;
	            tic2_pvMv = result.data.tic2_pvMv;
	            tic3_pvMv = result.data.tic3_pvMv;
	            tic1_spMv = result.data.tic1_spMv;
	            tic2_spMv = result.data.tic2_spMv;
	            tic3_spMv = result.data.tic3_spMv;    */     
	            
	            q1_pvJson = result.data.q1_pv;
	            q2_pvJson = result.data.q2_pv;
	            q3_pvJson = result.data.q3_pv;
	            q4_pvJson = result.data.q4_pv;
	            q5_pvJson = result.data.q5_pv;
	            t1_pvJson = result.data.t1_pv;
	            t2_pvJson = result.data.t2_pv;
	            t3_pvJson = result.data.t3_pv;
	            t4_pvJson = result.data.t4_pv;
	            oil_pvJson = result.data.oil_pv;
	            a_pvJson = result.data.a_pv;
	            cp_pvJson = result.data.cp_pv;
	            
	            q1_mvJson = result.data.q1_Mv;
	            q2_mvJson = result.data.q2_Mv;
	            q3_mvJson = result.data.q3_Mv;
	            q4_mvJson = result.data.q4_Mv;
	            q5_mvJson = result.data.q5_Mv;
	            t1_mvJson = result.data.t1_Mv;
	            t2_mvJson = result.data.t2_Mv;
	            t3_mvJson = result.data.t3_Mv;
	            t4_mvJson = result.data.t4_Mv;
	            oil_mvJson = result.data.oil_Mv;
	            a_mvJson = result.data.a_Mv;
	            cp_mvJson = result.data.cp_Mv;
	            lot_Json = result.data.lot;
	            
	            getChart();
	         }
	      });
	   }
		
		// 메모 세이브
		$('#saveMemo').on("click",function(){
//	       event.preventDefault(); 

	       var tdatetime2 = $("#bupumModalDatatimeClick").val();
	       var memoC = $("#MemoC").val();
	       var memoText = $("#memoText").val();
	       
	       $.ajax({
	           type: 'POST',
	           url: 'm00/s04_trend/insert_m00s04_trend_memo.jsp',
	           data: {
	               tdatetime2: tdatetime2,
	               memoC: memoC,
	               memoText: memoText,
	               "hogi":$("#s_hogi").val(),
	               "quenching":$("#quenching").val(),
	               "tempering":$("#tempering").val(),
	               "cp":$("#cp").val(),
	               "worker":$("#worker").val()
	           },
	           success: function (response) {
	        	   fileDialog.dialog("close");
	        	   getChartData();
	           },
	       });
	   });
		
		
		$('#deleteMemoButton').on("click",function(){
//	       event.preventDefault(); 

	       var tdatetime2 = $("#bupumModalDatatimeClick").val();
	       var memoC = $("#MemoC").val();
	       var memoText = $("#memoText").val();
	       
	       $.ajax({
	           type: 'POST',
	           url: 'm00/s04_trend/delete_m00s04_trend_memo.jsp',
	           data: {
	               tdatetime2: tdatetime2,
	               memoC: memoC,
	               memoText: memoText,
	               "hogi":$("#s_hogi").val()
	           },
	           success: function (response) {
	        	   fileDialog.dialog("close");
	        	   getChartData();
	           },
	           error: function (xhr, status, error) {
	               // 서버 요청이 실패한 경우에 실행됩니다.
	               alert("데이터가 없습니다.");
	           }
	       });
	   });

		
		
		
		
		
//////////////////////다이얼로그
var memoDialog;
fileDialog = $("#memo-form").dialog({
	autoOpen: false,
	height: 500,
	width: 380,
	modal: false,
	stack:false,
	buttons: {		
	"닫 기": function() {
		setTimeout( function(){				
			fileDialog.dialog("close");
		});
	}
	}
});
		
		
</script>

</body>
</html> 