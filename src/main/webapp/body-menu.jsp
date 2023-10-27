<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>

	@font-face{
		font-family:"headline";
		src:url("fonts/headline.TTF") format("ttf");
		font-style:normal;
		font-weight:normal;
	}
	
		
	#head-container{	
		border:1px solid gray;
	}

	.big-h3 {
		color: #838383;
		height:100%;
		font-size:16pt;
		margin-top:10px;
	}
	
	.big-h4{
		color: #838383;
		height:80%;
		font-size:10pt;
	}
	
	
	
	.menuLists li{
		padding-left:3px;
		padding-top:8px;
		padding-bottom:8px;
		font-family:headline;
		letter-spacing:1.5px !important; 
	}
	
	.menuLists a{
		font-size: 15pt;
		color:white;
	}
	.menuLists a:hover{
		text-decoration: none;
		opacity:0.6;
	}
	
	 #body-container{
	background: #353535;
	} 

	
	
</style>
<script>
//*:not(.bb) --> x



$(document).ready(function(){
	
	$(document).on("click",function(e){
		var classArray = e.target.className;
//		console.log(e.target);
//		console.log(typeof(classArray));
//		console.log(classArray);
	

		if(typeof classArray == "string"){
			var value = classArray.split(" ");
			
			var menu = "";
			//상단바가 있을때만 메뉴가 보임
			for(var v of value){
				if("head-container" == v){
					menu = v;
				}
			}				
			
			//상단바 클래스명이 없으면 사라지게
 			if(menu !="head-container"){
	 	 		$("#demo").removeClass("in");
	 	 		$("#demo").attr("aria-expanded",false);
//	 	 		$("#demo1").removeClass("in");
//	 	 		$("#demo1").attr("aria-expanded",false);
	 	 		return;
 			}				
		}
	
	});
	
});

/*
	$(document).click(function(e){ //문서 body를 클릭했을때

	 });
*/	
	
	
</script>
</head>
<body>





<nav id="web1" class="navbar navbar-default head-container" style="z-index:5000; position:fixed; width:100%; height: 40px;" >		
			<div id="head-container" class="container head-container" style="height:100%; padding-left:0;padding-right:0;">
				<div class="col-xs-12 head-container" style="height:100%;">
					<div id="custom-menubar" class="row body-menu head-container"  data-toggle="collapse" data-target="#demo" style="height:100%; padding-top:6px; height:100%; CURSOR: pointer;">
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>모니터링</strong></span>
						</div>					
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>생산관리</strong></span>
						</div>
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>조건관리</strong></span>
						</div>
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>품질관리</strong></span>
						</div>
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>설비관리</strong></span>
						</div>
						<div class="col-xs-2 text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>인원관리</strong></span>
						</div>
					</div>
				</div>								
			</div>
		
		<div id="body-container" class="row body-container ">	
			<div id="demo" class="collapse" style="color:red;">
			    <div class="col-xs-12">
			    
			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;">
							<li><a href="m00s01.jsp"><span>알람화면</span></a></li>
							<li><a href="m00s02.jsp"><span>알람랭킹</span></a></li>							
							<li><a href="m00s03.jsp"><span>트렌드</span></a></li>
							<li><a href="m00s04.jsp"><span>조건 모니터링</span></a></li>
							<li><a href="m00s05.jsp"><span>RX유량 입력값</span></a></li>				
						</ul>
			    	</div>			    
			    
			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;">
							<li><a href="m01s01.jsp"><span>설비별 생산실적 현황</span></a></li>
							<li><a href="m01s02.jsp"><span>설비 효율 현황</span></a></li>							
							<li><a href="m01s03.jsp"><span>생산 모니터링 현황</span></a></li>
							<li><a href="m01s04.jsp"><span>열처리 작업일보 현황</span></a></li>
							<li><a href="m01s05.jsp"><span>LOT 현황</span></a></li>
						</ul>
			    	</div>
			    	
			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;">			    		
							<li><a href="m02s01.jsp"><span>조건 관리</span></a></li>
							<li><a href="m02s02.jsp"><span>열전대 교체 이력</span></a></li>
							<li><a href="m02s03.jsp"><span>온도조절계 보정 현황</span></a></li>
							<li><a href="m02s04.jsp"><span>열처리유 성상분석</span></a></li>
							<li><a href="m02s05.jsp"><span>O₂ 센서 교체이력</span></a></li>
						</ul>
			    	</div>	
			    	 	    	
			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;"> 
			    			<li><a href="m03s01.jsp"><span>Cpk 분석[공정능력평가]</span></a></li>
			    			<li><a href="m03s02.jsp"><span>온도균일성 조사보고서[TUS]</span></a></li>
			    			<li><a href="m03s03.jsp"><span>열전대 비교측정</span></a></li>
						</ul>
			    	</div>
			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;">			    			 
							<li><a href="m04s01.jsp"><span>설비이상조치현황 모니터링</span></a></li>
						</ul>
			    	</div>

			    	<div class="col-xs-2 menuLists">
			    		<ul style="text-align: center;">
			    			<li><a href="m05s01.jsp"><span>사용자 관리</span></a></li>			    			 
			    			<li><a href="m05s02.jsp"><span>자격증관리</span></a></li>			    			 
						</ul>
			    	</div>
			    				    	
			    </div>
 			 </div>
			</div>
			
			
			
