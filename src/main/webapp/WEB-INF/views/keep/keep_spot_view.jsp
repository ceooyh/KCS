<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 스팟 페이지</title>
<style type="text/css">
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

@font-face {
	font-family: '에스코어8';
	src: url(../../../Font/S-Core_Dream_OTF/SCDream8.otf);
}

@font-face {
	font-family: '에스코어7';
	src: url(../../../Font/S-Core_Dream_OTF/SCDream7.otf);
}

@font-face {
	font-family: '에스코어6';
	src: url(../../../Font/S-Core_Dream_OTF/SCDream6.otf);
}

@font-face {
	font-family: '에스코어5';
	src: url(../../../Font/S-Core_Dream_OTF/SCDream5.otf);
}

@font-face {
	font-family: '에스코어4';
	src: url(../../../Font/S-Core_Dream_OTF/SCDream4.otf);
}

* {
	padding: 0;
	margin: 0;
}

section {
	margin-bottom: 100px;
}

#headline_comment {
	text-align: center;
	font-family: '굵은노토';
	color: rgb(46, 46, 46);
	margin-bottom: 40px;
	margin-top: 40px;
	font-size: 32px;
}

#reservation_table {
	width: 1500px;
	margin: 0 auto;
	margin-top: 40px;
}

#reservation_table table {
	border-collapse: collapse;
}

.head_name {
	width: 150px;
	height: 30px;
	font-size: 14px;
	padding-top: 10px;
	text-align: center;
	color: rgb(46, 46, 46);
	border-top: 2px solid rgb(215, 215, 215);
	border-bottom: 2px solid rgb(215, 215, 215);
	font-family: '굵은노토';
}

.inside_content {
	width: 150px;
	height: 60px;
	padding-top: 30px;
	font-size: 14px;
	text-align: center;
	color: rgb(46, 46, 46);
	border-bottom: 1px solid rgb(215, 215, 215);
	font-family: '굵은노토';
}

#status_click_button {
	text-decoration: none;
	color: rgb(46, 46, 46);
	background-color: rgb(233, 233, 233);
	border: 1px solid rgb(46, 46, 46);
	border-radius: 5px;
	padding: 4px;
}

#status_click_button:hover {
	color: rgb(233, 233, 233);
	background-color: rgb(46, 46, 46);
	border: none;
}

#reservation_headline_img {
	width: 100%;
}

/*캠핑장 리스트 목록 css */
#spot_detail_search_container {
	border-bottom: 2px solid rgb(165, 165, 165);
	margin-bottom: 40px;
}

#detail_camping_info {
	width: 1200px;
	margin: 0 auto;
}

#detail_camping_info h1 {
	margin-bottom: 40px;
	font-family: '굵은노토';
	font-size: 30px;
	color: rgb(44, 42, 41);
}

#h1_down_row {
	margin-top:15px;
	margin-bottom: 10px;
}

#camping_info_list {
	width: 100%;
	box-sizing: border-box;
	height: 300px;
	margin-bottom: 10px;
	position: relative;
}

#spot_main_img {
	position: absolute;
	left: 0;
	width: 30%;
	height: 100%;
	box-sizing: border-box;
	margin: 0;
	box-sizing: border-box;
	padding: 20px;
}

#spot_main_img>img {
	width: 100%;
	height: 100%;
	border: 1px solid rgb(44, 42, 41);
	box-shadow: 3px 3px 3px gray;
}

#spot_main_content {
	position: absolute;
	left: 30%;
	width: 50%;
	height: 100%;
	box-sizing: border-box;
	margin: 0;
	box-sizing: border-box;
	padding: 20px;
}

#spot_main_otherinfo {
	position: absolute;
	right: 0;
	width: 20%;
	height: 100%;
	box-sizing: border-box;
	margin: 0;
	box-sizing: border-box;
	padding: 20px;
}

#spot_name_title {
	display: inline-block;
	font-family: '에스코어8';
	font-size: 32px;
	margin-bottom: 10px;
}

#spot_name_title>a {
	/*text-shadow: 2px 2px 2px rgb(163, 163, 162);*/
	text-decoration: none;
	color: rgb(252, 177, 80);
}

#spot_name_title>a:hover {
	color: rgb(172, 245, 130);
	text-decoration: underline;
}

#online_intro {
	display: inline-block;
	font-family: '에스코어5';
	font-size: 23px;
	color: rgb(44, 42, 41);
	margin-bottom: 10px;
}

.spot_title {
	display: inline-block;
	font-size: 14px;
	font-family: '에스코어5';
	color: rgb(44, 42, 41);
	padding-left: 25px;
	box-sizing: border-box;
	height: 30px;
	vertical-align: middle;
}

#spot_address_title {
	background-image: url(../../../img/searchpage/location.png);
	background-size: 20px;
	background-repeat: no-repeat;
}

#spot_tel_title {
	background-image: url(../../../img/searchpage/telephone.png);
	background-size: 20px;
	background-repeat: no-repeat;
}

#spot_homepage_title {
	background-image: url(../../../img/searchpage/homepage.png);
	background-size: 20px;
	background-repeat: no-repeat;
}

#spot_homepage_title a {
	color: rgb(44, 42, 41);
	font-family: '에스코어5';
	text-decoration: none;
}

#spot_homepage_title a:hover {
	text-decoration: underline;
}

.camping_status_info {
	font-family: '두꺼운로보';
	display: inline-block;
	font-size: 12px;
	color: white;
	width: 40px;
	height: 40px;
	vertical-align: middle;
	text-align: center;
	box-sizing: border-box;
	padding-top: 14px;
	border-radius: 50%;
}

#status_open {
	background-color: rgb(18, 0, 180);
}

#status_close {
	background-color: rgb(170, 0, 0);
}

#spot_theme_title {
	display: inline-block;
	width: 100%;
	height: 74px;
	border: 1px solid rgb(252, 177, 80);
	padding: 10px;
	box-sizing: border-box;
}

#spot_theme_title span {
	display: inline-block;
	font-family: '에스코어7';
	color: rgb(44, 42, 41);
	font-size: 13px;
	margin-bottom: 10px;
}

#spot_theme_title p {
	font-family: '에스코어5';
	font-size: 12px;
	padding-left: 20px;
	letter-spacing: 2px;
}

#keep_btn {
	text-align: center;
	display: inline-block;
	height: 32px;
	width: 100px;
	background-color: rgb(50, 102, 136);
	box-sizing: border-box;
	font-size: 14px;
}

#resevation_btn {
	display: inline-block;
	width: 100px;
	height: 32px;
	background-color: rgb(248, 169, 79);
	box-sizing: border-box;
	text-align: center;
	font-size: 14px;
}

#resevation_btn a {
	display: inline-block;
	padding-top: 7px;
	width: 100%;
	height: 100%;
	text-decoration: none;
	font-family: '에스코어5';
	color: white;
}
#keep_btn a {
	display: inline-block;
	padding-top: 7px;
	width: 100%;
	height: 100%;
	font-family: '에스코어5';
	text-decoration: none;
	color: white;
}

#keep_btn a:hover {
	background-color: rgb(50, 102, 136);
}
#resevation_btn a:hover {
	background-color: rgb(248, 169, 79);
}
</style>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
</script>
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