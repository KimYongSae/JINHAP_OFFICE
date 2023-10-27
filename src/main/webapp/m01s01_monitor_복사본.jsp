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
		src:url("/fonts/headline.TTF") format("ttf");
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
							style="background-color:#24FCFF; width: 180px; height: 35px; 
								font-size: 22pt; font-family:headline;font-weight:700;">
								구 분
							</th>
							
							<th colspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 720px; height: 35px; 
								font-size: 22pt; font-family:headline;font-weight:700;"
								id="day_work">
							</th>
<!-- 							
							<th colspan="4" class="text-center cell" 
							style="background-color:#24FCFF; width: 780px; height: 35px; 
								font-size: 22pt; font-family:headline;font-weight:700;"
								id="day_work">
							</th>
 -->							
							<!-- 
							<th colspan="6" class="text-center cell" 
							style="background-color:#24FCFF; width: 800px; height: 35px; 
								font-size: 22pt; font-family:headline2;font-weight:700;"
								id="month_work">
								
							</th>
							 -->
						</tr>
						
						<tr>
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 160px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								일일<br />목 표
							</th>
<!-- 							
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								현시점<br />목 표
							</th>
 -->
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 160px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								실  적
							</th>
							
							
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 400px; height: 20px; 
								font-size: 22pt; font-family:headline;">
								일 달성율
							</th>						
							<!-- 
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								전일<br />목표
							</th>
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								전일<br />실적
							</th>
							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 35px; 
								font-size: 22pt; font-family:headline;">
								달성율
							</th>

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 20px; 
								font-size: 22pt; font-family:headline;">
								전일누계<br />목표
							</th>							

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 140px; height: 20px; 
								font-size: 22pt; font-family:headline;">
								전일누계<br />실적
							</th>

							<th rowspan="3" class="text-center cell" 
							style="background-color:#24FCFF; width: 120px; height: 20px; 
								font-size: 22pt; font-family:headline;">
								누계<br />달성율
							</th>
							 -->
						</tr>
						
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 400px; height: 20px; 
								font-size: 22pt; font-family:headline;">
								현시점 달성율
							</th>							
														
						</tr>												
					</thead>
					
					<tbody id="process_contents">
					
					</tbody>
				</table>
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
    var dateInetval;
	var day3, day4, day5, dayAll;
	var month3, month4, month5, monthAll;
	var tdate;
	var day3_a, day3_b, month3_a, month3_b;
	var day4_a, day4_b, month4_a, month4_b;
	var day5_a, day5_b, month5_a, month5_b;
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
						'tdate':$("#ttdate").val(),
						"ydate":$("#yydate").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						
						var rsAr = rsJson.rows;
						var rsAr2 = rsJson.rows2;
						var listHtml = "";
						var color = "";
						console.log(rsAr);
						console.log(rsAr2);
						day3_a = 0; day3_b = 0;
						day4_a = 0; day4_b = 0;
						day5_a = 0; day5_b = 0;
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
							day_work = "일간 생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 30분 기준";				
						}else{
							day_work = "일간 생산실적 - "+d_date.getFullYear()+"년 "+date_set(d_date.getMonth()+1)+"월 "+date_set(d_date.getDate())+"일 "+date_set(d_date.getHours())+"시 00분 기준";
						}
			
			var month_work = "월간 생산실적 - "+m_date.getFullYear()+"년 "+date_set(m_date.getMonth()+1)+"월 "+date_set(m_date.getDate())+"일 기준"
			$("#day_work").text(day_work);
			$("#month_work").text(month_work);
			
						var c_now = new Date();
