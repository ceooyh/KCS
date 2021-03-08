<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/book/guest_book_list.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<title>일반 사용자 예약내역페이지</title>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<img src="../../../img/reservationpage/reservation.png" id="reservation_headline_img">
    <section>
        <p id="headline_comment">고객 예약테이블</p>
        <div id="reservation_table">
            <table>
                <thead>
                    <tr>
                        <th><p class="head_name">예약번호</p></th>
                        <th><p class="head_name">시작일</p></th>
                        <th><p class="head_name">종료일</p></th>
                        <th><p class="head_name">예약일</p></th>
                        <th><p class="head_name">캠핑장번호</p></th>
                        <th><p class="head_name">예약자 아이디</p></th>
                        <th><p class="head_name">예약 상태</p></th>
                        <th><p class="head_name">캠핑장 이름</p></th>
                        <th><p class="head_name"></p></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${requestScope.list }">
                        <tr>
                            <td><p class="inside_content">${dto.bno}</p></td>
                            <td><p class="inside_content">${dto.start_date}</p></td>
                            <td><p class="inside_content">${dto.end_date}</p></td>
                            <td><p class="inside_content">${dto.book_date}</p></td>
                            <td><p class="inside_content">${dto.contentId}</p></td>
                            <td><p class="inside_content">${sessionScope.id}</p></td>
                            <c:choose>
                            	<c:when test="${dto.status == 0}">
		                            <td><p class="inside_content">예약대기중</p></td>
                            	</c:when>
                            	<c:when test="${dto.status == 1}">
		                            <td><p class="inside_content">예약확정</p></td>
                            	</c:when>
                            	<c:when test="${dto.status == 2}">
		                            <td><p class="inside_content">결제완료</p></td>
                            	</c:when>
                            	<c:when test="${dto.status == 3}">
		                            <td><p class="inside_content">후기작성완료</p></td>
                            	</c:when>
                            	<c:when test="${dto.status == 4}">
		                            <td><p class="inside_content">예약거절됨</p></td>
                            	</c:when>
                            </c:choose>
                            <td><p class="inside_content"><a id="facltNm_href" href="spotDetailView.do?contentId=${dto.contentId}&facltNm=${dto.facltNm}">${dto.facltNm}</a></p></td>
                            <c:choose>
                            	<c:when test="${dto.status <= 1}">
		                            <td><p class="inside_content"><a id="status_click_button" href="guestBookCancel.do?bno=${dto.bno}">예약취소</a></p></td>
                            	</c:when>
                            	<c:when test="${requestScope.today >= dto.start_date && dto.status < 3}">
		                            <td><p class="inside_content"><a id="status_click_button" href="reviewWriteView.do?contentId=${dto.contentId}&facltNm=${dto.facltNm}&bno=${dto.bno}">후기남기기</a></p></td>
                            	</c:when>
                            	<c:otherwise><td><p class="inside_content"></p></td></c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>