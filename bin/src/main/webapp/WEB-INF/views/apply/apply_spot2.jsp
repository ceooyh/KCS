<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    *{
        padding: 0;
        margin: 0;
    }
    #container{
        width: 800px;
        margin: 0 auto;
        padding: 0 20px 30px 20px;
    }
    #headline{
        font-size: 30px;
        margin: 20px 0;
        text-align: center;
        color: rgb(46, 46, 46);
        font-family: '굵은노토';
    }
    .category{
        /*border: 1px solid rgb(223, 223, 223);*/
        border-radius: 10px;
        padding: 10px;
        margin-bottom: 20px;
    }
    #category_1{
        font-size: 25px;
        font-family: '굵은노토';
        color: rgb(241, 186, 179);
    }
    #category_2{
        font-size: 25px;
        font-family: '굵은노토';
        color: rgb(179, 190, 241);
    }
    #category_3{
        font-size: 25px;
        font-family: '굵은노토';
        color: rgb(228, 241, 179);
    }
    #category_4{
        font-size: 25px;
        font-family: '굵은노토';
        color: rgb(181, 241, 179);
    }
    #category_5{
        font-size: 25px;
        font-family: '굵은노토';
        color: rgb(241, 179, 231);
    }




    input[type="checkbox"]{
        display: none;
    }
    #camp_type input[type="checkbox"] +label span{
        display: inline-block;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 5px;
        font-size: 20px;
        font-family: '굵은노토';
        border: 1px solid rgb(219, 219, 219);
        border-radius: 10px;
        color: rgb(46, 46, 46);
        cursor: pointer;
    }
    #camp_type input[type="checkbox"] +label span:hover{
        border:none;
        color: rgb(219, 219, 219);
        background-color: rgb(46, 46, 46);
    }
    #camp_type input[type="checkbox"]:checked +label span{
        color: rgb(46, 46, 46);
        background-color: rgb(241, 186, 179);
    }




    #mood input[type="checkbox"] +label span{
        display: inline-block;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 5px;
        font-size: 20px;
        font-family: '굵은노토';
        border: 1px solid rgb(219, 219, 219);
        border-radius: 10px;
        color: rgb(46, 46, 46);
        cursor: pointer;
    }
    #mood input[type="checkbox"] +label span:hover{
        border:none;
        color: rgb(219, 219, 219);
        background-color: rgb(46, 46, 46);
    }
    #mood input[type="checkbox"]:checked +label span{
        color: rgb(46, 46, 46);
        background-color: rgb(179, 190, 241);
    }




    #theme input[type="checkbox"] +label span{
        display: inline-block;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 5px;
        font-size: 20px;
        font-family: '굵은노토';
        border: 1px solid rgb(219, 219, 219);
        border-radius: 10px;
        color: rgb(46, 46, 46);
        cursor: pointer;
    }
    #theme input[type="checkbox"] +label span:hover{
        border:none;
        color: rgb(219, 219, 219);
        background-color: rgb(46, 46, 46);
    }
    #theme input[type="checkbox"]:checked +label span{
        color: rgb(46, 46, 46);
        background-color: rgb(228, 241, 179);
    }




    #location_type input[type="checkbox"] +label span{
        display: inline-block;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 5px;
        font-size: 20px;
        font-family: '굵은노토';
        border: 1px solid rgb(219, 219, 219);
        border-radius: 10px;
        color: rgb(46, 46, 46);
        cursor: pointer;
    } 
    #location_type input[type="checkbox"] +label span:hover{
        border:none;
        color: rgb(219, 219, 219);
        background-color: rgb(46, 46, 46);
    }
    #location_type input[type="checkbox"]:checked +label span{
        color: rgb(46, 46, 46);
        background-color: rgb(181, 241, 179);
    }



    
    #facilities input[type="checkbox"] +label span{
        display: inline-block;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 5px;
        font-size: 20px;
        font-family: '굵은노토';
        border: 1px solid rgb(219, 219, 219);
        border-radius: 10px;
        color: rgb(46, 46, 46);
        cursor: pointer;
    }
    #facilities input[type="checkbox"] +label span:hover{
        border:none;
        color: rgb(219, 219, 219);
        background-color: rgb(46, 46, 46);
    }
    #facilities input[type="checkbox"]:checked +label span{
        color: rgb(46, 46, 46);
        background-color: rgb(241, 179, 231);
    }




    #btn_submit{
        width: 50%;
        text-align: center;
        margin: 0 auto;
        margin-top: 30px;
    }
    #btn_submit button{
        margin: 0;
        width: 49%;
        padding: 5px;
        box-sizing: border-box;
        font-family: '보통노토';
        font-size: 20px;
        background-color: rgb(243, 243, 243);
        color: rgb(46, 46, 46);
        border: none;
        border-radius: 10px;
        text-decoration: none;
        cursor: pointer;
    }
    #btn_submit a{
        display: inline-block;
        margin: 0;
        width: 49%;
        padding: 5px;
        box-sizing: border-box;
        font-family: '보통노토';
        font-size: 20px;
        background-color: rgb(243, 243, 243);
        color: rgb(46, 46, 46);
        border: none;
        border-radius: 10px;
        text-decoration: none;
    }
    #btn_submit button:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(243, 243, 243);
    }
    #btn_submit a:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(243, 243, 243);
    }