//						var c_m = (c_now.getHours()+1);
						
						
						for(var i=0; i<6; i++){
							
							
							if(i == 0){
								//1호기
								day1_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1); 
								day1_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);					
							}else if(i == 1){
								//2호기
								day2_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day2_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);
							}else if(i == 2){
								//3호기
								day3_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day3_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 3){
								//4호기
								day4_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day4_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 4){
								//5호기
								day5_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day5_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}else if(i == 5){
								//6호기
								day6_a = (((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)))   / (rsAr[i].sumbuha) * 100).toFixed(1);
								day6_b = (  Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) )  / Math.round((rsAr[i].sumbuha  / 24 * c_m )) * 100).toFixed(1);						
							}
							
							
							var a = rsAr[i].sumbuha;
							var b = ((eval(rsAr[i].dkg)+eval(rsAr[i].nkg)));
							/*
							if(a < b){
								color = "background-color:#FFFFFF;";
							}else{
								color = "background-color:#FF0000;"
							}
							*/
							
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
							
							listHtml += "<tr>";
							listHtml += '<td rowspan="2" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 120px; width: 180px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700; '+color+'">Q01-HN0'+(i+1)+'</td>';
							listHtml += '<td rowspan="2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 120px; width: 160px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].sumbuha)+'</td>';
/*							listHtml += '<td rowspan="2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 160px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(Math.round((rsAr[i].sumbuha /24 * c_m )))+'</td>';*/
							listHtml += '<td rowspan="2" class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 120px; width: 160px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(Math.round( (eval(rsAr[i].dkg)+eval(rsAr[i].nkg)) ) )+'</td>';
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 120px; width: 260px; word-break:break-all;"><div id="day'+(i+1)+'"></div></td>';
							listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 70px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+percent1+'%</td>';
/*							
							listHtml += '<td rowspan="2" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 160px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(rsAr2[i].sumbuha)+'</td>';
							listHtml += '<td rowspan="2" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 160px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(eval(rsAr2[i].dkg)+eval(rsAr2[i].nkg))+'</td>';							
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+percent3+'%</td>';							
							listHtml += '<td rowspan="2" class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 160px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(rsAr2[i].sumbuha)+'</td>';
							listHtml += '<td rowspan="2" class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 160px; width: 140px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+comma(eval(rsAr2[i].dkg)+eval(rsAr2[i].nkg))+'</td>';							
							listHtml += '<td rowspan="2" class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 80px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+percent4+'%</td>';
*/							
							listHtml += "</tr>";
							
							
							
							
							listHtml += "<tr>";
							if(c_m == 0){
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">0%</td>';
							}else{
								listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 60px; width: 120px; word-break:break-all; font-size:24pt; font-family:headline; font-weight:700;">'+percent2+'%</td>';
							}
							
																					
							listHtml += "</tr>";
							
							////////////////////////////
							
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
					width:230,
					height:120
				},
				data : {
				    columns: [
				          	["목표", day1_a],
				          	["실적", day1_b]
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
					width:230,
					height:120
				},
				data : {
				    columns: [
				          	["목표", day2_a],
				          	["실적", day2_b]
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
						width:90,
						padding: 5
					},
					bindto : "#day2"
				});			
		}
		
		

		function day3_chart(){
			day3 = bb.generate({
				size:{
					width:230,
					height:120
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
						width:90,
						padding: 5
					},
					bindto : "#day3"
				});			
		}				
		

		function day4_chart(){
			day4 = bb.generate({
				size:{
					width:230,
					height:120
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
						width:90,
						padding: 5
					},
					bindto : "#day4"
				});			
		}				
		

		function day5_chart(){
			day5 = bb.generate({
				size:{
					width:230,
					height:120
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
						width:90,
						padding: 5
					},
					bindto : "#day5"
				});			
		}				
		

		function day6_chart(){
			day6 = bb.generate({
				size:{
					width:230,
					height:120
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
						width:90,
						padding: 5
					},
					bindto : "#day6"
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

	/*차트 불러오는 함수*/
	</script>
<input type="hidden" id="ttdate" name="ttdate" />
<input type="hidden" id="yydate" name="yydate" />

</body>
</html>