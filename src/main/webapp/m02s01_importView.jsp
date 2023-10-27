<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <% String hogi = request.getParameter("hogi"); %> --%>
<html>
<head>
<title>Project Management System</title>
<link rel="shortcut icon" href="resources/img/ez_ico.ico" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/style2.css"/>
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/jquery-ui.theme.css" />

<script src="assets/js/jquery-2.1.4.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-latest.js"></script>

<script src="resources/js/jquery-ui.js" /></script>
<!-- 추가한 부분 start-->

<script type="text/javascript" src="resources/js/script.js"></script> 
<script type="text/javascript" src="resources/js/jquery.color-2.1.2.min.js"></script>
<script type="text/javascript" src="resources/js/menu_min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/menu-css.css" />


<script src="resources/js/moment.min.js"></script> 
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="resources/js/sautil.js"></script>

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css"/>
<!-- 추가한 부분 end-->
<script src="resources/js/alogout.js"></script>

<style>
.scrolltbody {
    display: block;
  
    border-collapse: collapse;
    border: 0px solid #000;
}

.scrolltbody td { border: 1px solid #000; border-top: 0;}

.scrolltbody tbody {
    display: block;
    height: 380px;

    overflow-x: hidden;
}


</style>

 </head>
<body>
	<div style="display:none;" id="alert-form" title="확인창" >
			<span id="alertSpan"></span>
		</div>
		
	<form class="form-horizontal" action="m02/s01/import_m02s01_excel.jsp" name="upload" method="post" enctype="multipart/form-data">
 		<%-- <input type="hidden" id="hogiCode" name="hogiCode" value="<%=hogi %>호기"/> --%>
		
		<table>
			<tr><td colspan="2"> <b>**주의사항**</b></td></tr>
			<tr><td colspan="2">*엑셀파일만 업로드 가능합니다.</td></tr>
			<tr height="5"><td></td></tr>
			<tr>
			<td>
				<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
				
				<div class="file_input_div">
					<input type="file" id="bupumFileName" name="file1" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
				</div>
			</td>
			</tr>
			<tr height="5"><td></td></tr>
			<tr>
			<td colspan="2" align="center"><input type="button" class="btn small btn-primary" onclick="condition_excel_import();" value="전송"></td>
			</tr>
		</table>
	</form>
</body>

<script>

/* 
function eventOccur(evEle, evType){
	 if (evEle.fireEvent) {
			 evEle.fireEvent('on' + evType);
				 } else {
				 //MouseEvents가 포인트 그냥 Events는 안됨~ ??
				 var mouseEvent = document.createEvent('MouseEvents');
				 // API문서 initEvent(type,bubbles,cancelable)
				 mouseEvent.initEvent(evType, true, false);
				 var transCheck = evEle.dispatchEvent(mouseEvent);
				 if (!transCheck) {
				 //만약 이벤트에 실패했다면
				 console.log("클릭 이벤트 발생 실패!");
			 }
		 }
	} */

/*
function fileClick(){
	 eventOccur(document.getElementById('fileName'),'click');
} */

var alertDialog;			

alertDialog = $("#alert-form").dialog({
  autoOpen: false,
  height: 200,
  width: 300,
  modal: false,
  stack:false,
  buttons: {
        "확 인": function() {	        	
        	setTimeout( function(){		
 				alertDialog.dialog( "close" );
            }, 100);	        	
        }
	  }
});


	
	
	/*opener.getMachineCode();
	window.close(); */

	//부품표 - 목록불러오기
function condition_excel_import() {   
	 if (upload.file1.value == "") {   
		  $("#alertSpan").text("파일을 업로드해주세요.");
		  alertDialog.dialog("open");
		  return false;   
	 }  else if(!checkFileType(upload.file1.value)) {   
		  $("#alertSpan").text("엑셀파일만 업로드해주세요.");
		  alertDialog.dialog("open");
	  return false;   
	 }   
	 
	 if(upload.file1.value.indexOf("기준정보") == -1){
		 $("#alertSpan").text("선택하신 파일이 부품표의 파일이 맞는지 확인해주세요.");
		  alertDialog.dialog("open");
		  return false;
	 }
	 
	 
	 /* if(upload.file1.value.indexOf($("#hogiCode").val()) == -1){
		 $("#alertSpan").text("선택하신 파일이 해당 설비의 파일인지 확인해주세요.");
		  alertDialog.dialog("open");
		  return false;
	 } */
	 
	 
	  document.upload.submit();
//	  opener.getCodeDetail();
// 	  opener.getMachineCode();
	}
	
	function checkFileType(filePath){   
	  
	 var fileLen = filePath.length;   
	 var fileFormat = filePath.substring(fileLen - 4);   
	 var fileFormat2 = filePath.substring(fileLen - 5);   
	 fileFormatfileFormat = fileFormat.toLowerCase();   
	  
	 if (fileFormat == ".xls" || fileFormat2 == ".xlsx"){   
		 return true;    
	 	}else{ return false;}   
	}	

$(document).ready(function() {
	

	
});
</script>
</html>