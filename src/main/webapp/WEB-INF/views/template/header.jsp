<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Header</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
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
    * {
            margin: 0;
            padding: 0;
    }
    nav {
        width: 100%;
        position:fixed;
        text-align: center;
        background-color: rgb(226, 226, 226);
    }
    #company_logo_text{
        float: left;
    }
    
    #headline_logo_text{
        margin-top: 12px;
        margin-left: 30px;
        font-family: '굵은노토';
        font-size: 20px;
    }
    nav a {
        text-decoration: none;
        color: rgb(46, 46, 46);
        font-weight: bold;
        font-family: '보통노토';
    }
    nav a:hover {
	   color: #ecc34f;
    }
    nav ul {
   		height:100%;
        list-style-type: none;
        margin: 0 auto;
        display: inline-block;
        text-align: center;
    }
    .dropbtn{
    	box-sizing:border-box;
        list-style: none;
        width: 170px;
        height: 100%;
        text-align: center;
        padding:20px 0px;
        box-sizing: border-box;
        display: inline-block;
        position: relative;
        color: white;
        padding: 16px;
        font-size: 16px;
    }
    .dropbtn_hcon {
        list-style: none;
        width: 170px;
        height: 100%;
        text-align: center;
        padding:20px 0px;
        box-sizing: border-box;
        display: inline-block;
        position: relative;
        color: white;
        padding: 16px;
        font-size: 16px;
    }
     nav #login{
        font-family: '굵은노토';
        width: 200px;
        float: right;
        margin:0;
        margin-top: 7px;
        color: rgb(46, 46, 46);
    }

    .dropdown {
            display: inline-block;
            padding: 0;
            box-sizing: border-box;
    }

    .dropdown-content {
            display: none;
            position: absolute;
            z-index: 10;
            text-align: center;
            width: 100%;
            height:150px;
            left: 0;
            top:50px;
	    	background-color: rgb(226, 226, 226);
    }
    .dropdown-content a {
            text-decoration: none;
    }
    .dropdown-content-li{
    	margin-bottom: 20px;
    	height: 20px;
    }
    .dropdown-content-li:first-child{
    	margin-top: 20px;
    }
    
    .dropdown-content a:hover{
        color: #ecc34f;
    }
    .dropdown-content1 {
            display: none;
            position: absolute;
            z-index: 10;
            text-align: center;
            width: 100%;
            height:70px;
            left: 0;
            top:50px;
	    	background-color: rgb(226, 226, 226);
    }
    .dropdown-content1 a {
            text-decoration: none;
    }
    .dropdown-content1-li{
    	margin-bottom: 20px;
    	height: 20px;
    }
    .dropdown-content1-li:first-child{
    	margin-top: 20px;
    }
    
    .dropdown-content1 a:hover{
        color: #ecc34f;
    }
    
    .dropbtn_hcon:hover .dropdown-content {display: block;}
    .dropbtn_hcon:hover .dropdown-content1 {display: block;}
    
