<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/keep/keep_spot_view.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<title>찜한 스팟 페이지</title>
</head>
<body>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<img src="../../../img/reservationpage/reservation.png"
		id="reservation_headline_img">
	<section>
		<p id="headline_comment">찜한 스팟 목록</p>
		<div id="reservation_table">
			<c:forEach var="dto" items="${ requestScope.list}">
                <div id="camping_info_list">
                    <div id="spot_main_img">
                    	<c:choose>
							<c:when test="${dto.firstImageUrl eq '-'}">
		                        <img src="../../../img/searchpage/noimg.png">
							</c:when>
							<c:when test="${dto.firstImageUrl ne '-'}">
		                        <img src="${dto.firstImageUrl}">
							</c:when>
                    	</c:choose>
                    </div>
                    <div id="spot_main_content">
                        <span id="spot_name_title"><a href="spotDetailView.do?contentId=${dto.contentId}&facltNm=${dto.facltNm}">${dto.facltNm}</a></span><br>
                        <span id="online_intro">${dto.lineIntro}</span><br>
                        <span id="spot_address_title" class="spot_title">${dto.addr1} ${dto.addr2} </span><br>
                        <span id="spot_tel_title" class="spot_title">${dto.tel}</span><br>
                        <span id="spot_homepage_title" class="spot_title"><a href="${dto.homepage}">${dto.homepage}</a></span><br>
                        <span id="spot_theme_title">
                            <span>[부대시설]</span>
                            <p>${dto.sbrsCl}</p>
                        </span>
                        <span id="resevation_btn"><a href="bookView.do?contentId=${dto.contentId }&facltNm=${dto.facltNm}">예약하기</a></span>
                        <span id="keep_btn"><a href="keepDeleteAction.do?contentId=${dto.contentId}">찜삭제</a></span>
                    </div>
                    <div  id="spot_main_otherinfo">
                    	<c:choose>
                    		<c:when test="${dto.manageSttus eq '운영'}">
	                        	<span class="camping_status_info" id="status_open">OPEN</span>
                    		</c:when>
                    		<c:when test="${dto.manageSttus ne '운영'}">
	                        	<span class="camping_status_info" id="status_close">CLOSE</span>
                    		</c:when>
                    	</c:choose>
                    </div>
                </div>
                <hr id="h1_down_row">
            </c:forEach>
			
			
		</div>
	</section>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>