<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 취향정보 수정</title>
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
	<form action="guestFavoriteUpdateAction.do">
        <p id="headline">취향 정보 수정</p>
             <div id="camp_type" class="category">
                <p id="category_1">캠핑의 종류</p>
                <input type="checkbox" id="camping" name="gnrlSiteCo" value="0"><label for="camping"><span>#일반야영장</span></label>
                <input type="checkbox" id="autocamping" name="autoSiteCo"  value="0"><label for="autocamping"><span>#오토캠핑</span></label>
                <input type="checkbox" id="glamping" name="glampSiteCo"  value="0"><label for="glamping"><span>#글램핑</span></label>
                <input type="checkbox" id="caravan" name="caravSiteCo"  value="0"><label for="caravan"><span>#카라반</span></label>
                <input type="checkbox" id="indvdlcaravan" name="indvdlCaravSiteCo"  value="0"><label for="indvdlcaravan"><span>#개인카라반</span></label>
            </div>
            <div id="mood" class="category">
                <p id="category_2">명소</p>
                <input type="checkbox" id="themaEnvrnCl1" name="themaEnvrnCl"  value="일출명소"><label for="themaEnvrnCl1"><span>#일출명소</span></label>
                <input type="checkbox" id="themaEnvrnCl2" name="themaEnvrnCl"  value="일몰명소"><label for="themaEnvrnCl2"><span>#일몰명소</span></label>
                <input type="checkbox" id="themaEnvrnCl3" name="themaEnvrnCl"  value="수상레저"><label for="themaEnvrnCl3"><span>#수상레저</span></label>
                <input type="checkbox" id="themaEnvrnCl4" name="themaEnvrnCl"  value="항공레저"><label for="themaEnvrnCl4"><span>#4항공레저</span></label>
                <input type="checkbox" id="themaEnvrnCl5" name="themaEnvrnCl"  value="스키낚시"><label for="themaEnvrnCl5"><span>#스키낚시</span></label>
                <input type="checkbox" id="themaEnvrnCl6" name="themaEnvrnCl"  value="액티비티"><label for="themaEnvrnCl6"><span>#액티비티</span></label>
                <input type="checkbox" id="themaEnvrnCl7" name="themaEnvrnCl"  value="봄꽃여행"><label for="themaEnvrnCl7"><span>#봄꽃여행</span></label>
                <input type="checkbox" id="themaEnvrnCl8" name="themaEnvrnCl"  value="여름물놀이"><label for="themaEnvrnCl8"><span>#여름물놀이</span></label>
                <input type="checkbox" id="themaEnvrnCl9" name="themaEnvrnCl" value="가을단풍명소"><label for="themaEnvrnCl9"><span>#가을단풍명소</span></label><br>
                <input type="checkbox" id="themaEnvrnCl10" name="themaEnvrnCl"  value="겨울눈꽃명소"><label for="themaEnvrnCl10"><span>#겨울눈꽃명소</span></label>
                <input type="checkbox" id="themaEnvrnCl11" name="themaEnvrnCl"  value="걷기길"><label for="themaEnvrnCl11"><span>#걷기길</span></label>
            </div>
            <div id="theme" class="category">
                <p id="category_3">캠핑테마</p>
                <input type="checkbox" id="animalCmgCl" name="animalCmgCl"  value="0"><label for="animalCmgCl"><span>#반려동물</span></label>
                <input type="checkbox" id="trlerAcmpnyAt" name="trlerAcmpnyAt"  value="0"><label for="trlerAcmpnyAt"><span>#개인트레일러 동반</span></label>
                <input type="checkbox" id="caravAcmpnyAt" name="caravAcmpnyAt"  value="0"><label for="caravAcmpnyAt"><span>#개인카라반 동반</span></label>
            </div>
            <div id="location_type" class="category">
                <p id="category_4">입지구분</p>
                <input type="checkbox" id="beach" name="lctCl"  value="해변"><label for="beach"><span>#해변</span></label>
                <input type="checkbox" id="island" name="lctCl"  value="섬"><label for="island"><span>#섬</span></label>
                <input type="checkbox" id="mountain" name="lctCl"  value="산"><label for="mountain"><span>#산</span></label>
                <input type="checkbox" id="forest" name="lctCl"  value="숲"><label for="forest"><span>#숲</span></label>
                <input type="checkbox" id="valley" name="lctCl"  value="계곡"><label for="valley"><span>#계곡</span></label>
                <input type="checkbox" id="river" name="lctCl"  value="강"><label for="river"><span>#강</span></label>
                <input type="checkbox" id="lake" name="lctCl"  value="호수"><label for="lake"><span>#호수</span></label>
                <input type="checkbox" id="city" name="lctCl"  value="도심"><label for="city"><span>#도심</span></label>
            </div>
            <div id="facilities" class="category">
                <p id="category_5">부가시설</p>
                <input type="checkbox" id="wifi" name="sbrsCl"  value="-와이파이"><label for="wifi"><span>#와이파이</span></label>
                <input type="checkbox" id="hot_water" name="sbrsCl"  value="-온수"><label for="hot_water"><span>#온수</span></label>
                <input type="checkbox" id="shower" name="sbrsCl"  value="-샤워시설"><label for="shower"><span>#샤워시설</span></label>
                <input type="checkbox" id="mart" name="sbrsCl"  value="-마트편의점"><label for="mart"><span>#마트편의점</span></label>
                <input type="checkbox" id="toeilet" name="sbrsCl"  value="-화장실"><label for="toeilet"><span>#화장실</span></label>
                <input type="checkbox" id="electric" name="sbrsCl"  value="-전기"><label for="electric"><span>#전기</span></label>
                <input type="checkbox" id="pet_open" name="sbrsCl"  value="-반려동물동반"><label for="pet_open"><span>#반려동물동반</span></label>
            </div>
            <div id="btn_submit">
                <button>변경 완료</button>
                <a href="indexView.do">취소</a>
            </div>
            </form>
    </div><!--container-->
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>