</style>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.login == null}">
        <nav>
            <div id="company_logo_text">
                <p id="headline_logo_text"><a id="title_companyLogo" href="indexView.do">KOREACAMPSPOT</a></p>
            </div>
            <div class="dropdown">
                <ul>
                    <li class="dropbtn"><a href="infoView.do">소개</a></li>
                    <li class="dropbtn"><a href="findCampSpotView.do">캠핑 스팟 찾기</a></li>
                    <li class="dropbtn"><a href="keepCampSpotView.do">찜한 스팟</a></li>
                    <li class="dropbtn"><a href="selectJoinView.do">회원가입</a></li>
                    <li class="dropbtn"><a href="loginView.do">로그인</a></li>
                </ul>
            </div>
        </nav>
    </c:when>



    <c:when test="${sessionScope.user_type == 1}">
        <nav>
            <div id="company_logo_text">
                <p id="headline_logo_text"><a id="title_companyLogo" href="indexView.do">KOREACAMPSPOT</a></p>
            </div>
            <div class="dropdown">
                <ul>
                            <li class="dropbtn"><a href="infoView.do">소개</a></li>
                            <li class="dropbtn"><a href="findCampSpotView.do">캠핑 스팟 찾기</a></li>
                            <li class="dropbtn"><a href="keepCampSpotView.do">찜한 스팟</a></li>
                            <li class="dropbtn"><a href="qnaView.do">문의하기</a></li>
                            <li class="dropbtn_hcon"><a href="questMyPageView.do">마이 페이지</a>
                                <ul class="dropdown-content">
                                    <li class="dropdown-content-li"><a href="guestInfoUpdateView.do">개인정보수정</a></li>
                                    <li class="dropdown-content-li"><a href="guestFavoriteUpdateView.do">취향정보수정</a></li>
                                    <li class="dropdown-content-li"><a href="guestBookListView.do">캠핑장예약내역</a></li>
                                </ul>
                            </li>
                            <li class="dropbtn"><a href="boardList.do">게시판</a></li>
                            <li class="dropbtn"><a href="logoutAction.do">로그아웃</a></li>
                </ul>
            </div>
          <div id="login">
                <table>
                    <tr>
                        <td><img src="../../../img/mainpage/사람 아이콘.png" style="width:32px;"></td>
                        <td>${sessionScope.id}님 로그인</td>
                    </tr>
                </table>
            </div>
        </nav>
    </c:when>



    <c:when test="${sessionScope.user_type == 2}">
			<nav>
				<div id="company_logo_text">
                    <p id="headline_logo_text"><a id="title_companyLogo" href="indexView.do">KOREACAMPSPOT</a></p>
                </div>
                <div class="dropdown">
                    <ul>
                        <li class="dropbtn"><a href="infoView.do">소개</a></li>
                        <li class="dropbtn_hcon"><a href="#">캠핑장 등록</a>
                            <ul class="dropdown-content">
                                <li class="dropdown-content-li"><a href="applySpotView.do">캠핑장 등록 신청</a></li>
                                <li class="dropdown-content-li"><a href="applySpotStatusView.do">캠핑장 신청/현황</a></li>
                                <li class="dropdown-content-li"><a href="applySpotListView.do">캠핑장 관리</a></li>
                            </ul>
                        </li>
                        <li class="dropbtn"><a href="manageBookListView.do">예약 관리</a></li>
                        <li class="dropbtn"><a href="qnaView.do">문의하기</a></li>
                        <li class="dropbtn_hcon"><a href="#">마이 페이지</a>
                            <ul class="dropdown-content1">
                                <li class="dropdown-content-li"><a href="businessInfoUpdateView.do">사업자정보수정</a></li>
                            </ul>
                        </li>
                        <li class="dropbtn"><a href="logoutAction.do">로그아웃</a></li>
                    </ul>
                </div>
            <div id="login">
                <table>
                    <tr>
                        <td><img src="../../../img/mainpage/사람 아이콘.png" style="width:32px;"></td>
                        <td>${sessionScope.id}님 로그인</td>
                    </tr>
                </table>
            </div>
			</nav>
		</c:when>



        <c:when test="${sessionScope.user_type == 0}">
			<nav>
                <div id="company_logo_text">
                    <p id="headline_logo_text"><a id="title_companyLogo" href="indexView.do">KOREACAMPSPOT</a></p>
                </div>
                <div class="dropdown">
                    <ul>
                        <li class="dropbtn"><a href="applyManageListView.do">캠핑장 등록 허가</a></li>
                        <li class="dropbtn"><a href="memberManageListView.do">회원 관리</a></li>
                        <li class="dropbtn"><a href="qnaView.do">문의 관리</a></li>
                        <li class="dropbtn"><a href="boardView.do">게시판</a></li>
                        <li class="dropbtn"><a href="logoutAction.do">로그아웃</a></li>
                    </ul>
                </div>
            <div id="login">
                <table>
                    <tr>
                        <td><img src="../../../img/mainpage/사람 아이콘.png" style="width:32px;"></td>
                        <td>${sessionScope.id}님 로그인</td>
                    </tr>
                </table>
            </div>
			</nav>
		</c:when>
</c:choose>
</body>
</html>