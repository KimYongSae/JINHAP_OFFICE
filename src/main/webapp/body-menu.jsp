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

.custom-col {
    float: left;
    width: 14.28571%; /* 100% / 7 */
    padding: 0 15px; /* 여백 필요 시 */
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
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>모니터링</strong></span>
						</div>					
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>생산관리</strong></span>
						</div>
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>조건관리</strong></span>
						</div>
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>품질관리</strong></span>
						</div>
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>설비관리</strong></span>
						</div>
						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>투입 운전관리</strong></span>
						</div>
 						<div class="custom-col text-muted text-center head-container" style="display: inline-block;">
							<span class="big-h3 head-container"><strong>인원관리</strong></span>
						</div>
					</div>
				</div>								
			</div>
		
		<div id="body-container" class="row body-container ">	
			<div id="demo" class="collapse" style="color:red;">
			    <div class="col-xs-12">
			    
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">
							<li><a href="sample_7.jsp"><span>통합모니터링(미완)</span></a></li>
							<li><a href="m00s03.jsp"><span>경보 모니터링</span></a></li>							
							<li><a href="m00s01.jsp"><span>경보 이력</span></a></li>
							<!-- <li><a href="m00s02.jsp"><span>경보 발생빈도(랭킹)</span></a></li> -->
							<li><a href="sample_1.jsp"><span>경보 발생빈도(랭킹)</span></a></li>
							<li><a href="m01s05.jsp"><span>LOT 현황</span></a></li>				
							<li><a href="m00s04.jsp"><span>온도/CP 상태감시</span></a></li>				
							<li><a href="m00s04_trend.jsp"><span>온도/CP 경향모니터링</span></a></li>				
						</ul>
			    	</div>			    
			    
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">
							<li><a href="m01s00.jsp"><span>종합생산현황</span></a></li>
							<li><a href="m01s01.jsp"><span>설비별 생산실적</span></a></li>
							<li><a href="m01s02.jsp"><span>설비별 효율관리</span></a></li>							
							<li><a href="sample_8.jsp"><span>생산 모니터링 현황(미완)</span></a></li>							
							<li><a href="m01s06.jsp"><span>열처리 제공현황(미완)</span></a></li>
							<li><a href="m01s04.jsp"><span>열처리 작업일보 현황(미완)</span></a></li>
							<li><a href="m01s03.jsp"><span>LOT 보고서(미완)</span></a></li>
						</ul>
			    	</div>
			    	
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">			    		
							<li><a href="m02s01.jsp"><span>생산조건관리</span></a></li>
							<li><a href="m02s02.jsp"><span>T/C 교체이력</span></a></li>
							<li><a href="m02s03.jsp"><span>각종 조절계 교정이력</span></a></li>
							<li><a href="m02s04.jsp"><span>열처리유 성상분석</span></a></li>
							<li><a href="m02s05.jsp"><span>O₂ 센서 교체이력</span></a></li>
						</ul>
			    	</div>	
			    	 	    	
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;"> 
			    			<li><a href="m03s01.jsp"><span>Cpk 분석(미완)</span></a></li>
			    			<li><a href="m03s04.jsp"><span>PPK 관리</span></a></li>
			    			<li><a href="m03s02.jsp"><span>온도균일성 조사보고서</span></a></li>
			    			<li><a href="m03s03.jsp"><span>열전대 비교측정</span></a></li>
						</ul>
			    	</div>
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">			    			 
							<li><a href="m04s01.jsp"><span>설비보전관리</span></a></li>
							<li><a href="m04s02.jsp"><span>OPL 요령서</span></a></li>
						</ul>
			    	</div>

			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">
			    			<li><a href="http://localhost:8080/JINHAP/s001.jsp" target="_blank"><span>투입제어 및 모니터링</span></a></li>			    			 
			    			<li><a href="m05s02.jsp"><span>LOT 정보확인(미완)</span></a></li>			    			 
			    			<li><a href="sample_13.jsp"><span>생산/설비 실시간 정보(미완)</span></a></li>			    			 
			    			<li><a href="sample_14.jsp"><span>투입FLOW 모니터링(미완)</span></a></li>			    			 
						</ul>
			    	</div>
			    	<div class="custom-col menuLists">
			    		<ul style="text-align: center;">
			    			<li><a href="m06s01.jsp"><span>사용자 관리</span></a></li>			    			 
						</ul>
			    	</div>
			    				    	
			    </div>
 			 </div>
			</div>
			
			
			
</nav>


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