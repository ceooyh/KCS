'use strict';	
	
	$(function() {
		var title = $("#title").val()
		var content = $("#content").val()
		$(btn).click(function() {
			if (title == null) {
				alert("제목을 반드시 입력해주세요.")
			} else
				(content == null)
			{
				alert("내용을 반드시 입력해주세요.")
			}
		})
	});