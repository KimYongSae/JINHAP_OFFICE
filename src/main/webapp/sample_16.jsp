<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합 등대사업</title>
<link rel="shortcut icon" href="resources/images/jinhap4.gif"
	type="image/x-icon" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/style2.css" />
<script src="assets/js/jquery-2.1.4.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-latest.js"></script>

<!-- 추가한 부분 start-->

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.color-2.1.2.min.js"></script>
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


<link rel="stylesheet" href="resources/css/table_font_size.css" />

<!-- 풀캘린더 사용 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/fullcalendar.css" />

<!-- Load D3 -->
<script src="resources/js/d3.min.js"></script>

<!-- Load billboard.js with base style -->
<link rel="stylesheet" href="resources/css/billboard3.css">
<link rel="stylesheet" href="resources/css/insight.css">
<script src="resources/js/billboard3.js"></script>


<!-- datepicker에 있는 timepicker 추가기능 -->
<link rel="stylesheet"
	href="resources/css/jquery-ui-timepicker-addon.css">
<script src="resources/js/jquery-ui-timepicker-addon.js"></script>


<!-- 컬러셀렉터 -->
<script type="text/javascript"
	src="resources/js/bootstrap-colorselector.min.js"></script>
<link rel="stylesheet"
	href="resources/css/bootstrap-colorselector.min.css">
	
<!-- 부트스트랩 토글 -->
<script type="text/javascript"
	src="resources/js/bootstrap-toggle.min.js"></script>
<link rel="stylesheet"
	href="resources/css/bootstrap-toggle.min.css">


<!-- 추가한 부분 end-->

<style>
    .flex-center {
        display: flex;
        align-items: center;
        height: 100%;  /* 부모 요소의 높이에 따라 조정 필요 */
        justify-content: center;
        padding:0px;
    }
    
    .flex-header{
	    height:40px; 
	    background-color: #7f7f7f; 
	    color: white;
	    font-weight:bold;
	    position: sticky;
	    top: 0;
	    z-index: 1000;
    }
    .form-group{
    	display: inline-block;
    	margin:0;
    }
    #saveBtn {
	    position: fixed;
	    bottom: 10px;
	    left: 0;
	    right: 0;
	    width:100px;
	    height:50px;
	    margin: 0 auto;
	    z-index: 1000;
	    font-size: 20px;
	}
	input[type="number"] {
	    text-align: center;
	}
	
	
</style>

