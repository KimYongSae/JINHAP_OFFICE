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
	table th{
		background-color: #122d64 !important;
		color:#FFFFFF;
		border-color: #FFFFFF !important;
		text-align: center;
		font-size: 16pt;
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
<body onload="init();" data-offset="60" data-target=".navbar">
		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
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
        
<div class="content" style="height:780px;"> 

	
	  <div style="position:relative;left:-275px;top:-185px;">
	  
	  
   <div id="room1" style="width:100%; height:20px; position:absolute; left:272px; top:185px; font-size:16px; font-weight:600; color:black;">  
   
				
				                            <!--Begin Datatables-->
<div class="row">
            <hr class="bread_under">
  <div style="width: 70%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">인원관리 - 사용자 관리</h5>
            </header>
            <div id="collapse4" class="body">
               <table id="user_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 60px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								<input type="checkbox" id="allCheck" style="width:25px; height:25px;" />
							</th>						
							
						
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 60px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								No.
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 170px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								작업자명
							</th>
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 170px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								아이디
							</th>
							
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 220px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								로그인-비밀번호
							</th>

							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 220px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								싸인-비밀번호
							</th>
							
							<th class="text-center cell" 
							style="background-color:#24FCFF; width: 220px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								휴대폰 번호
							</th>
														
						</tr>
						
								
					</thead>					
					<tbody id="user_contents">
						
					</tbody>
				</table>				
            </div>
        </div>
    </div>
    
    
    
  <div style="width: 30%;" class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-cog"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">작업자 관리</h5>
            </header>
		                     
           <div class="body2">
               <form class="form-inline" role="form" name="insertform" id="insertform" 
               method="post" autocomplete="off">
               
  				<table>
    				<tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>작업자명</label></td>   
      					<td><input type="text" class="form-control input-sm" 
      					id="i_name" name="i_name" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="작업자명"/>
      					<input type="hidden" id="i_cnt" name="i_cnt" value="0" /></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_id" name="i_id" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="아이디"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
 
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_pw" name="i_pw" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="로그인-비밀번호"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr> 
 
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호</label></td>    			
      					<td><input type="text" class="form-control input-sm" 
      					id="i_pw2" name="i_pw2" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="싸인-비밀번호"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>  
                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>휴대폰번호</label></td>    			
      					<td><input type="text" class="form-control input-sm phoneNumber"
      					 
      					id="i_phone" name="i_phone" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="휴대폰번호"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     			
     			
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

	 			</table>
	 			
	 			<table>
     				<tr>
     					<c:if test="${sessionScope.sid != 'worker' }">
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:30px; 
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px; 
								font-size: 14pt; font-family:headline; font-weight:700"
								id="saveBtn">
								<i class="fa fa-plus"></i>  추 가</button>
	        				</td>
	        				
	        								
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:10px; 
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px; 
								font-size: 14pt; font-family:headline; font-weight:700"
								id="updateBtn">
								<i class="fa fa-pencil"></i>  수 정</button>
	        				</td>
	        				
	
	
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:10px; 
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px; 
								font-size: 14pt; font-family:headline; font-weight:700"
								id="removeBtn">
								<i class="fa fa-trash"></i>  삭 제</button>
	        				</td>			
        				</c:if>
 
     					<c:if test="${sessionScope.sid == 'worker' }">
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:30px; 
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px; 
								font-size: 14pt; font-family:headline; font-weight:700"
								disabled="disabled">
								<i class="fa fa-plus"></i>  추 가</button>
	        				</td>
	        				
	        				
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:10px; 
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px; 
								font-size: 14pt; font-family:headline; font-weight:700"
								disabled="disabled">
								<i class="fa fa-pencil"></i>  수 정</button>
	        				</td>
	        				
	
	
	     					<td colspan="1" 
	     					style="display: inline-block; padding-left:10px;
	     					padding-bottom:8px; padding-top:8px;">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 100px;
								font-size: 14pt; font-family:headline; font-weight:700"
								disabled="disabled">
								<i class="fa fa-trash"></i>  삭 제</button>
	        				</td>			
        				</c:if>
       				
        								
        				<td colspan="1" style="display: inline-block; padding-left:10px;  
        				padding-bottom:8px; padding-top:8px; ">
        					<button class="btn btn-default pull-right btn-sm" type="button" 
        					style="width: 100px; font-size: 14pt; font-family:headline; font-weight:700"
        					id="cancelBtn">
        					<i class="fa fa-times"></i>  취 소</button>
						</td>
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
	
/*전역변수*/
	var alertDialog;
	

//로트목록 No저장 배열
//추후 cnt로 변경예정
var mainIdxArray = new Array();
var tdate = "";
/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	fn_check();
	var now = new Date();
	
	tdate = now.getFullYear()+"년"+date_set(now.getMonth()+1)+"월"+date_set(now.getDate())+"일";
	getUserList();	
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

	var cntArray = new Array();

	var getUserList = function(){
		$.ajax({
			type : "POST",
			url : "m06/s01/select_m06s01.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;		
					var listHtml;
					
					for(var i=0; i<rsAr.length; i++){
						cntArray[i] = rsAr[i].cnt;
						listHtml += "<tr>";
						listHtml += '<td style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all;"><input type="checkbox" class="checkSelect form-control text-center" id="chbox"'+i.toString()+'" onclick="event.cancelBubble = true;" style="width:25px; height:25px; margin-left:15px;" /></td>';
						listHtml += '<td class="nr" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">'+(i+1)+'</td>';
						listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 170px; word-break:break-all; font-size:15pt; font-family:headline; display:none;">'+rsAr[i].cnt+'</td>';
						listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 170px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].u_name+'</td>';
						listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 170px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].u_id+'</td>';
						listHtml += '<td class="nr4" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 220px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].u_pw_login+'</td>';
						listHtml += '<td class="nr5" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 220px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].u_pw_sign+'</td>';
						listHtml += '<td class="nr6" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 220px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].u_phone+'</td>';
						listHtml += "</tr>";					
					}
					
					
					$("#user_list tbody").html(listHtml);					
					
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

$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

$("#allCheck").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
	if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
		chkeckAll = true;
		$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
	} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
		chkeckAll = false;
		$("input[type=checkbox]").prop("checked",false); 
	}

	//console.log(chkeckAll);
	
}); 


		$("#user_contents").delegate('tr','click', function() {
		
			var $row = $(this).closest("tr"),
				$nr1 = $row.find(".nr1").text();	//cnt
				$nr2 = $row.find(".nr2").text();	//작업자명
				$nr3 = $row.find(".nr3").text();	//아이디
				$nr4 = $row.find(".nr4").text();	//로그인_비밀번호
				$nr5 = $row.find(".nr5").text();	//싸인_비밀번호
				$nr6 = $row.find(".nr6").text();	//휴대폰 번호
			
				$("#i_cnt").val($nr1);
				$("#i_name").val($nr2);
				$("#i_id").val($nr3);
				$("#i_pw").val($nr4);
				$("#i_pw2").val($nr5);
				$("#i_phone").val($nr6);
				
				$("#saveBtn").attr("disabled",true);
				
			var index = 0;
			$("#user_contents > tr").each(function(){
				if($nr1 == cntArray[index]){
					$(this).css("background-color","#B2CCFF");						
				}else{						
					$(this).css("background-color","#fff");
				}	
				index++;
			});
			
//			console.log("선택 후 : "+$("#i_cnt").val());
		});
		
		
		
		$("#saveBtn").on("click",function(){
			
			var i_cnt = $("#i_cnt").val();
			var i_name = $("#i_name").val();
			var i_id = $("#i_id").val();
			var i_pw = $("#i_pw").val();
			var i_pw2 = $("#i_pw2").val();
			var i_phone = $("#i_phone").val();
			
			
			if(i_name == "" || i_id == "" || i_pw == "" || i_phone == ""){
				$("#alertSpan").text("작업자명, 아이디, 비밀번호, 휴대폰번호를 확인해주십시오!");
				alertDialog.dialog("open");
				
				return;			
			}
			
			//아이디, 휴대폰번호 중복체크
		$.ajax({
			type : "POST",
			url : "m06/s01/select_m06s01_dualCheck.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				"id":i_id,
				"phone":i_phone},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;				
					if(rsAr[0].id_cnt != 0 && rsAr[1].phone_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 아이디, 휴대폰번호가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else if(rsAr[0].id_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 아이디가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else if(rsAr[1].phone_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 휴대폰번호가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else{
						$("#alertSpan").text("저장되었습니다.");
						
						$.post("m06/s01/update_m06s01.jsp",{
							"u_cnt":i_cnt,
							"u_id":i_id,
							"u_name":i_name,
							"u_pw":i_pw,
							"u_pw2":i_pw2,
							"u_phone":i_phone
						},150);
						
						setTimeout(function(){
							alertDialog.dialog("open");
							getUserList();
							var form = $("#insertform")[0];
							
							form.reset();
							$("#i_cnt").val("0");
							fn_check();
						},300);
						
					}
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

		
		$("#updateBtn").on("click",function(){
			
			var i_cnt = $("#i_cnt").val();
			var i_name = $("#i_name").val();
			var i_id = $("#i_id").val();
			var i_pw = $("#i_pw").val();
			var i_pw2 = $("#i_pw2").val();
			var i_phone = $("#i_phone").val();
			
			
			if(i_cnt == "0"){
				$("#alertSpan").text("수정할 사용자항목을 선택해주십시오!");
				alertDialog.dialog("open");
				
				return;					
			}
			
			if(i_name == "" || i_id == "" || i_pw == "" || i_phone == ""){
				$("#alertSpan").text("작업자명, 아이디, 비밀번호, 휴대폰번호를 확인해주십시오!");
				alertDialog.dialog("open");
				
				return;			
			}
			
			//아이디, 휴대폰번호 중복체크
		$.ajax({
			type : "POST",
			url : "m06/s01/select_m06s01_dualCheck.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				"id":i_id,
				"phone":i_phone},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;				
					if(rsAr[0].id_cnt != 0 && rsAr[1].phone_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 아이디, 휴대폰번호가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else if(rsAr[0].id_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 아이디가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else if(rsAr[1].phone_cnt != 0 && i_cnt == "0"){
						$("#alertSpan").text("중복된 휴대폰번호가 있습니다.\n다시 입력해주십시오!");
						alertDialog.dialog("open");						
					}else{
						$("#alertSpan").text("수정되었습니다.");
						
						$.post("m06/s01/update_m06s01.jsp",{
							"u_cnt":i_cnt,
							"u_id":i_id,
							"u_name":i_name,
							"u_pw":i_pw,
							"u_pw2":i_pw2,
							"u_phone":i_phone
						},150);
						setTimeout(function(){
							alertDialog.dialog("open");
							getUserList();
							$("#saveBtn").attr("disabled",false);
							
							var form = $("#insertform")[0];
							
							form.reset();
//							console.log("수정 후 : "+$("#i_cnt").val());
							$("#i_cnt").val("0");
							fn_check();
						},300);
						
					}
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
		
		
	//취소
	$("#cancelBtn").on("click",function(){
		$("#saveBtn").attr("disabled",false);
		
		
		var form = $("#insertform")[0];
		form.reset();
	});
	
	
	
	//삭제
	$("#removeBtn").on("click",function(){
//		alert("삭제눌림");
		
		
		var obj = new Object();
		var m = 0;
		var x = 0;
		var chkSize = 0;
		var ccnt = 0;
		var cid = "";
		var str = "";
		
		$(".checkSelect").each(function(){
			if(this.checked){
				for(x=1; x<=7; x++){
					str = $('#user_list  > tbody > tr:eq('+m.toString()+')>td:eq('+x.toString() +')').html();
					obj['param_row'+chkSize.toString()+'_col' + x.toString()] = str;
					
				}
				
				
				
				ccnt = obj["param_row"+chkSize.toString()+"_col2"];
				chkSize++;
				if(chkSize == "1"){
					cid = ccnt;
				}else{
					cid += ','+ccnt;
				}
			}
			m++;
		});
		
		
		
		/* $.post("m06/s01/delete_m06s01.jsp",{
			"cnt":cid
		},150);
		
		setTimeout(function(){
			$("#saveBtn").attr("disabled",false);
			getUserList();
			
			$("#alertSpan").text("삭제되었습니다.");
			alertDialog.dialog("open");
			$("#allCheck").prop("checked",false);
			
			
		},300); */
		
		$.post("m06/s01/delete_m06s01.jsp", { "cnt": cid })
	    .done(function(responseData) {
	    	setTimeout(function(){
				$("#saveBtn").attr("disabled",false);
				getUserList();
				
				$("#alertSpan").text("삭제되었습니다.");
				alertDialog.dialog("open");
				$("#allCheck").prop("checked",false);
			},300);
	    })
	    .fail(function(jqXHR, textStatus, errorThrown) {
	    	$("#alertSpan").text("체크박스를 확인해 주세요.");
			alertDialog.dialog("open");
	    });

		
		
	});	
		
/*다이얼로그*/
alertDialog = $("#alert-form").dialog({
		autoOpen:false,
		height:180,
		width:320,
		modal:false,
		stack:false,
		buttons:{
			"확 인":function(){
				alertDialog.dialog("close");
			}
		}
	});



/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>