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

/* .scrolltbody {
    display: block;
    width: 900px;
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}


.scrolltbody thead {
    display: block;
    width: 900px;    
    overflow-x: hidden;
}

.scrolltbody tbody {
    display: block;
    width: 900px;    
    height: 620px;

    overflow-x: auto;
} */

	th{
		background-color: #24FCFF; text-align : center;
	}
	td{
		text-align : right; width : 200px;
	}
	
	.sum > th{
		background-color: #E8E6FC;
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
		font-weight:normal;
	}		
	
	
	
	text tspan{
		font-size:20pt;
		font-family:headline;
		
	}
	
	
	.bb-chart-arcs-gauge-title{
		font-size:16pt;
		font-weight:700;
		font-family:headline;
		fill:black;	
	}
	
	.bb-legend-item text{
		font-size:14pt;
		font-weight:700;
		font-family:headline;
		fill:black;	
	
	}
	/*
	.bb-chart-arc text{
		font-size:16pt;
		font-weight:700;
		font-family:headline;
		fill:black;
	}

	.bb-target-야간 text{
		fill:orange;
	}
	*/
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
        
<div class="content" style="height:810px;"> 
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-pie-chart"></i></div>
                <h5 id="h_title" style="font-size:14pt; font-family:headline;">설비 효율 현황</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" id="searchform" 
                name="searchform" method="post" autocomplete="off">
                
						<!-- 설비 선택 -->
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
								width: 50px; text-align: right;font-weight:700;">설비 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm" 
							id="s_hogi" name="s_hogi" 
							style="margin-top:5px; height: 30px; width: 140px; font-size: 14pt;
									padding-top : 1px; padding-bottom : 1px; font-family:headline;
									font-weight:700;">	
								<option value="1">Q01-HN01</option>
								<option value="2">Q01-HN02</option>
								<option value="3">Q01-HN03</option>
								<option value="4">Q01-HN04</option>
								<option value="5">Q01-HN05</option>
								<option value="6">Q01-HN06</option>
							</select>
						</div>												
				</form>
            </header> 
            
             
            <div id="collapse4" class="body" style="height:730px;">
            	<div class="row">
              <table id="temp"
               class="table table-bordered table-hover table-responsive"
               style= "font-size: 25px; width: 1000px; margin: auto; height: 700px;">
					
						<tr>
							<th rowspan = "2" style="background-color: white;">1호기(시간당 1000kg)<br>설비효율</th>
							<th>전 LOT품명</th>
							<td colspan = "2" id = "v_1"></td>
						</tr>
						<tr>
							<th>현 LOT품명</th>
							<td colspan = "2" id = "v_2"></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2">주간<br>08:00 ~ 20:00</th>
							<th>목표 생산량</th>
							<td>12,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td id = "v_3"></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td id = "v_4"></td>
							<th>진도율 (%)</th>
							<td id = "v_5"></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td id = "v_6"></td>
							<th>로트수</th>
							<td id = "v_7"></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td id = "v_8"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th rowspan = "2">기준시간</th>
							<th rowspan = "2">야간<br>20:00 ~ 08:00</th>
							<th>목표 생산량</th>
							<td>12,000Kg</td>
						</tr>
						<tr>
							<th>현 생산량</th>
							<td id = "v_9"></td>
						</tr>
						<tr>
							<th>시간당 생산량</th>
							<td id = "v_10"></td>
							<th>진도율 (%)</th>
							<td id = "v_11"></td>
						</tr>
						<tr>
							<th>비가동 시간(로트간격제외)</th>
							<td id = "v_12"></td>
							<th>로트수</th>
							<td id = "v_13"></td>
						</tr>
						<tr>
							<th>capa 장입량 준수율 (%)</th>
							<td id = "v_14"></td>
							<td></td>
							<td></td>
						</tr>
						<tr class = "sum">
							<th colspan = "2">합계</th>
							<th>현 생산량</th>
							<td id = "v_15"></td>
						</tr>
						<tr class = "sum">
							<th>시간당 생산량</th>
							<td id = "v_16"></td>
							<th>진도율 (%)</th>
							<td id = "v_17"></td>
						</tr>
						<tr class = "sum">
							<th>비가동 시간(로트간격제외)</th>
							<td id = "v_18"></td>
							<th>로트수</th>
							<td id = "v_19"></td>
						</tr>
						<tr class = "sum">
							<th>capa 장입량 준수율 (%)</th>
							<td id = "v_20"></td>
							<td></td>
							<td></td>
						</tr>
				</table>
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

	<!-- <script>

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
var chart3; var chart4; var chart5;
var chart6; var chart7; var chart8; var chart9; var chart_all;

