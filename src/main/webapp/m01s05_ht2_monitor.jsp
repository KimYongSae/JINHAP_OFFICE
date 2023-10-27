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
    width: 1900px;    
    height: 370px;

    overflow-x: auto;
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
		src:url("fonts/h2hdrm.ttf") format("ttf");
		font-style:normal;
		font-weight:bold;
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

<body onload="init();" data-offset="60" data-target=".navbar" style="background-color:white">

            <div id="collapse4" class="body" >
            <div class="row">
            </div>     
                   
                   
            <div class="row">
             	<h4 style="font-size:24pt; font-family:headline; font-weight:700; text-align:center;
             	margin-top:10px; margin-bottom:2px;">2호기 이전 작업</h4>
             	
		              <div class="row">
			               <table id="before_list" cellspacing="0" 
			               class="table table-bordered table-hover table-responsive scrolltbody">
								<thead>
								
									<tr>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 300px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											진합 LOT
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 300px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											품번
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 320px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											품명
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 400px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											강종
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 460px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											T급
										</th>										
									</tr>
									
									
									<tr>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 300px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_lot">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 300px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_pnum">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 320px; height: 40px; 
										font-size: 13pt; font-family:headline; font-weight:700;"
										id="b_pname">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 400px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_gangjong">
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 460px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t_gb">
											
										</th>		
									</tr>									
								</thead>
							</table>
					     </div>   
					     
		              <div class="row" style="height:180px; margin-bottom:20px;">
			               <table id="before_list2" cellspacing="0" 
			               class="table table-bordered table-hover table-responsive scrolltbody">
								<thead>
									<tr>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 110px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											항목
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 1존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 2존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 3존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 4존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 5존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											유조
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;">
											중간세정기
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 1존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 2존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 3존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 4존
										</th>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											투입통수
										</th>										
									</tr>
									<tr>

										<th class="text-center cell" 
										style="background-color:#47C83E; width: 110px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											설정값
										</th>									
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q1">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q2">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q3">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q4">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q5">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_oil">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_a">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t1">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t2">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t3">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t4">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_tong_cnt">
										</th>									
									</tr>
									<tr>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 80px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											항목
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 17pt; font-family:headline; font-weight:700;">
											투입대기시간
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											장입량
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											투입시간
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 인버터
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 인버터
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#47C83E; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											CP 값
										</th>
									</tr>									
									<tr>
										<th class="text-center cell" 
										style="background-color:#47C83E; width: 80px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											설정값
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_lot_space">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_kg">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_stime">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_q_inv">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_t_inv">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="b_cp">
										</th>

									</tr>																											
								</thead>
							</table>
					     </div> 					     
					    <hr style="margin:1px; border:solid 0.5px black;" />
             	<h4 style="font-size:24pt; font-family:headline; font-weight:700; text-align:center;
             	margin-top:10px;">2호기 현재 작업</h4>
             	
		              <div class="row">
			               <table id="now_list" cellspacing="0" 
			               class="table table-bordered table-hover table-responsive scrolltbody">
								<thead>
								
									<tr>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 300px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											진합 LOT
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 300px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											품번
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 320px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											품명
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 400px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											강종
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 460px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											T급
										</th>										
									</tr>
									
									
									<tr>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 300px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_lot">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 300px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_pnum">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 320px; height: 40px; 
										font-size: 13pt; font-family:headline; font-weight:700;"
										id="n_pname">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 400px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_gangjong">
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 460px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t_gb">
											
										</th>		
																		
									</tr>									
								</thead>
							</table>
					     </div>   
					     
					     
					     
		              <div class="row" style="height:180px;">
			               <table id="before_list2" cellspacing="0" 
			               class="table table-bordered table-hover table-responsive scrolltbody">
								<thead>
									<tr>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 110px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											항목
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 1존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 2존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 3존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 4존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 5존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											유조
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;">
											중간세정기
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 1존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 2존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 3존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 4존
										</th>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 150px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											투입통수
										</th>										
									</tr>
									<tr>

										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 110px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											설정값
										</th>									
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q1">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q2">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q3">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q4">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q5">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_oil">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_a">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 130px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t1">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t2">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t3">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t4">
											
										</th>
										<th class="text-center cell" 
										style="background-color:#FFFFFF; width: 150px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_tong_cnt">
										</th>									
									</tr>
									<tr>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 80px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											항목
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 17pt; font-family:headline; font-weight:700;">
											투입대기시간
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											장입량
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											투입시간
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소입 인버터
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											소려 인버터
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#24FCFF; width: 220px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											CP 값
										</th>
									</tr>									
									<tr>
										<th class="text-center cell" 
										style="background-color:#24FCFF; width: 80px; height: 40px; 
										font-size: 20pt; font-family:headline; font-weight:700;">
											설정값
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_lot_space">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_kg">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_stime">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_q_inv">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_t_inv">
											
										</th>
										<th colspan="2" class="text-center cell" 
										style="background-color:#FFFFFF; width: 220px; height: 40px; 
										font-size: 18pt; font-family:headline; font-weight:700;"
										id="n_cp">
										</th>
									</tr>																											
								</thead>
							</table>
					     </div>

             	
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
/*인터벌*/
	
	
	
	
/*페이지 로드*/	
$(function(){
	
	
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
				
				$("#s_edate").val(rsAr[0].a_date);
				$("#s_etime").val(rsAr[0].a_time);	
				
// 				now_search();
				
// 				dateInterval = setInterval('now_search()',1000);
				
					$("#tdate").val(rsAr[0].n_date);
					getAllListBefore();
					getAllListAfter();

			} else if (rsJson && rsJson.status == "fail") {
				alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
			} else {
				alert("에러발생!");
			}
			
//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
			
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


	/* function now_search(){
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
				
			},	
			
		});
	} */
	
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


function init(){
	
}



function getAllListBefore(){
	$.ajax({
		type : "POST",
		url : "m01/s05/select_m01s05_ht2_monitor_before.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"tdate":$("#tdate").val()},
		success : function(rsJson) {
				var before = rsJson.rows;
				
//				console.log("b_r : "+before_rows);
				
				console.log(before);
				
				//이전작업

					//진합 LOT
					$("#b_lot").text(before.b_lot);
					//품번
					$("#b_pnum").text(before.b_pnum);
					//품명
					$("#b_pname").text(before.b_pname);
					//강종
					$("#b_gangjong").text(before.b_gangjong);
					//T급
					$("#b_t_gb").text(before.b_t_gb);
					//T급
					$("#b_tong_cnt").text(before.b_tong_cnt);
					
					
					//소입1존
					$("#b_q1").text(before.b_q1);
					//소입2존
					$("#b_q2").text(before.b_q2);
					//소입3존
					$("#b_q3").text(before.b_q3);
					//소입4존
					$("#b_q4").text(before.b_q4);
					//소입5존
					$("#b_q5").text(before.b_q5);
					//유조
					$("#b_oil").text(before.b_oil);
					//중간세정기
					$("#b_a").text(before.b_a);
					//소려1존
					$("#b_t1").text(before.b_t1);
					//소려2존
					$("#b_t2").text(before.b_t2);
					//소려3존
					$("#b_t3").text(before.b_t3);
					//소려4존
					$("#b_t4").text(before.b_t4);
					
					//투입 대기시간
					$("#b_lot_space").text((eval(before.b_lot_space)));
					
					//장입량
					$("#b_kg").text(before.b_weight);
					
					//투입시간
					$("#b_stime").text(before.b_stime);
					
				
					//소입로 인버터
					$("#b_q_inv").text((eval(before.b_q_inv)/100).toFixed(2));
					//아지테이터 인버터
//					$("#b_agi_inv").text();
					//소려로 인버터
					$("#b_t_inv").text((eval(before.b_t_inv)/100).toFixed(2));
					//CP 값
					$("#b_cp").text((eval(before.b_cp)/1000).toFixed(3));

			
//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
			
		}
		
	});				

}


function getAllListAfter(){
	$.ajax({
		type : "POST",
		url : "m01/s05/select_m01s05_ht2_monitor_after.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"tdate":$("#tdate").val()},
		success : function(rsJson) {
				var before = rsJson.rows;
				
//				console.log("b_r : "+before_rows);
				
				console.log(before);
				
				//이전작업

					//진합 LOT
					$("#n_lot").text(before.n_lot);
					//품번
					$("#n_pnum").text(before.n_pnum);
					//품명
					$("#n_pname").text(before.n_pname);
					//강종
					$("#n_gangjong").text(before.n_gangjong);
					//T급
					$("#n_t_gb").text(before.n_t_gb);
					//T급
					$("#n_tong_cnt").text(before.n_tong_cnt);
					
					
					//소입1존
					$("#n_q1").text(before.n_q1);
					//소입2존
					$("#n_q2").text(before.n_q2);
					//소입3존
					$("#n_q3").text(before.n_q3);
					//소입4존
					$("#n_q4").text(before.n_q4);
					//소입5존
					$("#n_q5").text(before.n_q5);
					//유조
					$("#n_oil").text(before.n_oil);
					//중간세정기
					$("#n_a").text(before.n_a);
					//소려1존
					$("#n_t1").text(before.n_t1);
					//소려2존
					$("#n_t2").text(before.n_t2);
					//소려3존
					$("#n_t3").text(before.n_t3);
					//소려4존
					$("#n_t4").text(before.n_t4);
					
					//투입 대기시간
					$("#n_lot_space").text((eval(before.n_lot_space)));
					
					//장입량
					$("#n_kg").text(before.n_weight);
					
					//투입시간
					$("#n_stime").text(before.n_stime);
					
				
					//소입로 인버터
					$("#n_q_inv").text((eval(before.n_q_inv)/100).toFixed(2));
					//아지테이터 인버터
//					$("#n_agi_inv").text();
					//소려로 인버터
					$("#n_t_inv").text((eval(before.n_t_inv)/100).toFixed(2));
					//CP 값
					$("#n_cp").text((eval(before.n_cp)/1000).toFixed(3));

			
//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
			
		}
		
	});				

}

function getNowList(){
	//열처리 LOT
	$("#n_heatlot").text("200512-QT003-009");
	//작업지시
	$("#n_work").text("2020051100400010");
	//원재료 LOT
	$("#n_originlot").text("AK206-AP4-11.00 00");
	//규격
	$("#n_spec").text("08*24.50*1.25");
	//품번
	$("#n_pnum").text("BOOSTER BOLTJK) BOLT");
	
	//전세정기
	$("#n_bw").text("65");
	//소입1존
	$("#n_q1").text("850");
	//소입2존
	$("#n_q2").text("870");
	//소입3존
	$("#n_q3").text("870");
	//소입4존
	$("#n_q4").text("880");
	//소입5존
	$("#n_q5").text("880");
	//유조
	$("#n_oil").text();
	//중간세정기
	$("#n_mw").text();
	//소려1존
	$("#n_t1").text();
	//소려2존
	$("#n_t2").text();
	//소려3존
	$("#n_t3").text();
	//소려4존
	$("#n_t4").text();
	
	//LOT 간격
	$("#n_lot_space").text();
	//공급기 속도
	$("#n_speed").text();
	//소입로 인버터
	$("#n_si_inv").text();
	//아지테이터 인버터
	$("#n_agi_inv").text();
	//소려로 인버터
	$("#n_sr_inv").text();
	//CP 값
	$("#n_cp").text();
	
}

function getAfterList(){
	//열처리 LOT
	$("#a_heatlot").text("200512-QT003-010");
	//작업지시
	$("#a_work").text("2020051100400010");
	//원재료 LOT
	$("#a_originlot").text("AK206-AP4-11.00 00");
	//규격
	$("#a_spec").text("08*24.50*1.25");
	//품번
	$("#a_pnum").text("BOOSTER BOLTJK) BOLT");
	
	//전세정기
	$("#a_bw").text("65");
	//소입1존
	$("#a_q1").text("850");
	//소입2존
	$("#a_q2").text("870");
	//소입3존
	$("#a_q3").text("870");
	//소입4존
	$("#a_q4").text("880");
	//소입5존
	$("#a_q5").text("880");
	//유조
	$("#a_oil").text();
	//중간세정기
	$("#a_mw").text();
	//소려1존
	$("#a_t1").text();
	//소려2존
	$("#a_t2").text();
	//소려3존
	$("#a_t3").text();
	//소려4존
	$("#a_t4").text();
	
	//LOT 간격
	$("#a_lot_space").text();
	//공급기 속도
	$("#a_speed").text();
	//소입로 인버터
	$("#a_si_inv").text();
	//아지테이터 인버터
	$("#a_agi_inv").text();
	//소려로 인버터
	$("#a_sr_inv").text();
	//CP 값
	$("#a_cp").text();
	
}


/*이벤트*/	
		
		
/*다이얼로그*/


/*차트 불러오는 함수*/

			
</script>
<input type="hidden" id="tdate" />
</body>
</html>

