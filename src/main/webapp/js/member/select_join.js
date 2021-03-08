'use strict';

$(function(){
		$(".agree_select").click(function(){
			if($("#guest_nonagree").is(":checked") == true){
				console.log('yes');
			}else{
				console.log('no');
			}
		});
		
		/*비동의가 되어있을시 다음페이지로 넘어가지 못하도록함*/
		$(".btn_next_level").click(function(){
			if($("#guest_nonagree").is(":checked") == true){
				alert("동의를 하지 않으시면 회원가입을 진행 할 수 없습니다.");
				return false;
			}
		});
		
		/*동의 버튼 변경 구현*/
		$("#guest_agree").click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="guest_agree"]').prop('checked',false);
			 	$(this).prop('checked',true);
			}
		});
		/*비동의 버튼 변경 구현*/
		$("#guest_nonagree").click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="guest_agree"]').prop('checked',false);
			 	$(this).prop('checked',true);
			}
		});
	});