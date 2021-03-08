'use strict';

function delete_reservation(obj) {
			var data = "";
			data = "bno=" + $(obj).prev().val();
			$.ajax({
				url : "manageBookCancel.do",
				data : data,
				method:"get",
				success:function(d){
					d = d === "true";
					if(d){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");						
					}
					location.href = "manageBookListView.do";	
				}
			});
		}
		function accept_reservation(obj) {
			var data = "";

			data = "bno=" + $(obj).parent().parent().parent().parent().find("td").first().val();
			console.log(data);

			data = "bno=" + $(obj).prev().val();

			$.ajax({
				url : "manageBookAccept.do",
				data : data,
				method:"get",
				success:function(d){
					d = d === "true";
					if(d){
						alert("수락 성공");
					}else{
						alert("수락 실패");						
					}
					location.href = "manageBookListView.do";	
				}
			});
		}
		$(function() {
			$("#accept_click_button").click(function() {
				accept_reservation($(this));
			});
			$("#Cancel_click_button").click(function() {
				delete_reservation($(this));
			});
		});