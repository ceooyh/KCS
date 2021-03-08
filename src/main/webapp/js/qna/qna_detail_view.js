'use strict';

	function delete_qna(obj) {
		var data = "";
		data = "qno=" + $(obj).prev().val();
		$.ajax({
			url : "qnaAjaxDelete.do",
			data : data,
			method:"get",
			success:function(d){
				d = d === "true";
				if(d){
					alert("삭제 성공");
				}else{
					alert("삭제 실패");						
				}
				location.href='qnaView.do';
			}
		}); //ajax
	}
	
	$(function(){
		
		// 삭제 버튼 클릭시
		$("#btn_delete").click(function(){
			delete_qna($(this));
		});
	});
	