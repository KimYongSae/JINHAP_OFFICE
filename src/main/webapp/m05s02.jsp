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

<script src="resources/js/select2.min.js"></script>
<link rel="stylesheet" href="resources/css/select2.min.css" />

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
    height: 580px;

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
	
	#lot_contents tr td{
		height: 70px; 
		font-size: 18pt;
		font-family:headline;
		font-weight:700;
	}	
	.nr1{
		width: 70px;
	}
	.nr2{
		width: 210px;
	}
	.nr3{
		width: 320px;
	}
	.nr4{
		width: 250px;
	}
	.nr5{
		width: 180px;
	}
	.nr6{
		width: 180px;
	}
	.nr7{
		width: 180px;
	}
	.nr8{
		width: 180px;
	}
	.nr9{
		width: 180px;
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

<body data-offset="60" data-target=".navbar">


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
  <!-- 월간 -->
  <div style="width: 100%; " class="col-lg-12">
        <div class="box">
            <header>
                <div style="padding:11px 14px;" class="icons"><i style="color:white;" class="fa fa-list-alt"></i></div>
                <h5 style="font-family: headline; font-size:14pt;">투입 운전관리 - LOT 정보확인</h5>
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
							id="hogi" name="hogi" 
							style="margin-top:5px; height: 30px; width: 135px; 
								font-size: 14pt; font-family:headline;
								padding-top:1px; padding-bottom:1px;">
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
							color:#8C8C8C; width: 50px; text-align: right;">기간 : </label>
						</div>
						
						<!-- 발생일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" id="s_date" name="s_date" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="s_time" name="s_time" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="00:00:00"
							onkeyup="auto_time_format(event, this);"/>
						</div>						
						~						
						<!-- 해제일 -->
						<div class="form-group">
							<input type="text" class="form-control input-sm datepicker" id="e_date" name="e_date" 
							style="margin-top:5px; height: 30px; width: 140px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="예)2020-01-01"
							onkeyup="auto_date_format(event, this);"/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm timepicker" id="e_time" name="e_time" 
							style="margin-top:5px; height: 30px; width: 120px; 
							font-size: 14pt; font-family:headline;"  
							placeholder="23:59:59"
							onkeyup="auto_time_format(event, this);"/>
						</div>
						<div class="form-group">
							<label class="control-label" 
							style="font-size: 14pt; font-family:headline; color:#8C8C8C; 
								width: 50px; text-align: right;font-weight:700;">LOT : </label>
						</div>											
						<div class="form-group">
							<select class="form-control" name="lot" ID="lot" style="color:#8C8C8C !important; padding-top: 4px; margin-top:5px; width:200px; height:30px; font-size:14px;"></select>
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
															
				</form>
            </header>
            
            <div id="collapse4" class="body">
               <table id="lot_list" cellspacing="0" class="table table-bordered table-hover table-responsive scrolltbody">
					<thead>
					
						<tr>
							<th class="text-center cell" 
								style="width: 70px; height: 60px; 
								font-size: 16pt; font-family:headline; font-weight:700;
								">
								No.
							</th>
							<th class="text-center cell" 
								style="width: 210px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;
								">
								LOT
							</th>
							<th class="text-center cell" 
								style="width: 320px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								품명
							</th>							
							<th class="text-center cell" 
								style="width: 250px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								바코드
							</th>
							
							<th class="text-center cell" 
								style="width: 180px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								세척개시
							</th>							
							<th class="text-center cell" 
								style="width: 180px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								세척 종료
							</th>							
							<th class="text-center cell" 
								style="width: 180px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								겐츄리창고<br>입고
							</th>							
							<th class="text-center cell" 
								style="width: 180px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								겐츄리창고<br>출고
							</th>							
							<th class="text-center cell" 
								style="width: 180px; height: 70px; 
								font-size: 16pt; font-family:headline; font-weight:700;">
								열처리<br>투입시간
							</th>							
						</tr>
					</thead>
										
					<tbody id="lot_contents">
					</tbody>
				</table>				
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
	date_search();
	getSelect();
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

