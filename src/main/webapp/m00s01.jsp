<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="pluginpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합 등대사업</title>
<link rel="shortcut icon" href="resources/images/jinhap4.gif" type="image/x-icon" />


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
    height: 610px;

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
	/* 모든 th와 td 태그에 대한 기본 스타일 */
.table th {
    background-color: #122d64;
    color:#FFFFFF;
    height: 50px;
    font-size: 20pt;
    font-family: headline;
    font-weight: 700;
    text-align: center;
    border-color: #FFFFFF !important;
}
.table td {
    background-color: #FFFFFF;
    height: 50px;
    font-size: 20pt;
    font-family: headline;
    font-weight: 700;
    text-align: center;
}
.table th:nth-child(1), .table td:nth-child(1) {
    width: 100px;
}

.table th:nth-child(2), .table td:nth-child(2) {
    width: 200px;
}

.table th:nth-child(3), .table td:nth-child(3) {
    width: 800px;
}

.table th:nth-child(4), .table td:nth-child(4) {
    width: 300px;
}

.table th:nth-child(5), .table td:nth-child(5) {
    width: 300px;
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
                <h5 style="font-family: headline; font-size:14pt;">모니터링 - 경보 이력</h5>
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
							style="font-size: 14pt;  font-family:headline; font-weight:700; 
								color:#8C8C8C; width: 70px; text-align: right;">기 간: </label>
						</div>
						<!-- 시작일 -->
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
	
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								style="margin-top:6px; height: 31px; width: 120px; 
								font-size:14pt; font-weight:700; font-family:headline;
								padding-top:1px; padding-bottom:1px;" 
								id="excelBtn">
								<i class="fa fa-file-o"></i> 엑셀저장</button>
							</div>
						</div>	
	
								
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<button class="btn btn-success pull-right btn-sm" type="button" 
								style="padding-top:4px; margin-top:6px; height: 31px; width: 100px; 
										font-size:14px; font-weight:700; display:none;" 
								id="testbtn">
								<span class="glyphicon glyphicon-search"></span> 테스트</button>
							</div>
						</div>								
															
				</form>
            </header>
            
            
            <div id="collapse4" class="body">
               <table id="alarm_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell">
								No.
							</th>
							
							<th class="text-center cell">
								설 비 명
							</th>
							
							<th class="text-center cell">
								알 람 내 용
							</th>
							
							<th class="text-center cell">
								발 생 시 간
							</th>	
													
							<th class="text-center cell">
								복 구 시 간
							</th>				
										
						</tr>
					</thead>
										
					<tbody id="alarm_contents">
						
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
	
	
	$("#testbtn").on("click",function(){
		$.post("l000001_test.jsp",
				{"test":"test"});
	});
/*전역변수*/	

/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	fn_check();
	
	$("#alarm_list").tablesorter({debug:true});
	
	var now = new Date();
	
	var tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());

	$("#s_sdate").val(tdate);
	$("#s_edate").val(tdate);
	
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

	function getMonitoringList(){
		$.ajax({
			type : "POST",
			url : "m00/s01/select_m00s01.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					'hogi':$("#s_hogi").val(),
					"sdate":$("#s_sdate").val(),
					"edate":$("#s_edate").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					var listHtml = "";
						for(var i=0; i<rsAr.length; i++){
							listHtml += "<tr>";
							listHtml += '<td class="nr1" >'+(i+1)+'</td>';
							listHtml += '<td class="nr2" >'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr4" >'+rsAr[i].comment+'</td>';
							listHtml += '<td class="nr5" >'+rsAr[i].time_h+'</td>';
							listHtml += '<td class="nr6" >'+rsAr[i].time_r+'</td>';
							listHtml += "</tr>";							
						}
						
						$("#alarm_contents").html(listHtml);
						$("#alarm_list").trigger("update");
						
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
	getMonitoringList();
});
		
	$("#s_hogi").change(function(){
		getMonitoringList();
		
//		$("#s_hogi").val();
	});
	
	
$("#excelBtn").on("click",function(){
//	console.log($("#s_hogi").val()+", "+$("#s_sdate").val()+", "+$("#s_edate").val());
	
	/*
	$.post("i000001_excel.jsp",{
		"hogi":$("#s_hogi").val(),
		"sdate":$("#s_sdate").val(),
		"edate":$("#s_edate").val()
	},200);
	*/
	
	var form = document.forms["searchform"];
	
	form.action = "m00/s01/select_m00s01_excel.jsp";
	
//	form.target = "i000001_excel";
	
	form.submit();
	
	
	
});
	
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>