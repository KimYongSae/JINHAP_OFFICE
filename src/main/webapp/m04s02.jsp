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
	
[aria-describedby="image-form"]{
	z-index:20000 !important;
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
		
		<div id="confirm-form" style="display:none;" title="확인창">
			<span id="confirmSpan"></span>
		</div>
		
		<div style="display:none;" id="file-form" title="파일 첨부" >
			<form class="form-horizontal" id="upload" name="upload" method="post" enctype="multipart/form-data">
				<table>
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_date" name="import_date" class="file_input_textbox" readonly="readonly">
						<input type="hidden" id="import_cnt" name="import_cnt" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file" name="file" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="file_import();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>
		<div style="display:none;" id="image-form" title="파일 미리보기" >
			<iframe id="image_view" style="width:100%; height:100%; display:none;" > 
			
			</iframe>			
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
            
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list"></i></div>
                <h5 style="font-size:14pt; font-family: headline;">설비관리 - OPL 요령서</h5>
            </header>
            
            <header style="background:white; height:43px;">
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
						<!-- 기준선택 -->
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt;  font-family:headline; font-weight:700; 
								color:#8C8C8C; width: 70px; text-align: right;">
							기간 : </label>
						</div>
						
						<div class="form-group">
							<select class="form-control input-sm" 
							id="s_date" name="s_date"
							style="margin-top:5px; height: 30px; width: 160px; 
								font-size: 14pt; font-family:headline; font-weight:700;
								padding-top:1px; padding-bottom:1px;">
							</select>
						</div>				
										
						
						<div class="form-group">
							&nbsp;&nbsp;
							<div class="form-group">
								<c:if test="${sessionScope.sid != 'worker' }">
									<button class="btn btn-default pull-right btn-sm" type="button" 
									style="margin-top:6px; height: 31px; width: 120px; 
									font-size:14pt; font-family: headline; font-weight:700;
									padding-top:1px; padding-bottom:1px;" 
									id="fileSelect">
									<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
								</c:if>
							</div>
						</div>
				</form>
            </header>
            <div id="collapse4" class="body">
               <table id="file_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
						<tr>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 60px; height: 30px; 
							font-size: 16pt; font-family: headline; font-weight:700;">
								No.
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 140px; height: 30px; 
							font-size: 16pt; font-family: headline; font-weight:700;">
								파일 저장일
							</th>
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 400px; height: 30px; 
							font-size: 16pt; font-family: headline; font-weight:700;">
								파일제목
							</th>
							
							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 130px; height: 30px; 
							font-size: 16pt; font-family: headline; font-weight:700;">
								첨부파일
							</th>																																									

							<th class="text-center cell" 
							style="background-color:#36FFFF; width: 130px; height: 30px; 
							font-size: 16pt; font-family: headline; font-weight:700;">
								파일삭제
							</th>
						</tr>
								
					</thead>					
					<tbody id="file_contents">
						
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
	
/*전역변수*/	
var sid;
/*인터벌*/
	
	
/*페이지 로드*/	
$(function(){
	fn_check();
	var now = new Date();
	
	for(var j=-3; j<1; j++){
		var y_value = now.getFullYear() + j;
		$("#s_date").append("<option value='"+y_value+"'>"+y_value+"년</option>");	
	}
	
	sid = '<%=session.getAttribute("sid")%>'
	$("#s_date").val(now.getFullYear());
	
//	$("#s_sdate").val(now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10));
//	$("#s_edate").val(now.toISOString().substring(0, 4)+"-"+now.toISOString().substring(5, 7)+"-"+now.toISOString().substring(8, 10));
});
	
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
	getFileList();
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

function file_import(){
	var fileform = $("#upload")[0];
	var fileData = new FormData(fileform);

	fileDialog.dialog("close");
	
	 if (fileform.file.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("업로드해");
		  return false;   
	 }
	 

	 /*
		if(!checkFileTypePDF(fileform.file.value)) {
		  $("#alertSpan").text("PDF 파일만 업로드해주세요.");
		  alertDialog.dialog("open");
//			alert("엑셀만해");
			
			fileform.reset();
	  return false;   
	 }	
	 */
	
	var path = $("#filePath").val();
	if(path != ''){
	
		$.ajax({
			url:"m04/s02/upload_m04s02.jsp",
			type:"post",
			enctype:"multipart/form-data",
			data:fileData,
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				
				fileDialog.dialog("close");
				getFileList();
				fileform.reset();
			}
		});
	}
	
	
}

var fileDel_cnt = 0;

function delFile(c_val){
	fileDel_cnt = c_val;
	$("#confirmSpan").text("파일을 삭제하시겠습니까?");
	confirmDialog.dialog("open");
	
}

/* function checkFileTypePDF(filePath){   
	  
	 var fileLen = filePath.length;   
	 var fileFormat = filePath.substring(filePath.lastIndexOf('.'),filePath.length);   
	 fileFormatfileFormat = fileFormat.toLowerCase();   
	 
	 if (fileFormat == ".pdf"){
		 return true;    
	 	}else{ 
	 		return false;
	 }   
	} */

