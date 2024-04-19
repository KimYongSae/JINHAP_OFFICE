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
<link rel="stylesheet" href="resources/css/style5.css"/>
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
    height: 580px;
    
    overflow-x: hidden;
}

/*값 보여주는곳에서 코멘트목록 사용*/
.scrolltbody2 {
    display: block;
    width: 900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody2 td { border: 1px solid #000; border-top: 0;}

.scrolltbody2 thead {
    display: block;
	width: 900px;
    overflow-x: hidden;
}

.scrolltbody2 tbody {
    display: block;
    width: 900px;
    height: 400px;

    overflow-x: hidden;
}
/*태그목록 사용*/
.scrolltbody3 {
    display: block;
    width: 400px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody3 {
    display: block;
    width: 660px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody3 td { border: 1px solid #000; border-top: 0;}

.scrolltbody3 thead {
    display: block;
	width: 660px;
    overflow-x: hidden;
}

.scrolltbody3 tbody {
    display: block;
    width: 660px;
    height: 120px;

    overflow-x: hidden;
}

	#loading-image {  
		 position: absolute;  
		 top: 50%;  
		 left: 50%; 
		 z-index: 20100; 
	}

	.dropdown-colorselector {
		display:inline-block;
		padding-left:10px;
	} 
	
	@font-face{
		font-family:"headline";
		src:url("/fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
	}	
	
	@font-face{
		font-family:"headline2";
		src:url("fonts/h2hdrm.ttf") format("ttf");
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
	
	<div id="loading" style="display:none;">
		<img id="loading-image" src="resources/img/loading2.gif" alt="Loading..." />
	</div>
	
	<div id="tdate-form" style="display:none;" title="측정일 등록">
		<form class="form-inline" role="form" id="dateform" name="dateform" method="post" 
		autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 80px; text-align: right;">
					교체일: </label>
				</div>
				
				
				<div class="form-group">
					<input type="text" class="form-control input-sm datepicker" 
					id="t_date" name="t_date" 
						style="width: 140px; height: 34px; 
						font-size: 14pt; font-family :headline; font-weight:700;" 
						placeholder="교체일"/>
				</div>			
			</form>
				<input type="hidden" id="t_cnt" name="t_cnt" />
	</div>	
	
	
	<div id="buyDate-form" style="display:none;" title="열전대 구매완료일 등록">
		<form class="form-inline" role="form" id="buyDateform" name="buyDateform" method="post" 
		autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 100px; text-align: right;">
					구매완료일: </label>
				</div>
				
				
				<div class="form-group">
					<input type="text" class="form-control input-sm datepicker" 
					id="buy_date" name="buy_date" 
     					style="width: 140px; height: 34px; 
     					font-size: 14pt; font-family :headline; font-weight:700;" 
     					placeholder="구매완료일"/>
				</div>			
			</form>
				<input type="hidden" id="buy_cnt" name="buy_cnt" />
	</div>	
	
	<div id="popup-form" style="display:none;" title="확인창">
			<div class="row" style="height:60px;">
				<h1 style="font-size:30pt; font-family:headline; font-weight:700;
					text-align:center;"
					id="v_title"></h1>
			</div>	
			
			
			<div class="row" style="margin-top:15px;">
               <table id="thermo_list" cellspacing="0" 
               class="table table-bordered table-hover table-responsive scrolltbody2">
					<thead>
						<tr>					
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 60px; height: 30px; 
									font-size: 16pt; font-family:headline;">
								No.
							</th>
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 100px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								설비명
							</th>
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 140px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								존 구분
							</th>							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								차기 교체일자
							</th>
							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								교체일자
							</th>		
							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								구매완료일자
							</th>							
							
						</tr>
					</thead>
					<tbody id="thermo_ctents">
						
					</tbody>
				</table>
			</div>
	</div>
	<!-- O2센서 교체이력 -->
	<div id="o2_tdate-form" style="display:none;" title="O2센서 측정일 등록">
		<form class="form-inline" role="form" id="o2_dateform" name="o2_dateform" method="post" 
		autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 80px; text-align: right;">
					교체일: </label>
				</div>
				
				
				<div class="form-group">
					<input type="text" class="form-control input-sm datepicker" 
					id="o2_t_date" name="o2_t_date" 
     					style="width: 140px; height: 34px; 
     					font-size: 14pt; font-family :headline; font-weight:700;" 
     					placeholder="교체일"/>
				</div>			
			</form>
				<input type="hidden" id="o2_t_cnt" name="o2_t_cnt" />
	</div>	

	<!-- O2센서 구매완료일 등록 -->
	<div id="o2_buyDate-form" style="display:none;" title="O2센서 구매완료일 등록">
		<form class="form-inline" role="form" id="o2_buyDateform" name="o2_buyDateform" method="post" 
		autocomplete="off">
				<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline; font-weight:700; 
						color:#8C8C8C; width: 100px; text-align: right;">
					구매완료일: </label>
				</div>
				
				
				<div class="form-group">
					<input type="text" class="form-control input-sm datepicker" 
					id="o2_buy_date" name="o2_buy_date" 
     					style="width: 140px; height: 34px; 
     					font-size: 14pt; font-family :headline; font-weight:700;" 
     					placeholder="구매완료일"/>
				</div>			
			</form>
				<input type="hidden" id="o2_buy_cnt" name="o2_buy_cnt" />
	</div>	


	<div id="o2_popup-form" style="display:none;" title="확인창">
			<div class="row" style="height:60px;">
				<h1 style="font-size:30pt; font-family:headline; font-weight:700;
					text-align:center;"
					id="o2_v_title"></h1>
			</div>	
			
			
			<div class="row" style="margin-top:15px;">
               <table id="o2_list" cellspacing="0" 
               class="table table-bordered table-hover table-responsive scrolltbody3">
					<thead>
						<tr>					
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 60px; height: 30px; 
									font-size: 16pt; font-family:headline;">
								No.
							</th>
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 100px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								설비명
							</th>						
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								차기 교체일자
							</th>
							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								교체일자
							</th>	
							
							<th class="text-center cell" 
								style="background-color:#24FCFF; width: 160px; height: 30px; 
								font-size: 16pt; font-family:headline;">
								구매완료일자
							</th>							
							
						</tr>
					</thead>
					<tbody id="o2_ctents">
						
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
        
<div class="content" style="height:800px;"> 
	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons" onclick="cookie_del();"><i style="color:white;" class="fa fa-pie-chart"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">생산관리 - 설비별 생산실적</h5>
            </header>
          
            <div id="collapse4" class="body">
               <iframe id="monitor" src="m01s01_monitor_1.jsp" class="row" frameborder="0"
			            	scrolling="no" ALLOWTRANSPARENCY="true"
			            		style="width:1800px; height:810px;">
			            	</iframe>
               
			
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

	<%-- <script>

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
		var day3, day4, day5, day6, day7, day8, day9;
		var tdate;
		var ydate;
		
		var day3_a, day3_b;
		var day4_a, day4_b;
		var day5_a, day5_b;
		var day6_a, day6_b;
		var day7_a, day7_b;
		var day8_a, day8_b;
		var day9_a, day9_b;
		
		var sum1 = 0;
		var sum2 = 0;
		var sum3 = 0;
		var sum4 = 0;
		
		var sum5 = 0;
		var sum6 = 0;
		var sum7 = 0;
		var sum8 = 0;
		
		var sum9 = 0;
		
		var percent1 = 0;
		var percent2 = 0;
		var percent3 = 0;
		var percent4 = 0;
		
		var percent5 = 0;
		var percent6 = 0;
		var percent7 = 0;
		var percent8 = 0;
		
		var percent9 = 0;

		var per_max = 0;
		
		var start_interval;
		
		/*인터벌*/
		

		/*페이지 로드*/
		
		

		$(function(){
			fn_check();			
			
//			$("#loading").show();
			var now = new Date();
			
			tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
			
			var tempDate = new Date();
			var yesDate = new Date();
			yesDate.setDate(tempDate.getDate() - 1);
			
			
			ydate = yesDate.getFullYear()+"-"+date_set(yesDate.getMonth()+1)+"-"+date_set(yesDate.getDate());
//			console.log(ydate);
			
			
//			getProcessList();
			
			
			
//			start_interval = setInterval('getProcessList()',1000*60*30); //30분간격, 1800000
//			start_interval = setInterval('getProcessList()',10000); //30분간격
			
			
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
		
		function cookie_del(){		
			  var expireDate = new Date();
			  
			  //어제 날짜를 쿠키 소멸 날짜로 설정한다.
			  expireDate.setDate( expireDate.getDate() - 1 );
			  document.cookie = 'todayCookie' + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
		}		
		
		function popup_close(){
			var todayDate = new Date();
		    todayDate.setDate( todayDate.getDate() + 1 );
		    document.cookie = "todayCookie" + "=" + escape("done") + "; path=/; expires=" + todayDate.toGMTString() + ";"			
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
						
						getYearCount();
						var popup = rsJson.pop;
						var o2_popup = rsJson.o2_pop;
						
						var sid = '<%=session.getAttribute("sid")%>';
						
						
						if(sid != "worker"){
							var cookiedata = document.cookie;
							if ( cookiedata.indexOf("todayCookie=done") < 0 ){
								if (popup.length != 0){
								var listHtml = "";
								$("#v_title").text(popup[0].ndate+" "+"열전대 교체 사전준비 ");
									for(var i=0; i<popup.length; i++){
										
		//								$("#v_ndate").text();
								listHtml += "<tr>";
								listHtml += '<td class="nr" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+popup[i].cnt+'</td>';
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+(i+1)+'</td>';
								listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+popup[i].hogi+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 140px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+popup[i].seolbi+'</td>';						
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+popup[i].ndate+'</td>';
								listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; CURSOR:pointer;" onclick=tdateReg('+popup[i].cnt+'); return false; event.cancelBubble = true;></td>';
								listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; CURSOR:pointer;" onclick=buyDateReg('+popup[i].cnt+'); return false; event.cancelBubble = true;></td>';
								listHtml += "</tr>";
		
										
									}
									$("#thermo_list tbody").html(listHtml);
									
									
									popupDialog.dialog("open");						
								}
								
								if(o2_popup.length != 0){
									var o2_listHtml = "";
									$("#o2_v_title").text(o2_popup[0].ndate+" "+"O₂센서 교체 사전준비 ");
										for(var i=0; i<o2_popup.length; i++){
											
			//								$("#v_ndate").text();
									o2_listHtml += "<tr>";
									o2_listHtml += '<td class="nr" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+o2_popup[i].cnt+'</td>';
									o2_listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 60px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+(i+1)+'</td>';
									o2_listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+o2_popup[i].hogi+'</td>';					
									o2_listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+o2_popup[i].ndate+'</td>';
									o2_listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; CURSOR:pointer;" onclick=o2_tdateReg('+o2_popup[i].cnt+'); return false; event.cancelBubble = true;></td>';
									o2_listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700; CURSOR:pointer;" onclick=o2_buyDateReg('+o2_popup[i].cnt+'); return false; event.cancelBubble = true;></td>';
									o2_listHtml += "</tr>";
			
											
										}
										$("#o2_list tbody").html(o2_listHtml);
										
										
										o2_popupDialog.dialog("open");						

								}							
								
							}
						}
						if ($.isArray(rsAr)){

							if (rsAr[0].sec == "")
							{
								alert("로그인 정보가 없습니다.");
							    location.href="index.jsp";
							}
							
							$("#user_span").html("<font color='#428bca'><strong><a href = 'javascript:popupOpen();'>" + rsAr[0].sec + "</a></strong></font> 님이 로그인중입니다. ");
							//$("#user_span").html("<font color='#428bca'><strong>" + rsAr[0].sec + "</strong></font> 님이 로그인중입니다. ");
							
						//	if (rsAr[0].auth == "admin") {
						//		$("#top_btn_div").append("<a class='btn small' href='table.html' title='회원관리 페이지로 이동합니다'> 회원관리 </a>");
						//	} else {
						//		$("#top_btn_div").append("<a class='btn small' href='t_update.jsp' title='개인정보수정 페이지로 이동합니다'>개인정보수정</a>");
						//	}
							
						//	if (rsAr[0].auth == "admin") {	// 관리자이면 체크 -> 관리자일경우 처음 데이터 호출시 모든 데이터 나오도록 처리
						//		paramJson.member = null;	
						//	} else {
						//		paramJson.member = encodeURIComponent(rsAr[0].sec);	// 로그인자 정보 설정
						//	}
							
//							getUser();		// 페이지 처음 로딩시 데이터 요청

							//alert(rsAr[0].lev);

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
		
			function tdateReg(row_id){
				$("#t_cnt").val(row_id);
				tdateDialog.dialog("open");
			}			
			
			function buyDateReg(row_id){
				$("#buy_cnt").val(row_id);
				buyDateDialog.dialog("open");
				
			}

			function o2_tdateReg(row_id){
				$("#o2_t_cnt").val(row_id);
				o2_tdateDialog.dialog("open");
			}			
			
			function o2_buyDateReg(row_id){
				$("#o2_buy_cnt").val(row_id);
				o2_buyDateDialog.dialog("open");
				
			}
			
			function getYearCount(){
				var now = new Date();
				var y_year = now.getFullYear();
				//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
				$.post("i002002_count.jsp",{
					"tdate":y_year
				},100);
				
			}	
			
		function getProcessList(){
			$.ajax({
				type : "POST",
				url : "l001001.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'tdate':tdate,
						"ydate":ydate},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
						var rsAr2 = rsJson.rows2;
						var listHtml = "";
						var color = "";
						
						day3_a= 0; day3_b = 0;
						day4_a= 0; day4_b = 0;
						day5_a= 0; day5_b = 0;
						day6_a= 0; day6_b = 0;
						day7_a= 0; day7_b = 0;
						day8_a= 0; day8_b = 0;
						day9_a= 0; day9_b = 0;
						
						
						sum1 = 0;
						sum2 = 0;
						sum3 = 0;
						sum4 = 0;
						sum5 = 0;
						sum6 = 0;
						sum7 = 0;
						sum8 = 0;
						sum9 = 0;
						
						percent1 = 0;
						percent2 = 0;
						percent3 = 0;
						percent4 = 0;
						
						percent5 = 0;
						percent6 = 0;
						percent7 = 0;
						percent8 = 0;
						
						percent9 = 0;
						
						var d_date = new Date();
						
						var m_temp = new Date();
						var m_date = new Date();
						m_date.setDate(m_temp.getDate() - 1);
						/*
							var tempDate = new Date();
							var yesDate = new Date();
							yesDate.setDate(tempDate.getDate() - 1);
						*/
						
//						console.log(d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 "+date_set(d_date.getMinutes())+"분");
	
						
						
						var test_time1 = new Date(d_date.getFullYear(),d_date.getMonth(),d_date.getDate(),08,30,00);
//						console.log(test_time1);
//						console.log(test_time1.getTime());
						
//						console.log("==============");
						
						var test_time2 = new Date(d_date.getFullYear(),d_date.getMonth(),d_date.getDate(),d_date.getHours(),d_date.getMinutes(),00);						
//						console.log(test_time2);
//						console.log(test_time2.getTime());
						
						var diff = test_time2.getTime() - test_time1.getTime();
						var diff_h = (Math.floor((diff % (1000*60*60*24))/ (1000*60*60)));
						var diff_m = (Math.floor((diff % (1000*60*60))/ (1000*60)));
						
						var c_m = 0;
//						console.log("*****************");
//						console.log(diff);
						
						if(diff < 0){
							//어제날짜 08:30 ~ 현재시간 
							c_m = 24 + (diff_h+(diff_m/60));
						}else if(diff >0){
							//오늘날짜 08:30 ~ 현재시간
							c_m = diff_h+(diff_m/60);
						}else{
							c_m = 0;
						}
												
//						console.log("시 : "+(Math.floor((diff % (1000*60*60*24))/ (1000*60*60))));
//						console.log("분 : "+(Math.floor((diff % (1000*60*60))/ (1000*60))));
//						console.log("초 : "+(Math.floor((diff % (1000*60))/ (1000))));
						var day_work = "";
						if(d_date.getMinutes() >= 30){
							day_work = "일간 생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 30분 기준";				
						}else{
							day_work = "일간 생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 00분 기준";
						}
			
			var month_work = "월간 생산실적 - "+m_date.getFullYear()+"년 "+date_set(m_date.getMonth()+1)+"월 "+date_set(m_date.getDate())+"일 기준"
			$("#day_work").text(day_work);
			$("#month_work").text(month_work);
			
						var c_now = new Date();
//						var c_m = (c_now.getHours()+1);
						
						//rsAr.length
						for(var i=0; i<7; i++){
							
//							console.log("i: "+i);
							if(i == 0){
								//3호기
								day3_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1); 
								day3_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);					
							}else if(i == 1){
								//4호기
								day4_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day4_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);
							}else if(i == 2){
								//5호기
								day5_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day5_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 3){
								//6호기
								day6_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day6_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);							
							}else if(i == 4){
								//7호기
								day7_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day7_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 5){
								//8호기
								day8_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day8_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 6){
								//9호기
								day9_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day9_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}
							
							var a = rsAr[i].sumbuha;
							var b = ((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)));
							if(a < b){
								color = "background-color:#FFFFFF;";
							}else{
								color = "background-color:#FF0000;"
							}
							
							
							sum1 += (eval(rsAr[i].sumbuha));
							sum2 +=	(eval(Math.round(eval(rsAr[i].dkg)+eval(rsAr[i].nkg))));
							sum3 += (eval(Math.round((rsAr[i].sumbuha /24 * c_m))));
							sum4 +=	(eval(Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))));
							sum5 += (eval(rsAr2[i].sumbuha));
							sum6 += (eval(rsAr2[i].dkg)+eval(rsAr2[i].nkg));
							sum7 += (eval(rsAr2[i].sumbuha_t));
							sum8 += (eval(rsAr2[i].pdkg));
							
							//일간 - 목표+실적 중 목표 %
							//0611변경 : 일 달성율
							if(eval(rsAr[i].sumbuha == 0 || 
									(eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) == 0)){
								percent1 = 0;
							}else{
								//Math.round((rsAr[i].sumbuha /24 * c_m ))
								percent1 = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1) ;
							}
							
							
							//일간 - 목표+실적 중 실적 %
							//0611변경 : 현시점 달성율
							if(((eval(rsAr[i].dkg)+eval(rsAr[i].nkg))) == 0 ||
									eval(rsAr[i].sumbuha == 0)){
								percent2 = 0;
							}else{
//								percent2 = Math.round(((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) / (eval(rsAr[i].sumbuha) + ((eval(rsAr[i].dkg)+eval(rsAr[i].nkg))) ) * 100));
//								percent2 = Math.round(((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) / (eval(rsAr[i].sumbuha)) * 100));
								percent2 = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1) ;
							}
//							console.log("1 : "+Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) / 24 ));
//							console.log("2 : "+Math.round((rsAr[i].sumbuha  / 24 )));
							
							//per_max는 percent2의 최댓값 :
							if(per_max  < percent2){
								per_max = eval(percent2);
							}
							
							
							//월간 - 목표+실적 중 목표 %
							//0611변경 : 전일 달성율
							if(eval(rsAr2[i].sumbuha) == 0 ||
									((eval(rsAr2[i].dkg)+eval(rsAr2[i].nkg))) == 0) {
								percent3 = 0;
							}else{
//								percent3 = Math.round((eval(rsAr[i].sumbuha_t) / (eval(rsAr[i].sumbuha_t) + eval(rsAr[i].pdkg) ) * 100));
//								percent3 = 100;
								percent3 = ( (eval(rsAr2[i].dkg) + eval(rsAr2[i].nkg)) / eval(rsAr2[i].sumbuha ) * 100 ).toFixed(1);
							}
							
							//월간 - 목표+실적 중 실적 %
							//0611변경 : 누계 달성율
							if(eval(rsAr2[i].sumbuha_t) == 0 ||
									eval(rsAr2[i].pdkg) == 0){
								percent4 = 0;
							}else{
//								percent4 = Math.round((eval(rsAr[i].pdkg) / (eval(rsAr[i].sumbuha_t) ) * 100));
								percent4 = (eval(rsAr2[i].pdkg) / (eval(rsAr2[i].sumbuha_t) ) * 100).toFixed(1);
							}
							
							
//							console.log(c_m);
							
							// '+color+'
							listHtml += "<tr>";
							listHtml += '<td rowspan="2" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 110px; word-break:break-all; font-size:20pt; font-family:headline;">HT-QT'+(i+3)+'</td>';
							listHtml += '<td rowspan="2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(rsAr[i].sumbuha)+'</td>';
							listHtml += '<td rowspan="2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 150px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(Math.round((rsAr[i].sumbuha /24 * c_m )))+'</td>';
							listHtml += '<td rowspan="2" class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 110px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) ) )+'</td>';
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 300px; word-break:break-all;"><div id="day'+(i+3)+'"></div></td>';
							listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:20pt; font-family:headline;">'+percent1+'%</td>';
							listHtml += '<td rowspan="2" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(rsAr2[i].sumbuha)+'</td>';
							listHtml += '<td rowspan="2" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(eval(rsAr2[i].dkg)+eval(rsAr2[i].nkg))+'</td>';
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:20pt; font-family:headline;">'+percent3+'%</td>';
							
							if(rsAr2[i].sumbuha_t == null){
								listHtml += '<td rowspan="2" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">0</td>';	
							}else{
								listHtml += '<td rowspan="2" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(rsAr2[i].sumbuha_t)+'</td>';
							}
							
							listHtml += '<td rowspan="2" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 130px; word-break:break-all; font-size:20pt; font-family:headline;">'+comma(rsAr2[i].pdkg)+'</td>';
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:20pt; font-family:headline;">'+percent4+'%</td>';						
							listHtml += "</tr>";
							
							
							listHtml += "<tr>";
							if(c_m == 0){
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:20pt; font-family:headline;">0%</td>';
							}else{
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 120px; word-break:break-all; font-size:20pt; font-family:headline;">'+percent2+'%</td>';		
							}
							
							listHtml += "</tr>";
						}
													
							
						$("#process_contents").html(listHtml);
						
						day3_chart(); day4_chart(); day5_chart(); 
						day6_chart(); day7_chart(); day8_chart(); day9_chart();

						
						$("#loading").hide();
						
					} else if (rsJson && rsJson.status == "fail") {
						alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
					} else {
						alert("에러발생!");
					}
					
//					timer = setTimeout(function(){ o.run(); }, o.pollInterval);
					
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
		
		
		function day3_chart(){
			day3 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day3_a],
				          	["실적", day3_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
							
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day3"
				});			
		}
		
		
		//#ABF200

		function day4_chart(){
			day4 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day4_a],
				          	["실적", day4_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max

						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day4"
				});			
		}

		function day5_chart(){
			day5 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day5_a],
				          	["실적", day5_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day5"
				});			
		}		

		function day6_chart(){
			day6 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day6_a],
				          	["실적", day6_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day6"
				});			
		}
		
		function day7_chart(){
			day7 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day7_a],
				          	["실적", day7_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day7"
				});			
		}

		function day8_chart(){
			day8 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day8_a],
				          	["실적", day8_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day8"
				});			
		}		

		function day9_chart(){
			day9 = bb.generate({
				size:{
					width:280,
					height:70
				},
				data : {
				    columns: [
				          	["목표", day9_a],
				          	["실적", day9_b]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#day9"
				});			
		}		

		function dayAll_chart(){
			dayAll = bb.generate({
				size:{
					width:280,
					height:60
				},
				data : {
				    columns: [
				          	["목표", sum1],
				          	["실적", sum2]
				              ],
				      type:"bar"
					},
					legend:{
						show:false
					},
					tooltip:{
						show:false
					},
					axis:{
						rotated:true,
						y:{
							show:false,
							max:per_max
						},
						x:{
							show:false
						}					
					},color:{
						pattern:['#00FF00','#0000FF']
					},bar:{
						width:40,
						padding: 5
					},
					bindto : "#dayAll"
				});			
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
		    obj.value = comma(uncomma(obj.value));
		}		
		
		function init() {
			//초기값을 일별로
			$("#s_monthDayGb").val("d");
			
			//일별, 월별 조건창 보이게
			$("#day_div").show();
			$("#month_div").hide();
			
			//히스토리컬이 보이고, 실시간이 안보이게
			$("#history_btn").show();
			$("#real_btn").hide();
			
			var now = new Date();
			//오늘날짜(일별)
			var tday = now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10);
			var tmonth = now.toISOString().substring(5, 7);
			
			$("#s_sdate").val(tday);
			$("#s_month").val(tmonth);
		}
		
/*검색은 히스토리컬일때만 가능하게*/
		
		/*이벤트*/
		
		
		
		/*다이얼로그*/
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
				fn_check();
			}
		}
	});		
		
		
	var popupDialog = $("#popup-form").dialog({
		autoOpen:false,
		height:650,
		width:940,
		modal:false,
		stack:false,
		buttons:{
			"닫 기":function(){
				$("#alertSpan").text("오늘하루 열지 않습니다.");
				alertDialog.dialog("open");
				popup_close();
				popupDialog.dialog("close");
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
				
				$.post("i002002_tdate.jsp",{
					"cnt":$("#t_cnt").val(),
					"tdate":$("#t_date").val()
				},150);
				
				setTimeout(function(){
					$("#alertSpan").text("저장되었습니다.");
					alertDialog.dialog("open");
					
					var dForm = $("#dateform")[0];
					dForm.reset();
					fn_check();
					
				},500);
				
			},
			"닫 기":function(){
				var dForm = $("#dateform")[0];
				dForm.reset();
				tdateDialog.dialog("close");
			}
		}
	});	
	
	var buyDateDialog;
	buyDateDialog = $("#buyDate-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				buyDateDialog.dialog("close");
				
				$.post("i002002_buyDate.jsp",{
					"cnt":$("#buy_cnt").val(),
					"tdate":$("#buy_date").val()
				},150);
				
				setTimeout(function(){
					$("#alertSpan").text("저장되었습니다.");
					alertDialog.dialog("open");
					
					var dForm = $("#buyDateform")[0];
					dForm.reset();
					fn_check();
					
				},500);
				
			},
			"닫 기":function(){
				var dForm = $("#buyDateform")[0];
				dForm.reset();
				buyDateDialog.dialog("close");
			}
		}
	});	
	
	
	
	//O2센서
	var o2_popupDialog = $("#o2_popup-form").dialog({
		autoOpen:false,
		height:520,
		width:700,
		modal:false,
		stack:false,
		buttons:{
			"닫 기":function(){
				$("#alertSpan").text("오늘하루 열지 않습니다.");
				alertDialog.dialog("open");
				popup_close();
				o2_popupDialog.dialog("close");
			}
		}
	});
	
	var o2_tdateDialog;
	o2_tdateDialog = $("#o2_tdate-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				o2_tdateDialog.dialog("close");
				
				$.post("i002005_tdate.jsp",{
					"cnt":$("#o2_t_cnt").val(),
					"tdate":$("#o2_t_date").val()
				},150);
				
				setTimeout(function(){
					$("#alertSpan").text("저장되었습니다.");
					alertDialog.dialog("open");
					
					var o2_dForm = $("#o2_dateform")[0];
					o2_dForm.reset();
					fn_check();
					
				},500);
				
			},
			"닫 기":function(){
				var o2_dForm = $("#o2_dateform")[0];
				o2_dForm.reset();
				o2_tdateDialog.dialog("close");
			}
		}
	});	
	
	var o2_buyDateDialog;
	o2_buyDateDialog = $("#o2_buyDate-form").dialog({
		autoOpen:false,
		height:180,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"등 록":function(){
				o2_buyDateDialog.dialog("close");
				
				$.post("i002005_buyDate.jsp",{
					"cnt":$("#o2_buy_cnt").val(),
					"tdate":$("#o2_buy_date").val()
				},150);
				
				setTimeout(function(){
					$("#alertSpan").text("저장되었습니다.");
					alertDialog.dialog("open");
					
					var o2_dForm = $("#o2_buyDate-form")[0];
					o2_dForm.reset();
					fn_check();
					
				},500);
				
			},
			"닫 기":function(){
				var o2_dForm = $("#o2_buyDate-form")[0];
				o2_dForm.reset();
				o2_tdateDialog.dialog("close");
			}
		}
	});	
	
	
	//fn_chk();
	
		/*차트 불러오는 함수*/
	</script> --%>

</body>
</html>