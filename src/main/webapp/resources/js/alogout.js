/**
 * 
 */

//Logout Timer 객체 정의
var LogOutTimer = function() {
	var S = {
        timer : null,
        limit : 1000 * 60 * 30,
        fnc   : function() {},
        start : function() {
                  S.timer = window.setTimeout(S.fnc, S.limit);
                },
        reset : function() {
                  window.clearTimeout(S.timer);
                  S.start();
                }
      };

	document.onmousemove = function() { S.reset(); };

	return S;
}();

// 로그아웃 체크시간 설정
LogOutTimer.limit = 1000 * 60 * 30;

// 로그아웃 함수 설정
LogOutTimer.fnc = function() {
	location.href="index.jsp";
}

// 로그아웃 타이머 실행
LogOutTimer.start();