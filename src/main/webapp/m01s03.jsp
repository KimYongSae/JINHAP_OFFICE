<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    height: 561px;

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
	
	.table th {
	    background-color: #122d64;
	    color:#FFFFFF;
	    border-color: #FFFFFF !important;
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
		<div id="carousel-form" style="display:none;" title="보고서 파일">
		</div>
		<div id="confirm-form" style="display:none;" title="확인창">
			<span id="confirmSpan"></span>
		</div>			

		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
		</div>

	<div id="loading" style="display:none;">
		<img id="loading-image" src="resources/img/loading2.gif" alt="Loading..." />
	</div>


<div id="wrap">

    <div id="header">
		<jsp:include page="header-menu.jsp"/>
	</div>

	
	<div id="body2">
	<div id="floater2" style="margin-top:30px;">
		
		<jsp:include page="body-menu.jsp"/>
	</div>
	<div id="contents">
        
<div class="content" style="height:780px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
				                            
<div class="row">
            <hr class="bread_under">
  <div style="width: 75%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">모니터링 - LOT보고서</h5>
            </header>
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 90px; text-align: right;">작업일자 : </label>
					</div>
					<!-- 시작일 -->
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
								id="s_date" name="s_date" 
								style="margin-top:5px; height: 30px; width: 140px; 
								font-size: 14pt; font-family:headline;"  
								placeholder="예)2020-01-01"
								onkeyup="auto_date_format(event, this);"/>
					</div>              	

					<div class="form-group">
						<label class="control-label" 
							style="font-size: 14pt; font-family:headline; 
							color:#8C8C8C; width: 70px; text-align: right;">설비명 : </label>
					</div>
					
					
					<!-- 설비명 -->
					<div class="form-group">
						<select class="form-control input-sm datepicker" id="s_hogi" name="s_hogi" 
						style="margin-top:5px; height: 30px; width: 160px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;">
							<option value="">설비선택</option>
							<option value="1">Q01-HN01</option>
							<option value="2">Q01-HN02</option>
							<option value="3">Q01-HN03</option>
							<option value="4">Q01-HN04</option>
							<option value="5">Q01-HN05</option>
							<option value="6">Q01-HN06</option>
						</select>
					</div> 		
					
					<!-- LOT번호 -->			
					<!-- 
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 90px; text-align: right;">LOT번호 : </label>
					</div>
					
					
					<div class="form-group">
						<select class="form-control input-sm datepicker" 
						id="s_lotnum" name="s_lotnum" 
						style="margin-top:5px; height: 30px; width: 220px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;"></select>
					</div> 					
					 -->
					 
					 
					<div class="form-group">
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="padding-top:4px; margin-top:6px; height: 31px; width: 100px; 
							font-size:14pt; font-weight:700; font-family:headline;" 
							id="searchbtn">
							<i class="fa fa-search"></i> 검 색</button>
						</div>
					</div>					
					
				</form>
            </header>
            <div id="collapse4" class="body">
               <table id="lot_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell" 
							style="width: 60px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								No.
							</th>
							<th class="text-center cell" 
							style="width: 120px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								작업일자
							</th>
							<th class="text-center cell" 
							style="width: 80px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								설비명
							</th>
							
							<th class="text-center cell" 
							style="width: 200px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								열처리 LOT번호
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								품번
							</th>							
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								품명
							</th>
							<th class="text-center cell" 
							style="width: 140px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								규격
							</th>
							<th class="text-center cell" 
							style="width: 80px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								수량
							</th>
							<th class="text-center cell" 
							style="width: 90px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								중량
							</th>
							<th class="text-center cell" 
							style="width: 80px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								보고서 보기
							</th>
							<th class="text-center cell" 
							style="width: 80px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								보고서 삭제
							</th>							
						</tr>
								
					</thead>					
					<tbody id="lot_contents">
						
					</tbody>
				</table>				
            </div>
        </div>
    </div>
    
    <!-- 트렌드 설정 -->
  <div style="width: 25%;" class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-cog"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">LOT 관리</h5>
            </header>
            
		                     
           <div class="body2">
               <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
  				<table>
                    <tr>
      					<td><label class="control-label col-lg-4" 
      						style="padding-top:3px; width: 120px; text-align: right; 
      						font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>작업일자</label></td>    			
      					<td><input type="text" class="form-control input-sm datepicker" 
      					id="i_date" name="i_date" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="작업일자"/>
      					
      					
      					<input type="hidden" id="i_cnt" name="i_cnt" value="0" /></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>  				
  				
    				<tr>
      					<td><label class="control-label col-lg-4" 
      							style="padding-top:3px; width: 120px; text-align: right; 
      							font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>설비명</label></td>   
      					<td><select class="form-control input-sm" 
      					id="i_hogi" name="i_hogi" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;
      					padding-top:1px; padding-bottom:1px;">
      						<option value="">설비선택</option>
							<option value="1">Q01-HN01</option>
							<option value="2">Q01-HN02</option>
							<option value="3">Q01-HN03</option>
							<option value="4">Q01-HN04</option>
							<option value="5">Q01-HN05</option>
							<option value="6">Q01-HN06</option>
      					</select></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>LOT번호</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_lotnum" name="i_lotnum" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;
      					background-color:white;" 
      					placeholder="LOT번호" readonly="readonly" /></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 16pt; font-family:headline;">
      						<span class="asteriskField"></span>품번</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_pno" name="i_pno" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family: headline;" 
      					placeholder="품번"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>     				
     				
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 16pt; font-family:headline;">
      						<span class="asteriskField"></span>품명</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_pname" name="i_pname" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family: headline;" 
      					placeholder="품명"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 16pt; font-family:headline;">
      						<span class="asteriskField"></span>규격</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_spec" name="i_spec" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="사양"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 16pt; font-family:headline;">
      						<span class="asteriskField"></span>수량</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_qty" name="i_qty" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="수량"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				
     				
     				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>중량</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_weight" name="i_weight" 
      					style="width: 281px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="중량"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>     				
     				
<!--      				
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 120px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비고</label></td>    			
      					<td><textarea class="form-control input-sm" 
      					id="i_bigo" name="i_bigo" 
      					style="width: 340px; height: 110px; 
      					font-size: 14pt; font-family:headline; 
      					resize:none;"  placeholder="비고"></textarea></td> 
      					<td style="padding-bottom:106px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>      				
  -->
     				
	 			</table>
	 			
	 			
					<table>
						<tr>		
							<c:if test="${sessionScope.sid != 'worker' }">
								<td colspan="1" style="display: inline-block; padding-left:90px; padding-bottom:8px; padding-top:8px;">
									
										<button class="btn btn-default pull-right btn-sm" 
										type="button" id="printBtn"
										style="width: 140px; 
										font-size: 14pt; font-weight:700; font-family:headline;">
										보고서 생성</button>
									
								</td>
							</c:if>
							<c:if test="${sessionScope.sid == 'worker' }">
								<td colspan="1" style="display: inline-block; padding-left:90px; padding-bottom:8px; padding-top:8px;">
									
										<button class="btn btn-default pull-right btn-sm" disabled="disabled" 
										type="button"
										style="width: 140px; 
										font-size: 14pt; font-weight:700; font-family:headline;">
										보고서 생성</button>
									
								</td>
							</c:if>
							<!-- 				
							<td colspan="1" style="display: inline-block; padding-left:20px;  padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-danger pull-right btn-sm" 
								type="button" style="width: 100px; font-size: 14px; font-weight:700">
									<span class="glyphicon glyphicon-remove"></span>  삭 제</button>     									
							</td>
											
											
							<td colspan="1" 
							style="display: inline-block; padding-left:10px;padding-bottom:8px; padding-top:8px; ">
								<button class="btn btn-warning pull-right btn-sm" 
								type="button" style="width: 100px; font-size: 14px; font-weight:700">
									<span class="glyphicon glyphicon-refrash"></span>  취 소</button>
							</td>
							 -->
						</tr>
					</table>               		
				
              	</form>
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
		
		var now = new Date();
		var tdate = now.getFullYear()+"-"+date_set(now.getMonth()+1)+"-"+date_set(now.getDate());
//		$("#s_sdate").val(tdate);
//		$("#s_edate").val(tdate);
		$("#s_date").val(tdate);
		
//		$("#i_date").val(tdate);
		
//		getLotInfo();
		$("#loading").show();
		//getLotlist();
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
	    obj.value = comma(uncomma(obj.value));
	}	

	/* function getLotInfo(){
		$.ajax({
			type : "POST",
			url : "l000004_lotinfo.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"wdate":$("#i_date").val(),
					"hogi":$("#i_hogi").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;		
					$("#i_lotnum").val(rsAr[0].lotno);
					
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
				
	} */

	
	
	var cntArray = new Array();
	function getLotlist(){
		$.ajax({
			type : "POST",
			url : "l000004.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_date").val(),
					"hogi":$("#s_hogi").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;		
					var listHtml = "";
					
					
					for(var i=0; i<rsAr.length; i++){
						if(rsAr[i].pno != null){
							cntArray[i] = rsAr[i].cnt;
							listHtml += "<tr>";						
							listHtml += '<td class="nr" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">'+(i+1)+'</td>';
							listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+rsAr[i].cnt+'</td>';
							listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 120px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].wdate+'</td>';
							listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].hogi+'</td>';
							listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 100px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+rsAr[i].hogi2+'</td>';
							listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 200px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].process_code+'</td>';
							listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 140px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].pno+'</td>';
							listHtml += '<td class="nr7" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 140px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].model+'</td>';
							listHtml += '<td class="nr8" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 140px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].spec+'</td>';
							listHtml += '<td class="nr9" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+comma(rsAr[i].qty)+'</td>';
							listHtml += '<td class="nr10" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 90px; word-break:break-all; font-size:15pt; font-family:headline;">'+comma(rsAr[i].weight)+'</td>';
							
							if(rsAr[i].file_yn == 'Y'){
								listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+
								'<button type="button" class="btn btn-default" onclick=viewFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true; style="width:70px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-search"></i></button>'
								+'</td>';
								listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;">'+
								'<button type="button" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true; style="width:70px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-remove"></i></button>'
								+'</td>';						
							}else{
								listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;"></td>';
								listHtml += '<td class="nr11" style="text-align: center; vertical-align: middle; padding: 1px; height: 40px; width: 80px; word-break:break-all; font-size:15pt; font-family:headline;"></td>';							
							}
							
							listHtml += "</tr>";
						}
					}
					
					$("#lot_list tbody").html(listHtml);
					$("#loading").hide();	

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
	
	
	function viewFile(c_val){
		$.ajax({
			type : "POST",
			url : "l000004_file.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"cnt":c_val},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;		
					
					
					var _iframe = "<iframe src='/sunil/reports/"+rsAr[0].filename+"' style='width:100%; height:780px;'></iframe>";
					
					
					$("#carousel-form").empty().append(_iframe);					
					
					
					carouselDialog.dialog("open");	
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
	
	var fileDel_cnt = 0;
	function delFile(c_val){
		fileDel_cnt = c_val;
		$("#confirmSpan").text("파일을 삭제하시겠습니까?");
		confirmDialog.dialog("open");
		
	}	
	
/*이벤트*/	
$("#i_date").change(function(){
//	getLotInfo();
});
		
$("#i_hogi").change(function(){
//	getLotInfo();
});

$("#saveBtn").on("click",function(){
	var wdate = $("#i_date").val();
	var hogi = $("#i_hogi").val();
	var lotno = $("#i_lotnum").val();
	var pno = $("#i_pno").val();
	var pname = $("#i_pname").val();
	var spec = $("#i_spec").val();
	var qty = $("#i_qty").val();
	var weight = $("#i_weight").val();
	var bigo = $("#i_bigo").val();
	
	
	if(hogi == ''){
		$("#alertSpan").text("설비명을 선택해주십시오!");
		alertDialog.dialog("open");
		return;
	}
	
	
	
	$.post("i000004.jsp",{
		"wdate":wdate,
		"hogi":hogi,
		"lotno":lotno,
		"pno":pno,
		"pname":pname,
		"spec":spec,
		"qty":qty,
		"weight":weight,
		"bigo":bigo
	},100);
	
	
	setTimeout(function(){
		getLotlist();
//		getLotInfo();
	},400);
});


$("#printBtn").on("click",function(){
	$("#loading").show();
	var cnt = $("#i_cnt").val();
	var hogi = $("#i_hogi").val();
	
	
	
	if(cnt == 0){
		$("#alertSpan").text("LOT를 선택해주십시오!");
		alertDialog.dialog("open");
		return;
	}
	
	$.ajax({
		type : "POST",
		url : "l000004_pdf.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"cnt":cnt,
				"hogi":hogi},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
//				var rsAr = rsJson.rows;		
				
				$("#alertSpan").text("보고서가 생성되었습니다.");
				alertDialog.dialog("open");
				
				getLotlist();
				$("#loading").hide();
				
			} else if (rsJson && rsJson.status == "fail") {
				alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
			} else {
				alert("에러발생!");
			}
			
//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
			
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


$("#s_hogi").change(function(){
	$("#loading").show();
	getLotlist();
});






$("#lot_contents").delegate('tr','click', function() {
	
	
	var $row = $(this).closest("tr"),
		$nr1 = $row.find(".nr1").text();	//cnt
		$nr2 = $row.find(".nr2").text();	//작업일자
		$nr3 = $row.find(".nr3").text();	//설비 (3호기, 4호기 ...)
		$nr4 = $row.find(".nr4").text();	//설비 (QT001, QT002 ...)
		$nr5 = $row.find(".nr5").text();	//열처리 LOT NO
		$nr6 = $row.find(".nr6").text();	//품번
		$nr7 = $row.find(".nr7").text();	//품명
		$nr8 = $row.find(".nr8").text();	//규격
		$nr9 = $row.find(".nr9").text();	//수량
		$nr10 = $row.find(".nr10").text();	//중량
//		$nr11 = $row.find(".nr11").text();	//비고
		
		
		
		$("#i_cnt").val($nr1);
		$("#i_date").val($nr2);
		$("#i_hogi").val($nr4);
		$("#i_lotnum").val($nr5);
		$("#i_pno").val($nr6);
		$("#i_pname").val($nr7);
		$("#i_spec").val($nr8);
		$("#i_qty").val($nr9);
		$("#i_weight").val($nr10);
//		$("#i_bigo").val($nr11);
		
		
	var index = 0;
	$("#lot_contents > tr").each(function(){
		if($nr1 == cntArray[index]){
			$(this).css("background-color","#B2CCFF");						
		}else{						
			$(this).css("background-color","#fff");
		}	
		index++;
	});
});


$("#searchbtn").on("click",function(){
	$("#loading").show();
	getLotlist();
});


/*다이얼로그*/

	var alertDialog;
	alertDialog = $("#alert-form").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"확 인":function(){
				alertDialog.dialog("close");
			}
		}
	});
	
	var confirmDialog;
	confirmDialog = $("#confirm-form").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"삭 제":function(){
				$.post("d000004_file.jsp",{
					"cnt":fileDel_cnt
				},250);
				
				setTimeout(function(){
					$("#alertSpan").text("파일이 삭제되었습니다.");
					alertDialog.dialog("open");
					getLotlist();
					fileDel_cnt = 0;
				},400);					
				confirmDialog.dialog("close");
				
			},
			"취 소":function(){
				confirmDialog.dialog("close");
			}
		}
	});
	
	
	
	var carouselDialog;
	carouselDialog = $("#carousel-form").dialog({
		  autoOpen: false,
		  height: 950,
		  width: 1200,
		  modal: false,
		  stack:false,
	      open: function(event, ui){
	    	  $('.ui-dialog').css('zIndex', 20010);
	      },
		  buttons: {		
		        "닫 기": function() {
		        	setTimeout( function() 
		              {				
		        		carouselDialog.dialog("close");
		              });
		        }
			  }		
	});	
	
	
/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>