</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #5E5F67; padding-top: 10px; padding-bottom: 10px;">		
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<img style="padding-top:2px; padding-left:12px;height: 30px;" src="resources/images/jinhap4.gif"/>
					<h2 style="display: inline-block;">E/PROOF</h2>
				</div>
				
			</div>
		</div>
	</nav>
	
	<div style="width: 100%; " class="col-lg-12">
		<div class="box">
			<header>
		        <div style="padding:11px 10px;" class="icons"><i style="color:white;" class="fa fa-list"></i></div>
	        	<div class="form-group">
					<label class="control-label" 
					style="font-size: 14pt;  font-family:headline;font-weight:700; 
					color:#fff; width: 50px; text-align: right;">
					호기 : 
					</label>
				</div>
				<div class="form-group">
					<select class="form-control input-sm" 
					id="s_hogi" name="s_hogi"
					style="margin-top:5px; height: 30px; width: 140px; 
						font-size: 14pt; font-family:headline;font-weight:700;
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
					<label class="control-label pdate" id="pdate" 
					style="font-size: 14pt;  font-family:headline;font-weight:700; 
					color:#fff;  text-align: right;">
					
					</label>
				</div>
				
		    </header>
    
			<form>
				<div class="container body">
				    <div class="row flex-header">
				        <div class="col-xs-3 flex-center">
				            <div>설비</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>점검항목</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <div>F/PROOF</div>
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 1존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q1_sh" name="q1_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q1_sc" name="q1_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 2존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q2_sh" name="q2_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q2_sc" name="q2_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 3존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q3_sh" name="q3_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q3_sc" name="q3_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 4존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q4_sh" name="q4_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q4_sc" name="q4_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 5존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q5_sh" name="q5_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="q5_sc" name="q5_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">유조</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="oil_sh" name="oil_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="oil_sc" name="oil_sc">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>하한</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="oil_min"class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">중간세정기</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="a_sh" name="a_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="a_sc" name="a_sc">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>하한</div>
						        </div>
						        <div class="col-xs-7">
						            <input type="number" id="a_min"class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 1존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t1_sh" name="t1_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t1_sc" name="t1_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 2존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t2_sh" name="t2_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t2_sc" name="t2_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 3존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t3_sh" name="t3_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t3_sc" name="t3_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 4존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t4_sh" name="t4_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t4_sc" name="t4_sc">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 5존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과승</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t5_sh" name="t5_sh">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>과냉</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <input type="checkbox" checked data-toggle="toggle" data-on="O" data-off="X"
						             data-onstyle="success" data-offstyle="danger" id="t5_sc" name="t5_sc">
						        </div>
					        </div>
						</div>
				    </div>
				</div>
				<div class="container body">
				    <div class="row flex-header">
				        <div class="col-xs-3 flex-center">
				            <div>설비</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>온도</div>
						        </div>
						        <div class="col-xs-7 flex-center">
						            <div>SAT</div>
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 1존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q1_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q1_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q1_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 2존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q2_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q2_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q2_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 3존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q3_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q3_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q3_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 4존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q4_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q4_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q4_measurements" class="form-control">
						        </div>
					        </div>
						</div>
					</div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 5존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q5_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q5_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="q5_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:82px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">CP</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="cp_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="cp_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:42px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">CO2</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="co2_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:42px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold; text-align: center;">DEW<br>POINT</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="dew_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소입 유조</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="oil_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="oil_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="oil_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 1존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t1_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t1_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t1_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 2존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t2_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t2_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t2_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 3존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t3_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t3_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t3_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				    <div class="row" style="height:122px; border: 1px solid #d4d4d4;">
				        <div class="col-xs-3 flex-center">
				            <div style="font-weight:bold;">소려 4존</div>
				        </div>
				        <div class="col-xs-9">
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>설정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t4_set" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>지시</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t4_instructions" class="form-control">
						        </div>
					        </div>
					        <div class="row" style="height:40px">
						        <div class="col-xs-5 flex-center">
						            <div>측정</div>
						        </div>
						        <div class="col-xs-7 ">
						            <input type="number" id="t4_measurements" class="form-control">
						        </div>
					        </div>
						</div>
				    </div>
				</div>
			</form>
			
	   	</div>
	    <div style="padding:30px">
	    	<button class="btn btn-primary" type="button" id="saveBtn">저장</button>
	    </div>
	</div>

<script>
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
					
					$("#pdate").val(rsAr[0].y_date);
					$("#pdate").text(rsAr[0].y_date);
					//$("#s_stime").val(rsAr[0].n_time);
	//				console.log("1:"+$("#s_sdate").val()+", "+$("#s_stime").val());
					
					$("#s_edate").val(rsAr[0].n_date);
					//$("#s_etime").val(rsAr[0].a_time.substring(0,2)+":00:00");	
					//$("#s_etime").val(rsAr[0].n_time);
					$("#s_etime").val("08:00:00");
					
				} else if (rsJson && rsJson.status == "fail") {
					alert("데이터 불러오는중 예외가 발생하였습니다.\n다시 시도하시기 바랍니다.");
				} else {
					alert("에러발생!");
				}
				
	//			timer = setTimeout(function(){ o.run(); }, o.pollInterval);
				getChartDataLoad();
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
	
	$(function(){
		date_search();
		
	})
	
	
	
</script>



</body>
</html>