</style>
</head>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <div id="container">
        <p id="headline">취향 정보 입력란</p>
            <div id="camp_type" class="category">
                <p id="category_1">캠핑의 종류</p>
                <input type="checkbox" id="camping" name="camping" value="#일반야영장"><label for="camping"><span>#일반야영장</span></label>
                <input type="checkbox" id="autocamping" name="autocamping"  value="#오토캠핑"><label for="autocamping"><span>#오토캠핑</span></label>
                <input type="checkbox" id="glamping" name="glamping"  value="#글램핑"><label for="glamping"><span>#글램핑</span></label>
                <input type="checkbox" id="caravan" name="caravan"  value="#카라반"><label for="caravan"><span>#카라반</span></label>
            </div>
            <div id="mood" class="category">
                <p id="category_2">분위기</p>
                <input type="checkbox" id="activity" name="activity"  value="#액티비티"><label for="activity"><span>#액티비티</span></label>
                <input type="checkbox" id="photospot" name="photospot"  value="#포토스팟"><label for="photospot"><span>#포토스팟</span></label>
                <input type="checkbox" id="attraction" name="attraction"  value="#명소"><label for="attraction"><span>#명소</span></label>
                <input type="checkbox" id="4people" name="4people"  value="#4인이상"><label for="4people"><span>#4인이상</span></label>
                <input type="checkbox" id="couple" name="couple"  value="#커플"><label for="couple"><span>#커플</span></label>
                <input type="checkbox" id="2people" name="2people"  value="#2인이상"><label for="2people"><span>#2인이상</span></label>
                <input type="checkbox" id="solo" name="solo"  value="#솔플"><label for="solo"><span>#솔플</span></label>
                <input type="checkbox" id="nightview" name="nightview"  value="#야경"><label for="nightview"><span>#야경</span></label>
                <input type="checkbox" id="quiet" name="quiet" value="#조용"><label for="quiet"><span>#조용</span></label><br>
                <input type="checkbox" id="noisy" name="noisy"  value="#시끌벅적"><label for="noisy"><span>#시끌벅적</span></label>
                <input type="checkbox" id="Healing" name="Healing"  value="#힐링"><label for="Healing"><span>#힐링</span></label>
                <input type="checkbox" id="family" name="family"  value="#가족"><label for="family"><span>#가족</span></label>
                <input type="checkbox" id="romantic" name="romantic"  value="#로맨틱"><label for="romantic"><span>#로맨틱</span></label>
                <input type="checkbox" id="waterleisure" name="waterleisure"  value="#수상레저"><label for="waterleisure"><span>#수상레저</span></label>
                <input type="checkbox" id="mtb" name="mtb"  value="#MTB"><label for="mtb"><span>#MTB</span></label>
                <input type="checkbox" id="ski" name="ski"  value="#스키"><label for="ski"><span>#스키</span></label>
            </div>
            <div id="theme" class="category">
                <p id="category_3">즐길거리</p>
                <input type="checkbox" id="rent_tent" name="rent_tent"  value="#텐트대여"><label for="rent_tent"><span>#텐트대여</span></label>
                <input type="checkbox" id="rent_equipment" name="rent_equipment"  value="#장비대여"><label for="rent_equipment"><span>#장비대여</span></label>
                <input type="checkbox" id="pool" name="pool"  value="#수영장"><label for="pool"><span>#수영장</span></label>
                <input type="checkbox" id="pet" name="pet"  value="#반려동물"><label for="pet"><span>#반려동물</span></label>
                <input type="checkbox" id="fishing" name="fishing"  value="#낚시캠핑"><label for="fishing"><span>#낚시캠핑</span></label>
                <input type="checkbox" id="experience" name="experience"  value="#체험캠핑"><label for="experience"><span>#체험캠핑</span></label>
                <input type="checkbox" id="caravan_open" name="caravan_open"  value="#카라반가능"><label for="caravan_open"><span>#카라반가능</span></label>
                <input type="checkbox" id="trailer_open" name="trailer_open"  value="#트레일러가능"><label for="trailer_open"><span>#트레일러가능</span></label>
            </div>
            <div id="location_type" class="category">
                <p id="category_4">입지구분</p>
                <input type="checkbox" id="beach" name="beach"  value="#해변"><label for="beach"><span>#해변</span></label>
                <input type="checkbox" id="island" name="island"  value="#섬"><label for="island"><span>#섬</span></label>
                <input type="checkbox" id="mountain" name="mountain"  value="#산"><label for="mountain"><span>#산</span></label>
                <input type="checkbox" id="forest" name="forest"  value="#숲"><label for="forest"><span>#숲</span></label>
                <input type="checkbox" id="valley" name="valley"  value="#계곡"><label for="valley"><span>#계곡</span></label>
                <input type="checkbox" id="river" name="river"  value="#강"><label for="river"><span>#강</span></label>
                <input type="checkbox" id="lake" name="lake"  value="#호수"><label for="lake"><span>#호수</span></label>
                <input type="checkbox" id="city" name="city"  value="#도심"><label for="city"><span>#도심</span></label>
            </div>
            <div id="facilities" class="category">
                <p id="category_5">부가시설</p>
                <input type="checkbox" id="wifi" name="wifi"  value="#와이파이"><label for="wifi"><span>#와이파이</span></label>
                <input type="checkbox" id="hot_water" name="hot_water"  value="#온수"><label for="hot_water"><span>#온수</span></label>
                <input type="checkbox" id="shower" name="shower"  value="#샤워시설"><label for="shower"><span>#샤워시설</span></label>
                <input type="checkbox" id="mart" name="mart"  value="#마트편의점"><label for="mart"><span>#마트편의점</span></label>
                <input type="checkbox" id="toeilet" name="toeilet"  value="#화장실"><label for="toeilet"><span>#화장실</span></label>
                <input type="checkbox" id="electric" name="electric"  value="#전기"><label for="electric"><span>#전기</span></label>
                <input type="checkbox" id="pet_open" name="pet_open"  value="#반려동물동반"><label for="pet_open"><span>#반려동물동반</span></label>
            </div>
            <div id="btn_submit">
                <button>확인</button>
                <a href="#">취소</a>
            </div>
    </div><!--container-->
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>