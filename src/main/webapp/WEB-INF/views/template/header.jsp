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
    <link rel="stylesheet" href="../../../css/fonts/font.css">
    <link rel="stylesheet" href="../../../css/template/header.css">

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
                    <li class="dropbtn_hcon"><a href="findCampSpotView.do">캠핑 스팟 찾기</a>
                    	<ul class="dropdown-content2">
                            <li class="dropdown-content-li"><a href="findCampSpotView.do">캠핑장 키워드 검색</a></li>
                            <li class="dropdown-content-li"><a href="spotCategorySearch.do">캠핑장 상세 검색</a></li>
                        </ul>
                    </li>
                    <li class="dropbtn"><a href="keepSpotView.do">찜한 스팟</a></li>
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
                            <li class="dropbtn_hcon"><a href="findCampSpotView.do">캠핑 스팟 찾기</a>
                            	<ul class="dropdown-content2">
                                    <li class="dropdown-content-li"><a href="findCampSpotView.do">캠핑장 키워드 검색</a></li>
                                    <li class="dropdown-content-li"><a href="spotCategorySearch.do">캠핑장 상세 검색</a></li>
                                </ul>
                            </li>
                            <li class="dropbtn"><a href="keepSpotView.do">찜한 스팟</a></li>
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
                        <li class="dropbtn"><a href="memberManageListView.do">회원 관리</a></li>
                        <li class="dropbtn"><a href="qnaView.do">문의 관리</a></li>
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
</c:choose>
</body>
</html>