var rate3_val = 0; var rate4_val = 0; var rate5_val = 0;
var rate6_val = 0; var rate7_val = 0; var rate8_val = 0; var rate9_val = 0; var rateAll_val = 0;

var rate3_off = 0; var rate4_off = 0; var rate5_off = 0;
var rate6_off = 0; var rate7_off = 0; var rate8_off = 0; var rate9_off = 0; var rateAll_off = 0;


/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
//	$("#loading").show();
	fn_check();
	var m_temp = new Date();
	var now = new Date();
	now.setDate(m_temp.getDate() - 1);
	var tdate = now.getFullYear()+"년 "+date_set(now.getMonth()+1)+"월 "+date_set(now.getDate())+"일";
	
	
//	$("#h_title").text("생산관리 - 설비 효율현황 "+tdate+" 기준");
$("#h_title").text("생산관리 - 설비 효율현황");


//	getMonitoringList();
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
	
	var now = new Date();
	//오늘날짜(일별)
	var tday = now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10);
	
	$("#s_sdate").val(tday);
	$("#s_edate").val(tday);
	
//	getProcessList();
}
 
	function all_rate3(){
		chart3 = bb.generate({
			size:{
				width:320,
				height:360
			},	
		  data: {
		    columns: [
			["종합효율", rate3_val]
		    ],
		    type: "gauge"
		  },
		  gauge: {
			  type:"multi",
			  title:"HT-QT3\n"+rate3_val+"%"
		  },
		  color: {
		    pattern: [
		      "#F6F6F6",
		      "#FF0000",
		      "#F97600",
		      "#F6C600",
		      "#00FF00"
		    ],
		    threshold: {
		      values: [
		        0,
		        30,
		        50,
		        70,
		        100
		      ]
		    }
		  },		  
		legend:{
			item:{
				tile:{
					width:20,
					height:20
				}					
				}
			},
		  bindto: "#all_rate3"
		});
 }
	
	
	
	function all_rate4(){
		chart4 = bb.generate({
			size:{
				width:320,
				height:360
			},	
		  data: {
		    columns: [
			["종합효율", rate4_val]
		    ],
		    type: "gauge"
		  },
		  gauge: {
			  type:"multi",
			  title:"HT-QT4\n"+rate4_val+"%"
		  },
		  color: {
		    pattern: [
		      "#F6F6F6",
		      "#FF0000",
		      "#F97600",
		      "#F6C600",
		      "#00FF00"
		    ],
		    threshold: {
		      values: [
		        0,
		        30,
		        50,
		        70,
		        100
		      ]
		    }
		  },
			legend:{
				item:{
					tile:{
						width:20,
						height:20
					}					
					}
				},

		  bindto: "#all_rate4"
		});
	
 }
	
	
	function all_rate5(){
		chart5 = bb.generate({
			size:{
				width:320,
				height:360
			},	
		  data: {
		    columns: [
			["종합효율", rate5_val]
		    ],
		    type: "gauge"
		  },
		  gauge: {
			  type:"multi",
			  title:"HT-QT5\n"+rate5_val+"%"
		  },
		  color: {
		    pattern: [
		      "#F6F6F6",
		      "#FF0000",
		      "#F97600",
		      "#F6C600",
		      "#00FF00"
		    ],
		    threshold: {
		      values: [
		        0,
		        30,
		        50,
		        70,
		        100
		      ]
		    }
		  },
			legend:{
				item:{
					tile:{
						width:20,
						height:20
					}					
					}
				},

		  bindto: "#all_rate5"
		});
	
 }	
	
	
	
	function all_rate6(){
		chart6 = bb.generate({
			size:{
				width:320,
				height:360
			},	
		  data: {
		    columns: [
			["종합효율", rate6_val]
		    ],
		    type: "gauge"
		  },
		  gauge: {
			  type:"multi",
			  title:"HT-QT6\n"+rate6_val+"%"
		  },
		  color: {
		    pattern: [
		      "#F6F6F6",
		      "#FF0000",
		      "#F97600",
		      "#F6C600",
		      "#00FF00"
		    ],
		    threshold: {
		      values: [
		        0,
		        30,
		        50,
		        70,
		        100
		      ]
		    }
		  },
			legend:{
				item:{
					tile:{
						width:20,
						height:20
					}					
					}
				},

		  bindto: "#all_rate6"
		});
	
 }	
	
	
	function all_rate7(){
		chart7 = bb.generate({
			size:{
				width:320,
				height:360
			},	
		  data: {
		    columns: [
			["종합효율", rate7_val]
		    ],
		    type: "gauge"
		  },
		  gauge: {
			  type:"multi",
			  title:"HT-QT7\n"+rate7_val+"%"
		  },
		  color: {
		    pattern: [
		      "#F6F6F6",
		      "#FF0000",
		      "#F97600",
		      "#F6C600",
		      "#00FF00"
		    ],
		    threshold: {
		      values: [
		        0,
		        30,
		        50,
		        70,
		        100
		      ]
		    }
		  },
			legend:{
				item:{
					tile:{
						width:20,
						height:20
					}					
					}
				},

		  bindto: "#all_rate7"
		});
	
 }

