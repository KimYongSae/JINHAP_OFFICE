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
/*     height: 610px; */

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
	
	
	.row-flex {
    display: flex;
    flex-wrap: wrap;
  }
  .col-flex {
    flex-grow: 1;
    flex-basis: 12.5%; /* 100% / 8 columns */
    max-width: 12.5%;
    box-sizing: border-box;
    padding: 5px;
  }
  .btn-custom {
    width: 100%;
    margin-bottom: 4px; /* 버튼 사이의 간격 */
    height: 80px;
    font-size: 20px;
    font-weight: 600;
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
  <!-- 월간 -->
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">모니터링 - 경보 모니터링</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="m_searchform" method="post" autocomplete="off">
						<!-- 설비 선택 -->
						<div class="form-group">
							<label class="control-label" style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 50px; text-align: right;
							font-weight:700;">설비 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm datepicker" 
							id="m_hogi" name="m_hogi" 
							style="margin-top:5px; height: 30px; width: 180px; 
								font-size: 14pt; font-family:headline;
								padding-top:1px; padding-bottom:1px;">
								<option value="1">열처리 1호기</option>
								<option value="2">열처리 2호기</option>
								<option value="3">열처리 3호기</option>
								<option value="4">열처리 4호기</option>
								<option value="5">열처리 5호기</option>
								<option value="6">열처리 6호기</option>
							</select>
						</div>						
															
				</form>
            </header>
            
            <div id="collapse4" class="body">
				
				<div class="container-fluid">
  <div class="row row-flex">
    <div class="col-flex">
      <button type="button" id="B10b0" class="btn btn-default btn-custom">PLC 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10b1" class="btn btn-default btn-custom">PLC 밧데리 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10b5" class="btn btn-default btn-custom">CP 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c1" class="btn btn-default btn-custom">소입로 1존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c2" class="btn btn-default btn-custom">소입로 2존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c3" class="btn btn-default btn-custom">소입로 3존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c4" class="btn btn-default btn-custom">소입로 4존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c5" class="btn btn-default btn-custom">소입로 5존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c6" class="btn btn-default btn-custom">소입 유조 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c7" class="btn btn-default btn-custom">후세정 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c8" class="btn btn-default btn-custom">소려로 1존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10c9" class="btn btn-default btn-custom">소려로 2존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10ca" class="btn btn-default btn-custom">소려로 3존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10cb" class="btn btn-default btn-custom">소려로 4존 온도과열</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10cc" class="btn btn-default btn-custom">소입로 1존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10cd" class="btn btn-default btn-custom">소입로 2존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10ce" class="btn btn-default btn-custom">소입로 3존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10cf" class="btn btn-default btn-custom">소입로 4존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d0" class="btn btn-default btn-custom">소입로 5존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d1" class="btn btn-default btn-custom">소려로 1존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d2" class="btn btn-default btn-custom">소려로 2존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d3" class="btn btn-default btn-custom">소려로 3존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d4" class="btn btn-default btn-custom">소려로 4존 온도저하</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d5" class="btn btn-default btn-custom">소입로 1존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d7" class="btn btn-default btn-custom">소입로 2존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d8" class="btn btn-default btn-custom">소입로 3존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10d9" class="btn btn-default btn-custom">소입로 4존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10da" class="btn btn-default btn-custom">소입로 5존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10db" class="btn btn-default btn-custom">소려로 1존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10dc" class="btn btn-default btn-custom">소려로 2존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10dd" class="btn btn-default btn-custom">소려로 3존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10de" class="btn btn-default btn-custom">소려로 4존 SCR이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e1" class="btn btn-default btn-custom">소입로 제품 레벨이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e2" class="btn btn-default btn-custom">소입로 팬-1 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e3" class="btn btn-default btn-custom">소입로 팬-2 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e5" class="btn btn-default btn-custom">소려로 제품 레벨이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e6" class="btn btn-default btn-custom">소려로 팬-1 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e7" class="btn btn-default btn-custom">소려로 팬-2 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e8" class="btn btn-default btn-custom">소려로 팬-3 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10e9" class="btn btn-default btn-custom">소려로 팬-4 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f0" class="btn btn-default btn-custom">버킷 E/V 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f4" class="btn btn-default btn-custom">소입 콘베어 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f5" class="btn btn-default btn-custom">아지테이터 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f6" class="btn btn-default btn-custom">소입조 제트 펌프이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f7" class="btn btn-default btn-custom">소입조 레벨 하한이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f8" class="btn btn-default btn-custom">소입조 쿨링 펌프이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10f9" class="btn btn-default btn-custom">소입조 콘베어 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10fa" class="btn btn-default btn-custom">후세정 콘베어 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10fb" class="btn btn-default btn-custom">후세정기 레벨 저하이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10fc" class="btn btn-default btn-custom">소려로 콘베어 이상</button>
    </div>
    
    <div class="col-flex">
      <button type="button" id="B10fd" class="btn btn-default btn-custom">횡송 콘베어 이상</button>
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

/* 로드 */
$(function(){
	getAlarmList();
	setInterval(getAlarmList, 10000);
	
})
	
/*이벤트*/	

$("#m_hogi").change(function(){
	getAlarmList();
})

/*다이얼로그*/

/*함수*/
function getAlarmList() {
    $.ajax({
        type: "POST",
        url: "m00/s03/select_m00s03.jsp",
        cache: false,
        dataType: "json",
        data: {
            'hogi': $("#m_hogi").val()
        },
        success: function(rsJson) {
            if (rsJson && rsJson.status == "ok") {
                var rsAr = rsJson.data[0];
                
                $.each(rsAr, function(key, value) {
                    if(value == 1) {
                        $("#" + key).removeClass("btn-default").addClass("btn-danger");
                    } else {
                        $("#" + key).removeClass("btn-danger").addClass("btn-default");
                    }
                });
            }
        },
        error: function(rsJson) {
        	
        }
    });
}

			


	
			
</script>

</body>
</html>