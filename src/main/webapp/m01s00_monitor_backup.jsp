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
    /* width: 1900px; */
    border-collapse: collapse;
    border: 0px solid #000;
    padding-top: 50px;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}


.scrolltbody tbody {
    display: block;
    height: 500px;

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
	#gaugeChart1 .bb-title,
	#gaugeChart2 .bb-title,
	#gaugeChart3 .bb-title,
	#gaugeChart4 .bb-title,
	#gaugeChart5 .bb-title,
	#gaugeChart6 .bb-title {
    	font-size: 25px;
    	font-weight: bold;
	}

	.table-responsive thead th {
	    background-color: #36FFFF;
	    height: 30px;
	    font-size: 16pt;
	    font-family: headline;
	    font-weight: 700;
	}
	
	.table-responsive tbody th,
	.table-responsive tbody td {
	    height: 30px;
	    font-size: 15pt;
	    font-family: headline;
	    font-weight: 700;
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

<body >


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
  <!-- 월간 -->
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">생산관리 - 종합생산현황</h5>
            </header>
            
            <div id="collapse4" class="body">
            	<div class="container" >
	            	<div class="row">
            			<div class="col-xs-12"style="padding-bottom: 20px;">
			            	<div class="row">
			            		<div id="gaugeChart1" class="col-xs-4"></div>
			            		<div id="gaugeChart2" class="col-xs-4"></div>
			            		<div id="gaugeChart3" class="col-xs-4"></div>
			            		<div id="gaugeChart4" class="col-xs-4"></div>
			            		<div id="gaugeChart5" class="col-xs-4"></div>
			            		<div id="gaugeChart6" class="col-xs-4"></div>
			            	</div>
			            </div>
            			<div class="col-xs-12">
							<table class="table table-bordered table-hover table-responsive ">
								<thead>
									<tr>
										<th class="text-center cell" style="width:150px">
										</th>
										<th class="text-center cell" style="width:260px">
											1호기
										</th>
										<th class="text-center cell" style="width:260px">
											2호기
										</th>
										<th class="text-center cell" style="width:260px">
											3호기
										</th>
										<th class="text-center cell" style="width:260px">
											4호기
										</th>
										<th class="text-center cell" style="width:260px">
											5호기
										</th>
										<th class="text-center cell" style="width:260px">
											6호기
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="text-center cell">
											이전제품
										</th>
										<td class="text-center cell" id="ht1_before">
										</td>
										<td class="text-center cell" id="ht2_before">
										</td>
										<td class="text-center cell" id="ht3_before">
										</td>
										<td class="text-center cell" id="ht4_before">
										</td>
										<td class="text-center cell" id="ht5_before">
										</td>
										<td class="text-center cell" id="ht6_before">
										</td>
									</tr>
									<tr>
										<th class="text-center cell">
											현재제품
										</th>
										<td class="text-center cell" id="ht1_after">
										</td>
										<td class="text-center cell" id="ht2_after">
										</td>
										<td class="text-center cell" id="ht3_after">
										</td>
										<td class="text-center cell" id="ht4_after">
										</td>
										<td class="text-center cell" id="ht5_after">
										</td>
										<td class="text-center cell" id="ht6_after">
										</td>
									</tr>
									<tr>
										<th class="text-center cell">
											장입량 준수율
										</th>
										<td class="text-center cell" id="ht1_v5">
										</td>
										<td class="text-center cell" id="ht2_v5">
										</td>
										<td class="text-center cell" id="ht3_v5">
										</td>
										<td class="text-center cell" id="ht4_v5">
										</td>
										<td class="text-center cell" id="ht5_v5">
										</td>
										<td class="text-center cell" id="ht6_v5">
										</td>
									</tr>
									<tr>
										<th class="text-center cell">
											비가동시간
										</th>
										<td class="text-center cell" id="ht1_v7">
										</td>
										<td class="text-center cell" id="ht2_v7">
										</td>
										<td class="text-center cell" id="ht3_v7">
										</td>
										<td class="text-center cell" id="ht4_v7">
										</td>
										<td class="text-center cell" id="ht5_v7">
										</td>
										<td class="text-center cell" id="ht6_v7">
										</td>
									</tr>
								</tbody>
							</table>
            			</div>
	            	</div>
            	</div>
            
            </div>
        </div>
    </div>
 
 <!-- 연간 -->
   
 
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

	
	var chart1_val;
	var chart2_val;
	var chart3_val;
	var chart4_val;
	var chart5_val;
	var chart6_val;
	
	
	$(function() {
	    getChartData();
	    getChartData2();
	    setInterval(getChartData, 1000);
	    setInterval(getChartData2, 1000);
	});

	
	// for ESM environment, need to import modules as:
	// import bb, {gauge} from "billboard.js";
function chart1_load(){
	var chart1 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart1_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:24000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
	    	values: [
		        7200,
		        14400,
		        21600,
		        24000
		      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
		show: false  
	  },
	  title:{
			text: "1호기"  
		  },
	  bindto: "#gaugeChart1"
	});
}
function chart2_load(){
	var chart2 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart2_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:12000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
	    	values: [
	    		3600,
		        7200,
		        10800,
		        12000
		      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
		show: false  
	  },
	  title:{
			text: "2호기"  
		  },
	  bindto: "#gaugeChart2"
	});
}
function chart3_load(){
	var chart3 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart3_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:12000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
	    	values: [
	    		3600,
		        7200,
		        10800,
		        12000
		      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
			show: false  
		  },
	  title:{
			text: "3호기"  
		  },
	  bindto: "#gaugeChart3"
	});
}
function chart4_load(){
	var chart4 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart4_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:24000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
	    	values: [
	    		7200,
		        14400,
		        21600,
		        24000
		      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
			show: false  
		  },
	  title:{
			text: "4호기"  
		  },
	  bindto: "#gaugeChart4"
	});
}
function chart5_load(){
	var chart5 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart5_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:24000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
    	values: [
    		7200,
	        14400,
	        21600,
	        24000
	      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
			show: false  
		  },
	  title:{
			text: "5호기"  
		  },
	  bindto: "#gaugeChart5"
	});
}
function chart6_load(){
	var chart6 = bb.generate({
	  data: {
 	    columns: [
		["생산량", chart6_val]
	    ],
	    type: "gauge", // for ESM specify as: gauge()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  gauge: {
		  label: {
		      // 게이지 레이블 형식 지정
		      format: function(value, ratio) {
		        return value.toLocaleString() + "(" + Math.round(ratio * 100) + "%)";
		      }
		    },
		    max:24000
	  },
	  color: {
	    pattern: [
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#60B044"
	    ],
	    threshold: {
	      values: [
	    	  7200,
		      14400,
		      21600,
		      24000
	      ]
	    }
	  },
	  size: {
	    height: 250,
	  },
	  legend:{
			show: false  
		  },
	  title:{
			text: "6호기"  
		  },
	  bindto: "#gaugeChart6"
	});
}
	function getChartData(){
		$.ajax({
			url:"m01/s00/select_m01s00.jsp",
			type:"post",
			dataType:"json",
			data:{},
			success:function(result){
				console.log(result);
				
				var data = result.rows;
				
				
				for(var i=0; i<data.length; i++){
					
					//$("#ht"+(i+1)+"_v1").text(data[i].v1+" Kg");
					//$("#ht"+(i+1)+"_v2").text(data[i].v2+" Kg");
					//$("#ht"+(i+1)+"_v3").text(data[i].v3+" %");
					//$("#ht"+(i+1)+"_v4").text(data[i].v4+" %");
					$("#ht"+(i+1)+"_v5").text(data[i].v5+" %");
					//$("#ht"+(i+1)+"_v6").text(data[i].v6+" LOT");
					$("#ht"+(i+1)+"_v7").text(data[i].v7+" 시간");
					
					switch(i){
						case 0:
							chart1_val = data[i].v1;
							break;
						case 1:
							chart2_val = data[i].v1;
							break;
						case 2:
							chart3_val = data[i].v1;
							break;
						case 3:
							chart4_val = data[i].v1;
							break;
						case 4:
							chart5_val = data[i].v1;
							break;
						case 5:
							chart6_val = data[i].v1;
							break;
					}
				}
					chart1_load();
					chart2_load();
					chart3_load();
					chart4_load();
					chart5_load();
					chart6_load();
				
			}
		});
	}
	function getChartData2(){
		$.ajax({
			url:"m01/s00/select_m01s00_before_after.jsp",
			type:"post",
			dataType:"json",
			data:{},
			success:function(result){
				console.log(result);
				
				var data = result.rows;
				
				
				for(var i=0; i<data.length; i++){
					
					$("#ht"+(i+1)+"_before").text(data[i].before_pname);
					$("#ht"+(i+1)+"_after").text(data[i].after_pname);
					
					}
			}
		});
	}
	
	
	
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>