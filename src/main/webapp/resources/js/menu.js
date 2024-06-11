function getMenuStr(){
	
	var  str="";
	str+='<div class="menu" id="slide">';
	str+='<ul>';
	
	str+='<li><a href="#" class="icon1">기준정보</a>';
	str+='<ul>';
	str+='<li><a href="s001001.jsp"> - &nbsp 사용자 정보</a></li>';
	str+='<li><a href="s001002.jsp"> - &nbsp 센서 정보</a></li>';
	str+='</ul>';
	str+='</li>';
	
	str+='<li><a href="#" class="icon2">모니터링</a>';
	str+='<ul>';
	str+='<li> <a href="s002001.jsp"> - &nbsp 현장 온 · 습도</a></li>';
	str+='<li> <a href="s002002.jsp"> - &nbsp 차트</a></li>';
	str+='</ul>';
	str+='</li>';
	
	str+='<li><a href="#" class="icon3">현장정보</a>';
	str+='<ul>';
	str+='<li> <a href="s003001.jsp"> - &nbsp 온 · 습도 현황</a></li>';
	str+='<li> <a href="s003002.jsp"> - &nbsp EVENT 이력 조회</a></li>';
	str+='</ul>';
	str+='</li>';
	
	str+='</ul>';
	str+='</div>';
	
	return str;
}
