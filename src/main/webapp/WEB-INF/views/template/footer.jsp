<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보</title>
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
        margin:0;
        padding: 0;
    }
    footer{
        padding-top:10px;
        width: 100%;
        background-color: rgb(44, 42, 41);
        height: 150px;
        box-sizing: border-box;
    }
    #top_footer{
        color: rgb(241, 241, 241);
        width: 80%;
        margin: 0 auto;
    }
    #bottom_footer{
        font-family: '보통노토';
        color: rgb(196, 196, 196);
        width: 80%;
        height: 10%;
        margin: 0 auto;
        text-align: center;
        font-size: 13px;
    }
    #top_footer{
        width: 80%;
        height: 10%;
        margin: 0 auto;
        margin-top: 20px;
        text-align: center;
    }
    #top_footer a{
        font-family: '보통노토';
        color: rgb(196, 196, 196);
        text-decoration: none;
        width: 20%;
        font-size: 15px;
        padding: 0 30px;
    }
    #footer_hyperline{
        border: 1px solid rgb(241, 241, 241);
        margin: 20px 0;
    }
    #top_footer a:hover{
        text-decoration: underline;
    }
</style>
</head>
<body>
    <footer>
        <div id="footer_container">
            <div id="top_footer">
                <a class="footer_movetag" href="index.do">HOME</a>
                <a class="footer_movetag" href="infoView.do">INTRODUCE</a>
                <a class="footer_movetag" href="findCampSpotView.do">CAMPINGSPOT</a>
                <a class="footer_movetag" href="selectJoinView.do">JOINUS</a>
            </div>
            <hr id="footer_hyperline">
            <div id="bottom_footer">
                <span class="top_footer_span">© 2021 koreacampspot은 505 Group 계열사입니다. All rights reserved. Copyright ⓒ</span><br>
                <span class="top_footer_span">All rights reserved. Designed by KCS</span>
            </div>
        </div>
    </footer>
</body>
</html>