</nav>

<!-- <nav id="mobile1" class="navbar navbar-default head-container" style="z-index:5000; position:fixed; width:100%;" >		
			<div id="head-container1" class="container head-container" style="height:100%;">
				<div class="col-xs-12 head-container" style="height:100%; padding:0;">
					<div id="custom-menubar1" class="row body-menu head-container"  data-toggle="collapse" data-target="#demo1" style="height:100%; padding-top:10px; height:100%; padding-top:10px; CURSOR: pointer;">
						<div class="col-xs-4 text-muted text-center head-container" style="display: inline-block; padding:0;">
							<h3 class="big-h3"><strong>기준정보</strong></h3>												
							<span class="big-h4 head-container"><strong>기준정보</strong></span>
						</div>
						<div class="col-xs-4 text-muted text-center head-container" style="display: inline-block; padding:0;">
							<span class="big-h4 head-container"><strong>프로젝트</strong></span>
						</div>
						<div class="col-xs-4 text-muted text-center head-container" style="display: inline-block; padding:0;">
							<span class="big-h4 head-container"><strong>영업/자재관리</strong></span>
						</div>				
					</div>
				</div>								
			</div>
		
		
		
		<div id="body-container1" class="row body-container ">	
			<div id="demo1" class="collapse" style="color:red;">
			    <div class="col-xs-12" style="padding:0;">
			    	<div class="col-xs-4 menuLists1 text-center" style="padding:0;">
			    		<ul>
							<li><a href="s001001.jsp"><span> &nbsp; 사용자 정보</span></a></li>
							<li><a href="s001002.jsp"><span> &nbsp; 거래처 정보</span></a></li>							
							<li><a href="s001004.jsp"><span> &nbsp; 제품 정보</span></a></li>
							<li><a href="s001005.jsp"><span> &nbsp; 자재 정보</span></a></li>
							<li><a href="s001006.jsp"><span> &nbsp; 설비코드 정보</span></a></li>
						</ul>
			    	</div>
			    	<div class="col-xs-4 menuLists1" style="padding:0;">
			    		<ul> 
							<li> <a href="s002001.jsp"><span> &nbsp; 프로젝트관리</span></a></li>
							<li> <a href="s002002.jsp"><span> &nbsp; 산출물관리</span></a></li>
							<li> <a href="s002003.jsp"><span> &nbsp; 활동게시판</span></a></li>
							<li> <a href="s002004.jsp"><span> &nbsp; 일정관리</span></a></li>
							<li> <a href="s002005.jsp"><span> &nbsp; 이슈관리</span></a></li>
							<li> <a href="s002006.jsp"><span> &nbsp; 통합공정표</span></a></li>
							<li> <a href="s002007.jsp"><span> &nbsp; 공정보고서</span></a></li>
						</ul>
			    	</div>			    	
			    	
			    	<div class="col-xs-4 menuLists1" style="padding:0;">
			    		<ul> 
			    			<li> <a href="s001003.jsp"><span> &nbsp; 영업관리</span></a></li>
			    			<li> <a href="s003002.jsp"><span> &nbsp; 판매관리</span></a></li>
							<li> <a href="s003001.jsp"><span> &nbsp; 재고현황</span></a></li>							
							<li> <a href="s003003.jsp"><span> &nbsp; 출고관리</span></a></li>
							<li> <a href="s003004.jsp"><span> &nbsp; 구매관리</span></a></li>
							<li> <a href="s003005.jsp"><span> &nbsp; 매입/매출관리</span></a></li>
						</ul>
			    	</div>
			    </div>
 			 </div>
			</div>
</nav> -->



<script>
//클랙스 : collapsed
// 속성  : aria-expanded="false"
$(function(){
		var width = window.innerWidth;
		//alert(width);
		//alert(window.innerHeight);
		
		if(width > 425){
			$("#web1").css("display","block");
			$("#mobile1").css("display","none");
		}else{
			$("#web1").css("display","none");
			$("#mobile1").css("display","block");
		}		
	});

</script>
</body>
</html>