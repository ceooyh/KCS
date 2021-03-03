<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세페이지</title>
</head>
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
    #title{
        font-family: '굵은노토';
        font-size: 16px;
        color: rgb(46, 46, 46);
    }
    #span{
        display: inline-block;
        border-bottom: 2px solid rgb(231, 231, 231);
        margin-bottom: 5px;
        padding: 3px;
    }
    #title_input {
        border-bottom: 2px solid rgb(231, 231, 231);
        padding: 5px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        font-size: 16px;
        border: none;
    }

    .input_span input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
    }

    #title_input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
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
    #qna_response{
        width: 690px;
        height: 100px;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        display: inline-block;
        margin-bottom: 5px;
        padding: 3px;
        margin-top: 5px;
        margin-bottom: 10px;
    }
    #content{
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
    #content:focus {
		border: 2px solid rgb(46, 46, 46);
    }
   
    #btn_modify{
        width: 100px;
        margin-right: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
        border: 2px solid rgb(46, 46, 46);
        background-color: rgb(231, 231, 231);
        border-radius: 5px;
        font-family: '보통노토';
        font-size:16px;
        color: rgb(46, 46, 46);
        cursor: pointer;
        float: right;
    }
    
    #btn_delete{
        width: 100px;
        margin-right: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
        border: 2px solid rgb(46, 46, 46);
        background-color: rgb(231, 231, 231);
        border-radius: 5px;
        font-family: '보통노토';
        font-size:16px;
        color: rgb(46, 46, 46);
        cursor: pointer;
        float: right;
    }
    #btn_enter{
        width: 100px;
        margin-right: 5px;
        margin-top: 10px;
        margin-bottom: 5px;
        border: 2px solid rgb(46, 46, 46);
        background-color: rgb(231, 231, 231);
        border-radius: 5px;
        font-family: '보통노토';
        font-size:16px;
        color: rgb(46, 46, 46);
        cursor: pointer;
        float: right;
    }
    #btn_modify:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(231, 231, 231);
    }
    #btn_delete:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(231, 231, 231);
    }

    #btn_enter:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(231, 231, 231);
    }
    hr{
        margin: 10px 0px;
        clear: both;
    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function delete_qna(obj) {
		var data = "";
		data = "qno=" + $(obj).prev().val();
		alert(data);
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
	
</script>
</head>
<body>
	<jsp:include page="../template/header2.jsp"></jsp:include>
	<div id="container">
        <p id="headline">QnA</p><!--헤드라인-->
			<form action="qnaUpdate.do" method="get">
				<input type="hidden" name="qno" value="${requestScope.dto.qno }">
				<div class="qna_title">
    	             <div class="part_select">
        	             <p id="qna_content_title"><label for="#">[아이디]</label></p>
            	         <span id="span">${requestScope.dto.writer }</span>
                	 </div><!--아이디-->
                 
                 	<div class="part_select">
                    	 <p id="qna_content_title"><label for="title">[제목]</label></p>
                     	<span class="input_span"><input id="title_input" type="text" name="title"  value="${requestScope.dto.title }" <c:if test="${sessionScope.id ne requestScope.dto.writer }">readonly</c:if>></span>
                 	</div><!--제목-->
                 
                	<div class="part_select">
                    	 <p id="qna_content_title"><label for="title">[문의내용]</label></p>
                     	<textarea name="content" id="content" rows="90" cols="20"  <c:if test="${sessionScope.id ne requestScope.dto.writer }">readonly</c:if>>${requestScope.dto.content }</textarea>
                     	</div>
                 	</div><!--내용-->	
                
               	 <div id="btn_update">
                		<input type="hidden" value="${requestScope.dto.qno }">
                	    	<button id="btn_delete" type="button">삭제</button>
                    	<c:if test="${sessionScope.status != 2 }">
                    	    <button id="btn_modify">수정</button>
                  	 	 </c:if>
                </div>
			</form>
			<hr>
			<c:if test="${requestScope.dto.status == 2 }">
	            <div class="response">
	                <p id="qna_content_title"><label for="title">[답변내용]</label></p>
	                <span id="qna_response">${requestScope.dto.response}</span>
	            </div> <!--답변-->
			</c:if>
            <c:if test="${requestScope.dto.status != 2 && sessionScope.user_type == 0}">
            	<div id="qna_form"><!--답변 입력란-->
					<form action="qnaAdminAnswer.do" method="get" id="admin_answer">
						<input type="hidden" name="qno" value="${requestScope.dto.qno }">
		                    <p id="qna_content_title"><label for="title">[답변]</label></p>
						<table>
		                    <tr>
		                        <td><textarea name="response" placeholder="답변 내용을 입력해 주세요"></textarea>
								</td>
							</tr>
						</table>
		                    <button id="btn_enter">답변 등록</button>
					</form>
				</div>
            </c:if>
		</div><!--container-->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>