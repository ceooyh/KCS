<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세페이지</title>
</head>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/qna/qna_detail_view.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/qna/qna_detail_view.js"></script>
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
                     	<textarea name="content" class="content" rows="90" cols="20"  <c:if test="${sessionScope.id ne requestScope.dto.writer }">readonly</c:if>>${requestScope.dto.content }</textarea>
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
		                        <td><textarea class="content" name="response" placeholder="답변 내용을 입력해 주세요"></textarea>
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