<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/book/book.css">
<title>예약 페이지</title>
</head>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	    <section>
	        <form action="bookAction.do">
	            <div id="form_container">
	                <div id="img_insert">
	                    <span id="reservation_campimg" style="background-image: url(${requestScope.firstImageUrl})">${requestScope.facltNm}</span>
	                </div>
	                <div id="date_insert">
	                    <span id="start_date_insert">
	                        <span class="date_headline">예약 시작일</span>
	                        <input id="start_date" name="start_date" type="date" min="${requestScope.today}">
	                    </span>
	                    <span id="end_date_insert">
	                        <span class="date_headline">예약 종료일</span>
	                        <input id="end_date" name="end_date" type="date" max="${requestScope.today}+365">
	                    </span>
	                </div>
	                <div id="button_insert">
	                    <button class="book_btn" id="btn_reservation" type="submit">예약하기</button>
	                    <button class="book_btn" type="reset">초기화하기</button>
	                    <button  class="book_btn"  type="button" onclick="location.href='indexView.do';">돌아가기</button>
	                </div>
	            </div>
	            <input type="hidden" name="contentId" value="${requestScope.contentId}">
	            <input type="hidden" name="facltNm" value="${requestScope.facltNm}">
	            <input type="hidden" name="bizrno" value="${requestScope.bizrno}">
	        </form>
	    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>