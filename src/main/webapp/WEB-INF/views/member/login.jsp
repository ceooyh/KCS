<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
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
        font-family: '굵은로보';
        src: url(../../../Font/Roboto/Roboto-Bold.ttf);
    }
    *{
        padding: 0;
        margin: 0;
    }
    #fullcontainer{
        width: 100%;
        height: 761px;
        background-image: url(../../../img/loginpage/loginmainimg.png);
        box-sizing: border-box;
        padding-top: 200px;
    }
    section{
        width: 660px;
        margin: 0 auto;
        padding: 30px;
        box-sizing: border-box;
        border-radius: 5px;
        background-color: white;
    }
    #headline_comment{
        width: 100%;
    }
    #login_input_console{
        width: 100%;
    }
    #select_find_id_pw{
        width: 100%;
        text-align: center;
    }
    #headline_comment{
        text-align: center;
        padding-bottom: 20px;
    }
    #headline_comment p{
        display: inline-block;
    }
    #headline_comment1{
        font-family: '보통로보';
        color: rgb(250, 187, 71);
        margin-right: 8px;
        font-size: 25px;
    }
    #headline_comment2{
        font-family: '보통노토';
        color: rgb(97, 97, 97);
        font-size: 20px;
    }
    #hr_line{
        border: 1px solid rgb(215, 215, 215);
    }
    #login_input_console{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .insert_input{
        border:1px solid rgb(215, 215, 215);
        padding: 10px;
        box-sizing: border-box;
        width: 600px;
        border-radius: 3px;
        margin-bottom: 10px;
    }
    #agree_btn{
        font-family: '보통노토';
        width: 600px;
        height: 45px;
        color: white;
        background-color: rgb(250, 187, 71);
        border: none;
        border-radius: 3px;
        font-size: 23px;
        cursor: pointer;
    }
    #agree_btn:hover{
        color: rgb(46, 46, 46);
        background-color: rgb(255, 240, 212);
    }
    #login_input_console{
        width: 100%;
    }
    .insert_input:focus{
        background-color: rgb(255, 243, 220);
    }
    .btn_next_level{
        text-decoration: none;
        color: rgb(46, 46, 46);
        width: 200px;
        font-family: '보통노토';
    }
    .btn_next_level:hover{
        text-decoration:underline;
    }
</style>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <div id="fullcontainer">
        <section>
            <form action="loginAction.do">
                <div id="headline_comment">
                    <p id="headline_comment1">Welcome!</p><p id="headline_comment2">코리아 캠프스팟에 오신것을 환영합니다.</p>
                </div>
                <hr id="hr_line">
                <div id="login_input_console">
                    <span class="input_class"><input class="insert_input" id="insert_input1" type="text" name="id" id="id" placeholder="아이디를 입력해주세요"></span><br>
                    <span class="input_class"><input class="insert_input" type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요"></span><br>
                    <button id="agree_btn" type="submit">로그인</button>
                </div>
                <div id="select_find_id_pw">
                    <a class="btn_next_level" href="selectJoinView.do">회원가입</a>
                    <a class="btn_next_level" href="findIdPwView.do">아이디/비밀번호 찾기</a>
                </div>
            </form>
        </section>
    </div>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>