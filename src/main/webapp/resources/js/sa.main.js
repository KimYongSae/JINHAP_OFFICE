/**
 * @company : SunnyAuto
 * @author  : DAEJIGOM
 * @since   : 2016. 7. 29.
 * @desc    : 메인 페이지 	
 */
(function() {
	SaMain = function() {
		var that = this;
		var isEdit = false;
		var isAdd = false;
		
		var list = new Array();
		
		var col1Module = null;
		var col2Module = null;
		var col3Module = null;
		var col4Module = null;
		var col5Module = null;
		var col6Module = null;
		var col7Module = null;
		var col8Module = null;
		var col9Module = null;
		var col10Module = null;
		var col11Module = null;
		
		var selectedRow = 0;
		
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
			
			if (list.length == 0) {
				return;
			}
			
			selectedRow = row;
		};
		
		// 수정모드에서 뷰 모드로 전환
		this.cancelToEdit = function() {
			isEdit = false;
		};
		
		// 리스트 요청
		this.getList = function() {
			
		};
		
		// 수정요청
		this.requestToUpdate = function(sno) {
			if (!confirm("저장하시겠습니까?")) {
				return;
			}
		};
		
		// 삭제요청
		this.requestToDelete = function(sno) {
			if (!confirm("삭제하시겠습니까?")) {
				return;
			}
		};
		
	};
})();