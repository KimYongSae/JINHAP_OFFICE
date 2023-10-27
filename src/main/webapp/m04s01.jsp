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
    height: 600px;

    overflow-x: hidden;
}

	#loading-image {  
	 position: absolute;  
	 top: 20%;  
	 left: 20%; 
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


<div id="wrap">

    <div id="header">
		<jsp:include page="/header-menu.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-top:30px;">
		
		<jsp:include page="/body-menu.jsp"/>
	</div>
	<div id="contents">
        
<div class="content" style="height:780px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-industry"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">설비관리 - 설비 보전 모니터링</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
						<div class="form-group">
							<label class="control-label" style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 90px; text-align: right;">설비선택 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm" 
							id="s_hogi" name="s_hogi" 
						style="margin-top:5px; height: 30px; width: 140px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;">
								<option value="">설비선택</option>
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
								width: 50px; text-align: right;">기간 : </label>
						</div>
						<!-- 시작일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_sdate" name="s_sdate" 
							style="margin-top:5px; height: 30px; width: 160px; 
							font-size: 14pt; font-family:headline;font-weight:700;"
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<span class="control-label" 
						style="color:#8C8C8C; 
						font-size:13pt; font-family:headline;">~</span>
						
						<!-- 종료일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" 
							id="s_edate" name="s_edate" 
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
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 100px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								설비명
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								구분
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 110px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								실시일자
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 180px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								정지일자
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								처리부서
							</th>							
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 100px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								처리<br />담당자
							</th>	
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 160px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								고장현상
							</th>	
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 180px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								고장부위
							</th>	
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 140px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								고장원인
							</th>	
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 180px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								비고
							</th>	
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 100px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								의뢰시간
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 160px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								결과코드
							</th>
							<th class="text-center cell" style="background-color:#36FFFF; 
							width: 100px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								생성구분
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

/*인터벌*/
	
/*페이지 로드*/	
$(function(){
	
	fn_check();
	
	
	var now = new Date();
	//오늘날짜(일별)
	tday = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
	$("#s_sdate").val(tday);


	$("#s_edate").val(tday);
//	getMonitoringList();

	
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
function init(){
	
}

	function getMonitoringList(){

		$.ajax({
				type : "POST",
				url : "l004001.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
					"hogi":$("#s_hogi").val(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						
						var rsAr = rsJson.rows;
						var listHtml = "";
//						console.log(listHtml);
//						console.log("==========================");
							for(var i=0; i<rsAr.length; i++){
								
								
								
								listHtml += "<tr>";
								listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].mchno+'</td>';
								listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 120px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].gubun+'</td>';
								listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 110px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].sidat+'</td>';
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].jidat+'</td>';
								listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 120px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].widpt+'</td>';
								listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].empname+'</td>';
								listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].gocod+'</td>';
								listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].godesc+'</td>';
								listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 140px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].jecod+'</td>';
								listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 180px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].bigo+'</td>';
								listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].retim+'</td>';
								listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 160px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].rslcod+'</td>';
								listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 50px; width: 100px; word-break:break-all; font-size:16pt; font-family:headline; font-weight:700;">'+rsAr[i].ins_gub+'</td>';
								listHtml += "</tr>";
								
							}
//							console.log(listHtml);
							$("#monitoring_list tbody").html(listHtml);
						
			   			
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

	
/*이벤트*/	
$("#searchbtn").on("click",function(){
	getMonitoringList();
});
		
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>