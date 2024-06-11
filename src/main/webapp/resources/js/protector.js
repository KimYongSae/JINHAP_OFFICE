/**
 * @company : SunnyAuto
 * @author  : DAEJIGOM
 * @since   : 2016. 7. 18.
 * @desc    : 휴직관리 페이지 	
 */
(function() {
	Break = function() {
		var that = this;
		var isEdit = false;
		var isAdd = false;
		
		var breakList = new Array();
		
		var col1Module = null;
		var col2Module = null;
		var col3Module = null;
		
		var selectedRow = 0;
		
		// 휴직 추가
		this.add = function() {
			if (isEdit) {
				alert("데이터 저장 또는 취소 후 재시도 바랍니다.");
				return;
			}
			
			isAdd = true;
			var html = '<tr><td class="text-center" style="vertical-align: middle; height: 30px;" colspan="3">' +
				'<div class="col-sm-9"><input type="text" class="form-control input-sm" id="add_col1" style="width: 100%;" maxlength="8" placeholder="사번을 입력하세요."/></div>' +
				'<div class="col-sm-1"><button type="button" class="btn btn-info btn-sm" style="width: 70px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.requestToAdd()"><span class="glyphicon glyphicon-search"> 찾기</button></div>' +
				'</td>' +
				'<td class="text-center" style="vertical-align: middle; height: 30px;">' +
				'<input type="text" class="form-control input-sm datepicker" id="add_col2" style="width: 100%;" placeholder="예) 20160101"/>' +
				'</td>' +
				'<td class="text-center" style="vertical-align: middle; height: 30px;">' +
				'<input type="text" class="form-control input-sm datepicker" id="add_col3" style="width: 100%;" placeholder="예) 20160101"/>' +
				'</td>' +
				'<td class="text-center" style="vertical-align: middle; height: 30px;">' +
				'<div class="dropdown">' +
				    '<button id="add_col4" class="btn btn-primary dropdown-toggle btn-sm" style="width: 100%;" type="button" data-toggle="dropdown">선 택 ' +
				    	'<span class="caret"></span>' +
				    '</button>' +
				    '<ul class="dropdown-menu" role="menu" aria-labelledby="add_col4">' +
				      	'<li role="presentation"><a role="menuitem" tabindex="-1" data="SYS06001">군입대</a></li>' +
				      	'<li role="presentation"><a role="menuitem" tabindex="-1" data="SYS06002">출산휴가</a></li>' +
				      	'<li role="presentation"><a role="menuitem" tabindex="-1" data="SYS06003">육아휴가</a></li>' +
				    '</ul>' +
				'</div>' +
				'</td>' +
				'<td class="text-center" style="vertical-align: middle; height: 30px;">' +
				'<button type="button" class="btn btn-success btn-sm" style="width: 60px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.requestToAdd()">추 가</button>' +
				'<button type="button" class="btn btn-default btn-sm" style="width: 60px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.cancelToAdd()">취 소</button>' +
				'</td>' +
				'</tr>';
			
			$("#break_contents").prepend(html);	
			
			$(".datepicker").datepicker({
				dateFormat: "yymmdd",
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
				
			});
			
			// Dropdown 이벤트 추가
			$(".dropdown-menu[aria-labelledby='add_col4']").on('click', 'li a', function(){
		      	$("#add_col4:first-child").text($(this).text());
		      	$("#add_col4:first-child").val($(this).attr("data"));
		   	});
			
			$("#add_break_btn").prop("disabled", true);
		};
		
		this.requestToAdd = function() {
			var param = {
				sNo: $("#add_col1").val(),
				startDate: $("#add_col2").val(),
				endDate: $("#add_col3").val(),
				resonCd: $("#add_col4").val()
			};
			
			console.log("requestToAdd param = ");
			console.log(param);

			$.ajax({
				type : "POST",
				url : "addBreak",
				cache : false,
				dataType : "json",
				data : param,
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						console.log("ok.");
						isAdd = false;
						$("#add_break_btn").prop("disabled", false);
						breakPage.getList();
					} else if (rsJson && rsJson.status == "fail") {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n다시 시도하여 주시기바랍니다.");
					} else {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n담당자에게 문의하시기 바랍니다.(eCode=0)");
					}

				}// success 끝
			});
		};
		
		this.cancelToAdd = function() {
			isAdd = false;	
			$("#break_contents>tr:eq(0)").remove();
			$("#add_break_btn").prop("disabled", false);
		};
		
		// 수정모드로 전환
		this.edit = function(row) {
			if (isAdd) {
				alert("데이터 저장 또는 취소 후 재시도 바랍니다.");
				return;
			}
			
			if (isEdit) {
				alert("다른 데이터가 수정중입니다. 계속 진행하시려면 저장 또는 취소 후 재시도 바랍니다.");
				return;
			}
			
			isEdit = true;
			// 사원 리스트에서 sno로 찾아서 데이터 대입 시켜야함. 코드때문에
			
			if (breakList.length == 0) {
				return;
			}
			
			selectedRow = row;
			
			var sno = breakList[row].sNo;
			var sname = breakList[row].sName;
			var startDate = breakList[row].startDate;
			var endDate = breakList[row].endDate;
			var resonCd = breakList[row].resonCd;
			
			col1Module = new SaModule("break_contents", row, 3, "date", startDate, null);
			col1Module.showEdit();
		
			col2Module = new SaModule("break_contents", row, 4, "date", endDate, null);
			col2Module.showEdit();
			
			col3Module = new SaModule("break_contents", row, 5, "dropdown", resonCd, sexHtml);
			col3Module.showEdit();
			
			$("#break_contents>tr:eq(" + row + ")").find("td:eq(6)").html('<button type="button" class="btn btn-success btn-sm" style="width: 60px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.requestToUpdate(\'' + sno + '\')">저 장</button>' +
					'<button type="button" class="btn btn-danger btn-sm" style="width: 60px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.requestToDelete(\'' + sno + '\')">삭 제</button>' 
					+'<button type="button" class="btn btn-default btn-sm" style="width: 60px; margin-left: 5px; margin-right: 5px; margin-top: 2px; margin-bottom: 2px;" onclick="breakPage.cancelToEdit()">취 소</button>');
			
		};
		
		// 수정모드에서 뷰 모드로 전환
		this.cancelToEdit = function() {
			isEdit = false;
			col1Module.cancelEdit();
			col2Module.cancelEdit();
			col3Module.cancelEdit();
			
			$("#break_contents>tr:eq(" + selectedRow + ")").find("td:eq(6)").html('<button type="button" class="btn btn-success btn-sm edit-btn" style="width: 70px;" onclick="breakPage.edit(' + selectedRow + ')">수 정</button>');
			
		};
		
		// 사원정보 요청
		this.getList = function() {
			var param = {
				searchSNo: null,
				searchSName: null,
				searchToStartDate: null,
				searchFromStartDate: null,
				searchToEndDate: null,
				searchFromEndDate: null
			};
			
			if (String($("#break_search_sno").val()).trim().length > 0) {
				param.searchSNo = $("#break_search_sno").val();
			}
			
			if (String($("#break_search_sname").val()).trim().length > 0) {
				param.searchSName = $("#break_search_sname").val();
			}
			
			param.searchToStartDate = $("#memu2_to_start_date").val();
			param.searchFromStartDate = $("#menu2_from_start_date").val();
			param.searchToEndDate = $("#menu2_to_end_date").val();
			param.searchFromEndDate = $("#menu2_from_end_expire_date").val();
			
			console.log(">>>>> getList param = ");
			console.log(param);
			
			breakList = null;
			breakList = new Array();
			
			$.ajax({
				type : "POST",
				url : "getBreaks",
				cache : false,
				dataType : "json",
				data : param,
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						console.log("ok.");
						console.log(rsJson);
						var rsHtml = "";
						if (rsJson.list.length > 0) {
							for (var i = 0; i < rsJson.list.length; i++) {
								
								breakList.push(rsJson.list[i]);
								rsHtml += '<tr><td class="text-center" style="vertical-align: middle; height: 30px;">' + rsJson.list[i].sNo + '</td>' +
								'<td class="text-center" style="vertical-align: middle; height: 30px;">' + rsJson.list[i].sName + '</td>' +
								'<td class="text-center" style="vertical-align: middle; height: 30px;">' + rsJson.list[i].startDate + '</td>' +
								'<td class="text-center" style="vertical-align: middle; height: 30px;">' + rsJson.list[i].endDate + '</td>' +
								'<td class="text-center" style="vertical-align: middle; height: 30px;">' + rsJson.list[i].resonCd + '</td>' +
								'<td class="text-center" style="vertical-align: middle; height: 30px;">' +
								'<button type="button" class="btn btn-success btn-sm edit-btn" style="width: 70px;" onclick="breakPage.edit(' + i + ')">수 정</button>' +
								'</td></tr>';
							}
						
						} else {
							rsHtml = '<tr><td class="text-center" style="vertical-align: middle; height: 55px;" colspan="7">검색 결과가 없습니다.</td></tr>';
						}
						
						$("#break_contents").html(rsHtml);
						
					} else if (rsJson && rsJson.status == "fail") {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n다시 시도하여 주시기바랍니다.");
					} else {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n담당자에게 문의하시기 바랍니다.(eCode=0)");
					}

				}// success 끝
			});
		};
		
		// 수정요청
		this.requestToUpdate = function(sno) {
			if (!confirm("저장하시겠습니까?")) {
				return;
			}
			
			col1Module.saveEdit();
			col2Module.saveEdit();
			col3Module.saveEdit();
			
			var param = {
				sNo: sno,
				startDate: col1Module.getValue(),
				endDate: col2Module.getValue(),
				resonCd: col3Module.getValue()
			};
			
			console.log("requestToUpdate param = ");
			console.log(param);

			$.ajax({
				type : "POST",
				url : "updateBreak",
				cache : false,
				dataType : "json",
				data : param,
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						console.log("ok.");
						isEdit = false;
						breakPage.getList();
					} else if (rsJson && rsJson.status == "fail") {
						console.log("fail.");
						col1Module.showEdit();
						col2Module.showEdit();
						col3Module.showEdit();
						alert("처리중 예외가 발생하였습니다.\n다시 시도하여 주시기바랍니다.");
					} else {
						console.log("fail.");
						col1Module.showEdit();
						col2Module.showEdit();
						col3Module.showEdit();
						alert("처리중 예외가 발생하였습니다.\n담당자에게 문의하시기 바랍니다.(eCode=0)");
					}

				}// success 끝
			});
		};
		
		// 삭제요청
		this.requestToDelete = function(sno) {
			if (!confirm("삭제하시겠습니까?")) {
				return;
			}
			
			var param = {
				sNo: sno
			};
			
			console.log("requestToDelete param = ");
			console.log(param);

			$.ajax({
				type : "POST",
				url : "deleteBreak",
				cache : false,
				dataType : "json",
				data : param,
				success : function(rsJson) {
					if (rsJson && rsJson.status == "ok") {
						console.log("ok.");
						isEdit = false;
						breakPage.getList();
					} else if (rsJson && rsJson.status == "fail") {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n다시 시도하여 주시기바랍니다.");
					} else {
						console.log("fail.");
						alert("처리중 예외가 발생하였습니다.\n담당자에게 문의하시기 바랍니다.(eCode=0)");
					}

				}// success 끝
			});
		};
		
	};
})();