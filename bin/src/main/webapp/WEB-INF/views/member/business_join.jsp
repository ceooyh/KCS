<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입 페이지</title>
<style>
     @font-face {
        font-family: '보통노토';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Medium.otf);
    }
    @font-face {
        font-family: '굵은노토';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Black.otf);
    }
    @font-face {
        font-family: '검은고딕';
        src: url(../../../Font/검은고딕/OFL.txt);
    }
    @font-face {
        font-family: '보통로보';
        src: url(../../../Font/Roboto/Roboto-Medium.ttf);
    }
    @font-face {
        font-family: '두꺼운로보';
        src: url(../../../Font/Roboto/Roboto-Bold.ttf);
    }
    *{
        padding: 0;
        margin: 0;
    }
    section{
        width: 100%;
        margin: 30px auto;
    }
    section #headline{
        font-size: 30px;
        margin: 20px 0;
        text-align: center;
        color: rgb(46, 46, 46);
        font-family: '굵은노토';
    }
    section #inside_headline{
        font-size: 30px;
        margin: 20px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
    }
    .label{
        font-family: '굵은노토';
        font-size: 13px;
        color: rgb(49, 49, 49);
    }
    section input{
        border: none;
    }
    section span{
        display: inline-block;
    }
    section input:focus {
        outline:none;
    }
    section input::placeholder{
        color: rgb(216, 215, 215);
    }
    #container{
        padding: 50px;
        width: 600px;
        margin: 0 auto;
        border: 1px solid rgb(189, 187, 187);
    }
    .part{
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .guest_insert{
        width: 100px;
        margin: 10px 0;
    }
    .guest_input1{
        width: 600px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .guest_input1{
        font-size: 18px;
        font-family: '보통노토';
        color: rgb(46, 46, 46);
    }
    #tel1{
        width: 100px;
        color: rgb(97, 95, 95);
        font-family: '보통노토';
        border: none;
    }
    .guest_input2{
        font-size: 18px;
        font-family: '보통노토';
        width: 244px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .guest_input3{
        font-size: 18px;
        font-family: '보통노토';
        width: 440px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    #host{
        width: 150px;
        color: rgb(97, 95, 95);
        font-family: '보통노토';
        border: none;
    }
    .guest_input4{
        font-size: 18px;
        font-family: '보통노토';
        width: 196px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .gender_select{
        margin-top: 10px;
        margin-right: 5px;
        font-family: '보통노토';
        color: rgb(97, 95, 95);
    }
    #btn_id_check{
        padding: 2px;
        border: none;
        font-size: 16px;
        border-radius: 10px;
        background-color: white;
        font-family: '보통노토';
        color: rgb(97, 95, 95);
    }
    #btn_id_check:hover{
        border: none;
        background-color: rgb(97, 95, 95);
        color: white;
    }
    .btn_submit{
        padding-top: 8px;
        padding-bottom: 8px;
        background-color: rgb(245, 244, 244);
        width: 49%;
        border: none;
        font-family: '보통노토';
        border-radius: 3%;
    }
    .btn_before{
        padding-top: 8px;
        padding-bottom: 8px;
        background-color: rgb(245, 244, 244);
        width: 49%;
        border: none;
        font-family: '보통노토';
        border-radius: 3%;
    }
    #btn_continer button:hover{
        background-color: rgb(63, 62, 62);
        color: rgb(245, 244, 244);
        cursor: pointer;
    }
    input[type="checkbox"]{
        display: none;
    }
    #checkbox_gender input[type="checkbox"] + label span{
        border-radius: 5px;
        padding: 5px;
        display: inline-block;
        cursor:pointer;
        vertical-align:middle;
        border: 1px solid rgb(216, 215, 215);
    }
    #checkbox_gender input[type="checkbox"] + label span:hover{
        color: white;
        background-color: rgb(216, 215, 215);
    }
    #checkbox_gender input[type="checkbox"]:checked + label span{
        background-color: rgb(233, 173, 9);
        color: rgb(46, 46, 46);
    }
    .guest_input1:focus,.guest_input2:focus,.guest_input3:focus,.guest_input4:focus{
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    .input_result{
    	margin-top:5px;
    	font-family: '보통노토';
    	color:rgb(215,215,215);
    	font-size: 13px;
    }
    
       /*파일업로드 부분 수정*/
    #file_upload input[name="file"]{
        display: none;
    }
    #file_upload_label{
        color: rgb(44, 42, 41);
        cursor: pointer;
        padding: 5px;
        border: 1px solid rgb(215, 215, 215);
        border-radius: 3px;
        background-color: white;
        font-family: '보통노토';
    }
    #file_upload_label:hover{
        border: none;
        background-color: rgb(44, 42, 41);
        color: white;
    }
     input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}