function all_rate8(){
	chart8 = bb.generate({
		size:{
			width:320,
			height:360
		},	
	  data: {
	    columns: [
		["종합효율", rate8_val]
	    ],
	    type: "gauge"
	  },
	  gauge: {
		  type:"multi",
		  title:"HT-QT8\n"+rate8_val+"%"
	  },
	  color: {
	    pattern: [
	      "#F6F6F6",
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#00FF00"
	    ],
	    threshold: {
	      values: [
	        0,
	        30,
	        50,
	        70,
	        100
	      ]
	    }
	  },
		legend:{
			item:{
				tile:{
					width:20,
					height:20
				}					
				}
			},

	  bindto: "#all_rate8"
	});

}

function all_rate9(){
	chart9 = bb.generate({
		size:{
			width:320,
			height:360
		},	
	  data: {
	    columns: [
		["종합효율", rate9_val]
	    ],
	    type: "gauge"
	  },
	  gauge: {
		  type:"multi",
		  title:"HT-QT9\n"+rate9_val+"%"
	  },
	  color: {
	    pattern: [
	      "#F6F6F6",
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#00FF00"
	    ],
	    threshold: {
	      values: [
	        0,
	        30,
	        50,
	        70,
	        100
	      ]
	    }
	  },
		legend:{
			item:{
				tile:{
					width:20,
					height:20
				}					
				}
			},

	  bindto: "#all_rate9"
	});

}


function all_rate(){
	chart_all = bb.generate({
		size:{
			width:380,
			height:420
		},	
	  data: {
	    columns: [
		["종합효율", rateAll_val]
	    ],
	    type: "gauge"
	  },
	  gauge: {
		  type:"multi",
		  title:"전체\n"+rateAll_val+"%"
	  },
	  color: {
	    pattern: [
	      "#F6F6F6",
	      "#FF0000",
	      "#F97600",
	      "#F6C600",
	      "#00FF00"
	    ],
	    threshold: {
	      values: [
	        0,
	        30,
	        50,
	        70,
	        100
	      ]
	    }
	  },
		legend:{
			item:{
				tile:{
					width:20,
					height:20
				}					
				}
			},

	  bindto: "#all_rate"
	});
}


	var getMonitoringList = function() {

		$.ajax({
				type : "POST",
				url : "l001002.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime()},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsAr = rsJson.rows;
						var rsAr2 = rsJson.rows2;
						var listHtml = "";
						console.log(rsAr);
						
						for(var i=0; i<rsAr.length; i++){
							listHtml += "<tr>";
							listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">HT</br>'+rsAr[i].mchno+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].d_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].capacity+'</td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].d_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].d_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].d_mtbf)+'</td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].d_nt17+'</td>';
							listHtml += '</tr>';
							
							listHtml += "<tr>";
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].n_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].n_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].n_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].n_mtbf)+'</td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].n_nt17+'</td>';
							listHtml += '</tr>';	
							
							listHtml += "<tr>";
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].t_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].t_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].t_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr[i].t_mtbf)+'</td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr[i].t_nt17+'</td>';
							listHtml += '</tr>';	
							
							
							switch(i){
								case 0: 
									rate3_val = rsAr[i].t_all_rate;
									rate3_off = (100 - rsAr[i].t_all_rate);
									break;
								case 1: 
									if(rsAr[i].t_all_rate > 100){
										rate4_val = 0;
									}else{
										rate4_val = rsAr[i].t_all_rate;
									}
									 
									rate4_off = (100 - rsAr[i].t_all_rate);
									break;
								case 2: 
									rate5_val = rsAr[i].t_all_rate; 
									rate5_off = (100 - rsAr[i].t_all_rate);
									break;
								case 3: 
									rate6_val = rsAr[i].t_all_rate; 
									rate6_off = (100 - rsAr[i].t_all_rate);
									break;
								case 4: 
									rate7_val = rsAr[i].t_all_rate; 
									rate7_off = (100 - rsAr[i].t_all_rate);
									break;
								case 5: 
									rate8_val = rsAr[i].t_all_rate; 
									rate8_off = (100 - rsAr[i].t_all_rate);
									break;
								case 6: 
									rate9_val = rsAr[i].t_all_rate; 
									rate9_off = (100 - rsAr[i].t_all_rate);
									break;
							}
						}
						
						//계
						
							listHtml += "<tr>";							
							listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">그룹</br>소계</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].d_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].d_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].d_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].d_nt17+'</td>';
							listHtml += '</tr>';
							
							listHtml += "<tr>";
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].n_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].n_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].n_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].n_nt17+'</td>';
							listHtml += '</tr>';	
							
							listHtml += "<tr>";
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 65px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].t_pdqty)+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].t_buha)+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_time_rate+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_perform_rate+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_yangpum_rate+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_all_rate+'</td>';
							listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+comma(rsAr2[0].t_ytsum)+'</td>';
							listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
							listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_ntsum+'</td>';
							listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt01+'</td>';
							listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt05+'</td>';
							listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt06+'</td>';
							listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt08+'</td>';
							listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt12+'</td>';
							listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt13+'</td>';
							listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">'+rsAr2[0].t_nt17+'</td>';
							listHtml += '</tr>';							
						
							if(rsAr2[0].t_all_rate > 100){
								rateAll_val = 0;
							}else{
								rateAll_val = rsAr2[0].t_all_rate;
							}
							
							rateAll_off = (100 - rsAr2[0].t_all_rate);
						
						$("#process_list tbody").html(listHtml);
										
						all_rate3(); all_rate4(); all_rate5(); all_rate6(); all_rate7(); all_rate8(); all_rate9(); all_rate();
						
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
		};

	

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

		

