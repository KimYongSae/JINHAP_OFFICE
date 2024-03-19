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

<script type="text/javascript" src="resources/js/jquery.tablesorter.js"></script>

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
		<input type="hidden" id="imgDeleteValue" />
		<div id="imgDelete-form" style="display:none;" title="삭제 확인창">
			<span id="imgDeleteSpan"></span>
		</div>

		<!-- 작성 이미지 -->
		<div style="display:none;" id="img1-form" title="작성 결재이미지 등록" >
			<form class="form-horizontal" id="img1_reg" name="img1_reg" 
					method="post" enctype="multipart/form-data">
				<table>
					<tr>
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디:</label>

	      					<input type="text" class="form-control input-sm" 
	      					id="img1_id" name="img1_id" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="아이디"/>
      						</div>
      					</td>    			
					</tr>
					<tr style="border-bottom:2px dashed gray;">
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호:</label>

	      					<input type="password" class="form-control input-sm" 
	      					id="img1_pw" name="img1_pw" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="비밀번호"/>
      						</div>
      					</td>    			
					</tr>
					<tr height="5"><td></td></tr>
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="img1Path" class="file_input_textbox" 
								readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="img1File" name="img1File" 
							class="file_input_hidden form-control" 
							onchange="javascript:document.getElementById('img1Path').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="img1FileSave();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>

		<!-- 검토 이미지1 -->
		<div style="display:none;" id="img2-form" title="검토1 결재이미지 등록" >
			<form class="form-horizontal" id="img2_reg" name="img2_reg" 
					method="post" enctype="multipart/form-data">
				<table>
					<tr>
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디:</label>

	      					<input type="text" class="form-control input-sm" 
	      					id="img2_id" name="img2_id" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="아이디"/>
      						</div>
      					</td>    			
					</tr>
					<tr style="border-bottom:2px dashed gray;">
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호:</label>

	      					<input type="password" class="form-control input-sm" 
	      					id="img2_pw" name="img2_pw" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="비밀번호"/>
      						</div>
      					</td>    			
					</tr>
					<tr height="5"><td></td></tr>
				
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="img2Path" class="file_input_textbox" 
								readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="img2File" name="img2File" 
							class="file_input_hidden form-control" 
							onchange="javascript:document.getElementById('img2Path').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="img2FileSave();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>

		<!-- 검토 이미지2 -->
		<div style="display:none;" id="img3-form" title="검토2 결재이미지 등록" >
			<form class="form-horizontal" id="img3_reg" name="img3_reg" 
					method="post" enctype="multipart/form-data">
				<table>
					<tr>
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디:</label>

	      					<input type="text" class="form-control input-sm" 
	      					id="img3_id" name="img3_id" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="아이디"/>
      						</div>
      					</td>    			
					</tr>
					<tr style="border-bottom:2px dashed gray;">
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호:</label>

	      					<input type="password" class="form-control input-sm" 
	      					id="img3_pw" name="img3_pw" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="비밀번호"/>
      						</div>
      					</td>    			
					</tr>
					<tr height="5"><td></td></tr>
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="img3Path" class="file_input_textbox" 
								readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="img3File" name="img3File" 
							class="file_input_hidden form-control" 
							onchange="javascript:document.getElementById('img3Path').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="img3FileSave();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>

		<!-- 승인이미지 -->
		<div style="display:none;" id="img4-form" title="승인 결재이미지 등록" >
			<form class="form-horizontal" id="img4_reg" name="img4_reg" 
					method="post" enctype="multipart/form-data">
				<table>
					<tr>
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디:</label>

	      					<input type="text" class="form-control input-sm" 
	      					id="img4_id" name="img4_id" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="아이디"/>
      						</div>
      					</td>    			
					</tr>
					<tr style="border-bottom:2px dashed gray;">
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호:</label>

	      					<input type="password" class="form-control input-sm" 
	      					id="img4_pw" name="img4_pw" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="비밀번호"/>
      						</div>
      					</td>    			
					</tr>
					<tr height="5"><td></td></tr>
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="img4Path" class="file_input_textbox" 
								readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="img4File" name="img4File" 
							class="file_input_hidden form-control" 
							onchange="javascript:document.getElementById('img4Path').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="img4FileSave();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>

		<!-- 본부장이미지 -->
		<div style="display:none;" id="img5-form" title="본부장 결재이미지 등록" >
			<form class="form-horizontal" id="img5_reg" name="img5_reg" 
					method="post" enctype="multipart/form-data">
				<table>
					<tr>
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>아이디:</label>

	      					<input type="text" class="form-control input-sm" 
	      					id="img5_id" name="img5_id" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="아이디"/>
      						</div>
      					</td>    			
					</tr>
					<tr style="border-bottom:2px dashed gray;">
      					<td>
      						<div class="form-group">
      						<label class="control-label col-lg-4" 
			      					style="width: 120px; text-align: right; 
			      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>비밀번호:</label>

	      					<input type="password" class="form-control input-sm" 
	      					id="img5_pw" name="img5_pw" 
	      					style="width: 200px; height: 30px; 
	      					font-size: 14pt; font-family:headline;" 
	      					placeholder="비밀번호"/>
      						</div>
      					</td>    			
					</tr>
					<tr height="5"><td></td></tr>
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="img5Path" class="file_input_textbox" 
								readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="img5File" name="img5File" 
							class="file_input_hidden form-control" 
							onchange="javascript:document.getElementById('img5Path').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="img5FileSave();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
		</div>


		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
		</div>
		<div id="confirm-form" style="display:none;" title="확인창">
			<span id="confirmSpan"></span>
		</div>		
		<div id="carousel-form" style="display:none;" title="작업일보 파일">
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
  <div style="width: 70%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">생산관리 - 열처리 작업일보 현황</h5>
            </header>
            <header style="background:white; height:43px;">
            
            
                <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
					
					<div class="form-group">
						<label class="control-label" 
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 70px; text-align: right;">설비명 : </label>
					</div>
					<!-- 설비명 -->
					<div class="form-group">
						<select class="form-control input-sm datepicker" 
						id="s_hogi" name="s_hogi" 
						style="margin-top:5px; height: 30px; width: 140px; 
						font-size: 14pt; font-family:headline;
						padding-top:1px; padding-bottom:1px;">
							<option value="">전체</option>
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
						style="font-size: 14pt; font-family:headline; 
						color:#8C8C8C; width: 90px; text-align: right;">날짜 : </label>
					</div>
					<!-- 시작일 -->
					<div class="form-group">
						<input type="text" class="form-control input-sm datepicker" 
						id="s_date" name="s_date" 
						style="margin-top:5px; height: 30px; width: 160px; 
						font-size: 14pt; font-family:headline;"
						 placeholder="예)2020-01-01"
						onkeyup="auto_date_format(event, this);"/>
					</div>              	

	
					
					<div class="form-group">
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
							style="margin-top:6px; height: 31px; width: 100px; 
							font-size:14pt; font-family:headline; font-weight:700;
							padding-top:1px; padding-bottom:1px;" 
							id="searchbtn">
							<i class="fa fa-search"></i> 검 색</button>
						</div>
					</div>					
					
				</form>
            </header>
            <div id="collapse4" class="body">
               <table id="lot_list" cellspacing="0" 
				class="table table-bordered table-hover 
				table-responsive scrolltbody tablesorter">
					<thead>
						<tr>
							<th class="text-center cell" 
							style=" width: 200px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								작업일자
							</th>
							<th class="text-center cell" 
							style=" width: 250px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								설비명
							</th>
							
							
							<th class="text-center cell" 
							style=" width: 350px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								작업일보 보기
							</th>																																														

							<th class="text-center cell" 
							style=" width: 350px; height: 30px; 
							font-size: 16pt; font-family:headline;">
								트렌드 보기
							</th>

						</tr>
						
								
					</thead>					
					<tbody id="lot_contents">
						
					</tbody>
				</table>				
            </div>
        </div>
    </div>
    
    
    
  <div style="width: 30%;" class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-cog"></i></div>
                <h5 style="font-size:14pt; font-family:headline;">작업일보 출력</h5>
            </header>
		                     
           <div class="body2">
               <form class="form-inline" role="form" name="searchform" method="post" autocomplete="off">
  				<table>
    				<tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>설비명</label></td>   
      					<td><input type="text" class="form-control input-sm" 
      					id="i_hogi" name="i_hogi" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="설비명"/>
						<input type="hidden" id="i_cnt" name="i_cnt" value="0" />
						</td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

                    <tr>
      					<td><label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 130px; text-align: right; 
      					font-size: 14pt; font-family:headline;">
      						<span class="asteriskField"></span>작성일자</label></td>    			
      					<td><input type="text" class="form-control input-sm datepicker" 
      					id="i_date" name="i_date" 
      					style="width: 340px; height: 34px; 
      					font-size: 14pt; font-family:headline;" 
      					placeholder="작성일자"/></td> 
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
 
	 			</table>
	 			<table>
     				<tr>
     					<td colspan="1" 
     					style="display: inline-block; padding-left:56px; 
     					padding-bottom:8px; padding-top:8px;">
     					
     						<c:if test="${sessionScope.sid != 'worker' }">
	 							<button class="btn btn-default pull-right btn-sm" type="button" 
								onclick="log_print();"
								style="width: 160px; 
								font-size: 14pt; font-family:headline; font-weight:700">
								<i class="fa fa-print"></i>  작업일보 생성</button>    						
							</c:if>

     						<c:if test="${sessionScope.sid == 'worker' }">
	 							<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 160px; 
								font-size: 14pt; font-family:headline; font-weight:700" disabled="disabled">
								<i class="fa fa-print"></i>  작업일보 생성</button>    						
							</c:if>    					
							
        				</td>
        								
      					<td colspan="1" 
      					style="display: inline-block; padding-left:10px;  padding-bottom:8px; 
      					padding-top:8px; width: 100px; margin-left:180px;">
      						<c:if test="${sessionScope.sid != 'worker' }">
								<button class="btn btn-default pull-right btn-sm" type="button" 
								onclick="getLotAllList();"
								style="width: 200px; 
								font-size: 14pt; font-family:headline; font-weight:700">
								<i class="fa fa-print"></i>  작업일보 일괄생성</button>
        					</c:if>

      						<c:if test="${sessionScope.sid == 'worker' }">
								<button class="btn btn-default pull-right btn-sm" type="button"
								style="width: 200px; 
								font-size: 14pt; font-family:headline; font-weight:700" disabled="disabled">
								<i class="fa fa-print"></i>  작업일보 일괄생성</button>
        					</c:if>

        				</td>
        								
        								
        				<td colspan="1" style="display: inline-block; padding-left:10px;  padding-bottom:8px; padding-top:8px; ">
        					
						</td>
					</tr>
				</table>               		
              	</form>
           </div> 
        </div>
        
		<%-- <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons">
                	<i style="color:white;" class="fa fa-cog"></i>
                </div>
                <h5 style="font-size:14pt; font-family:headline;">결재이미지 저장</h5>
            </header>
		                     
           <div class="body2">
               <form class="form-inline" role="form" 
               			id="signImageForm" name="signImageForm" 
               			method="post" autocomplete="off">
  				<table>
  					<!-- 작성 -->
    				<tr>
      					<td>
      						<label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 90px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>작성</label>
      					</td>
      					<td>
      						<img id="img1" class="rp-img-popup"
      							style="margin-left:2px; width:17px; height:23px;"
      						 src="" alt="" />
      						 <input type="hidden" id="l_img1_path" />
      					</td>   
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img1_id" name="l_img1_id" 
	      					style="width: 90px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="아이디" readonly="readonly"/>
      					</td>
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img1_name" name="l_img1_name" 
	      					style="width: 120px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="사용자명" readonly="readonly"/>
						</td>
						<c:if test="${sessionScope.sid != 'worker' }">
	      					<td>      						
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img1_fileSelect">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>				
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img1_fileDelete" onclick="imgDeleteView(1);">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td> 
	      				</c:if>
						<c:if test="${sessionScope.sid == 'worker' }">
	      					<td>      						
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>				
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td> 
	      				</c:if>	      				
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="7"></td></tr>
 
 
 					<!-- 검토1 -->
    				<tr>
      					<td>
      						<label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 90px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>검토1</label>
      					</td>
      					<td>
      						<img id="img2" class="rp-img-popup"
      							style="margin-left:2px; width:17px; height:23px;"
      						 src="" alt="" />
      						 <input type="hidden" id="l_img2_path" />
      					</td>   
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img2_id" name="l_img2_id" 
	      					style="width: 90px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="아이디" readonly="readonly"/>
      					</td>
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img2_name" name="l_img2_name" 
	      					style="width: 120px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="사용자명" readonly="readonly"/>
						</td>
						<c:if test="${sessionScope.sid != 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 31px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img2_fileSelect">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img2_fileDelete" onclick="imgDeleteView(2);">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>
	      				<c:if test="${sessionScope.sid == 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 31px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>
	      				
	      				
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="7"></td></tr>
 
 					<!-- 검토2 -->
    				<tr>
      					<td>
      						<label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 90px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>검토2</label>
      					</td>
      					<td>
      						<img id="img3" class="rp-img-popup"
      							style="margin-left:2px; width:17px; height:23px;"
      						 src="" alt="" />
      						 <input type="hidden" id="l_img3_path" />
      					</td>   
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img3_id" name="l_img3_id" 
	      					style="width: 90px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="아이디" readonly="readonly"/>
      					</td>
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img3_name" name="l_img3_name" 
	      					style="width: 120px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="사용자명" readonly="readonly"/>
						</td>
						<c:if test="${sessionScope.sid != 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img3_fileSelect">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img3_fileDelete" onclick="imgDeleteView(3);">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>
						<c:if test="${sessionScope.sid == 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>


      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="7"></td></tr>
 
 					<!-- 승인 -->
    				<tr>
      					<td>
      						<label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 90px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>승인</label>
      					</td>
      					<td>
      						<img id="img4" class="rp-img-popup"
      							style="margin-left:2px; width:17px; height:23px;"
      						 src="" alt="" />
      						 <input type="hidden" id="l_img4_path" />
      					</td>   
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img4_id" name="l_img4_id" 
	      					style="width: 90px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="아이디" readonly="readonly"/>
      					</td>
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img4_name" name="l_img4_name" 
	      					style="width: 120px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="사용자명" readonly="readonly"/>
						</td>
						<c:if test="${sessionScope.sid != 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img4_fileSelect">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img4_fileDelete" onclick="imgDeleteView(4);">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>
						<c:if test="${sessionScope.sid == 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>

      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="7"></td></tr>
 
 					<!-- 본부장 -->
    				<tr>
      					<td>
      						<label class="control-label col-lg-4" 
      					style="padding-top:3px; width: 90px; text-align: right; 
      					font-size:14pt; font-family:headline;">
      						<span class="asteriskField"></span>본부장</label>
      					</td>
      					<td>
      						<img id="img5" class="rp-img-popup"
      							style="margin-left:2px; width:17px; height:23px;"
      						 src="" alt="" />
      						 <input type="hidden" id="l_img5_path" />
      					</td>   
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img5_id" name="l_img5_id" 
	      					style="width: 90px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="아이디" readonly="readonly"/>
      					</td>
      					<td>
	      					<input type="text" class="form-control input-sm" 
	      					id="l_img5_name" name="l_img5_name" 
	      					style="width: 120px; height: 34px; margin-left:5px;
	      					font-size: 14pt; font-family:headline;
	      					background-color:#FFFFFF;" 
	      					placeholder="사용자명" readonly="readonly"/>
						</td>
						<c:if test="${sessionScope.sid != 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img5_fileSelect">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								id="img5_fileDelete" onclick="imgDeleteView(5);">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>

						<c:if test="${sessionScope.sid == 'worker' }">
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 110px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span>파일첨부</button>
	      					</td> 
	      					<td>
								<button class="btn btn-default btn-sm" type="button" 
								style="height: 34px; width: 70px; 
								font-size:14pt; font-family: headline; font-weight:700;
								padding-top:1px; padding-bottom:1px; margin-left:5px;" 
								disabled="disabled">
								<span class="glyphicon glyphicon-remove"></span>삭제</button>
	      					</td>
	      				</c:if>
	      				
      					<td style="padding-bottom:30px;">&nbsp;</td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="7"></td></tr>
	 			</table>
              	</form>
           </div> 

                
        </div> --%>
	        
        
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
		
		<input type="hidden" id="s_sdate" />
		<input type="hidden" id="s_ydate" />
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

