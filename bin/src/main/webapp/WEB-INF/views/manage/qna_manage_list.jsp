<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 상세페이지</title>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
	<div id="container">
		<h3 class="qna_title">
			<c:forEach var="dto" items="${requestScope.list }">
				${dto.title } | ${dto.writer } | ${dto.qdate } | ${dto.status }<br>
				${dto.content }<br>
			</c:forEach>
			<ul>
				<li>제목 : ${requestScope.dto.title }</li>
				<li>작성자 : ${requestScope.dto.writer }</li>
				<li>작성일 : ${requestScope.dto.qdate }</li>
				<c:choose>
					<c:when test="${requestScope.dto.status==0}">
						<li>미확인</li>
					</c:when>
					<c:when test="${requestScope.dto.status==1}">
						<li>확인</li>
					</c:when>
					<c:otherwise>
						<li>답변완료</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</h3>
		<div>
			<p>
				<b>문의내용</b>
			</p>
			<p class="qna_content">${requestScope.dto.content }</p>
		</div>
		<hr>
		<div id="qna_form">
			<form action="answer.do">
				<input type="hidden" name="qno" value="${requestScope.dto.qno }">
				<table>
					<tr>
						<td><textarea name="response" placeholder="답변 내용을 입력해 주세요">${requestScope.dto.response}</textarea>
						</td>
						<td>
							<button>답변하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>