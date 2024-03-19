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
<link rel="stylesheet" href="resources/css/billboard4.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard4.js"></script>


<!-- datepicker에 있는 timepicker 추가기능 -->
<link rel="stylesheet" href="resources/css/jquery-ui-timepicker-addon.css">
<script src="resources/js/jquery-ui-timepicker-addon.js"></script>


<!-- 컬러셀렉터 -->
<script type="text/javascript" src="resources/js/bootstrap-colorselector.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-colorselector.min.css"> 

<!-- 하이차트 -->

<script type="text/javascript" src="resources/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="resources/js/highchart/exporting.js"></script>
<script type="text/javascript" src="resources/js/highchart/offline-exporting.js"></script>

<!-- 추가한 부분 end-->

<style>
	.highcharts-menu {
	  font-size: 16px; /* 메뉴의 글꼴 크기를 더 크게 조정 */
	}
		
			    body {
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>

	

</head>




<body>
	<!-- <div id="container" style="width: 2500px; height: 1000px;"></div> -->
	<div id="container" style="width: 1920px; height: 1000px;"></div>
</body>


	<script>
	/*전역변수*/ 
	
	var q1_pv, q2_pv, q3_pv, q4_pv, q5_pv;
	var t1_pv, t2_pv, t4_pv, t4_pv;
	var oil_pv, a_pv, cp_pv;

	var q1_pvJson, q2_pvJson, q3_pvJson, q5_pvJson, q4_pvJson;
 	var t1_pvJson, t2_pvJson, t3_pvJson, t4_pvJson;
 	var oil_pvJson, a_pvJson, cp_pvJson; 
 	
	var q1_mvJson, q2_mvJson, q3_mvJson, q5_mvJson, q4_mvJson;
 	var t1_mvJson, t2_mvJson, t3_mvJson, t4_mvJson;
 	var oil_mvJson, a_mvJson, cp_mvJson;
 	var lot_Json;
	
	
	
	
	
	
	
	/*로드*/
	$(function(){
		fn_check();
		getChartDataLoad();
	});	
	
	/*함수*/
    function getParameterByName(name) {
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    var startDate = getParameterByName('startDate');
    var endDate = getParameterByName('endDate');
    var hogi = getParameterByName('hogi');
    
    switch (hogi) {
    case "Q01-HN01":
        hogi = "1";
        break;
    case "Q01-HN02":
        hogi = "2";
        break;
    case "Q01-HN03":
        hogi = "3";
        break;
    case "Q01-HN04":
        hogi = "4";
        break;
    case "Q01-HN05":
        hogi = "5";
        break;
    case "Q01-HN06":
        hogi = "6";
        break;
}
    console.log(startDate);
    console.log(endDate);
    console.log(hogi);
    
    /* var startDate = "2024-02-04"; */
    var startTime = "08:00";
    /* var endDate = "2024-02-05"; */
    var endTime = "08:00";
    /* var hogi = "1"; */

	
	
	
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
	
		
		var date_interval;
		
		
		/*이벤트*/
		
		/*차트*/
		
		function unix_timestamp(t){
       var date = new Date(t*1000);
       var year = date.getFullYear();
       var month = "0" + (date.getMonth()+1);
       var day = "0" + date.getDate();
       var hour = "0" + date.getHours();
       var minute = "0" + date.getMinutes();
       var second = "0" + date.getSeconds();
       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + "</br> " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
   }
		
		function unix_timestamp_tooltip(t){
		       var date = new Date(t*1000);
		       var year = date.getFullYear();
		       var month = "0" + (date.getMonth()+1);
		       var day = "0" + date.getDate();
		       var hour = "0" + date.getHours();
		       var minute = "0" + date.getMinutes();
		       var second = "0" + date.getSeconds();
		       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
		   }   
		   
		   function unix_timestamp_onClick(t){
		       var date = new Date(t*1000);
		       var year = date.getFullYear();
		       var month = "0" + (date.getMonth()+1);
		       var day = "0" + date.getDate();
		       var hour = "0" + date.getHours();
		       var minute = "0" + date.getMinutes();
		       var second = "0" + date.getSeconds();
		       return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
		   }   
		   
		
		function getChart(){
       
       const chart = Highcharts.chart('container', {
           chart: {
               type: "spline",
               panning: true,
               panKey: "shift",
               zoomType: "x",
               styleMode: true,
           },
           time: {
               timezone: "Indonesian",
               useUTC: true
           },
           title: {
               text: ' '
           },
           tooltip: {
               formatter: function() {
            	   
                   var seriesName = this.series.name;
                   var formattedDate = unix_timestamp_tooltip(this.x);
                   
                   if (seriesName === 'LOT') {
                       return formattedDate + '<br>' + seriesName + ' : ' + this.point.label;
                   } else {
                       return formattedDate + '<br>' + seriesName + ' : ' + this.y;
                   }
               }
           },
           yAxis: [{
               crosshair: {
                   width: 3,
                   color: '#5D5D5D',
                   zIndex: 5
               },
               title: {
                   text: 'Temper(℃)'
               },
               labels: {
                   style: {
                       fontSize: "14pt"
                   }
               },
               min: 0,
               max: 1000,
               endOnTick: false
           },
           {   
               opposite: false, // 기존 y축의 반대편에 배치
               title: {
                   text: 'CP' 
               },
               min: 0, 
               max: 1, 
               endOnTick: false,
               labels: {
                   formatter: function () {
                       return this.value; // 레이블 포맷
                   }
               }
           }
           ],
           xAxis: {
               crosshair: {
                   width: 3,
                   color: '#5D5D5D',
                   zIndex: 5
               },
               labels: {
                   formatter: function () {
                       return unix_timestamp(this.value);
//                  return this.value;
                   },
                   style: {
                       fontSize: "11pt"
                   }
               },
               tickmarkPlacement: 'on',
               startOnTick: false
           },
           /* legend: {
               layout: 'vertical',
               align: 'right',
               verticalAlign: 'middle'
           }, */
           plotOptions: {
               series: {
                   dataLabels: {
                       dataLabels: {
                    	   enabled: true,
                           format: '{point.label}',
                           useHTML: true,
                           
                       },
                       selected: true,
                       cursor: 'pointer',
                       marker: {
                           radius: 1
                       },
                       style:{
                      	 fontSize: '15px'  
                         }
                   },
                  
                   point: {
                       events: {
                          click: function () {
                             
                             
                              // 클릭된 데이터 포인트의 날짜와 값
                              var clickedDate = unix_timestamp_onClick(this.x);  // 함수 적용
                              var clickedValueY = this.y;
                              var clickedValueX = this.x;
                              console.log(this);
                             /*  console.log(clickedDate);
                              console.log(clickedValueY);
                              console.log(clickedValueX);
                              console.log(this.series.name);
                              
                              console.log(this.dataLabel); */
                              if(typeof this.dataLabel != 'undefined'){
                                 //$("#memoText").val(this.dataLabel.textStr);
                                 $("#memoText").val("");
                                 $("#quenching").val("");
                                 $("#tempering").val("");
                                 $("#cp").val("");
                                 $("#worker").val("");
                                 
                                 var parts = this.dataLabel.textStr.split("<br/>");
                                 parts.forEach(function(part) {
                                	    var keyValue = part.split(":");
                                	    var key = keyValue[0].trim().toLowerCase();
                                	    var value = keyValue.length > 1 ? keyValue[1].trim() : "";
                                	    // 3. 해당하는 input 태그에 값 할당
                                	    if (key === "메모") {
                                	        $("#memoText").val(value);   
                                	    } else if (key === "소입") {
                                	        $("#quenching").val(value);
                                	    } else if (key === "소려") {
                                	    	$("#tempering").val(value);
                                	    } else if (key === "cp") {
                                	    	$("#cp").val(value);
                                	    } else if (key === "작업자") {
                                	    	$("#worker").val(value);
                                	    }
                                	});
                                 
                              }else{
                                 $("#memoText").val("");
                                 $("#quenching").val("");
                                 $("#tempering").val("");
                                 $("#cp").val("");
                                 $("#worker").val("");
                              }
                              
                              $("#MemoC").val(this.series.name);
                                             
                              
                              // 모달을 열고
                              fileDialog.dialog("open");
                              /* $("#memoModal").show();
                              $(document).keyup(function(e) {
                                  if (e.key === "Escape") { // ESC 키를 누르면
                                      $("#memoModal").hide(); // 모달 창을 닫습니다.
                                  }
                              });
                              $("#closeModal").click(function() {
                              $("#memoModal").hide();
                              }); */
                              // 날짜와 시간을 분리
                              var dateParts = clickedDate.split(" ")[0];
                              var timeParts = clickedDate.split(" ")[1].split(":");

                              // 날짜 선택기와 시간 텍스트에 클릭된 데이터 포인트의 날짜를 설정
                              $("#datePicker").val(dateParts); // YYYY-MM-DD 형식
                              $("#hourInput").text(timeParts[0] + '시');
                              $("#minuteInput").text(timeParts[1] + '분');
                          
                             

                              $("#bupumModalDatatimeClick").val(clickedDate);
                              $("#bupumModalDatatimeClick").val(clickedDate);
                              // 메모 입력 필드에 클릭된 데이터 포인트의 값을 설정
                             
                              $("#yInput").val(clickedValueY);
                              $("#xInput").val(clickedValueX);
                              
                          }
                     

                       }
                   }
               }
           },
           
           series: [
        	   q1_pvJson, q2_pvJson, q3_pvJson, q5_pvJson, q4_pvJson,
        	   t1_pvJson, t2_pvJson, t3_pvJson, t4_pvJson,
        	   oil_pvJson, a_pvJson,
        	   $.extend({}, cp_pvJson, { yAxis: 1 }),
        	   
        	   q1_mvJson, q2_mvJson, q3_mvJson, q5_mvJson, q4_mvJson,
        	   t1_mvJson, t2_mvJson, t3_mvJson, t4_mvJson,
        	   oil_mvJson, a_mvJson,
        	   $.extend({}, cp_mvJson, { yAxis: 1 }),
        	   lot_Json
        	  
        	]
,
            
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 700
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        },
        exporting: {
            enabled: true
        },
        legend: {
            itemStyle: {
                fontSize: "11pt"
            },
            layout: 'horizontal',
	        verticalAlign: 'top',
	        align: 'right',
	        x:-50
        }
        
    });
}
		
		
		function getChartData(){
		      
	      console.log("init getChartData");
	      
	      $.ajax({
	         url:"m00/s04_trend/select_m00s04_trend.jsp",
	         type:"post",
	         dataType:"json",
	         data:{            
	            "sdate" : startDate,
	            "edate" : endDate,
	            "stime" : startTime,
	            "etime" : endTime,
	            "hogi" : hogi
	         },
	         success:function(result){
	            //console.log(result.data);

	            
	           datetimeJson = result.data.datetime;
	          /*  tic1_pvJson = result.data.tic1_pv;

	            tic1_pvJson = result.data.tic1_pv;
	            tic2_pvJson = result.data.tic2_pv;
	            tic3_pvJson = result.data.tic3_pv;
	            tic1_spJson = result.data.tic1_sp;
	            tic2_spJson = result.data.tic2_sp;
	            tic3_spJson = result.data.tic3_sp;
	            
	            
	            tic1_pvMv = result.data.tic1_pvMv;
	            tic2_pvMv = result.data.tic2_pvMv;
	            tic3_pvMv = result.data.tic3_pvMv;
	            tic1_spMv = result.data.tic1_spMv;
	            tic2_spMv = result.data.tic2_spMv;
	            tic3_spMv = result.data.tic3_spMv;    */     
	            
	            q1_pvJson = result.data.q1_pv;
	            q2_pvJson = result.data.q2_pv;
	            q3_pvJson = result.data.q3_pv;
	            q4_pvJson = result.data.q4_pv;
	            q5_pvJson = result.data.q5_pv;
	            t1_pvJson = result.data.t1_pv;
	            t2_pvJson = result.data.t2_pv;
	            t3_pvJson = result.data.t3_pv;
	            t4_pvJson = result.data.t4_pv;
	            oil_pvJson = result.data.oil_pv;
	            a_pvJson = result.data.a_pv;
	            cp_pvJson = result.data.cp_pv;
	            
	            q1_mvJson = result.data.q1_Mv;
	            q2_mvJson = result.data.q2_Mv;
	            q3_mvJson = result.data.q3_Mv;
	            q4_mvJson = result.data.q4_Mv;
	            q5_mvJson = result.data.q5_Mv;
	            t1_mvJson = result.data.t1_Mv;
	            t2_mvJson = result.data.t2_Mv;
	            t3_mvJson = result.data.t3_Mv;
	            t4_mvJson = result.data.t4_Mv;
	            oil_mvJson = result.data.oil_Mv;
	            a_mvJson = result.data.a_Mv;
	            cp_mvJson = result.data.cp_Mv;
	            lot_Json = result.data.lot;
	            
	            
	            var chart = $("#container").highcharts();
	            
	            if(typeof chart != 'undefined'){
	            
/* 	               chart.series[0].update(tic1_pvJson,false);
	               chart.series[1].update(tic2_pvJson,false);
	               chart.series[2].update(tic1_spJson,false);
	               chart.series[3].update(tic2_spJson,false);
	            chart.series[4].update(tic1_pvMv,false);
	            chart.series[5].update(tic2_pvMv,false);            
	            chart.series[6].update(tic1_spMv,false);
	            chart.series[7].update(tic2_spMv,false); */
	            chart.series[0].update(q1_pvJson,false);
	            chart.series[1].update(q2_pvJson,false);
	            chart.series[2].update(q3_pvJson,false);
	            chart.series[3].update(q4_pvJson,false);
	            chart.series[4].update(q5_pvJson,false);
	            chart.series[5].update(t1_pvJson,false);
	            chart.series[6].update(t2_pvJson,false);
	            chart.series[7].update(t3_pvJson,false);
	            chart.series[8].update(t4_pvJson,false);
	            chart.series[9].update(oil_pvJson,false);
	            chart.series[10].update(a_pvJson,false);
	            chart.series[11].update(cp_pvJson,false);
	            chart.series[12].update(q1_mvJson,false);
	            chart.series[13].update(q2_mvJson,false);
	            chart.series[14].update(q3_mvJson,false);
	            chart.series[15].update(q4_mvJson,false);
	            chart.series[16].update(q5_mvJson,false);
	            chart.series[17].update(t1_mvJson,false);
	            chart.series[18].update(t2_mvJson,false);
	            chart.series[19].update(t3_mvJson,false);
	            chart.series[20].update(t4_mvJson,false);
	            chart.series[21].update(oil_mvJson,false);
	            chart.series[22].update(a_mvJson,false);
	            chart.series[23].update(cp_mvJson,false);
	            chart.series[24].update(lot_Json,false);
	            
	            
	               chart.redraw();
	              
	            }else{
	               console.log("언디파인드");
	               
	            }
	         }
	      });
	   }
		function getChartDataLoad(){
		      
//	      console.log("sdate : "+$("#sdate").val());
	      
	      $.ajax({
	         url:"m00/s04_trend/select_m00s04_trend.jsp",
	         type:"post",
	         dataType:"json",
	         data:{            
	        	 "sdate" : startDate,
		            "edate" : endDate,
		            "stime" : startTime,
		            "etime" : endTime,
		            "hogi" : hogi
	         },
	         success:function(result){
	            //console.log(result.data);

	            
	           datetimeJson = result.data.datetime;
	          /*  tic1_pvJson = result.data.tic1_pv;

	            tic1_pvJson = result.data.tic1_pv;
	            tic2_pvJson = result.data.tic2_pv;
	            tic3_pvJson = result.data.tic3_pv;
	            tic1_spJson = result.data.tic1_sp;
	            tic2_spJson = result.data.tic2_sp;
	            tic3_spJson = result.data.tic3_sp;
	            
	            
	            tic1_pvMv = result.data.tic1_pvMv;
	            tic2_pvMv = result.data.tic2_pvMv;
	            tic3_pvMv = result.data.tic3_pvMv;
	            tic1_spMv = result.data.tic1_spMv;
	            tic2_spMv = result.data.tic2_spMv;
	            tic3_spMv = result.data.tic3_spMv;    */     
	            
	            q1_pvJson = result.data.q1_pv;
	            q2_pvJson = result.data.q2_pv;
	            q3_pvJson = result.data.q3_pv;
	            q4_pvJson = result.data.q4_pv;
	            q5_pvJson = result.data.q5_pv;
	            t1_pvJson = result.data.t1_pv;
	            t2_pvJson = result.data.t2_pv;
	            t3_pvJson = result.data.t3_pv;
	            t4_pvJson = result.data.t4_pv;
	            oil_pvJson = result.data.oil_pv;
	            a_pvJson = result.data.a_pv;
	            cp_pvJson = result.data.cp_pv;
	            
	            q1_mvJson = result.data.q1_Mv;
	            q2_mvJson = result.data.q2_Mv;
	            q3_mvJson = result.data.q3_Mv;
	            q4_mvJson = result.data.q4_Mv;
	            q5_mvJson = result.data.q5_Mv;
	            t1_mvJson = result.data.t1_Mv;
	            t2_mvJson = result.data.t2_Mv;
	            t3_mvJson = result.data.t3_Mv;
	            t4_mvJson = result.data.t4_Mv;
	            oil_mvJson = result.data.oil_Mv;
	            a_mvJson = result.data.a_Mv;
	            cp_mvJson = result.data.cp_Mv;
	            lot_Json = result.data.lot;
	            
	            getChart();
	         }
	      });
	   }
		

		
		
		
		
		
		
		
</script>

</body>
</html> 