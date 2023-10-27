/**
 * @company : SunnyAuto
 * @author  : DAEJIGOM
 * @since   : 2016. 7. 18.
 * @desc    : 뷰 및 에디터 관리 모듈	
 */

(function() {
	SaModule = function(tbodyId, row, col, type, value, dataList) {
		
		var that = this;
		var row = row;
		var col = col;
		var tbody = $("#" + tbodyId);
		var target = $(tbody).find("tr:eq(" + row + ")>td:eq(" + col +")");
		var oldLabel = null;
		var editHtml = "";
		var returnValue = null;
		
		oldLabel = $(target).text().trim();
		if (type == "text") {
			editHtml = '<input type="text" class="form-control input-sm" style="width: 90%;" value="' + value + '"/>';
		} else if (type == "date") {
			editHtml = '<input type="text" class="form-control input-sm datepicker" style="width: 90%;" value="' + (value == null ? "":value) + '" placeholder="예) 20160101"/>';
		} else if (type == "dropdown") {
			editHtml = '<div class="dropdown">' +
		    '<button id="row' + row + '_col' + col + '" class="btn btn-primary dropdown-toggle btn-sm" style="width: 100%;" type="button" data-toggle="dropdown">선 택 ' +
	    	'<span class="caret"></span>' +
	    	'</button>' +
	    	'<ul class="dropdown-menu" role="menu" aria-labelledby="row' + row + '_col' + col + '">' + dataList +
	      	'</ul></div>';
		}
		
		this.showEdit = function() {
			$(target).html(editHtml);
			
			$(".datepicker").datepicker({
				dateFormat: "yymmdd",
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
				
			});
			
			if (type == "dropdown") {
				if (value != null) {
					$("#row" + row + "_col" + col + ":first-child").text(oldLabel);
					$("#row" + row + "_col" + col + ":first-child").val(value);
				}
				// Dropdown 이벤트 추가
				$(".dropdown-menu[aria-labelledby='row" + row + "_col" + col + "']").on('click', 'li a', function(){
			      	$("#row" + row + "_col" + col + ":first-child").text($(this).text());
			      	$("#row" + row + "_col" + col + ":first-child").val($(this).attr("data"));
			   	});
			} 
		};
		
		this.saveEdit = function() {
			var currentValue = null;
			if (type == "dropdown") {
				if (value != null) {
					currentValue = $("#row" + row + "_col" + col + ":first-child").text().trim();
					returnValue = $("#row" + row + "_col" + col + ":first-child").val();
				} 
				$(target).html(currentValue);
			} else {
				currentValue = $(target).find("input").val();
				returnValue = $(target).find("input").val();
				$(target).text(currentValue);
			}
		};
		
		this.cancelEdit = function() {
			if (type == "dropdown") {
				$(target).html(oldLabel);
				returnValue = value;
			} else {
				$(target).text(value);
				returnValue = value;
			}
		};
		
		this.getValue = function() {
			return returnValue;
		};
		
	};
	
	SaModule.prototype = {
			
	};
})();