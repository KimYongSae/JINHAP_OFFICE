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

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css"/>

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
    height: 280px;

    overflow-x: hidden;
}


/*호기목록*/
.scrolltbody2 {
    display: block;
    width: 1900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody2 td { border: 1px solid #000; border-top: 0;}


.scrolltbody2 tbody {
    display: block;
    height: 200px;

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
	
	.select2-container--default .select2-selection--single .select2-selection__rendered{
		font-size:14pt;
		font-family:headline;
		font-weight:700;
	}
	
	
	.select2-container--default .select2-results>.select2-results__options li{
		font-size:14pt;
		font-family:headline;
		font-weight:700;		
	}
	
	.table th {
    background-color: #122d64;
    color:#FFFFFF;
    border-color: #FFFFFF !important;
    height: 30px; 
    font-size:16pt; 
    font-family: headline;
}

#gantryList .r1{
	width: 50px;
}
#gantryList .r2{
	width: 500px;
}
#gantryList .r3{
	width: 500px;
}
#gantryList .r4{
	width: 150px;
}
#gantryList .r5{
	width: 150px;
}
#gantryList .r6{
	width: 200px;
}
#gantryList .r7{
	width: 80px;
}

.nr1{
	width: 100px;
}
.nr2{
	width: 150px;
}
.nr3{
	width: 150px;
}
.nr4{
	width: 250px;
}
.nr5{
	width: 400px;
}
.nr6{
	width: 100px;
}
.nr7{
	width: 100px;
}
.nr8{
	width: 100px;
}
.nr9{
	width: 100px;
}
.nr10{
	width: 100px;
}
.rtime{
	width: 100px;
}
.rauto{
	width: 100px;
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
	<!-- <div id="loading" style="display:none;">
		<img id="loading-image" src="resources/img/loading2.gif" alt="Loading..." />
	</div> -->

<div id="wrap">

    <div id="header">
		<jsp:include page="header-menu.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-top:30px;">
		
		<jsp:include page="body-menu.jsp"/>
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
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">생산관리 - 열처리 재공현황 조회</h5>
            </header>
            
            
            <div id="collapse4" class="body">				
				
                <table id="gantryList" class="table table-bordered table-hover table-responsive scrolltbody2">
					<thead>
						<tr>
							<th class="text-center cell r1">NO</th>
							<th class="text-center cell r2">품번</th>
							<th class="text-center cell r3">품명</th>
							<th class="text-center cell r4">강종</th>
							<th class="text-center cell r5">T급</th>
							<th class="text-center cell r6">진합LOT</th>
							<th class="text-center cell r7">통 수량</th>
						</tr>
					</thead>
					<tbody id="gantryContents">
					
					</tbody>
				</table>
            </div>
        </div>
    </div>
    
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">               
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label"
							style="font-size: 14pt; font-family: headline; color: #8C8C8C; width: 50px; text-align: right; font-weight: 700;">설비
							: </label>
					</div>

					<div class="form-group">
						<select class="form-control input-sm" id="hogi" name="hogi"
							style="margin-top: 5px; height: 30px; width: 140px; font-size: 14pt; padding-top: 1px; padding-bottom: 1px; font-family: headline; font-weight: 700;">
							<option value="0">전체</option>
							<option value="1">Q01-HN01</option>
							<option value="2">Q01-HN02</option>
							<option value="3">Q01-HN03</option>
							<option value="4">Q01-HN04</option>
							<option value="5">Q01-HN05</option>
							<option value="6">Q01-HN06</option>
						</select>
	
					</div> 
					<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 50px; text-align: right;">기간 : </label>
						</div>
						
						<!-- 발생일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" id="s_date" name="s_date" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="s_time" name="s_time" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="00:00:00"
							onkeyup="auto_time_format(event, this);"/>
						</div>						
						~						
						<!-- 해제일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" id="e_date" name="e_date" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="e_time" name="e_time" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="23:59:59"
							onkeyup="auto_time_format(event, this);"/>
						</div>
															
				</form>
            </header>
            <div id="collapse4" class="body">
				
                <table id="factory_list2" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell nr1">호기</th>
							<th class="text-center cell rtime">입고시간</th>
							<th class="text-center cell rauto">자동/수동</th>
							<th class="text-center cell nr2">바코드</th>
							<th class="text-center cell nr3">LOT</th>
							<th class="text-center cell nr4">품번</th>
							<th class="text-center cell nr5">품명</th>
							<th class="text-center cell nr6">강종</th>
							<th class="text-center cell nr7">CP</th>
							<th class="text-center cell nr8">소입온도</th>
							<th class="text-center cell nr9">소려온도</th>
							<th class="text-center cell nr10">T급</th>
						</tr>
					</thead>
					<tbody id="lotContents">
						<tr>
							
						</tr>
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
	  getGantryList();
	  
	  date_search();
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
	
	
	

	
	
	
	
	function getGantryList(){
		
		$.ajax({
			type : "POST",
			url : "m01/s06/select_m01s06.jsp",
			cache : false,
			dataType : "json",
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var listHtml = "";
					console.log(rsAr);
						for(var i=0; i<rsAr.length; i++){	
							listHtml += "<tr>";
							listHtml += '<td class="text-center cell r1">'+rsAr[i].listIdx+'</td>';
							listHtml += '<td class="text-center cell r2">'+rsAr[i].pnum+'</td>';
							listHtml += '<td class="text-center cell r3">'+rsAr[i].pname+'</td>';
							listHtml += '<td class="text-center cell r4">'+rsAr[i].gang+'</td>';
							listHtml += '<td class="text-center cell r5">'+rsAr[i].t_gb+'</td>';
							listHtml += '<td class="text-center cell r6">'+rsAr[i].jhlot+'</td>';
							listHtml += '<td class="text-center cell r7">'+rsAr[i].tongCount+'</td>';
							listHtml += "</tr>";							
						}
					$("#gantryContents").html(listHtml);
					
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
	function getLotList(){
		
		$.ajax({
			type : "POST",
			url : "m01/s06/select_lot_m01s06.jsp",
			cache : false,
			dataType : "json",
			data:{
				hogi : $("#hogi").val(),
				"sdate":$("#s_date").val(),
	          	"edate":$("#e_date").val(),
	          	"stime":$("#s_time").val(),
	          	"etime":$("#e_time").val()
			},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var listHtml = "";
					console.log(rsAr);
						for(var i=0; i<rsAr.length; i++){	
							listHtml += "<tr>";
							listHtml += '<td class="text-center cell nr1">' + rsAr[i].hogi + '</td>';
							listHtml += '<td class="text-center cell rtime">' + rsAr[i].time + '</td>';
							listHtml += '<td class="text-center cell rauto"></td>';
							listHtml += '<td class="text-center cell nr2">' + rsAr[i].barcode + '</td>';
							listHtml += '<td class="text-center cell nr3">' + rsAr[i].lot + '</td>';
							listHtml += '<td class="text-center cell nr4">' + rsAr[i].item_cd + '</td>';
							listHtml += '<td class="text-center cell nr5">' + rsAr[i].pname + '</td>';
							listHtml += '<td class="text-center cell nr6">' + rsAr[i].gang + '</td>';
							listHtml += '<td class="text-center cell nr7">' + rsAr[i].cp + '</td>';
							listHtml += '<td class="text-center cell nr8">' + rsAr[i].quen + '</td>';
							listHtml += '<td class="text-center cell nr9">' + rsAr[i].temp + '</td>';
							listHtml += '<td class="text-center cell nr10">' + rsAr[i].t_gb + '</td>';

							listHtml += "</tr>";							
						}
					$("#lotContents").html(listHtml);
					
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
					$("#s_date").val(rsAr[0].y_date);
					//$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
					$("#s_time").val("08:00:00");
					//$("#s_stime").val(rsAr[0].n_time);
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#e_date").val(rsAr[0].n_date);
					//$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					//$("#s_etime").val(rsAr[0].n_time);
					$("#e_time").val("08:00:00");
					
				} else if (rsJson && rsJson.status == "fail") {
					alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				} else {
					alert("에러발생!");
				}
				
				getLotList();
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
  		$("#hogi, #s_date, #s_time, #e_date, #e_time").on('change', function(){
  			getLotList();
  		})
		
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>
<!-- 호기별 (선택한 주 설비명) -->
<input type="hidden" id="select_mch" name="select_mch" />
<!-- CP별 (선택한 CP값) -->
<input type="hidden" id="select_cp" name="select_cp" />
<!-- 재질경도 별 (선택한 Jijil값) -->
<input type="hidden" id="select_jijil" name="select_jijil" />
<!-- 공장코드 별 (선택한 공장코드값) -->
<input type="hidden" id="select_factory" name="select_factory" />
<!-- 템퍼링 온도별 (선택한 온도값) -->
<input type="hidden" id="select_temper" name="select_temper" />
</body>
</html>