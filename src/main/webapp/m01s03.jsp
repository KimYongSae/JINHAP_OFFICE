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
    width: 1800px;
    border-collapse: collapse;
    border: 0px solid #000;
}


.scrolltbody td { border: 1px solid #000; border-top: 0;}


.scrolltbody tbody {
    display: block;
    height: 531px;

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
        
        
<div class="content" style="height:800px;"> 
	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">생산관리 - 생산 모니터링 현황</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
						<!-- 설비 선택 -->
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
							width: 50px; text-align: right; font-weight:700;">설비 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm" 
							id="s_hogi" name="s_hogi" 
							style="margin-top:5px; height: 30px; width: 120px;
							padding-top:1px; padding-bottom:1px; 
							font-size: 14pt; font-family:headline; font-weight:700;"  
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
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C;
								font-weight:700; 
								width: 50px; text-align: right;">날짜 : </label>
						</div>
						<!-- 시작일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_date" name="s_date" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family:headline;font-weight:700;"
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
											
								
						
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								style="padding-top:1px; padding-bottom:1px; margin-top:6px; 
								height: 31px; width: 100px; 
								font-size:14pt; font-weight:700; font-family:headline;" 
								id="searchbtn">
								<i class="fa fa-search"></i> 검 색</button>
							</div>
						</div>
				</form>
            </header>
			
            <div id="collapse4" class="body">
               <table id="monitoring_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>						
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 180px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								열처리LotNo
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 100px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								작업지시번호
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 170px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								원재료 LotNo
							</th>

							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 140px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								품번
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 180px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								품명
							</th>				
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 140px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								규격
							</th>	
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 50px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>구분</span>
							</th>
<!-- 														
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 70px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>재공<br />철통수</span>
							</th>
							
							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 70px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>재공<br />수량</span>
							</th>	
 -->										
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 80px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>LOT별<br />수량</span>
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 80px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>LOT별<br />중량</span>
							</th>								
							
							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 90px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>재질<br />경도</span>
							</th>
							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 60px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>재질<br />SPEC</span>
							</th>							
								
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 70px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>템퍼링<br />온도</span>
							</th>																				
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 60px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								CP
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 55px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>제품<br />투입</span>
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 55px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>투입<br />완료</span>
							</th>							
							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 55px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>퀜칭<br />완료</span>
							</th>							
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 70px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>템퍼링<br />투입</span>
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 60px; height: 30px; 
									font-size: 16pt; font-family:headline; font-weight:700;">
								<span>작업<br />완료</span>
							</th>
							<th class="text-center cell" 
								style="background-color:#36FFFF; width: 70px; height: 30px; 
									font-size: 14pt; font-family:headline; font-weight:700;">
								<span>시간당<br />장입량</span>
							</th>							
						</tr>
						
						
					</thead>			
							
					<tbody id="monitoring_contents">
						
					</tbody>
				</table>				
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
	var tday;
/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	fn_check();
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
 
function init(){
//	$("#loading").show();
	
	var now = new Date();
	var last = new Date();
	var temp_tdate = tday = now.getFullYear()+"-"+date_set(now.getMonth()+1);
	//오늘날짜(일별)
	tday = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
	$("#s_date").val(tday);
	
//	$("#s_edate").val(tday);
//	last.setFullYear(last.getFullYear(), last.getMonth()+1);

/*
	var tempDate = new Date();
	var yesDate = new Date();
	yesDate.setDate(tempDate.getDate() - 1);
	
	
	var ydate = yesDate.getFullYear()+"-"+date_set(yesDate.getMonth()+1)+"-"+date_set(yesDate.getDate());

	
//	lday = last.getFullYear()+"-"+date_set(now.getMonth()+2);
	$("#s_sdate").val(ydate);
	*/
//	getMonitoringList();	
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

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function inputNumberFormat(obj) {
	plusClick = false;
    obj.value = comma(uncomma(obj.value));
}

var getMonitoringList = function() {

	$.ajax({
			type : "POST",
			url : "l001003.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'sdate':$('#s_date').val(),
					'hogi':$('#s_hogi').val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
		   			var listHtml = "";
					var detail_height = 0;
		   			if ($.isArray(rsAr)) {
		   				for (var i = 0; i < rsAr.length; i++) {
		   					
		   					
			   			listHtml += '<tr style="background-color:'+rsAr[i].color+'">';				
			   			//설비(열처리LotNo)
			   			listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 180px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].qt_lot_no+'</td>';
			   			//작업지시번호
			   			listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 100px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].work_lot_no+'</td>';
			   			//원재료 LOT NO
			   			listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 170px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].roll+'</td>';			   			
			   			//품번
			   			listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 140px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].model_code+'</td>';
			   			//품명
			   			listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 180px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].model_name+'</td>';
			   			//규격
			   			listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 140px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].model_desc+'</td>';
			   			//작업지시구분
			   			listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 50px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].work_flag+'</td>';
			   			
			   			
			   			//전공정
//			   			listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 50px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].process_code1+'</td>';
			   			//재공 철통수
//			   			listHtml += '<td class="nr9" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 70px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].box_cnt+'</td>';
			   			//재공수량
//			   			listHtml += '<td class="nr10" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 70px; word-break:break-all; font-family:headline; font-size:14pt;">'+comma(rsAr[i].out_qty)+'</td>';
			   			//계획수량
//			   			listHtml += '<td class="nr11" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-family:headline; font-size:14pt;">-</td>';
			   			//계획중량
//			   			listHtml += '<td class="nr12" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 50px; word-break:break-all; font-family:headline; font-size:14pt;">-</td>';
			   			//LOT별 수량
			   			listHtml += '<td class="nr13" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-family:headline; font-size:14pt;">'+comma(rsAr[i].lot_qty)+'</td>';
			   			//LOT별 중량
			   			listHtml += '<td class="nr14" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-family:headline; font-size:14pt;">'+comma(rsAr[i].lot_weight)+'</td>';
			   			
						//재질경도
			   			listHtml += '<td class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].jijil_ht+'</td>';
			   			
			   			//재질 스펙
			   			listHtml += '<td class="nr15" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 60px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].qt_type+'</td>';			   			
			   			//템퍼링 온도
			   			listHtml += '<td class="nr16" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 70px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].temper+'</td>';
			   			//CP
			   			listHtml += '<td class="nr17" style="text-align: right; vertical-align: middle; padding: 1px; height: 40px; width: 60px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].cp_mid+'</td>';
			   			//ROLL LOT NO
//			   			listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].roll_lot_cnt+'</td>';
			   			//제품투입시간
			   			listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 55px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].work_start+'</td>';
			   			//투입완료시간
			   			listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 55px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].input_end+'</td>';			   			
			   			//퀜칭 완료시간
			   			listHtml += '<td class="nr20" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 55px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].quen_end+'</td>';			   			
			   			//템퍼링 투입시간
			   			listHtml += '<td class="nr20" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 70px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].temper_start+'</td>';			   			
			   			//종료시간
			   			listHtml += '<td class="nr21" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 60px; word-break:break-all; font-family:headline; font-size:14pt;">'+rsAr[i].work_end+'</td>';
			   			//시간당 장입량 kg/hr
						listHtml += '<td class="nr22" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 70px; word-break:break-all; font-family:headline; font-size:14pt;">'+comma(rsAr[i].kg_hr)+'</td>';
						
						
						
						
			   			listHtml +=	'</tr>';
		   				}
		   			} else {
		   				listHtml += '<tr>' +
						'<td class="text-center" style="vertical-align: middle; height: 55px;" colspan="15">검색 데이터가 없습니다.</td>' +
						'</tr>';
		   			}			
		   			
		   			$("#monitoring_list tbody").html(listHtml);	
		   			
		   			$("#loading").hide();
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
	};

	
	
/*이벤트*/	
$("#s_hogi").change(function(){
	$("#loading").show();
	getMonitoringList();
});

$("#searchbtn").on("click",function(){
	$("#loading").show();
	getMonitoringList();
});

		
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>