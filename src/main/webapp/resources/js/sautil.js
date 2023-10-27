/**
 * 
 */

function AddComma(data_value) {
	return Number(data_value).toLocaleString('en');
}

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

function autoHypenDate(str){
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if(str.length < 5){
		return str;
	}else if(str.length < 6){
		tmp += str.substr(0, 4);
		tmp += '-';
		tmp += str.substr(4);
		return tmp;
	}else{
		tmp += str.substr(0, 4);
		tmp += '-';
		tmp += str.substr(4, 2);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	}
	return str;
}

function autoHypenNum(str){
	str = str.replace(/[^A-Za-z0-9]/g, '');
	var tmp = '';
	if(str.length < 4){
		return str;
	}else if(str.length < 5){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	}else{
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 2);
		tmp += '-';
		tmp += str.substr(5);
		return tmp;
	}
	return str;
}

function checkChr(check_form)
{
	var chrPattern = /[~!@\#$%^&*\()\-=+_']/gi;
	var chrPattern = check_form.value.match(chrPattern);
	if(chrPattern != null){
		alert("특수 기호는 입력하실 수 없습니다!");
		check_form.value="";
		check_form.focus();
		return false;
	}
}

function checkNum(check_form)
{
	var numPattern = /([^0-9])/;
	var numPattern = check_form.value.match(numPattern);
	if(numPattern != null){
		alert("숫자만 입력해 주십시요!");
		check_form.value="";
		check_form.focus();
		return false;
	}
}

function checkNum1(check_form)
{
	var numPattern = /([^0-9\.])/;
	var numPattern = check_form.value.match(numPattern);
	if(numPattern != null){
		alert("입력형식을 확인하여 주십시요!");
		check_form.value="";
		check_form.focus();
		return false;
	}
}