//로트목록 No저장 배열
//추후 cnt로 변경예정
var mainIdxArray = new Array();
var tdate = "";
/*인터벌*/
	
	
/*페이지 로드*/	
 $(function(){
	
/*	fn_check();
	
	$.tablesorter.addParser({
		  id: 'NumberSort',
		  is:function(s){return false;},
		  format: function(s) {return s.replace(/,/g,'');},
		  type: 'numeric'
		});

		$("#lot_list").tablesorter({debug:true});
	
	
	
//	$("#s_sdate").val(tdate);
//	$("#s_edate").val(tdate);
	getLotList();	
	getImageList();
	rpImagePopup();
	*/
		var now = new Date();
		
		
		var y = now.getFullYear();
		var m = date_set(now.getMonth()+1);
		var d = date_set(now.getDate());
		
		var ho = date_set(now.getHours());
		var mi = date_set(now.getMinutes());
		var ss = date_set(now.getSeconds());
		var total = ho+mi;
		
		tdate = y+"-"+m+"-"+d;
		ttime = ho+":"+mi+":"+ss;

		var yDate = new Date();		
		var yesterDay = yDate.getTime() - (1 * 24 * 60 * 60 * 1000);
		yDate.setTime(yesterDay);
		
		var ydate = yDate.getFullYear()+"-"+date_set(yDate.getMonth()+1)+"-"+date_set(yDate.getDate());

		$("#s_date").val(ydate);
		
		$("#s_sdate").val(tdate);
		$("#s_ydate").val(ydate);
	
	
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
// 트렌드 보기






	function viewFile2(w,h,f){
		$.ajax({
			type : "POST",
			url : "l001006_file.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"f":f,
					"h":h,
					"w":w},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
//					console.log("길이  : "+rsAr.length);
					
					
					
					
					if(rsAr.length == 1){
						var c_inner = "<div class='item active'><iframe src='/sunil/upload/"+rsAr[0].filename+"' style='width:100%; height:820px;'></iframe></div>";
						
						$("#carousel-form").empty().append(c_inner);
					}else{
						var c_indicators = "";
						var c_inner = "";
						var file1 = rsAr[0].filename;
						var file2 = rsAr[1].filename;
						
						for(var i=0; i<rsAr.length; i++){
//							console.log("i : "+i);
							
							if(i==0){
//								c_indicators += "<li class='active' data-target='#myCarousel' data-slide-to='0'></li>";
								c_inner += "<div class='item active'><iframe src='/sunil/upload/"+file1+"' style='width:100%; height:820px;'></iframe></div>";
							}else if(i==1){
//								c_indicators += "<li data-target='#myCarousel' data-slide-to='1'></li>";
								
								c_inner += "<div class='item'><iframe src='/sunil/upload/"+file2+"' style='width:100%; height:820px'></iframe></div>";							
							}
						}										
						
						var carousel_first = "<div id='myCarousel' class='carousel slide' data-ride='carousel'>";
						var carousel_last = "</div>";
						
//						var ol_first = "<ol class='carousel-indicators'>";
//						var ol_last = "</ol>";
						var div_first = "<div class='carousel-inner'>";
						var div_last = "</div>";
						
						
						
						var left_right = "";					   			
						left_right += "<a style='width:60px;' class='left carousel-control' href='#myCarousel' data-slide='prev'>";
						left_right += "<span style='color:white;' class='glyphicon glyphicon-chevron-left'>이전</span>";
						left_right += "<span class='sr-only'>Previous</span>";
						left_right += "</a>";
						left_right += "<a style='width:60px;' class='right carousel-control' href='#myCarousel' data-slide='next'>";
						left_right += "<span style='color:white;' class='glyphicon glyphicon-chevron-right'>다음</span>";
						left_right += "<span class='sr-only'>Next</span>";
						left_right += "</a>";					
						
						
						$("#carousel-form").empty().append(carousel_first+div_first+c_inner+div_last+left_right+carousel_last);
					}
					
//					console.log(carousel_first+ol_first+c_indicators+ol_last+div_first+c_inner+div_last+left_right+carousel_last);
					
					

//					console.log(left_right);
					
//										   			$("#c_indicators").remove().append(c_indicators);
										
					
					
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
	
	function viewFile(w,h,f){
		$.ajax({
			type : "POST",
			url : "l001006_file.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"f":f,
					"h":h,
					"w":w},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
//					console.log("길이  : "+rsAr.length);
//					console.log(rsAr[0].filename);
					
					
					var c_inner = "<iframe src='/sunil/upload/"+rsAr[0].filename+"' zoom='125%' style='width:100%; height:100%;'></iframe>";
						
					$("#carousel-form").empty().append(c_inner);
					
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
	

	var fileDel_f = '';
	var fileDel_w = '';
	var fileDel_h = '';
	function delFile(w,h,f){
		fileDel_w = w;
		fileDel_h = h;
		fileDel_f = f;
		$("#confirmSpan").text("파일을 삭제하시겠습니까?");
		confirmDialog.dialog("open");
		
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


	var log_print = function(){
		
		
		var i_hogi = $("#i_hogi").val();
		var i_date = $("#i_date").val();
		var i_cnt = $("#i_cnt").val();
		var date = new Date(i_date);

		date.setDate(date.getDate() + 1);

		var nextDay = date.toISOString().slice(0, 10);
		
		if(i_hogi == '' || i_date == ''){
			$("#alertSpan").text("설비를 선택해주십시오.");
			alertDialog.dialog("open");
			return;
		}		
		$("#loading").show();
		
		
		
		$.ajax({
			type : "POST",
			url : "m01/s04/export_m01s04_excel.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				"hogi":i_hogi,
				"date":i_date,
				"cnt":i_cnt,
				"edate":nextDay
			},
			success : function(response) {
				if (response.status == "ok") {
					$("#alertSpan").text("작업일보가 생성되었습니다.");
					alertDialog.dialog("open");
					
					getLotList();
					$("#loading").hide();
			        // 성공 로직 처리
			    } else {
			    	alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
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
	
	var getDayCount = function(){
		//년도를 기준으로 데이터베이스 검색해서 없으면 년도에 대해서 3~8호기 insert
		$.post("m01/s04/count_m01s04.jsp",{
			"tdate":$("#s_date").val()
		},100);
		
		setTimeout(function(){
			// 로드할거
		},300);
	}

	var cntArray = new Array();
	var getLotList = function(){
		$.ajax({
			type : "POST",
			url : "m01/s04/select_m01s04.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				"tdate":$("#s_date").val(),
				"hogi":$("#s_hogi").val()},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var rowColor = "";
					var rowId = "";
					
					var mainIdx = 0;
					var listHtml = "";
							
							
					for(var i=0; i<rsAr.length; i++){
						/* var fname_a =  rsAr[i].filename.substring(0,rsAr[i].filename.lastIndexOf('_'));
						var fname_b =  rsAr[i].filename.substring(rsAr[i].filename.lastIndexOf('.'),rsAr[i].filename.length);			 */			
						cntArray[i] = rsAr[i].cnt;
						listHtml += "<tr>";
						listHtml += '<td class="nr" style="display:none;">'+rsAr[i].cnt+'</td>';
						listHtml += '<td class="nr3 text-center cell" style=" width: 200px; height: 50px; font-size: 16pt; font-family:headline;" >'+rsAr[i].tdate.split(" ")[0] +'</td>';
						listHtml += '<td class="nr4 text-center cell" style=" width: 250px; height: 30px; font-size: 16pt; font-family:headline;" >'+rsAr[i].hogi+'</td>';						
						//listHtml += '<td class="nr7 text-center cell" style=" width: 350px; height: 30px; font-size: 16pt; font-family:headline;">'+rsAr[i].filename+'</td>';
						if(rsAr[i].filename != null){
							listHtml += '<td class="nr7 text-center cell" style=" width: 350px; height: 30px; font-size: 16pt; font-family:headline;">'+
							'<button type="button" class="btn btn-default" onclick="downFile(\''+ encodeURIComponent(rsAr[i].filename) +'\'); return false; event.stopPropagation();" style="width:160px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-save"></i>파일다운</button>'

							+'</td>';
						}else{
							listHtml += '<td class="nr7 text-center cell" style=" width: 350px; height: 30px; font-size: 16pt; font-family:headline;"></td>';							
						}
						listHtml += '<td class="nr8 text-center cell" style=" width: 350px; height: 30px; font-size: 16pt; font-family:headline;"><button type="button" id="showTrend" class="btn btn-default"; return false; event.cancelBubble = true; style="width:160px;height:40px; font-size:15pt; font-family:headline; font-weight:700;"><i class="fa fa-search"></i>트렌드 보기</button></td>';
						
						
						listHtml += "</tr>";						
					}					
					
						$("#lot_list tbody").html(listHtml);
						$("#lot_list").trigger("update");
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

	function getImageList(){
		$.ajax({
			url:"l001006_img_list.jsp",
			type:"post",
			dataType:"json",
			cache : false,
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					
					//폼태그 초기화
					$("#img1").attr("src","resources/img/file0.png");
					$("#img2").attr("src","resources/img/file0.png");
					$("#img3").attr("src","resources/img/file0.png");
					$("#img4").attr("src","resources/img/file0.png");
					$("#img5").attr("src","resources/img/file0.png");
					
					
					$("#l_img1_id").val("");
					$("#l_img2_id").val("");
					$("#l_img3_id").val("");
					$("#l_img4_id").val("");
					$("#l_img5_id").val("");
					
					$("#l_img1_name").val("");
					$("#l_img2_name").val("");
					$("#l_img3_name").val("");
					$("#l_img4_name").val("");
					$("#l_img5_name").val("");
					
					$("#l_img1_path").val("");
					$("#l_img2_path").val("");
					$("#l_img3_path").val("");
					$("#l_img4_path").val("");
					$("#l_img5_path").val("");
					
					for(var i=0; i<rsAr.length; i++){
						if(rsAr[i].u_level == "img1"){
							$("#l_img1_id").val(rsAr[i].u_id);
							$("#l_img1_name").val(rsAr[i].u_name);	
/*							
							$("#img1").attr("src","resources/img/file1.png");
							
*/
							$("#img1").attr("src","upload/"+rsAr[i].img_path);
							$("#l_img1_path").val(rsAr[i].img_path);

						}else if(rsAr[i].u_level == "img2"){
							$("#l_img2_id").val(rsAr[i].u_id);
							$("#l_img2_name").val(rsAr[i].u_name);
							
							$("#img2").attr("src","upload/"+rsAr[i].img_path);
							$("#l_img2_path").val(rsAr[i].img_path);
							
						}else if(rsAr[i].u_level == "img3"){
							$("#l_img3_id").val(rsAr[i].u_id);
							$("#l_img3_name").val(rsAr[i].u_name);
							$("#img3").attr("src","upload/"+rsAr[i].img_path);
							$("#l_img3_path").val(rsAr[i].img_path);
							
						}else if(rsAr[i].u_level == "img4"){
							$("#l_img4_id").val(rsAr[i].u_id);
							$("#l_img4_name").val(rsAr[i].u_name);
							$("#img4").attr("src","upload/"+rsAr[i].img_path);
							$("#l_img4_path").val(rsAr[i].img_path);
							
						}else if(rsAr[i].u_level == "img5"){
							$("#l_img5_id").val(rsAr[i].u_id);
							$("#l_img5_name").val(rsAr[i].u_name);
							$("#img5").attr("src","upload/"+rsAr[i].img_path);
							$("#l_img5_path").val(rsAr[i].img_path);
							
						}
					}
					
					
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

	//작성
	function img1FileSave(){
		var fileform = $("#img1_reg")[0];
		var fileData = new FormData(fileform);

		var img1_id = fileform.img1_id.value;
		var img1_pw = fileform.img1_pw.value;
		
		if(img1_id == "" || img1_pw == ""){
			  $("#alertSpan").text("로그인정보를 입력해주십시오!");
			  alertDialog.dialog("open");
			  return false;   
		}
		
		img1Dialog.dialog("close");
		
		
		 if (fileform.img1File.value == "") {
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 
		
		var path = $("#img1Path").val();
		if(path != ''){
			$.ajax({
				type : "POST",
				url : "l001006_img1user.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'img1_id':$("#img1_id").val(),
						"img1_pw":$("#img1_pw").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status =="ok") {						
						var rsAr = rsJson.rows;
						
						if(rsJson.rowCount == 0){
							  $("#alertSpan").text("아이디/비밀번호를 확인해주십시오!");
							  alertDialog.dialog("open");
							  return false;   
						}else{
							$.ajax({
								url:"i001006_img1file.jsp",
								type:"post",
								enctype:"multipart/form-data",
								data:fileData,
								processData:false,
								contentType:false,
								cache:false,
								success:function(data){
									
									img1Dialog.dialog("close");
									getImageList();
									
									fileform.reset();
								}
							});
							
						}
						
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
	}

	//검토1
	function img2FileSave(){
		var fileform = $("#img2_reg")[0];
		var fileData = new FormData(fileform);

		var img2_id = fileform.img2_id.value;
		var img2_pw = fileform.img2_pw.value;
		
		if(img2_id == "" || img2_pw == ""){
			  $("#alertSpan").text("로그인정보를 입력해주십시오!");
			  alertDialog.dialog("open");
			  return false;   
		}
		
		img2Dialog.dialog("close");
		
		
		 if (fileform.img2File.value == "") {
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 
		
		var path = $("#img2Path").val();
		if(path != ''){
			$.ajax({
				type : "POST",
				url : "l001006_img2user.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'img2_id':$("#img2_id").val(),
						"img2_pw":$("#img2_pw").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status =="ok") {						
						var rsAr = rsJson.rows;
						
						if(rsJson.rowCount == 0){
							  $("#alertSpan").text("아이디/비밀번호를 확인해주십시오!");
							  alertDialog.dialog("open");
							  return false;   
						}else{
							$.ajax({
								url:"i001006_img2file.jsp",
								type:"post",
								enctype:"multipart/form-data",
								data:fileData,
								processData:false,
								contentType:false,
								cache:false,
								success:function(data){
									
									img2Dialog.dialog("close");
									getImageList();
									
									fileform.reset();
								}
							});
							
						}
						
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
	}

	//검토2
	function img3FileSave(){
		var fileform = $("#img3_reg")[0];
		var fileData = new FormData(fileform);

		var img3_id = fileform.img3_id.value;
		var img3_pw = fileform.img3_pw.value;
		
		if(img3_id == "" || img3_pw == ""){
			  $("#alertSpan").text("로그인정보를 입력해주십시오!");
			  alertDialog.dialog("open");
			  return false;   
		}
		
		img3Dialog.dialog("close");
		
		
		 if (fileform.img3File.value == "") {
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 
		
		var path = $("#img3Path").val();
		if(path != ''){
			$.ajax({
				type : "POST",
				url : "l001006_img3user.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'img3_id':$("#img3_id").val(),
						"img3_pw":$("#img3_pw").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status =="ok") {						
						var rsAr = rsJson.rows;
						
						if(rsJson.rowCount == 0){
							  $("#alertSpan").text("아이디/비밀번호를 확인해주십시오!");
							  alertDialog.dialog("open");
							  return false;   
						}else{
							$.ajax({
								url:"i001006_img3file.jsp",
								type:"post",
								enctype:"multipart/form-data",
								data:fileData,
								processData:false,
								contentType:false,
								cache:false,
								success:function(data){
									
									img3Dialog.dialog("close");
									getImageList();
									
									fileform.reset();
								}
							});
							
						}
						
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
	}

	//승인
	function img4FileSave(){
		var fileform = $("#img4_reg")[0];
		var fileData = new FormData(fileform);

		var img4_id = fileform.img4_id.value;
		var img4_pw = fileform.img4_pw.value;
		
		if(img4_id == "" || img4_pw == ""){
			  $("#alertSpan").text("로그인정보를 입력해주십시오!");
			  alertDialog.dialog("open");
			  return false;   
		}
		
		img4Dialog.dialog("close");
		
		
		 if (fileform.img4File.value == "") {
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 
		
		var path = $("#img4Path").val();
		if(path != ''){
			$.ajax({
				type : "POST",
				url : "l001006_img4user.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'img4_id':$("#img4_id").val(),
						"img4_pw":$("#img4_pw").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status =="ok") {						
						var rsAr = rsJson.rows;
						
						if(rsJson.rowCount == 0){
							  $("#alertSpan").text("아이디/비밀번호를 확인해주십시오!");
							  alertDialog.dialog("open");
							  return false;   
						}else{
							$.ajax({
								url:"i001006_img4file.jsp",
								type:"post",
								enctype:"multipart/form-data",
								data:fileData,
								processData:false,
								contentType:false,
								cache:false,
								success:function(data){
									
									img4Dialog.dialog("close");
									getImageList();
									
									fileform.reset();
								}
							});
							
						}
						
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
	}

	//본부장
	function img5FileSave(){
		var fileform = $("#img5_reg")[0];
		var fileData = new FormData(fileform);

		var img5_id = fileform.img5_id.value;
		var img5_pw = fileform.img5_pw.value;
		
		if(img5_id == "" || img5_pw == ""){
			  $("#alertSpan").text("로그인정보를 입력해주십시오!");
			  alertDialog.dialog("open");
			  return false;   
		}
		
		img5Dialog.dialog("close");
		
		
		 if (fileform.img5File.value == "") {
			  $("#alertSpan").text("파일을 업로드해주세요.");
			  alertDialog.dialog("open");
//				alert("업로드해");
			  return false;   
		 }
		 
		
		var path = $("#img5Path").val();
		if(path != ''){
			$.ajax({
				type : "POST",
				url : "l001006_img5user.jsp",
				cache : false,
				dataType : "json",
				data : {'time':new Date().getTime(),
						'img5_id':$("#img5_id").val(),
						"img5_pw":$("#img5_pw").val()},
				success : function(rsJson) {
					if (rsJson && rsJson.status =="ok") {						
						var rsAr = rsJson.rows;
						
						if(rsJson.rowCount == 0){
							  $("#alertSpan").text("아이디/비밀번호를 확인해주십시오!");
							  alertDialog.dialog("open");
							  return false;   
						}else{
							$.ajax({
								url:"i001006_img5file.jsp",
								type:"post",
								enctype:"multipart/form-data",
								data:fileData,
								processData:false,
								contentType:false,
								cache:false,
								success:function(data){
									
									img5Dialog.dialog("close");
									getImageList();
									
									fileform.reset();
								}
							});
							
						}
						
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
	}
	
	//파일 삭제
	function imgDeleteView(v_level){
		//삭제 클릭시 
		// 1은 img1		
		
		var v_id = $("#l_img"+v_level+"_id").val();
		var v_img_path = $("#l_img"+v_level+"_path").val(); 
			
		if(v_img_path == ""){
			$("#alertSpan").text("저장된 파일이 없습니다.");
			alertDialog.dialog("open");
			return;
		}
		
		$("#imgDeleteValue").val(v_level+";"+v_id);
		
		//다이얼로그만 보는 함수
		$("#imgDeleteSpan").text("파일을 삭제하시겠습니까?");
		imgDeleteDialog.dialog("open");	
	}
	
	
	var lotArray = new Array();
	//2020-11-21 작업일보 일괄출력으로 추가
	function getLotAllList(){
		//$("#s_sdate").val()
		$.ajax({
			type : "POST",
			url : "l001006.jsp",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
					"sdate":$("#s_sdate").val(),
					"hogi":""
					},
			success : function(rsJson) {
				if (rsJson && rsJson.status == "ok") {
					var rsAr = rsJson.rows;
					var rowColor = "";
					var rowId = "";
					$("#loading").show();
					
					//seq변수로 정렬
					rsAr.sort(function(a,b){
						return a.seq - b.seq;
					})					
					
					var mainIdx = 0;
					var listHtml = "";
						for(var i=0; i<rsAr.length; i++){
							if(rsAr[i].r_gb == 0){
								//작업량이 있을때
								
								lotArray.push(rsAr[i].hogi);
							}
						}
						
						for(var j=0; j<lotArray.length; j++){
							setTimeout(function(){
								
								$.ajax({
									type : "POST",
									url : "i001006.jsp",
									cache : false,
									dataType : "json",
									data : {'time':new Date().getTime(),
										"hogi":lotArray.pop(),
										"date":$("#s_ydate").val()},
									success : function(rsJson) {
										if (rsJson && rsJson.status == "ok") {
//											var rsAr = rsJson.rows;		
//											console.log(lotArray[j]+" 완료");
	
//											console.log("i : "+i);
											if(i == 6){
												lotArray = new Array();
												getLotList();
												$("#loading").hide();
											}

										} else if (rsJson && rsJson.status == "fail") {
											alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
										} else {
											alert("에러발생!");
										}
										
//										timer = setTimeout(function(){ o.run(); }, o.pollInterval);
										
									},	// success 끝
									error: function(req, status) {
										if (req.status == 0 || status == "timeout") {
											alert("네트워크 연결 확인 후 다시 시도해주세요.");
										} else {
											alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
										}
									},
								});	
								
							},1000*10);
							
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
	}	
	
	

	
	
	function rpImagePopup() {
	    var img = document.createElement("img");
//	    console.log(img);
	    
	    // $(img).attr("src", "imgs/noimage_01.gif");
	    $(img).css("width", "600");
	    $(img).css("height", "500");
	    
	    var div = document.createElement("div");
	    $(div).css("position", "absolute");
	    $(div).css("display", "none");
	    $(div).css("z-index", "24999");
	    $(div).append(img);
	    $(div).hide();
	    $("body").append(div);

	    $(document).on("mouseover", ".rp-img-popup", function(){
	            $(img).attr("src", $(this).attr("src"));
	            $(div).show();
	            var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
	            var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
	            $(div).css("left", iWidth);
	            $(div).css("top", 100);
	        })
	        .on("mouseout", ".rp-img-popup", function(){
	            $(div).hide();
	        });
	}
	
	function downFile(encodedFilename) {
	    // URL에서 사용할 수 있도록 인코딩된 파일명을 디코딩합니다.
	    var filename = decodeURIComponent(encodedFilename);

	    // 파일 다운로드 URL을 생성합니다.
	    var downloadUrl = '/JINHAP_OFFICE/upload/' + filename;

	    // 생성된 URL로 이동하여 파일 다운로드를 시작합니다.
	    window.location.href = downloadUrl;
	}

	
/*이벤트*/	

$('#lot_contents').on('click', '#showTrend', function() {
    console.log("abc");
    var trend_start_date = $("#s_date").val();
    var trend_date_casting = new Date(trend_start_date);
    trend_date_casting.setDate(trend_date_casting.getDate() + 1);
    var trend_next_day = trend_date_casting.toISOString().slice(0, 10);

    var $row = $(this).closest("tr");
	$nr4 = $row.find(".nr4").text();	//호기
	
    var trend_hogi = $nr4;
    
    
    var chartPageUrl = "/JINHAP_OFFICE/m01s04_trend.jsp" + 
                       '?startDate=' + encodeURIComponent(trend_start_date) + 
                       '&endDate=' + encodeURIComponent(trend_next_day) + 
                       '&hogi=' + encodeURIComponent(trend_hogi);

    window.open(chartPageUrl, '_blank');
});



$("#s_date").change(function(){
	getDayCount();
});
		$("#searchbtn").on("click",function(){
			getLotList();
		});


		$("#lot_contents").delegate('tr','click', function() {
	
			
			var $row = $(this).closest("tr");
			$nr = $row.find(".nr").text();		//cnt
			$nr3 = $row.find(".nr3").text();	//교체일
			$nr4 = $row.find(".nr4").text();	//호기
			$nr7 = $row.find(".nr7").text();	//실제 파일명
			$nr8 = $row.find(".nr8").text();	//파일보기
			
			$("#i_date").val($nr3);
			$("#i_hogi").val($nr4);
			$("#i_cnt").val($nr);
			
			
			var index = 0;
			$("#lot_contents > tr").each(function(){
				if($nr == cntArray[index]){
					$(this).css("background-color","#B2CCFF");						
				}else{						
					$(this).css("background-color","#fff");
				}	
				index++;
			});
			
			
		});
		
		//파일 등록
		//작성		
		$("#img1_fileSelect").on("click",function(){
			img1Dialog.dialog("open");			
		});
		
		//검토1		
		$("#img2_fileSelect").on("click",function(){
			img2Dialog.dialog("open");			
		});
		
		//검토2		
		$("#img3_fileSelect").on("click",function(){
			img3Dialog.dialog("open");			
		});
		
		//승인		
		$("#img4_fileSelect").on("click",function(){
			img4Dialog.dialog("open");			
		});
		
		//본부장		
		$("#img5_fileSelect").on("click",function(){
			img5Dialog.dialog("open");			
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
				$.post("d001006_file.jsp",{
					"w":fileDel_w,
					"h":fileDel_h,
					"f":fileDel_f
				},250);
				
				setTimeout(function(){
					$("#alertSpan").text("파일이 삭제되었습니다.");
					alertDialog.dialog("open");
					getLotList();
					fileDel_w = '';
					fileDel_h = '';
					fileDel_f = '';
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
		  width: 1900,
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
	})

	//작성싸인이미지 첨부
	var img1Dialog;
	img1Dialog = $("#img1-form").dialog({
	  autoOpen: false,
	  height: 340,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		img1Dialog.dialog("close");
	              });
	        }
		  }
	});

	//검토1싸인이미지 첨부
	var img2Dialog;
	img2Dialog = $("#img2-form").dialog({
	  autoOpen: false,
	  height: 340,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		img2Dialog.dialog("close");
	              });
	        }
		  }
	});

	//검토2싸인이미지 첨부
	var img3Dialog;
	img3Dialog = $("#img3-form").dialog({
	  autoOpen: false,
	  height: 340,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		img3Dialog.dialog("close");
	              });
	        }
		  }
	});

	//승인싸인이미지 첨부
	var img4Dialog;
	img4Dialog = $("#img4-form").dialog({
	  autoOpen: false,
	  height: 340,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		img4Dialog.dialog("close");
	              });
	        }
		  }
	});

	//본부장싸인이미지 첨부
	var img5Dialog;
	img5Dialog = $("#img5-form").dialog({
	  autoOpen: false,
	  height: 340,
	  width: 380,
	  modal: false,
	  stack:false,
	  buttons: {		
	        "닫 기": function() {
	        	setTimeout( function() 
	              {				
	        		img5Dialog.dialog("close");
	              });
	        }
		  }
	});
	
	var imgDeleteDialog;
	imgDeleteDialog = $("#imgDelete-form").dialog({
		autoOpen:false,
		height:150,
		width:300,
		modal:false,
		stack:false,
		buttons:{
			"삭 제":function(){
				
				var img_valueArray = ($("#imgDeleteValue").val()).split(";");
				
				$.ajax({
					url:"d001006_img.jsp",
					type:"post",
					data:{
						"u_level":img_valueArray[0],
						"u_id":img_valueArray[1]
						},
					success:function(){
						imgDeleteDialog.dialog("close");
						
						$("#alertSpan").text("삭제가 완료되었습니다.");
						alertDialog.dialog("open");
						getImageList();
					}
				});	
				
				
			},
			"취 소":function(){
				imgDeleteDialog.dialog("close");
			}
		}
	});
	
	
/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>