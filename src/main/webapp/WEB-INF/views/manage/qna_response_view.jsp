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
        margin: 20px auto;
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
    span{
        display: inline-block;
        border-bottom: 2px solid rgb(231, 231, 231);
        margin-bottom: 5px;
        padding: 3px;
    }
    #qna_content_title{
        font-weight: bold;
        color: rgb(46, 46, 46);
    }
    #qna_content{
        width: 690px;
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
        width: 695px;
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

</style>
</head>
<body>
 	<c:if test="${sessionScope.login != 0}">
				<script>
					alert("권한이 없습니다. 로그인 후 이용해 주세요");
					location.href="loginView.do";
				</script>
	</c:if>
	<jsp:include page="../template/header.jsp"></jsp:include>
	<div id="container">
        <p id="headline">문의사항 관리자 페이지</p><!--헤드라인-->
		<div class="qna_title">
                 <div class="part_select">
                     <p id="qna_content_title"><label for="#">[아이디]</label></p>
                     <span>${requestScope.dto.writer }</span>
                 </div><!--아이디 입력란 마지막 자동 입력-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[제목]</label></p>
                     <span>${requestScope.dto.title }</span>
                 </div><!--제목 입력란-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[문의내용]</label></p>
                     <span id="qna_content">${requestScope.dto.content }</span>
                     </div>
                 </div><!--내용 입력란-->	
		<hr>
		<div id="qna_form"><!--답변 입력란-->
			<form action="answer.do" method="get">
				<input type="hidden" name="qno" value="${requestScope.dto.qno }">
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