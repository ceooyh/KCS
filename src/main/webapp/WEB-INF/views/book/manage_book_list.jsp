<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/book/manage_book_list.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/book/manage_book_list.js"></script>
<title>일반 사용자 예약내역페이지</title>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<img src="../../../img/reservationpage/reservation.png" id="reservation_headline_img">
    <section>
        <p id="headline_comment">사업자 고객 예약관리 테이블</p>
        <div id="reservation_table">
        <form action="" id="reservation_frm">
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
                        <th><p class="head_name">수락</p></th>
                        <th><p class="head_name">거절</p></th>
                    </tr>
                </thead>
                <tbody>
		                    <c:forEach var="dto" items="${requestScope.list }">
		                            <tr>
		                                <td id="td_bno"><p class="inside_content">${dto.bno}</p></td><!--번호-->
		                                <td><p class="inside_content">${dto.start_date}</p></td><!--시작일-->
		                                <td><p class="inside_content">${dto.end_date}</p></td><!--종료일-->
		                                <td><p class="inside_content">${dto.book_date}</p></td><!--예약일-->
		                                <td><p class="inside_content">${dto.contentId}</p></td><!--캠핑장 번호-->
		                                <td><p class="inside_content" id="dto_id">${dto.id}</p></td><!--예약자 아이디-->
		                                <td><p class="inside_content">${dto.status}</p></td><!--예약상태-->
		                                <td><p class="inside_content">${dto.facltNm}</p></td><!--캠핑장 이름-->
		                                <c:choose>
		                                	<c:when test="${dto.status == 0}">
				                                <td><p class="inside_content">
				                                <input type="hidden" name="bno" value="${dto.bno }">
				                                <a id="accept_click_button" href="#">수락</a></p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 1}">
				                                <td><p class="inside_content">수락완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 2}">
				                                <td><p class="inside_content">결제완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 3}">
				                                <td><p class="inside_content">이용완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 4}">
				                                <td><p class="inside_content">예약거절됨</p></td>
		                                	</c:when>
		                                </c:choose>
		                                <c:choose>
		                                	<c:when test="${dto.status == 0}">
				                                <td><p class="inside_content">
				                                <input type="hidden" name="bno" value="${dto.bno }">
				                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 1}">
				                                <c:choose>
		                                			<c:when test="${dto.start_date <= requestScope.today}">
						                                <td><p class="inside_content">기간만료</p></td>
		                                			</c:when>
		                                			<c:otherwise>
						                                <td><p class="inside_content">
						                                <input type="hidden" name="bno" value="${dto.bno }">
						                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</c:when>
		                                	<c:when test="${dto.status == 2}">
		                                		<c:choose>
		                                			<c:when test="${dto.start_date <= requestScope.today}">
						                                <td><p class="inside_content">기간만료</p></td>
		                                			</c:when>
		                                			<c:otherwise>
						                                <td><p class="inside_content">
						                                <input type="hidden" name="bno" value="${dto.bno }">
						                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</c:when>
		                                	<c:when test="${dto.status == 3}">
				                                <td><p class="inside_content">이용완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 4}">
				                                <td><p class="inside_content">예약거절됨</p></td>
		                                	</c:when>
		                                </c:choose>
		                            </tr>
		                    </c:forEach>
                </tbody>
            </table>
		</form>
        </div>
    </section>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>