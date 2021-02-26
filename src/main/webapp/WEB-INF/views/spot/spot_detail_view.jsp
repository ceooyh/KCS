<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     @font-face {
        font-family: '보통노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Medium.otf);
    }
    @font-face {
        font-family: '얇은노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Light.otf);
    }
    @font-face {
        font-family: '얇은노토2';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-DemiLight.otf);
    }
    @font-face {
        font-family: '굵은노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Black.otf);
    }
    @font-face {
        font-family: '검은고딕';
        src: url(Font/검은고딕/OFL.txt);
    }
    @font-face {
        font-family: '보통로보';
        src: url(Font/Roboto/Roboto-Medium.ttf);
    }
    @font-face {
        font-family: '두꺼운로보';
        src: url(Font/Roboto/Roboto-Bold.ttf);
    }
    @font-face {
        font-family: '에스코어8';
        src: url(Font/S-Core_Dream_OTF/SCDream8.otf);
    }
    @font-face {
        font-family: '에스코어7';
        src: url(Font/S-Core_Dream_OTF/SCDream7.otf);
    }
    @font-face {
        font-family: '에스코어6';
        src: url(Font/S-Core_Dream_OTF/SCDream6.otf);
    }
    @font-face {
        font-family: '에스코어5';
        src: url(Font/S-Core_Dream_OTF/SCDream5.otf);
    }
    @font-face {
        font-family: '에스코어4';
        src: url(Font/S-Core_Dream_OTF/SCDream4.otf);
    }
    *{
        padding: 0;
        margin: 0;
    }
    #maintitle_img_headline{
        width: 1920px;
        height: 320px;
        box-sizing: border-box;
        background-image: url(img/detail_camping_viewimg.png);
    }
    #headLine_row{
        width: 100%;
        height: 20px;
        background-color: rgb(236, 236, 236);
    }
    section{
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }
    #maintitle_name_div{
        width: 1200px;
        margin: 0 auto;
        height: 320px;
        box-sizing: border-box;
    }
    #camping_sname_ptag{
        display: inline-block;
        font-family: '에스코어7';
        font-size: 32px;
        color: rgb(236, 236, 236);
        margin-top: 80px;
        margin-bottom: 10px;
        text-shadow: 3px 3px 3px black;
    }
    #camping_address_ptag{
        display: inline-block;
        font-family: '에스코어4';
        font-size: 21px;
        color: rgb(236, 236, 236);
        margin-bottom: 15px;
        text-shadow: 1px 1px 1px black;
    }
    #maintitle_name_div hr{
        border: 1px solid rgb(236, 236, 236);
        margin-bottom: 15px;
    }
    #tag_name{
        display: inline-block;
        color: rgb(236, 236, 236);
        font-family: '얇은노토';
        font-size: 15px;
        width: 50px;
        height: 30px;
        padding-top: 3px;
        box-sizing: border-box;
        border: 1px solid rgb(236, 236, 236);
        border-radius: 15px;
        text-align: center;
        margin-right: 10px;
    }
    #tag_content{
        font-family: '얇은노토';
        color: rgb(236, 236, 236);
    }
    section{
        width: 1200px;
        margin-bottom: 80px;
    }

    /*최초 캠핑장 정보 내역*/
    #main_content_container{
        position: relative;
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        margin-bottom: 50px;
        height: 500px;
        box-sizing: border-box;
    }
    #main_content_img{
        position: absolute;
        left: 0;
        width: 60%;
        height: 100%;
        box-sizing: border-box;
        padding: 10px;
    }
    #main_content_img img{
        width: 100%;
        height: 100%;
    }
    #maint_content_info{
        position: absolute;
        right: 0;
        width: 40%;
        height: 100%;
        box-sizing: border-box;
        padding: 10px;
    }
    .detail_content_div{
        position: relative;
        height: 10%;
        box-sizing: border-box;
        margin: 0;
        border-bottom: 1px solid rgb(236, 236, 236);
    }
    .detail_content_div_first{
        position: absolute;
        left: 0;
        box-sizing: border-box;
        width: 25%;
        height: 100%;
        vertical-align: middle;
        padding-top: 14px;
        padding-left: 20px;
        font-size: 14px;
        font-family: '에스코어6';
        color: rgb(44,42,41);
    }
    #detail_content_div_first{
        border-top: 2px solid red;
    }
    #detail_content_div_second{
        border-top: 2px solid rgb(44,42,41);
    }
    .detail_content_div_second{
        position: absolute;
        right: 0;
        box-sizing: border-box;
        width: 75%;
        height: 100%;
        vertical-align: middle;
        padding-top: 14px;
        padding-left: 15px;
        font-size: 13px;
        font-family: '에스코어4';
    }
    /*찜하기 예약하기 버튼 CSS*/
    .detail_content_div:last-child{
        padding-top: 8px;
    }
    #resevation_btn{
        display: inline-block;
        width: 30%;
        height: 80%;
        background-color: rgb(248, 169, 79);
        box-sizing: border-box;
        text-align: center;
        font-size: 14px;
    }
    #resevation_btn a{
        display: inline-block;
        padding-top: 7px;
        width: 100%;
        height: 100%;
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    #keep_btn{
        text-align: center;
        display: inline-block;
        height: 80%;
        width: 30%;
        background-color: rgb(50, 102, 136);
        box-sizing: border-box;
        font-size: 14px;
    }
    #keep_btn a{
        display: inline-block;
        padding-top: 7px;
        width: 100%;
        height: 100%;
        font-family: '에스코어5';
        text-decoration: none;
        color: white;
    }
    #homepage_move_btn{text-decoration: none; color: rgb(153, 153, 153);}
    #resevation_btn a:hover{background-color:rgb(248, 169, 79);}
    #keep_btn a:hover{background-color: rgb(50, 102, 136);}



    /*캠핑장 정보 안의 메뉴창 CSS*/
    #detail_information_maincontent{
        width: 1200px;
        margin: 30px auto;
    }
    .detail_information_menubar1{
        margin-bottom: 30px;
    }
    .detail_information_menubar1 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar1 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar1 td:first-child{
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .detail_information_menubar1 td:nth-child(2){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar1 td:nth-child(3){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar2{
        margin-bottom: 30px;
    }
    .detail_information_menubar2 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar2 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar2 td:first-child{
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar2 td:nth-child(2){
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .detail_information_menubar2 td:nth-child(3){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3{
        margin-bottom: 30px;
    }
    .detail_information_menubar3 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar3 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar3 td:first-child{
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3 td:nth-child(2){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3 td:nth-child(3){
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .menubar1-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }
    .menubar1-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar1-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar2-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar2-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }
    .menubar2-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }

    /*캠핑장 위치정보 CSS*/
    #detail_information_image{
        width: 1000px;
        height: 600px;
        margin: 0 auto;
        /*background-color: rgb(247, 186, 186);*/
        border: 1px solid rgb(236, 236, 236);
        text-align: center;
        box-sizing: border-box;
        margin-bottom: 30px;
    }

    /*캠핑장 긴글소개 CSS*/
    #detail_information_longinfo{
        width: 1200px;
        margin: 0 auto;
        margin-bottom: 30px;
        padding: 15px 0;
        font-family: '얇은노토';
        font-size: 14px;
        border-top: 2px solid rgb(44,42,41);
        border-bottom: 1px solid rgb(128, 126, 126);
    }


    /*캠핑장 시설정보 CSS*/
    #detail_information_detailinfo{
        width: 1200px;
        margin: 0 auto;
    }
    .camp_facility_info{
        display: inline-block;
        font-family: '에스코어6';
        color: rgb(44,42,41);
        font-size: 20px;
        margin-bottom: 10px;
    }

    /*캠핑장 시설정보 아이콘 CSS*/
    #container_icon{
        width: 100%;
        padding: 30px;
        box-sizing: border-box;
        /*background-color: rgb(117, 101, 101);*/
        border: 1px solid rgb(128, 126, 126);
        margin-bottom: 50px;
    }
    .icon_container{
        display: inline-block;
        width: 90px;
        height: 110px;
        box-sizing: border-box;
        margin-right: 30px;
    }
    #img_span{
        display: inline-block;
        width: 90px;
        height: 90px;
        box-sizing: border-box;
    }
    #img_span img{
        width: 100%;
        height: 100%;
    }
    #icon_index{
        width: 90px;
        height: 20px;
        box-sizing: border-box;
        text-align: center;
        font-family: '에스코어5';
        font-size: 13px;
        color: rgb(44,42,41);
    }


    /*상세정보창 CSS*/
    #container_info{
        width: 1200px;
        position: relative;
    }
    .container_info_first{
        position: absolute;
        left: 0;
        width: 20%;
    }
    .container_info_second{
        position: absolute;
        right: 0;
        width: 80%;
        height: 20px;
    }
    #camp_facility_info{
        width: 1200px;
    }
    .container_info_category{
        width: 1200px;
        position: relative;
        height: 40px;
        margin: 0;
    }
    .container_info_first{
        position: absolute;
        left: 0;
        width: 10%;
        height: 40px;
        box-sizing: border-box;
        padding: 10px;
        font-family: '에스코어7';
        font-size: 13px;
        color: rgb(44,42,41);
    }
    .container_info_second{
        /*background-color: rgb(231, 231, 231);*/
        margin: 0;
        position: absolute;
        right: 0;
        width: 90%;
        height: 40px;
        box-sizing: border-box;
        padding: 10px;
        border-bottom: 1px solid rgb(128, 126, 126);
        font-family: '에스코어5';
        font-size: 13px;
        color: rgb(153, 153, 153);
    }
    #top_category1{
        border-top: 2px solid red;
    }
    #top_category2{
        border-top: 2px solid rgb(44,42,41);
    }
    #last_category1{
        border-bottom: 2px solid rgb(44,42,41);
    }
    #last_category2{
        border-bottom: 2px solid rgb(44,42,41);
    }
