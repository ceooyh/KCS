<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }

    #container{
        width: 704px;
        border: 1px solid rgb(46, 46, 46);
        border-radius: 8px;
        padding: 20px;
        margin: 80px auto;
        font-family: '굵은노토';
    }

    #headline{
        text-align: center;
        font-family: '굵은노토';
        font-size: 26px;
        font-weight: bold;
        color: rgb(46, 46, 46);
        margin-bottom: 20px;
        border-bottom: 2px solid rgb(46, 46, 46);
        border-top: 2px solid rgb(46, 46, 46);
        padding: 10px;
    }

    label{
        font-family: '굵은노토';
        font-size: 16px;
        color: rgb(46, 46, 46);
    }

    input:focus {
        outline: none;
    }

    input {
        border: none;
    }

    .input_span input {
        border-bottom: 2px solid rgb(231, 231, 231);
        padding: 3px ;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        font-size: 18px;
    }

    #first_input {
        border-bottom: 2px solid rgb(231, 231, 231);
        padding: 5px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        font-size: 18px;
    }

    .input_span input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
    }

    #first_input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    .part_select {
        margin-bottom: 10px;
    }

    #qna_content_title{
        font-weight: bold;
        color: rgb(46, 46, 46);
    }

    #qna_content{
        width: 700px;
        height: 300px;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        margin-top: 5px;
        margin-bottom: 10px;
    }

    textarea{
        width: 700px;
        height: 100px;
        resize: none;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        font-family: '굵은노토';
        font-size:16px;
        margin-top: 10px;
        padding: 8px;
    }

    #btn_enter {
        width: 700px;
        height: 50px;
        margin-top: 10px;
        margin-left: 5px;
        font-family: '굵은노토';
        font-size: 20px;
        background-color: rgb(231, 231, 231);
        border: none;
        border-radius: 10px;
        color: rgb(46, 46, 46);
        font-weight: bold;
        cursor: pointer;
    }

    #btn_enter:hover{
        color: rgb(231, 231, 231);
        background-color: rgb(46, 46, 46);
    }
    hr{
        margin: 10px 0px;
        clear: both;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".comment_form textarea").keyup(function() {
			$(this).next().text($(this).val().length+"/500");
		});
		$("#btn_enter").click(function(){
			var data = $("#admin_answer").serialize();
			$.ajax({
				url : "adminAnswer.do",
				data : data,
				method:"get",
				success:function(d){
					alert("답변 등록 성공 : " + d);
					location.reload();	
				}
			});
        });
		$("textarea").focus(function(){
			if($(this).val() == '답변 없음')
				$(this).val('');
		}) ;
		$("textarea").blur(function(){
			if($(this).val() == '')
				$(this).val('답변 없음');
		}) ;
		
		
	});
</script>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
 	<c:if test="${sessionScope.login != 0}">
				<script>
					alert("권한이 없습니다. 로그인 후 이용해 주세요");
					location.href="loginView.do";
				</script>
	</c:if>
	<div id="container">
        <p id="headline">문의사항 관리자 페이지</p><!--헤드라인-->
		<div class="qna_title">
                 <div class="part_select">
                     <p id="qna_content_title"><label for="#">[아이디]</label></p>
                     <span class="input_span"><input id="first_input" type="text" name="id" id="id" value="${sessionScope.id}" readonly></span>
                    </div>
                 </div><!--아이디 입력란 마지막 자동 입력-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[제목]</label></p>
                     <span class="input_span"><input id="first_input" type="text" name="title" id="title" value="${sessionScope.title}" readonly></span>
                 </div><!--제목 입력란-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[문의내용]</label></p>
                     <span class="input_span"><input id="qna_content" type="text" name="content" id="content" value="${sessionScope.content}" readonly></span>
                 </div><!-- 내용 입력란-->	
		<hr>
		<div id="qna_form"><!--답변 입력란-->
			<form action="qnaAdminAnswer" method="get" id="admin_answer">
				<input type="hidden" name="qno" value="${requestScope.dto.qno }">
                    <p id="qna_content_title"><label for="title">[답변내용]</label></p>
				<table>
                    <tr>
                        <td><textarea name="response" placeholder="답변 내용을 입력해 주세요">${requestScope.dto.response}</textarea>
						</td>
					</tr>
				</table>
                    <button id="btn_enter">답변 등록</button>
			</form>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>