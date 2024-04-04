<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진합</title>
<link rel="stylesheet" href="resources/login.css">
<link rel="stylesheet" href="resources/basic_v7.css">
<link rel="shortcut icon" href="resources/images/jinhap4.gif" type="image/x-icon" />

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script> 
<script type="text/javascript" src="resources/js/jquery.color-2.1.2.min.js"></script>
<script type="text/javascript" src="resources/js/menu_min.js"></script>




<style>
    .login_box {
        display: flex;
        align-items: center;
    }
    
    .notice{

    }
    
    .login{
 margin-left: auto !important;
    }
    
    .tit{
    font-size: 35px !important;
    }
    
    

</style>

</head>
	
	<body id="login_body" class="layout_ex " onload="">
    
<div id="wrap_login" class="login_gw7">
	<div class="login_container">
		<div class="header">
			<div class="inner">
			<h1 class="logo"><img id="login_img_logo" src="resources/images/fileView.png" alt=""></h1>
			<div class="lang">
			</div>
			</div>
		</div>
		<hr class="hide">
		<div class="content" id="login_layout_content">
			<div id="login_imgbox" class="visual_box">
				<img id="login_img_loginBanner" src="resources/img/bolt09_2.png" alt="">
			</div>
			<div class="login_box">
				<div class="notice">
					<div class="tit_bar">
						<h2 class="tit">열처리 통합관리시스템</h2>
					</div>
					<ul id="login_noticeCont_ul" class="bu_lst">
					</ul>
				</div>
				<div class="login">
				    <form name="form" class="omb_loginForm" role="form" 
    				action="login_ok.jsp" method="post" onsubmit="return false">
						<div class="login_frm">
							
							<div id="login_loginBox">
								<ul id="loginIdType1" class="ip_box">
									<li class="info id">
										<label class="input_txt">
											<input id="userId" name="pid" class="input_id" type="text" autocomplete="off" >
											<i class="ico ico_login-id"></i>
										</label>
									</li>
									<li class="info pw">
										<label class="input_txt">
											<input id="password" name="pw" type="password" autocomplete="new-password" class="input_pw">
											<i class="ico ico_login-pw"></i>
										</label>
									</li>
								</ul>
							</div>
							<div class="btn_login">
								<button id="btnLogin" data-text="Login" onclick="doLogin()">
									<span>L</span><span>o</span><span>g</span><span>i</span><span>n</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>


<script>
	function doLogin(){
		var pid = $("#userId").val();
		var pw = $("#password").val();
		
		var form = document.form;
		
		if(pid != "" && pw != ""){
			form.submit();
		}else{
			alert("아이디 또는 비밀번호를 확인해주십시오!");
			return;
		}
		
		
	}




</script>
	
	

</html>