</style>
</head>
<body>
    <div id="maintitle_img_headline">
        <c:forEach var="dto" items="${requestScope.list}">
            <div id="maintitle_name_div">
                <span id="camping_sname_ptag">한티별빛아래관광농원 야영장</span><br>
                <span id="camping_address_ptag">경상북도 칠곡군 가산면 응추리</span>
                <hr>
            </div>
        </c:forEach>
    </div>
    <div id="headLine_row"></div>
    <section>
        <div id="main_content_container"><!--머릿글부분 시작-->
            <div id="main_content_img"><!--캠핑장 이미지-->
                <img src="img/searchpage/캠핑장사진.jpg" alt="">
            </div><!--캠핑장 이미지-->
            <div id="maint_content_info"><!--캠핑장 내용 시작-->
                <div class="detail_content_div">
                    <span class="detail_content_div_first" id="detail_content_div_first">주소</span>
                    <span class="detail_content_div_second" id="detail_content_div_second">경상북도 칠곡군 가산면 응추리</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">연락처</span>
                    <span class="detail_content_div_second">054-972-8032</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">캠핑장 환경</span>
                    <span class="detail_content_div_second">산</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">캠핑장 유형</span>
                    <span class="detail_content_div_second">일반야영장</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">계절오픈</span>
                    <span class="detail_content_div_second">봄여름가을겨울</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">운영요일</span>
                    <span class="detail_content_div_second">매일</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">홈페이지</span>
                    <span class="detail_content_div_second"><a id="homepage_move_btn" href="http://cafe.daum.net/hantistar-camp">http://cafe.daum.net/hantistar-camp</a></span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">애완동물</span>
                    <span class="detail_content_div_second">가능/불가능</span>
                </div>
                <div class="detail_content_div">
                    <span class="detail_content_div_first">캠핑장 특징</span>
                    <span class="detail_content_div_second">카페</span>
                </div>
                <div class="detail_content_div">
                    <span id="resevation_btn"><a href="">예약하기</a></span>
                    <span id="keep_btn"><a href="">찜하기</a></span>
                </div>
            </div><!--캠핑장 내용 마지막-->
        </div><!--머릿글부분 마지막-->

        <div id="detail_information_maincontent"><!--본문 상세내용 시작-->

            <div id="location1"></div>

            <div class="detail_information_menubar1"><!--소제목 메뉴바1-->
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar1-1">위치안내</a></td><td><a href="#location2" class="menubar1-2">캠핑장소개</a></td><td><a href="#location3" class="menubar1-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div><!--소제목 메뉴바1-->

            <div id="detail_information_image"><!--위치정보 들어갈 지도 시작-->
                <img src="map" alt="">지도 들어가는곳
            </div><!--위치정보 들어갈 지도 마지막-->

            <div id="location2"></div>

            <div class="detail_information_menubar2" id="detail_information_menubar1"><!--소제목 메뉴바2-->
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar2-1">위치안내</a></td><td><a href="#location2" class="menubar2-2">캠핑장소개</a></td><td><a href="#location3" class="menubar2-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div><!--소제목 메뉴바2-->
            
            <div id="detail_information_longinfo"><!--캠핑장 긴소개 시작-->
                <p>한티 별빛아래 오토캠핑장은 경북 칠곡군 가산면에 자리 잡았다. 칠곡군청을 기점으로 33㎞가량 떨어졌으며, 자동차에 몸을 싣고 호국로, 남원로, 79번 지방도를 차례로 달리면 닿는다. 도착까지 걸리는 시간은 50분 안팎이다. 이곳은 ‘높은 고개’란 의미를 지닌 한티재 인근에 위치했다. 고지대인 덕택에 한여름 낮 시간에는 다른 지역에 비해 무덥지 않다. 해가 진 저녁에는 닭살이 살짝 돋는 선선함을 느낄 정도다. 게다가 캠핑장에서 발 아래로 내려다보는 풍경은 감탄사를 자아낼 정도로 멋지다. 캠핑장에는 48면의 자동차 야영장을 마련했다. 바닥 형태는 파쇄석이며, 사이트 크기는 가로 6m 세로 9m다. 개인 트레일러는 물론 카라반 동반 입장이 가능하다. 주말 운영을 원칙으로 사계절 내내 문을 연다. 캠핑장 인근에 치산관광지, 팔공산도립공원, 블루데이식물원 등이 있어 연계관광이 용이하다. 팔공산 주변에 여러 음식점도 성업 중이라 먹을거리를 찾아 나서기에 부담이 없다</p>
            </div><!--캠핑장 긴소개 마지막-->

            <div id="location3"></div>

            <div class="detail_information_menubar3" id="detail_information_menubar1"><!--소제목 메뉴바3-->
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar3-1">위치안내</a></td><td><a href="#location2" class="menubar3-2">캠핑장소개</a></td><td><a href="#location3" class="menubar3-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div><!--소제목 메뉴바3-->

            <div id="detail_information_detailinfo"><!--캠핑장 상세내역 시작-->
                <span class="camp_facility_info">[캠핑장시설정보]</span>
                <div id="container_icon"><!--캠핑장 시설정보 시작-->
                    <span class="icon_container">
                        <span id="img_span"><img src="img/FacilitiesIcon/electro.png" alt=""></span>
                        <p id="icon_index">전기</p>
                    </span>
                </div><!--캠핑장 시설정보 마지막--><!-- 오류체크용 -->
                
                <span class="camp_facility_info">[캠핑장상세정보]</span>
                <div id="container_info"><!--캠핑장 상세정보 시작-->
                    <div class="container_info_category">
                        <span class="container_info_first" id="top_category1">주요시설</span>
                        <span class="container_info_second" id="top_category2">주요시설 일반야영장</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">사이트간격</span>
                        <span class="container_info_second">3M</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">바닥형태</span>
                        <span class="container_info_second">자갈</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">사이트크기</span>
                        <span class="container_info_second">4X7(35개)</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">캠핑장비대여</span>
                        <span class="container_info_second">릴선,화로대</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">애완동물출입</span>
                        <span class="container_info_second">불가능</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">화장실개수</span>
                        <span class="container_info_second">11개</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first">샤워실개수</span>
                        <span class="container_info_second">10개</span>
                    </div>
                    <div class="container_info_category">
                        <span class="container_info_first" id="last_category1">개수대개수</span>
                        <span class="container_info_second" id="last_category2">13개</span>
                    </div>
                </div><!--캠핑장 상세정보 마지막-->

            </div><!--캠핑장 상세내역 마지막-->

        </div><!--본문 상세내용 마지막-->
    </section>
</body>
</html>