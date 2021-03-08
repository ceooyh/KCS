<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>문의하기 페이지</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/qna/qna.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/qna/qna.js"></script>
</head>
<body>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<section>
		<div id="container">
            <p id="headline">QnA</p>
	
			<c:choose>
				
				<c:when test="${sessionScope.user_type == 0}">
					
					<div class="part">
						<table id="part_topic">
							<tr>
								<th class="part_No">[No]</th>
								<th class="part_title">[제목]</th>
								<th class="part_content">[내용]</th>
								<th id="part_select">[작성자]</th>
								<th id="part_select">[작성일]</th>
								<th id="part_select">[답변]</th>
							</tr>
	
                            <c:forEach var="qna" items="${requestScope.list }">
								<tr class="part_topic">
									<td class="part_No"><p>${qna.qno }</p></td>
									<td class="part_title"><a id="qna_link"
										href="qnaDetailView.do?qno=${qna.qno }">${qna.title }</a></td>
									<td class="part_content"><a id="qna_link"
										href="qnaDetailView.do?qno=${qna.qno }">${qna.content }</a></td>
									<td id="part_select"><p>${qna.writer}</p></td>
									<td id="part_select"><p>${qna.qdate }</p></td>
							        <td id="part_select">
											<c:choose>
											<c:when test="${qna.status == 0}">미확인</c:when>
											<c:when test="${qna.status == 1}">확인</c:when>
											<c:when test="${qna.status == 2}">답변완료</c:when>
										</c:choose>
									</td>
                                    </tr>
                                </c:forEach>
						</table>
					</div>
				</c:when>

				<c:otherwise>
					
					<div class="guestQnA">
						<form action="sendQnA.do" method="get">
							<div class="part_select">
								<p>
									<label for="#">[아이디]</label>
								</p>
								<span class="input_span"><input id="first_input" type="text" name="id" id="id" value="${sessionScope.id}" readonly></span>
							</div>
							

							<div class="part_select">
								<p>
									<label for="title">[제목]</label>
								</p>
								<span class="input_span"><input type="text" name="title"
									id="title" placeholder="제목을 입력해주세요"></span>
							</div>
						

							<div class="part_select">
								<p id="qna_content_title">
									<label for="title">[문의내용]</label>
								</p>
								<textarea name="content" id="content" cols="95" rows="20"
									placeholder="문의내용을 입력하세요"></textarea>
								<div>
									<button id="btn_enter" type="submit">문의 등록</button>
								</div>
							</div>
							
						</form>
					</div>


					<div class="part">
						
						<table id="part_topic">
							<tr>
								<th class="part_No">[No]</th>
								<th class="part_title">[제목]</th>
								<th class="part_content">[내용]</th>
								<th id="part_select">[작성자]</th>
								<th id="part_select">[작성일]</th>
								<th id="part_select">[답변]</th>
							</tr>

							<c:forEach var="qna" items="${requestScope.list }">
								<tr class="part_topic">
									<td class="part_No"><p>${qna.qno }</p></td>
									<td class="part_title"><a id="qna_link"
										href="qnaDetailView.do?qno=${qna.qno }">${qna.title }</a></td>
									<td class="part_content"><a id="qna_link"
										href="qnaDetailView.do?qno=${qna.qno }">${qna.content }</a></td>
									<td id="part_select"><p>${qna.writer}</p></td>
									<td id="part_select"><p>${qna.qdate }</p></td>
									<td id="part_select">
										<c:choose>
											<c:when test="${qna.status == 0}">미확인</c:when>
											<c:when test="${qna.status == 1}">확인</c:when>
											<c:when test="${qna.status == 2}">답변완료</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
			
			<div class="page_bar">
                <c:set var="page" value="${requestScope.page}" scope="page"/>
                <c:if test="${page.previousPageGroup }">
                    <a href=" qnaView.do?pageNo=${page.startPageOfPageGroup - 1 }"
						id="btn_page">◀</a>
                </c:if>
                <c:forEach var="i" begin="${page.startPageOfPageGroup}"
                    end="${page.endPageOfPageGroup}" step="1">
                    <a href="qnaView.do?pageNo=${i}" id="btn_page">${i}</a>
                </c:forEach>
                <c:if test="${page.nextPageGroup }">
                    <a href="qnaView.do?pageNo=${page.endPageOfPageGroup + 1 }"
						id="btn_page">▶</a>
                </c:if>
            </div>
		</div>
		<!--container 마지막 부분-->
	</section>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>