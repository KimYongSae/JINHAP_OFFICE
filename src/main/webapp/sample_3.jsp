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
                <h5 style="font-family: headline; font-size:14pt;">모니터링 - 경보 발생빈도(랭킹)</h5>
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
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">PLC 배터리 이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					</div>
					<div class="row row-flex">
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #1<br> 온도변경이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #2<br> 온도변경이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #3<br> 온도변경이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #4<br> 온도변경이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #1 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #1 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-danger btn-custom">Q-FCE #2 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-danger btn-custom">Q-FCE #2 온도저하</button></div>
					</div>
					<div class="row row-flex">
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #3 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #3 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #4 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #4 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #1 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #1 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-danger btn-custom">T-FCE #2 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-danger btn-custom">T-FCE #2 온도저하</button></div>
				  </div>
					<div class="row row-flex">
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #3 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #3 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #4 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #4 온도저하</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">유조탱크 과열</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">CP 이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  </div>
					<div class="row row-flex">
					  
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">공급기 구동 이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">전세정기 ConV.<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE ConV.<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">유조 ConV. 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">중간세정기 ConV<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE ConV. 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">횡송 ConV. 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					</div>
					<div class="row row-flex">
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #1 FAN<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">Q-FCE #2 FAN<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #1 FAN<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #2 FAN<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">T-FCE #3 FAN<br> 회전이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">유조탱크 하한이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">횡송제품 감지이상</button></div>
					</div>
					<div class="row row-flex">
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">변성로 압력이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">변성로 온도이상</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					  <div class="col-flex"><button type="button" class="btn btn-default btn-custom">SPARE</button></div>
					</div>
				  <!-- 필요한 만큼 row-flex를 추가해서 나머지 버튼들을 구성합니다. -->
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

	
	
/*이벤트*/	
	
/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>