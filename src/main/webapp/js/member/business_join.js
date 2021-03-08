'use strict';

$(function(){
	
	/*이름에는 한글만 입력할 수 있도록 변경*/
	var name = document.querySelector("#name");
	var onlyKorean = function() {
	  var pattern = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	  this.value = this.value.replace(pattern, "");
	  alert("한글만 입력해주세요");
	};
	name.addEventListener('keypress', onlyKorean);
	
	/*아이디 중복시 아래에 알림창 띄워주고 글씨색 변경해주는 부분*/
	$("#id").keyup(function() {
		var length = $("#id").val().trim().length
		if(length<4 && length > 0){
			$("#id").css("color", "red");
			$("#input_result1").html("아이디는 4자리 이상 입력해주세요.");
		}
		else if(length==0){
			$("#id").css("color", "red");
			$("#input_result1").html("아이디는 반드시 입력해주시기 바랍니다.");
		}
		else{
			$("#id").css("color", "blue");
			$("#input_result1").html("사용가능한 형식입니다");
		}
	});
	/*비밀번호 입력 문제시 알림창 띄워주고 글씨색 변경해주는 부분*/
	$("#pass").keyup(function() {
		var length = $("#pass").val().trim().length
		if(length<8 && length > 0){
			$("#pass").css("color", "red");
			$("#input_result2").html("비밀번호는 8자리 이상 입력해주세요.");
		}
		else if(length==0){
			$("#pass").css("color", "red");
			$("#input_result2").html("비밀번호는 반드시 입력해주시기 바랍니다.");
		}else{
			$("#pass").css("color", "blue");
			$("#input_result2").html("사용가능한 비밀번호입니다.");
		}
	});
	
	
	/*비밀번호 확인 입력 문제시 알림창 띄워주는 부분*/
	$("#passcheck").keyup(function() {
		var length = $("#passcheck").val().trim().length
		if(length<8 && length > 0){
			$("#passcheck").css("color", "red");
			$("#input_result3").html("비밀번호는 8자리 이상 입력해주세요.");
		}
		else if(length==0){
			$("#passcheck").css("color", "red");
			$("#input_result3").html("비밀번호는 반드시 입력해주시기 바랍니다.");
		}
		else if($("#passcheck").val()!=$("#pass").val()){
			$("#input_result3").html("비밀번호와 일치하지 않습니다.");
		}
		else{
			$("#passcheck").css("color", "blue");
			$("#input_result3").html("비밀번호가 알맞습니다.");
		}
	});
	
	/*이름 입력시 문제되는 사항에 대해서 보여줌*/
	$("#name").keyup(function() {
		var length = $("#name").val().trim().length
		if(length==0){
			$("#name").css("color", "red");
			$("#input_result4").html("이름은 반드시 입력해주시기 바랍니다.");
		}else{
			$("#name").css("color", "blue");
			$("#input_result4").html("이름이 입력되었습니다.");
		}
	});
	
	
	/*전화번호 입력시 문제되는 사항에 대해서 보여줌*/
	$("#tel2").keyup(function() {
		var length = $("#tel2").val().trim().length
		if(length==0){
			$("#tel2").css("color", "red");
			$("#input_result5").html("전화번호는 반드시 전부 입력해주시기 바랍니다.");
		}
		else if(length >0 && length <2){
			$("#tel2").css("color", "red");
			$("#input_result5").html("가운데 전화번호는  2글자 이상 5글자 이하입니다.");
		}
		else if(length >= 5){
			$("#tel2").css("color", "red");
			$("#input_result5").html("가운데 전화번호는 5글자 이하입니다.");
		}
		else{
			$("#tel2").css("color", "blue");
			$("#input_result5").html("다음 전화번호를 입력해주십쇼.");
		}
	});
	
	/*전화번호 입력시 문제되는 사항에 대해서 보여줌*/
	$("#tel3").keyup(function() {
		var length = $("#tel3").val().trim().length
		if(length==0){
			$("#tel3").css("color", "red");
			$("#input_result5").html("전화번호는 반드시 전부 입력해주시기 바랍니다.");
		}
		else if(length >0 && length <4){
			$("#tel3").css("color", "red");
			$("#input_result5").html("마지막 전화번호는  4글자입니다.");
		}
		else if(length >= 5){
			$("#tel3").css("color", "red");
			$("#input_result5").html("마지막 전화번호는 5글자 이하입니다.");
		}
		else{
			$("#tel3").css("color", "blue");
			$("#input_result5").html("올바른 양식입니다.");
		}
	});
	
	/*이메일 입력시 문제되는 사항에 대해서 보여줌*/
	$("#email").keyup(function() {
		var length = $("#email").val().trim().length
		if(length==0){
			$("#email").css("color", "red");
			$("#input_result6").html("이메일을 입력해주시기 바랍니다.");
		}
		else{
			$("#email").css("color", "blue");
			$("#input_result6").html("올바른 양식입니다.");
		}
	});
	
	/*년도 입력시 문제되는 사항에 대해서 보여줌*/
	$("#year").keyup(function() {
		var length = $("#year").val().trim().length
		if(length==0){
			$("#year").css("color", "red");
			$("#input_result7").html("생년월일을 반드시 입력해주세요.");
		}
		else if(length >0 && length <4){
			$("#year").css("color", "red");
			$("#input_result7").html("년도의 양식은 4글자입니다(ex:1894,1991)");
		}
		else{
			$("#year").css("color", "blue");
			$("#input_result7").html("월을 입력해주세요");
		}
	});
	
	/*월 입력시 문제되는 사항에 대해서 보여줌*/
	$("#month").keyup(function() {
		var length = $("#month").val().trim().length
		if(length==0){
			$("#month").css("color", "red");
			$("#input_result7").html("생년월일을 반드시 입력해주세요.");
		}
		else if(length >=3){
			$("#month").css("color", "red");
			$("#input_result7").html("월은 3글자 이상 입력 할 수 없습니다.");
		}
		else{
			$("#month").css("color", "blue");
			$("#input_result7").html("일을 입력해주세요");
		}
	});
	
	/*일 입력시 문제되는 사항에 대해서 보여줌*/
	$("#day").keyup(function() {
		var length = $("#day").val().trim().length
		if(length==0){
			$("#day").css("color", "red");
			$("#input_result7").html("생년월일을 반드시 입력해주세요.");
		}
		else if(length >=3){
			$("#day").css("color", "red");
			$("#input_result7").html("일은 3글자 이상 입력 할 수 없습니다.");
		}
		else{
			$("#day").css("color", "blue");
			$("#input_result7").html("올바른 양식입니다.");
		}
	});
	
	
	/*사업자 번호1 입력시 문제되는 사항에 대해서 보여줌*/
	$("#business_no1").keyup(function() {
		var length = $("#business_no1").val().trim().length
		if(length==0){
			$("#business_no1").css("color", "red");
			$("#input_result8").html("사업자번호를 반드시 입력해주세요.");
		}
		else if(length >=4){
			$("#business_no1").css("color", "red");
			$("#input_result8").html("첫사업자번호는 4글자 이상 입력 할 수 없습니다.");
		}
		else{
			$("#business_no1").css("color", "blue");
			$("#input_result8").html("올바른 양식입니다.");
		}
	});
	
	/*사업자 번호2 입력시 문제되는 사항에 대해서 보여줌*/
	$("#business_no2").keyup(function() {
		var length = $("#business_no2").val().trim().length
		if(length==0){
			$("#business_no2").css("color", "red");
			$("#input_result8").html("사업자번호를 반드시 입력해주세요.");
		}
		else if(length >=3){
			$("#business_no2").css("color", "red");
			$("#input_result8").html("첫사업자번호는 3글자 이상 입력 할 수 없습니다.");
		}
		else{
			$("#business_no2").css("color", "blue");
			$("#input_result8").html("올바른 양식입니다.");
		}
	});
	
	/*사업자 번호3 입력시 문제되는 사항에 대해서 보여줌*/
	$("#business_no3").keyup(function() {
		var length = $("#business_no3").val().trim().length
		if(length==0){
			$("#business_no3").css("color", "red");
			$("#input_result8").html("사업자번호를 반드시 입력해주세요.");
		}
		else if(length >=6){
			$("#business_no3").css("color", "red");
			$("#input_result8").html("마지막사업자번호는 6글자 이상 입력 할 수 없습니다.");
		}
		else{
			$("#business_no3").css("color", "blue");
			$("#input_result8").html("올바른 양식입니다.");
		}
	});
	
	/*아이디 중복 기능 확인*/
	$('#btn_id_check').on('click', function(){ 
		$.ajax({ 
			type: "get", 
			url: "idCheckAction.do", 
			data: { 
				"id" : $('#id').val() 
			}, 
			success: function(data){ 
				data = data === "true";
				if(data == true){ 
					alert("아이디 사용가능");
				} else{ 
					alert("아이디가 중복되었습니다.");
				} 
			} 
		});
	});
	
	
	/*남녀 버튼 변경 구현*/
	$("#gender_woman").click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="gender"]').prop('checked',false);
		 	$(this).prop('checked',true);
		}
	});
	/*남녀 버튼 변경 구현*/
	$("#gender_man").click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="gender"]').prop('checked',false);
		 	$(this).prop('checked',true);
		}
	});
	
	/*최종 회원가입시 미입력부분 포커스 맞춰주고 alert 띄워주는 부분*/
	$("#btn_submit").click(function() {
    	 var id=$("input:text[name=id]").val();
    	event.preventDefault();
    		if($("#id").val().trim().length == 0){
    			alert("아이디를 입력해주세요");
    			$("#id").focus();
    			return false;
    			};
    		if($("#id").val().trim().length < 4){
    			alert("아이디는 4글자이상 입력해주세요");
    			$("#id").focus();
    			return false;
    		};
    		if($("#pass").val().trim().length == 0){
    			alert("암호를 입력해주세요");
    			$("#pass").focus();
   				return false;
   			};
   			if($("#pass").val().trim().length < 8){
   				alert("암호는 8자이상 입력해주세요");
				$("#pass").focus();
    			return false;
    		};
    		if($("#pass").val() != $("#passcheck").val()){
   				alert("암호확인과 암호를 일치시켜주세요.");
   				$("#pass").focus();
   				return false;
   			}
			if($("#name").val().trim().length == 0){
    			alert("이름을 입력해주세요");
    			$("#name").focus();
    			return false;
    		};
    		if($("#tel1").val().trim().length == 0){
    			alert("연락처는 반드시 입력해주시기 바랍니다.");
   				$("#tel1").focus();
   				return false;
   			};
    		if($("#tel1").val().trim().length<2){
    			alert("연락처를 형식에 맞게 입력해주세요(ex:000-0000-0000)");
    			$("#tel1").focus();
   				return false;
   			};
   			if($("#tel2").val().trim().length == 0){
   				alert("연락처는 반드시 입력해주시기 바랍니다.");
				$("#tel2").focus();
    			return false;
    		};
    		if($("#tel2").val().trim().length<3){
    			alert("연락처를 형식에 맞게 입력해주세요(ex:000-0000-0000)");
    			$("#tel2").focus();
   				return false;
   			}
    		if($("#tel3").val().trim().length == 0){
    			alert("연락처는 반드시 입력해주시기 바랍니다.");
    			$("#tel3").focus();
   				return false;
   			};
   			if($("#tel3").val().trim().length<4){
   				alert("연락처를 형식에 맞게 입력해주세요(ex:000-0000-0000)");
				$("#tel3").focus();
				return false;
    		};
    		if($("#email").val().length == 0){
    			alert("이메일은 반드시 입력해주시기 바랍니다..");
    			$("#email").focus();
   				return false;
   			};
    		if($("#year").val().length == 0){
    			alert("생년월일을 입력해주세요");
    			$("#year").focus();
   				return false;
   			};
    		if($("#month").val().length == 0){
    			alert("생년월일을 입력해주세요");
    			$("#month").focus();
   				return false;
   			};
    		if($("#day").val().length == 0){
    			alert("생년월일을 입력해주세요");
    			$("#day").focus();
   				return false;
   			};
		if($("#business_no1").val.length ==0){
    			alert("사업자등록번호를 반드시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
   			if($("#business_no1").val().trim().length<3){
    			alert("사업자등록번호를 양식에 맞게 다시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
   			if($("#business_no2").val.length ==0){
    			alert("사업자등록번호를 반드시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
   			if($("#business_no2").val().trim().length<2){
    			alert("사업자등록번호를 양식에 맞게 다시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
   			if($("#business_no3").val.length ==0){
    			alert("사업자등록번호를 반드시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
   			if($("#business_no3").val().trim().length<5){
    			alert("사업자등록번호를 양식에 맞게 다시 입력해주세요");
    			$("#business_no1").focus();
   				return false;
   			}
    		$("#btn_submit").submit();
    		});
	
	// 이전버튼 클릭시 이전 페이지로 이동
	$(".btn_before").click(function(){
		location.href="selectJoinView.do";
	});
});