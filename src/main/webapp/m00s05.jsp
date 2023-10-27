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


<script type="text/javascript" src="resources/js/jquery.tablesorter.js"></script>

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
    width: 430px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}


.scrolltbody tbody {
    display: block;
    width: 430px;
    height: 280px;

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

	@font-face{
		font-family:"margun";
		font-style:normal;
		font-weight:normal;
		src:url("fonts/malgungothic.ttf") format("truetype");
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
                <h5 style="font-family: headline; font-size:14pt;">모니터링 - RX유량 입력값 확인</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" id="searchform" 
                name="searchform" method="post" autocomplete="off">
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt;  font-family:headline; font-weight:700; 
								color:#8C8C8C; width: 120px; text-align: right;">입력날짜: </label>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_sdate" name="s_sdate" 
							style="margin-top:5px; height: 30px; width: 160px; 
								font-size: 14pt; font-family:headline; font-weight:700;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>				
						~
						<!-- 종료일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_edate" name="s_edate" 
							style="margin-top:5px; height: 30px; width: 160px; 
								font-size: 14pt; font-family:headline; font-weight:700;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								style="margin-top:6px; height: 31px; width: 100px; 
								font-size:14pt; font-weight:700; font-family:headline;
								padding-top:1px; padding-bottom:1px;" 
								id="searchbtn">
								<i class="fa fa-search"></i> 검 색</button>
							</div>
						</div>
										
				</form>
            </header>
            
            
            
            <div id="collapse4" class="body" style="height:690px;">
	            	<!-- 3, 4, 5, 6 호기 -->
		            <div class="row" style="width:100%; height:300px;">
		       
		       		<!-- 3호기 유량 -->     
		            <div class="col-xs-4">	            
		               <table id="rx1_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody"
		                style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx1_contents">
								
							</tbody>
						</table>
		            
		            </div>
		            
		            <!-- 4호기 유량 -->
		            <div class="col-xs-4">
		               <table id="rx2_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody"
		                style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx2_contents">
								
							</tbody>
						</table>
			            
		            </div>
		            
		            <!-- 5호기 유량 -->
		            <div class="col-xs-4">
		               <table id="rx3_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody"
		                style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx3_contents">
								
							</tbody>
						</table>
		            </div>
		            
		            <!-- 6호기 유량 
					<div class="col-xs-3" style="padding-right:0;">
		               <table id="rx4_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx4_contents">
								
							</tbody>
						</table>
					</div>
	            </div>
	            <br><br>
	            -->
				<!-- 7, 8, 9 호기 -->
	            <div class="row" style="width:100%; height:300px;">

					<!-- 7호기 유량 -->					
					<div class="col-xs-4 col-lg-offset-0 col-lg-4" >
		               <table id="rx11_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody" style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx11_contents">
								
							</tbody>
						</table>
					
					</div>
					
					<!-- 8호기 유량 -->
					<div class="col-xs-3 col-lg-4">
		               <table id="rx12_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody" style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx12_contents">
								
							</tbody>
						</table>
					
					</div>
					
					<!-- 9호기 유량 -->
					<div>
		               <table id="rx13_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody" style="margin : 0 auto;">
							<thead>
								<tr>
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										설 비 명
									</th>
									
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 230px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										입력시간
									</th>
									
									<th class="text-center cell" 
										style="background-color:#36FFFF; width: 90px; height: 40px; 
											font-size: 16pt; font-family:headline; font-weight:700;">
										RX 유량
									</th>	
													
								</tr>
							</thead>
												
							<tbody id="rx13_contents">
								
							</tbody>
						</table>
					
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

/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	fn_check();
	
	$("#rx_list").tablesorter({debug:true});
	
	var now = new Date();
	
	var tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());

	var m_temp = new Date();
	var yester = new Date();
	yester.setDate(m_temp.getDate() - 1);
	
	var ydate = yester.getFullYear()+"-"+date_set(yester.getMonth()+1)+"-"+date_set(yester.getDate());


	$("#s_sdate").val(ydate);
	$("#s_edate").val(tdate);
/*	
	getRxList1(); getRxList2(); getRxList3();
	getRxList4(); getRxList11(); getRxList12();
	getRxList13();
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

	//3호기
	function getRxList1(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"1",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx1_contents").html(listHtml);
						$("#rx1_list").trigger("update");
						
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


	//4호기
	function getRxList2(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"2",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx2_contents").html(listHtml);
						$("#rx2_list").trigger("update");
						
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

	

	//5호기
	function getRxList3(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"3",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx3_contents").html(listHtml);
						$("#rx3_list").trigger("update");
						
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
	
	

	//6호기
	function getRxList4(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"4",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx4_contents").html(listHtml);
						$("#rx4_list").trigger("update");
						
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
	

	//7호기
	function getRxList11(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"11",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx11_contents").html(listHtml);
						$("#rx11_list").trigger("update");
						
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
	

	//8호기
	function getRxList12(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"12",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx12_contents").html(listHtml);
						$("#rx12_list").trigger("update");
						
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
	
	//9호기
	function getRxList13(){
		$.ajax({
			type : "POST",
			url : "l000007.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':"13",
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
					var color = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].color == '0'){
								color = "background-color:#FF0000;";
							}else{
								color = "";
							}
							
							
							listHtml += "<tr style="+color+">";							
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 230px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].datadate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].rx_val+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#rx13_contents").html(listHtml);
						$("#rx13_list").trigger("update");
						
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
	
	
	
/*이벤트*/	
	$("#searchbtn").on("click",function(){
		getRxList1();
		getRxList2();
		getRxList3();
		getRxList4();
		getRxList11();
		getRxList12();
		getRxList13();
	});
		
	$("#s_hogi").change(function(){
		getRxList1();
		getRxList2();
		getRxList3();
		getRxList4();
		getRxList11();
		getRxList12();
		getRxList13();
	});
	
	
	
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>