function date_search(){
	
	$.ajax({
		type : "POST",
		url : "util/lmonitor_date_search.jsp",
		cache : false,
		dataType : "json",
		data : {'time':new Date().getTime()},
		success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				
				//$("#s_sdate").val(rsAr[0].b_date);
				$("#s_date").val(rsAr[0].y_date);
				//$("#s_stime").val(rsAr[0].b_time.substring(0,2)+":00:00");
				//$("#s_stime").val("00:00:00");
				$("#s_time").val(rsAr[0].n_time);
//				console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
				
				$("#e_date").val(rsAr[0].n_date);
				//$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
				$("#e_time").val(rsAr[0].n_time);
				
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

function getLotData(){
    
	$.ajax({
		url:"m05/s02/select_m05s02.jsp",
		type:"post",
       	dataType:"json",
       	data:{            
          	"sdate":$("#s_date").val(),
          	"edate":$("#e_date").val(),
          	"stime":$("#s_time").val(),
          	"etime":$("#e_time").val(),
			"hogi":$("#hogi").val(),
			"lot":$("#lot").val(),
			"pname":$("#pname").val()
       	},
       	success : function(rsJson) {
			if (rsJson && rsJson.status == "ok") {
				var rsAr = rsJson.rows;
				
				var listHtml = "";
					for(var i=0; i<rsAr.length; i++){
						listHtml += "<tr>";
						listHtml += '<td class="nr1 text-center cell">'+(i+1)+'</td>';
						listHtml += '<td class="nr2 text-center cell" >'+rsAr[i].lot+'</td>';
						//listHtml += '<td class="nr3 text-center cell" >'+rsAr[i].pnum+'</td>';
						listHtml += '<td class="nr3 text-center cell" >'+rsAr[i].pname+'</td>';
						listHtml += '<td class="nr4 text-center cell" >'+rsAr[i].barcode+'</td>';
						listHtml += '<td class="nr5 text-center cell" ></td>';
						listHtml += '<td class="nr6 text-center cell" ></td>';
						listHtml += '<td class="nr7 text-center cell" ></td>';
						listHtml += '<td class="nr8 text-center cell" ></td>';
						listHtml += '<td class="nr9 text-center cell" >'+rsAr[i].regtime+'</td>';
						listHtml += "</tr>";							
					}
					
					$("#lot_contents").html(listHtml);
					//$("#alarm_list").trigger("update");
					
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
	$
			.ajax({
				type : "POST",
				url : "m05/s02/list_m05s02.jsp",
				cache : false,
				dataType : "json",
				data : {
					'time' : new Date().getTime(),
					'hogi' : $('#hogi').val(),
					'lot' : $('#lot').val(),
					'pname' : $('#pname').val()
				},
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						var rsLot = rsJson.lot;
						var rsPname = rsJson.pname;


						// 로트를 업데이트하는 함수
						function updateLot(rsLot) {
							var lotHtml = "";
							if ($.isArray(rsLot)) {
								lotHtml += "<option value='0'>All</option>";
								for (var i = 0; i < rsLot.length; i++) {
									lotHtml += "<option value='" + rsLot[i].lot + "'>"
											+ rsLot[i].lot
											+ "</option>";
								}
							} else {
								lotHtml += "<option value='0'>로트가 없습니다.</option>";
							}
							$("#lot").empty().append(lotHtml);
							$("#lot").select2();
						}

						// 품명을 업데이트하는 함수
						function updatePname(rsPname) {
							var pnameHtml = "";
							if ($.isArray(rsPname)) {
								pnameHtml += "<option value='0'>All</option>";
								for (var i = 0; i < rsPname.length; i++) {
									pnameHtml += "<option value='" + rsPname[i].pname + "'>"
											+ rsPname[i].pname
											+ "</option>";
								}
							} else {
								pnameHtml += "<option value='0'>품명이 없습니다.</option>";
							}
							$("#pname").empty().append(pnameHtml);
							$("#pname").select2();
						}


						if (boxId == "lot") {
							updatePname(rsPname);
						} else if(boxId == "pname") {
							;;
						} else{
							console.log("dd");
							updatePname(rsPname);
							updateLot(rsLot);
						}

					} else if (rsJson && rsJson.status == "fail") {
						alert("데이터 불러오는 중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
					} else {
						alert("에러 발생!");
					}
				},
				error : function(req, status) {
					if (req.status == 0 || status == "timeout") {
						alert("네트워크 연결 확인 후 다시 시도해주세요.");
					} else {
						alert("처리 중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
					}
				},
			});
};


	
	
/*이벤트*/	
	
$("#searchbtn").on("click",function(){
	getLotData();
});


var boxId = "";
$('#hogi').change(function() {
	boxId = "hogi";
	getSelect();
});
$('#lot').change(function() {
	boxId = "lot";
	getSelect();
});
$('#pname').change(function() {
	boxId = "pname";
	getSelect();
});

/*다이얼로그*/


/*차트 불러오는 함수*/
	
			
</script>

</body>
</html>