</style>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
</script>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <p id="headline">회원 가입 페이지</p>
        <form action="guestJoinAction.do" method="GET">
        <div id="container">
                <p id="inside_headline">회원님의 정보를 입력해주세요</p>
                <div id="id_insert" class="part"><!--아이디 입력 부분 start-->
                        <span class="guest_insert"><label for="id" class="label">아이디</label></span><br>
                       	<div class="input_result" id="input_result1"></div>
                        <span><input  class="guest_input1 input" type="text" name="id" id="id" placeholder="아이디를 입력하세요"></span><br>
                        <span class="guest_insert"><button id="btn_id_check" type="button">중복검사</button></span><br>
                </div><!--아이디 입력 부분 end-->




                <div id="id_insert" class="part"><!--비밀번호 입력 부분 start-->
                        <span class="guest_insert"><label for="pass" class="label">비밀번호입력</label></span><br>
                        <div class="input_result" id="input_result2"></div>
                        <span><input  class="guest_input1" type="password" name="pass" id="pass" placeholder="비밀번호 입력"></span>
                </div><!--비밀번호 입력 부분 end-->
                    
                    
                    
                    
                <div id="id_insert" class="part"><!--비밀번호 확인 부분 start-->
                        <span class="guest_insert"><label for="passcheck" class="label">비밀번호확인</label></span><br>
                        <div class="input_result" id="input_result3"></div>
                        <span><input class="guest_input1" type="password" name="passcheck" id="passcheck" placeholder="비밀번호 확인"></span>
                </div><!--비밀번호 확인 부분 end-->
                    



                <div id="id_insert" class="part"><!--이름 입력 부분 start-->
                    <span class="guest_insert"><label for="name" class="label">이름</label></span><br>
                    <div class="input_result" id="input_result4"></div>
                    <span><input class="guest_input1" type="text" name="name" id="name" placeholder="이름 입력"></span>
                </div><!--이름 입력 부분 end-->




                <div id="id_insert" class="part"><!--전화번호 입력 부분 start-->
                    <span class="guest_insert"><label for="tel2" class="label">전화번호</label></span><br>
                    <div class="input_result" id="input_result5"></div>
                        <span><select name="tel1" id="tel1">
                                <option value="010">010</option>
                                <option value="019">019</option>
                                <option value="011">011</option>
                            </select></span>
                            <span><input class="guest_input2" type="number" name="tel2" id="tel2" class="tel" placeholder="0000"></span>
                            <span><input class="guest_input2" type="number" name="tel3" id="tel3" class="tel" placeholder="0000"></span>
                </div><!--전화번호 입력 부분 end-->




                <div id="id_insert" class="part"><!--이메일 부분 start-->
                    <span class="guest_insert"><label for="pass" class="label">이메일</label></span><br>
                    <div class="input_result" id="input_result6"></div>
                    <span><input class="guest_input3" type="text" name="email" id="email" placeholder="이메일을 입력해주세요"></span>
                    <span><select name="host" id="host">
                                <option value="">직접입력</option>
                                <option value="naver.com">@naver.com</option>
                                <option value="gmail.com">@gmail.com</option>
                                <option value="nate.com">@nate.com</option>
                                <option value="hanmail.com">@hanmail.com</option>
                                <option value="daum.net">@daum.net</option>
                            </select></span>
                </div><!--이메일 부분 end-->




                <div id="id_insert" class="part"><!--생일/성별 start-->
                    <span class="guest_insert"><label for="year" class="label">생일/성별</label></span><br>
                    <div class="input_result" id="input_result7"></div>
                    <span><input  class="guest_input4" type="number" id="year" name="year" placeholder="년"></span>
                    <span><input class="guest_input4" type="number" id="month" name="month" placeholder="월"></span>
                    <span><input  class="guest_input4" type="number" id="day" name="day" placeholder="일"></span><br>
                    <div id="checkbox_gender">
                        <span class="gender_select"><input id="gender_woman" type="checkbox" value="1" class="checkbox" name="gender"><label for="gender_woman" class="label"><span>여성</span></label></span>
                        <span class="gender_select"><input id="gender_man" type="checkbox" value="0" class="checkbox"  name="gender" checked><label for="gender_man" class="label"><span>남성</span></label></span>
                    </div>
                </div><!--생일 성별 end-->


                <div id="id_insert" class="part"><!--사업자 등록번호 입력 start-->
                    <span class="guest_insert"><label for="business_no" class="label">사업자등록번호</label></span><br>
                    <div class="input_result" id="input_result8"></div>
                    <span><input class="guest_input4" type="number" id="business_no1" name="business_no1" placeholder="000"></span>
                    <span><input class="guest_input4" type="number" id="business_no2" name="business_no2" placeholder="00"></span>
                    <span><input class="guest_input4" type="number" id="business_no3" name="business_no3" placeholder="00000"></span><br>
                 </div><!--사업자 등록번호 입력 end-->


                <div id="btn_continer">
                    <button class="btn_submit" id="btn_submit">회원가입</button>
                    <button type="button" class="btn_before">이전</button>
                </div>
            </div>
        </form><!--폼마지막 줄-->
    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>