var getProcessList = function(){
	var listHtml = "";
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT3</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">4,329</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">67.36</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.95</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">51.83</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">485</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,160</td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">235</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">160</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">75</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,107</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">93.75</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">77.99</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">73.12</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">675</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">45</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">45</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">10,436</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.56</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">77.56</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">62.48</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,160</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,160</td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">280</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">160</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	
	
	//4호기
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT4</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,143</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.89</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">82.04</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">72.93</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">640</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,796</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">84.03</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">96.01</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.68</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">605</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">115</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">40</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	

	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12,939</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">86.46</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.83</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.80</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,245</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">195</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	
	
	//5호기
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT5</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,143</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.89</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">82.04</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">72.93</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">640</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,796</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">84.03</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">96.01</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.68</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">605</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">115</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">40</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	

	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12,939</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">86.46</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.83</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.80</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,245</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">195</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';		
	
	
	//6호기
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT6</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,143</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.89</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">82.04</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">72.93</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">640</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,796</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">84.03</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">96.01</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.68</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">605</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">115</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">40</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	

	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12,939</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">86.46</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.83</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.80</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,245</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">195</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	
	//7호기
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT7</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,143</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.89</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">82.04</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">72.93</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">640</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,796</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">84.03</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">96.01</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.68</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">605</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">115</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">40</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	

	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12,939</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">86.46</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.83</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.80</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,245</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">195</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	
	
	//8호기
	listHtml += "<tr>";
	listHtml += '<td rowspan="3" class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">QT8</td>';
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">주간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,143</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12</td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.89</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">82.04</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">72.93</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">640</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">야간</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">6,796</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">720</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">84.03</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">96.01</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">80.68</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">605</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">115</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">40</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	

	
	
	listHtml += "<tr>";
	listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">계</td>';
	listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">12,939</td>';
	listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 30px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,440</td>';
	listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">86.46</td>';
	listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">88.83</td>';
	listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 55px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">100.00</td>';
	listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">76.80</td>';
	listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">1,245</td>';
	listHtml += '<td class="nr12" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr13" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 50px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">195</td>';
	listHtml += '<td class="nr14" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">25</td>';
	listHtml += '<td class="nr18" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">50</td>';
	listHtml += '<td class="nr19" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;">120</td>';
	listHtml += '<td class="nr25" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr26" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr27" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '<td class="nr30" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 40px; word-break:break-all; font-size: 12pt; font-family:headline; font-weight:700;"></td>';
	listHtml += '</tr>';	
	
	$("#process_list tbody").html(listHtml);
}


/*이벤트*/	
$("#s_wgroupBtn").on("click",function(){
	alert("작업반 선택");
});

$("#s_hogi").change(function(){
	
	if($("#s_hogi").val() == '3'){
		$("#hogi_name").text("3호기");
	}else if($("#s_hogi").val() == '4'){
		$("#hogi_name").text("4호기");
	}else if($("#s_hogi").val() == '5'){
		$("#hogi_name").text("5호기");
	}else if($("#s_hogi").val() == '6'){
		$("#hogi_name").text("6호기");
	}else if($("#s_hogi").val() == '7'){
		$("#hogi_name").text("7호기");
	}else if($("#s_hogi").val() == '8'){
		$("#hogi_name").text("8호기");
	}
});
		
		
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script> -->

</body>
</html>