function getFileList(){
	$.ajax({
		type : "POST",
		url : "m04/s02/select_m04s02.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
			"sdate":$("#s_date").val()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				var listHtml = "";
				
				for(var i=0; i<rsAr.length; i++){
//					console.log(rsAr[i].filename);
					var temp = rsAr[i].filename;
					var o_fname = temp.substring(0,temp.lastIndexOf("_"));
//					console.log(o_fname+rsAr[i].version);
					
					
					listHtml += "<tr>";
					listHtml += '<td class="nr1" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 60px; word-break:break-all; font-size:15pt; font-family:headline;">'+(i+1)+'</td>';
					listHtml += '<td class="nr2" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 140px; word-break:break-all; font-size:15pt; font-family:headline;">'+rsAr[i].tdate+'</td>';
					listHtml += '<td class="nr3" style="text-align: center; vertical-align: middle; padding: 1px; height: 30px; width: 400px; word-break:break-all; font-size:15pt; font-family:headline;">'+o_fname+rsAr[i].version+'</td>';
					//if(rsAr[i].version == ".pdf"){
					if (rsAr[i].version == ".pdf" || rsAr[i].version == ".png") {

						listHtml += '<td style="text-align: center; height: 20px; width: 130px;"><button type="button" style="font-size:15pt; font-family:headline;" class="btn btn-default" onclick=viewFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true;><i class="fa fa-search"></i>파일보기</button></td>';	
					}else{
						listHtml += '<td style="text-align: center; height: 20px; width: 130px;"><button type="button" style="font-size:15pt; font-family:headline;" class="btn btn-default" onclick=downFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true;><i class="fa fa-save"></i>파일다운</button></td>';
					}
					
					if(rsAr[i].file_yn == 'Y'){
						if(sid != "worker"){
							listHtml += '<td style="text-align: center; height: 20px; width: 130px;"><button type="button" style="font-size:15pt; font-family:headline;" class="btn btn-default" onclick=delFile('+rsAr[i].cnt+'); return false; event.cancelBubble = true;><i class="fa fa-remove"></i>파일삭제</button></td>';
						}else{
							listHtml += '<td style="text-align: center; height: 20px; width: 130px;"></td>';
						}
					}else{
						listHtml += '<td style="text-align: center; height: 20px; width: 130px;"></td>';
					}
					
					listHtml += "</tr>";						
				}
	
				$("#file_list tbody").html(listHtml);
	
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
			
}


/*이벤트*/	
$("#fileSelect").on("click",function(){
	fileDialog.dialog("open");
});
		
/*		
$("#searchbtn").on("click",function(){
	getFileList();
});
*/

$("#s_date").change(function(){
	getFileList();
});
		
function viewFile(c_val){
	
	$.ajax({
		type : "POST",
		url : "m04/s02/view_m04s02.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"cnt":c_val},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
//				console.log(rsAr[0].filename);
								
				var file = "/JINHAP_OFFICE/upload/"+(decodeURIComponent(rsAr[0].filename));
				//var file = "D:/file/m04s02/"+(decodeURIComponent(rsAr[0].filename));
				//var file = "/JINHAP_OFFICE/file/m04s02/"+(decodeURIComponent(rsAr[0].filename));
				
				console.log((decodeURIComponent(file)));
				
				
				$("#image_view").attr("src",file);
				$("#image_view").show();
				imageDialog.dialog("open");
				
				
			} else if (rsJson && rsJson.status == "fail") {
				alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
			} else {
				alert("에러발생!");
			}
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


function downFile(c_val){
	
	$.ajax({
		type : "POST",
		url : "m04/s02/view_m04s02.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime(),
				"cnt":c_val},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
//				console.log(rsAr[0].filename);
								
				var file = "/JINHAP_OFFICE/upload/"+(decodeURIComponent(rsAr[0].filename));
				//var file = "D:/file/m04s02/"+(decodeURIComponent(rsAr[0].filename));
				//var file = "/JINHAP_OFFICE/file/m04s02/"+(decodeURIComponent(rsAr[0].filename));
				console.log((decodeURIComponent(file)));
				
				
				$("#image_view").attr("src",file);
				$("#image_view").show();
//				imageDialog.dialog("open");
				
				
			} else if (rsJson && rsJson.status == "fail") {
				alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
			} else {
				alert("에러발생!");
			}
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


		
/*다이얼로그*/

var imageDialog;			

imageDialog = $("#image-form").dialog({
  autoOpen: false,
  height: 900,
  width: 1100,
  modal: false,
  stack:false,
  buttons: {		
        "닫 기": function() {
        	setTimeout( function() 
              {				
        		imageDialog.dialog("close");
        		
        		$("#image_view").empty();
              });
        }
	  }
});

var fileDialog;
fileDialog = $("#file-form").dialog({
	  autoOpen: false,
	  height: 280,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		fileDialog.dialog("close");
	              });
	        }
		  }
	});

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
			$.post("m04/s02/delete_m04s02.jsp",{
				"cnt":fileDel_cnt
			},250);
			
			setTimeout(function(){
				$("#alertSpan").text("파일이 삭제되었습니다.");
				alertDialog.dialog("open");
				getFileList();
				fileDel_cnt = 0;
			},400);					
			confirmDialog.dialog("close");
			
		},
		"취 소":function(){
			confirmDialog.dialog("close");
		}
	}
});

/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>