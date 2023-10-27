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
<script src="resources/js/jquery.tablesorter.js"></script>

<!-- 추가한 부분 start-->

<!-- <script type="text/javascript" src="resources/js/jQuery.js"></script> -->
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

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css"/>

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

	#temp th{
		background-color: #24FCFF; text-align : center; 
		font-size: 16pt; font-family:headline; font-weight:700;	
	}
	#temp td{
		text-align : right; height: 50px;
		font-size: 12pt; 
	}
	.scrolltbody {
    display: block;
    /* width: 100%; */
    border-collapse: collapse;
    border: 0px solid #000;
	}
	
	.scrolltbody td { border: 1px solid #000; border-top: 0;}
	
	
	.scrolltbody tbody {
	    display: block;
	    /* width: 100%; */
	    height: 600px;
	
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
	<div style="display:none;" id="alert-form" title="확인창" >
			<span id="alertSpan"></span>
	</div>
	
	<div style="display:none;" id="file-form" title="파일 첨부" >
			<form class="form-horizontal" id="upload" name="upload" method="post" enctype="multipart/form-data">
				<table class = "no-style">
					<tr><td colspan="2"> <b>**파일첨부**</b></td></tr>
					<tr><td colspan="2">*엑셀파일만 업로드 가능합니다.</td></tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<input type="hidden" id="filePath" class="file_input_textbox" readonly="readonly">
						
						<div class="file_input_div">
							<input type="file" id="file" name="file1" class="file_input_hidden form-control" onchange="javascript:document.getElementById('filePath').value = this.value" />
						</div>
					</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn small btn-primary" onclick="condition_excel_import();" value="전송">
					</td>
					</tr>
				</table>
			</form>			
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
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-size:14pt; font-family:headline;"> 조건관리 - 조건관리</h5>
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
							id="hogi" name="hogi" 
							style="margin-top:5px; height: 30px; width: 140px; font-size: 14pt;
									padding-top : 1px; padding-bottom : 1px; font-family:headline;
									font-weight:700;">	
								<!-- <option value="0">전체</option>	 -->
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
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
								width: 50px; text-align: right;font-weight:700;">품명 : </label>
						</div>											
						<div class="form-group">
							<select class="form-control" name="pname" ID="pname" style="color:#8C8C8C !important; padding-top: 4px; margin-top:5px; width:200px; height:30px; font-size:14px;"></select>
						</div>
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
								width: 50px; text-align: right;font-weight:700;">강종 : </label>
						</div>											
						<div class="form-group">
							<select class="form-control" name="gang" ID="gang" style="color:#8C8C8C !important; padding-top: 4px; margin-top:5px; width:200px; height:30px; font-size:14px;"></select>
						</div>
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
								width: 50px; text-align: right;font-weight:700;">T급 : </label>
						</div>											
						<div class="form-group">
							<select class="form-control" name="t_gb" ID="t_gb" style="color:#8C8C8C !important; padding-top: 4px; margin-top:5px; width:200px; height:30px; font-size:14px;"></select>
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
								style="margin-top:6px; height: 31px; width: 160px; 
								font-size:14pt; font-weight:700; font-family:headline;
								padding-top:1px; padding-bottom:1px;" 
								id="excelBtn">
								<i class="glyphicon glyphicon-save"></i> 엑셀다운로드</button>
							</div>
						</div>	
						<div class="form-group">
							<button class="btn btn-default pull-right btn-sm" type="button" 
								style="margin-top:6px; height: 31px; width: 160px; 
								font-size:14pt; font-weight:700; font-family:headline;
								padding-top:1px; padding-bottom:1px;" id="in_excel" onclick="excel_import_open();"><span class="glyphicon glyphicon-open"></span>엑셀업로드</button>
						</div>
						
						
				</form>
            </header>            
            
	            <div id="collapse4" class="body" style="padding-top:0; padding-bottom:0;
	            background-color:white;">
			       	<table id="temp"
               		class="table table-bordered table-hover table-responsive scrolltbody">
						<thead>
							<tr>
								<th rowspan = "2" width="70">설비명</th>
								<th rowspan = "2" width="200">품번</th>
								<th rowspan = "2" width="300">품명</th>
								<th rowspan = "2" width="100">강종</th>
								<th rowspan = "2" width="70">T급</th>
								<th rowspan = "2" width="130">진합로트</th>
								<th colspan = "3" width="240">진합 기준정보</th>
								<th colspan = "3" width="240">EZ 기준정보</th>
								<th rowspan = "2" width="80" style="font-size:14pt">장입량1</th>
								<th rowspan = "2" width="80" style="font-size:14pt">장입량2</th>
								<th rowspan = "2" width="80" style="font-size:14pt">장입량3</th>
								<th rowspan = "2" width="90">기준<br>장입량</th>
								<th rowspan = "2" width="80" style="font-size:13pt">요구경도</th>
							</tr>
							<tr>
								<th width="80"style="font-size:13pt">소입온도</th>
								<th width="80"style="font-size:13pt">소려온도</th>
								<th width="80">CP</th>
								<th width="80"style="font-size:13pt">소입온도</th>
								<th width="80"style="font-size:13pt">소려온도</th>
								<th width="80">CP</th>
							</tr>
							
						</thead>
						<tbody id="conditionList" style="display : block; overflow-y: auto;">
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

/*인터벌*/
	
	
/*페이지 로드*/	
  
  $(function(){
	  fn_check();
	  getSelect();
	  $("#temp").tablesorter();
	  getConditionList();
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
			
			function getConditionList(){
				$.ajax({
					type : "POST",
					url : "m02/s01/select_m02s01.jsp",
					cache : false,
					dataType : "json",
					data : {'time':new Date().getTime(),
							'hogi':$("#hogi").val(),
							"pname":$("#pname").val(),
							"gang":$("#gang").val(),
							"t_gb":$("#t_gb").val()
							},
					success : function(rsJson) {
						if (rsJson && rsJson.status == "ok") {
							var rsAr = rsJson.rows;
							
							var listHtml = "";
								for(var i=0; i<rsAr.length; i++){
									listHtml += "<tr>";
									listHtml += '<td width = "70px" style = "text-align : center; font-size: 15pt;">'+rsAr[i].hogi+'</td>';
									listHtml += '<td width = "200px">'+rsAr[i].pnum+'</td>';
									listHtml += '<td width = "300px">'+rsAr[i].pname+'</td>';
									listHtml += '<td width = "100px">'+rsAr[i].gang+'</td>';
									listHtml += '<td width = "70px">'+rsAr[i].t_gb+'</td>';
									listHtml += '<td width = "130px">'+rsAr[i].lot+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].q_temp_jin+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].t_temp_jin+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].cp_jin+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].q_temp_ez+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].t_temp_ez+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].cp_ez+'</td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td width = "80px"></td>';
									listHtml += '<td width = "90px">'+rsAr[i].weight+'</td>';
									listHtml += '<td width = "80px">'+rsAr[i].hardness+'</td>';
									listHtml += "</tr>";							
								}
								
								$("#conditionList").html(listHtml);
								$("#temp").trigger("update");
								//$("#temp").tablesorter();
								
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
			var getSelect = function() {
				console.log(boxId);
				  $.ajax({
				    type: "POST",
				    url: "m02/s01/list_m02s01.jsp",
				    cache: false,
				    dataType: "json",
				    data: {
				      'time': new Date().getTime(),
				      'hogi': $('#hogi').val(),
				      'pname': $('#pname').val(),
				      'gang': $('#gang').val(),
				      't_gb': $('#t_gb').val()
				    },
				    success: function(rsJson) {
				      if (rsJson && rsJson.status == "ok") {
				        var rsPname = rsJson.pname;
				        var rsGang = rsJson.gang;
				        var rsT_gb = rsJson.t_gb;

				        
				        /* // 품목명
				        var pnameHtml = "";
				        if ($.isArray(rsPname)) {
				          pnameHtml += "<option value='0'>All</option>";
				          for (var i = 0; i < rsPname.length; i++) {
				            pnameHtml += "<option value='" + rsPname[i].pname + "'>" + rsPname[i].pname + "</option>";
				          }
				        } else {
				          pnameHtml += "<option value='0'>품명이 없습니다.</option>";
				        }
				        $("#pname").empty().append(pnameHtml);
				        $("#pname").select2(); // 이 위치에서 select2()를 호출합니다.

				        // 강종
				        var gangHtml = "";
				        if ($.isArray(rsGang)) {
				          gangHtml += "<option value='0'>All</option>";
				          for (var i = 0; i < rsGang.length; i++) {
				            gangHtml += "<option value='" + rsGang[i].gang + "'>" + rsGang[i].gang + "</option>";
				          }
				        } else {
				          gangHtml += "<option value='0'>품명이 없습니다.</option>";
				        }
				        $("#gang").empty().append(gangHtml);
				        $("#gang").select2(); // 이 위치에서 select2()를 호출합니다.

				        // t급
				        var t_gbHtml = "";
				        if ($.isArray(rsT_gb)) {
				          t_gbHtml += "<option value='0'>All</option>";
				          for (var i = 0; i < rsT_gb.length; i++) {
				            t_gbHtml += "<option value='" + rsT_gb[i].t_gb + "'>" + rsT_gb[i].t_gb + "</option>";
				          }
				        } else {
				          t_gbHtml += "<option value='0'>품명이 없습니다.</option>";
				        }
				        $("#t_gb").empty().append(t_gbHtml);
				        $("#t_gb").select2(); // 이 위치에서 select2()를 호출합니다. */

				        
				     // 품목명을 업데이트하는 함수
				        function updatePname(rsPname) {
				          var pnameHtml = "";
				          if ($.isArray(rsPname)) {
				            pnameHtml += "<option value='0'>All</option>";
				            for (var i = 0; i < rsPname.length; i++) {
				              pnameHtml += "<option value='" + rsPname[i].pname + "'>" + rsPname[i].pname + "</option>";
				            }
				          } else {
				            pnameHtml += "<option value='0'>품명이 없습니다.</option>";
				          }
				          $("#pname").empty().append(pnameHtml);
				          $("#pname").select2();
				        }

				        // 강종을 업데이트하는 함수
				        function updateGang(rsGang) {
				          var gangHtml = "";
				          if ($.isArray(rsGang)) {
				            gangHtml += "<option value='0'>All</option>";
				            for (var i = 0; i < rsGang.length; i++) {
				              gangHtml += "<option value='" + rsGang[i].gang + "'>" + rsGang[i].gang + "</option>";
				            }
				          } else {
				            gangHtml += "<option value='0'>품명이 없습니다.</option>";
				          }
				          $("#gang").empty().append(gangHtml);
				          $("#gang").select2();
				        }

				        // t급을 업데이트하는 함수
				        function updateT_gb(rsT_gb) {
				          var t_gbHtml = "";
				          if ($.isArray(rsT_gb)) {
				            t_gbHtml += "<option value='0'>All</option>";
				            for (var i = 0; i < rsT_gb.length; i++) {
				              t_gbHtml += "<option value='" + rsT_gb[i].t_gb + "'>" + rsT_gb[i].t_gb + "</option>";
				            }
				          } else {
				            t_gbHtml += "<option value='0'>품명이 없습니다.</option>";
				          }
				          $("#t_gb").empty().append(t_gbHtml);
				          $("#t_gb").select2();
				        }
				        
				        if(boxId == "pname"){
				        	updateGang(rsGang);
				        	updateT_gb(rsT_gb);
				        } else if(boxId == "gang"){
				        	updateT_gb(rsT_gb);
				        } else if(boxId == "t_gb"){
				        	;;
				        } else {
				        	updateGang(rsGang);
				        	updatePname(rsPname);
				        	updateT_gb(rsT_gb);
				        }
				        
				        
				        
				        
				      } else if (rsJson && rsJson.status == "fail") {
				        alert("데이터 불러오는 중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				      } else {
				        alert("에러 발생!");
				      }
				    },
				    error: function(req, status) {
				      if (req.status == 0 || status == "timeout") {
				        alert("네트워크 연결 확인 후 다시 시도해주세요.");
				      } else {
				        alert("처리 중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
				      }
				    },
				  });
				};


				function condition_excel_import() {
					
					var fileform = $("#upload")[0];
					var fileData = new FormData(fileform);
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
					 
					 
					  //document.upload.submit();
//					  opener.getCodeDetail();
//				 	  opener.getMachineCode();
					 	$.ajax({
							url:"m02/s01/import_m02s01_excel.jsp",
							type:"post",
							enctype:"multipart/form-data",
							data:fileData,
							processData:false,
							contentType:false,
							cache:false,
							success:function(data){
								
								fileDialog.dialog("close");
								getSelect();
								getConditionList();
								fileform.reset();
							}
						});

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
		plusClick = false;
	    obj.value = comma(uncomma(obj.value));
	}
	
	
/*이벤트*/

	var boxId = "";
	$('#hogi').change(function() {
		boxId = "hogi";
		getSelect();
	});
	$('#pname').change(function() {
		boxId = "pname";
		getSelect();
	});
	$('#gang').change(function() {
		boxId = "gang";
		getSelect();
	});
	$('#t_gb').change(function() {
		boxId = "t_gb";
		getSelect();
	});
	
	
	$("#searchbtn").on("click",function(){
		getConditionList();
	});
	
	$("#excelBtn").on("click",function(){
		
		var form = document.forms["searchform"];
		
		form.action = "m02/s01/export_m02s01_excel.jsp";
		
		form.submit();
		
	});
	
	function excel_import_open(){
		/* var popupx = (window.screen.width/2)-(346/2);
		var popupy = (window.screen.height/2)-(300/2);
		var openWin = window.open('m02s01_importView.jsp','', 'status=no, width=450, height=260,menubar=1,left='+popupx+',top='+ popupy+', screenX='+popupx+', screenY='+popupy); */
		fileDialog.dialog("open");
	}
	
 	
/*다이얼로그*/
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

/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>