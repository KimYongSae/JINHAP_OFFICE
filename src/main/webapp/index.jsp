<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합</title>
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
     
<!-- 추가한 부분 end-->
<style>


#body{
    margin:-45px 0 -44px;
    width:100%;
    min-height:100%; 
	background: url(resources/images/진합_회사사진2.jpg) no-repeat center top !important;
	-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

	.menuLists li{
		padding-left:3px;
		padding-top:8px;
		padding-bottom:8px;
		font-family:margun;
		letter-spacing:1.5px !important; 
	}

	.brand-text{
/*		color:white;*/
	}

</style>

<script>
//로그인 처리
</script>


</head>
<body data-offset="60" data-target=".navbar">
		<div id="alert-form" style="display:none;" title="확인창">
			<span id="alertSpan"></span>
		</div>
<div id="wrap">
    <div id="header">
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #5E5F67; padding-top: 10px; padding-bottom: 10px; position:fixed;">		
			<div class="container">
				<div class="row">
					<div class="navbar-header">
						<img style="padding-top:2px; padding-left:12px;height: 42px;" src="resources/images/jinhap4.gif"/><!-- 선일 로고 -->
					</div>
					
					
					<h2 style="display: inline-block;">(주)진합</h2>
					<ul style="display: inline-block;" class="pjtname">
		            	<li class="pjtnamebg">진합 등대사업</li>
		            </ul>
				</div>
			</div>
		</nav>
	</div>
	
		<div id="body">
			<div id="floater">	
			</div>
				<div id="contents">
				    <h1 style="text-align:center" class="brand-text">열처리 등대사업</h1>
					<div class="login" style="border:4px solid #436324;">
				
						<div class="col-xs-12">	
						    <form name="form" class="omb_loginForm" role="form" 
						    action="login_ok.jsp" method="post" onsubmit="return false">
						        <h3 class="user_login2" style="color:black;">로그인</h3>
						        <hr class="user_under">
						        
						        <div class="form-title">아이디</div>
						        
						        
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<input type="text" class="form-control" name="pid" id="pid" placeholder="아이디를 입력하세요.">
								</div>
								<span style="margin-bottom:30px;" class="help-block"></span>
								
								
								<div class="form-title">패스워드</div>										
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input  type="password" class="form-control" name="pw" id="pw" placeholder="패스워드를 입력하세요.">
								</div>
								<span style="margin-bottom:35px;" class="help-block"></span>
			
			  					<span style="margin-bottom:15px;" class="help-block"></span>
								<button type="button" class="btn btn-lg btn-success btn-block" 
									style="width:100px; height:40px; font-size:14px; font-weight:700;" 
									onclick="doLogin()">로그인</button>
							</form>
						</div>
			
			        </div>
        	    
				</div>
		</div>
			<!-- 로그인 끝 -->
	
		<div id="footer">
		
		<img src="resources/images/jinhap4.gif" style="height:30px;"/>&nbsp;(주)진합&nbsp;&nbsp;
		Copyright 2023. All Rights Reserved.
			
		</div>
	
</div>

	<script>
	
	
		//함수
		function doLogin(){
			var pid = $("#pid").val();
			var pw = $("#pw").val();
			
			var form = document.form;
			
			if(pid != "" && pw != ""){
				form.submit();
			}else{
				$("#alertSpan").text("아이디 또는 비밀번호를 확인해주십시오!");
				alertDialog.dialog("open");
				return;
			}
			
			
		}
		
		//다이얼로그
	var alertDialog = $("#alert-form").dialog({
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
	</script>

</body>
</html>