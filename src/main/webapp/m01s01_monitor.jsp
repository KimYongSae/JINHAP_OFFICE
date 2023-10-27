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
/*    margin: 0 auto;*/
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}


.scrolltbody tbody {
    display: block;
    height: 800px;
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

</script>


</head>





<body onload="init();" data-offset="60" data-target=".navbar" style="background:white;">
	<div id="collapse4" class="body" style="height:930px;">
            <div class="row">
            	<h1 class="text-center control-label" id="now_datetime" 
            		style="font-weight:bold; font-size:30pt;"></h1>
            </div>
			<div class="row">
              <table id="process_list" cellspacing="0" 
               class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
					
						<tr>
							<th rowspan="4" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 18pt; font-family:headline;font-weight:700;">
								설비명
							</th>
							
							<th colspan="13" class="text-center cell" 
							style="background-color:#24FCFF; width: 420px; height: 35px; 
								font-size: 18pt; font-family:headline;font-weight:700;"
								id="day_work">
							</th>
						</tr>
						
						<tr>
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								생산능력
							</th>
 							
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								부여시간<br />(HR)
							</th>

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								일 생산<br />LOT
							</th>

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								로트간격<br />구분시간
							</th>
							
							
							<th class="text-center cell" colspan="4"
							style="background-color:#24FCFF; width: 400px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								생산 LOSS 시간
							</th>						

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								가동시간<br />(LOSS 제외)
							</th>
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								생산가능량<br />(KG)
							</th>
							<th class="text-center cell" colspan="3"
							style="background-color:#24FCFF; width: 300px; height: 35px; 
								font-size: 18pt; font-family:headline;">
								실적
							</th>

						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								로트구분
							</th>						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								조건변경
							</th>						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								비가동
							</th>						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								계
							</th>						

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								생산
							</th>					

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 100px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								과부족
							</th>					

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 260px; height: 20px; 
								font-size: 18pt; font-family:headline;">
								달성율
							</th>					
						</tr>												
					</thead>

					<tbody id="process_contents">
					
					</tbody>
				</table>
			</div>
		</div>
		
		<input type="text" style="display:none;" id="ntDateFull" />
		<input type="text" style="display:none;" id="ntDateFull2" />
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
    var dateInetval;
	var day3, day4, day5, dayAll;
	var month3, month4, month5, monthAll;
	var tdate;
	
	var day1_a, day1_b, month1_a, month1_b;
	var day2_a, day2_b, month2_a, month2_b;
	var day3_a, day3_b, month3_a, month3_b;
	var day4_a, day4_b, month4_a, month4_b;
	var day5_a, day5_b, month5_a, month5_b;
	var day6_a, day6_b, month6_a, month6_b;	
	
	var sum1 = 0;
	var sum2 = 0;
	var sum3 = 0;
	var sum4 = 0;
	
	var percent1 = 0;
	var percent2 = 0;
	var percent3 = 0;
	var percent4 = 0;
	
	var percent5 = 0;
	var percent6 = 0;
	var percent7 = 0;
	var percent8 = 0;
	
	var per_max = 0;
	
	/*인터벌*/
	

	/*페이지 로드*/

	$(function(){
		$("#loading").show();
		var now = new Date();
		tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
		
		/*
			var tempDate = new Date();
			var yesDate = new Date();
			yesDate.setDate(tempDate.getDate() - 1);		
		*/
		
		var tempDate = new Date();
		var yesDate = new Date();
		yesDate.setDate(tempDate.getDate() - 1);
		
		$("#yydate").val(yesDate.getFullYear()+"-"+date_set(yesDate.getMonth()+1)+"-"+date_set(yesDate.getDate()));		
		$.ajax({
			type : "POST",
			url : "util/lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var ndate = rsAr[0].n_date;
					var ntime = rsAr[0].n_time; //08:00:00
					var n_h = eval(ntime.substring(0,2));
					var n_m = eval(ntime.substring(3,5));
//						console.log(n_h+", "+n_m);
					var ntDate = new Date();
					var ntDate2 = new Date();
					if(n_h < 8){			
						ntDate.setDate(now.getDate()-1);
						ntDate2.setDate(now.getDate());
					}else{
						ntDate.setDate(now.getDate());
						ntDate2.setDate(now.getDate()+1);
					}
						
					var ntDateFull = ntDate.getFullYear()+"-"+checkTime((ntDate.getMonth()+1))+"-"+checkTime(ntDate.getDate());
					var ntDateFull2 = ntDate2.getFullYear()+"-"+checkTime((ntDate2.getMonth()+1))+"-"+checkTime(ntDate2.getDate());
					$("#ntDateFull").val(ntDateFull);
					$("#ntDateFull2").val(ntDateFull2);
//					console.log("날짜 : "+ntDateFull);
					
					
					$("#s_sdate").val(rsAr[0].b_date);
					$("#s_stime").val(rsAr[0].b_time);
//					console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#s_edate").val(rsAr[0].a_date);
					$("#s_etime").val(rsAr[0].a_time);	
					
					$("#ttdate").val(rsAr[0].n_date);
					

					dateInterval = setInterval('now_search()',1000);
					
					getProcessList();					
					
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
	function now_search(){
		$.ajax({
			type : "POST",
			url : "util/lmonitor_date_search.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					
					$("#now_datetime").text(
							rsAr[0].n_date.substring(0,4)+"년"
							+
							rsAr[0].n_date.substring(5,7)+"월"
							+
							rsAr[0].n_date.substring(8,10)+"일"
							+
							" "
							+
							rsAr[0].n_time.substring(0,2)+"시"
							+
							rsAr[0].n_time.substring(3,5)+"분"
							+
							rsAr[0].n_time.substring(6,8)+"초"
							);
					

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

		function getProcessList(){
			$.ajax({
				type : "POST",
				url : "m01/s01/select_m01s01_monitor.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						"tdate":$("#ntDateFull").val(),
						"tdate2":$("#ntDateFull2").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						
						var rsAr = rsJson.rows;
						var rsAr2 = rsJson.rows2;
						var listHtml = "";
						var color = "";
						day1_a = 0; day1_b = 0;
						day2_a = 0; day2_b = 0;
						day3_a = 0; day3_b = 0;
						day4_a = 0; day4_b = 0;
						day5_a = 0; day5_b = 0;
						day6_a = 0; day6_b = 0;
						sum1 = 0;
						sum2 = 0;
						sum3 = 0;
						sum4 = 0;
						sum5 = 0;
						sum6 = 0;
						sum7 = 0;
						sum8 = 0;
						
						percent1 = 0;
						percent2 = 0;
						percent3 = 0;
						percent4 = 0;
						
						percent5 = 0;
						percent6 = 0;
						percent7 = 0;
						percent8 = 0;
						
						var d_date = new Date();
						
						var m_temp = new Date();
						var m_date = new Date();
						m_date.setDate(m_temp.getDate() - 1);
						
						
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
//							day_work = "일간 생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 30분 기준";			
						}else{
							day_work = "생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 00분 기준";
						}
			
						
			var month_work = "월간 생산실적 - "+m_date.getFullYear()+"년 "+date_set(m_date.getMonth()+1)+"월 "+date_set(m_date.getDate())+"일 기준"
			$("#day_work").text(day_work);
			$("#month_work").text(month_work);
			
						var c_now = new Date();
//						var c_m = (c_now.getHours()+1);
						
						var a_1, a_2, a_4;
						var a_5, a_6, a_7, a_8, a_9;
						var a_10, a_11, a_12, a_13, a_14;
						per_max = 100;
						
						
						for(var i=0; i<rsAr.length; i++){
							
							if(i == 0){
								a_1 = 1000;
								a_2 = "24";
								a_4 = "8분";								
							}else if(i == 1){
								a_1 = 500;
								a_2 = "24";
								a_4 = "8분";
							}else if(i == 2){
								a_1 = 500;
								a_2 = "24";
								a_4 = "8분";
							}else if(i == 3){
								a_1 = 1000;
								a_2 = "24";
								a_4 = "8분";
							}else if(i == 4){
								a_1 = 1000;
								a_2 = "24";
								a_4 = "8분";
							}else if(i == 5){
								a_1 = 1000;
								a_2 = "24";
								a_4 = "8분";
							}

							a_5 = (8 * rsAr[i].a_3/60).toFixed(1);
							a_6 = 0;
							a_7 = 0;
							a_8 = (eval(a_5)+a_6+a_7).toFixed(1);
							a_9 = 24 - a_5;
							a_10 = a_1 * a_9;
							a_12 = a_10 - rsAr2[i].a_11;
							a_13 = (rsAr2[i].a_11 / a_10*100).toFixed(1);
							
							if(i==0){
								day1_a = a_13;
							}else if(i==1){
								day2_a = a_13;
							}else if(i==2){
								day3_a = a_13;
							}else if(i==3){
								day4_a = a_13;
							}else if(i==4){
								day5_a = a_13;
							}else if(i==5){
								day6_a = a_13;
							}
							
							listHtml += "<tr>";
							listHtml += '<td id="h'+(i+1)+'_a0" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700; '+color+'">'+(i+1)+'호기</td>';
							listHtml += '<td id="h'+(i+1)+'_a1" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_1+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_2+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a3" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+rsAr[i].a_3+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a4" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_4+'</td>';
							
							listHtml += '<td id="h'+(i+1)+'_a5" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_5+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a6" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_6+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a7" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_7+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a8" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_8+'</td>';
							
							listHtml += '<td id="h'+(i+1)+'_a9" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+a_9+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a10" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(a_10)+'</td>';

							listHtml += '<td id="h'+(i+1)+'_a11" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:22pt; font-family:headline; font-weight:700;">'+comma(rsAr2[i].a_11)+'</td>';
							listHtml += '<td id="h'+(i+1)+'_a12" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:22pt; font-family:headline; font-weight:700;">'+comma(a_12)+'</td>';

							
							listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 160px; word-break:break-all;"><div id="day'+(i+1)+'"></div></td>';
							listHtml += '<td id="h'+(i+1)+'_a13" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 110px; width: 100px; word-break:break-all; font-size:22pt; font-family:headline; font-weight:700;">'+a_13+'%</td>';
				
							listHtml += "</tr>";
						}
													
							
						$("#process_contents").html(listHtml);
						
						day1_chart(); day2_chart(); day3_chart();
						day4_chart(); day5_chart(); day6_chart();

						
						$("#loading").hide();
						
					} else if (rsJson && rsJson.status == "fail") {
						alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
					} else {
						alert("에러발생!");
					}
					
//					timer = setTimeout(function(){ o.run(); }, o.pollInterval);
					
				},
				
			});						
		}
		
		
		function day1_chart(){
			day1 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day1_a]
//				          	,["실적", day1_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day1"
				});			
		}
		
		
		//#ABF200

		function day2_chart(){
			day2 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day2_a]
//				          	,["실적", day2_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day2"
				});			
		}
		
		

		function day3_chart(){
			day3 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day3_a]
//				          	,["실적", day3_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day3"
				});			
		}				
		

		function day4_chart(){
			day4 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day4_a]
//				          	,["실적", day4_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day4"
				});			
		}				
		

		function day5_chart(){
			day5 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day5_a]
//				          	,["실적", day5_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day5"
				});			
		}				
		

		function day6_chart(){
			day6 = bb.generate({
				size:{
					width:150,
					height:60
				},
				data : {
				    columns: [
				          	["목표", day6_a]
//				          	,["실적", day6_b]
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
						pattern:
//					['#00FF00'],
					['#0000FF']
					},bar:{
						width:90,
						padding: 5
					},
					bindto : "#day6"
				});			
		}				
	
	function getMachinePerformance(){
		
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

	/*차트 불러오는 함수*/
	</script>
<input type="hidden" id="ttdate" name="ttdate" />
<input type="hidden" id="yydate" name="yydate" />

</body>
</html>