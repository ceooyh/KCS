<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    *{
        padding: 0;
        margin: 0;
    }
    section{
        width: 100%;
        margin: 0 auto;
    }
    #headline{
        font-size: 30px;
        margin: 20px 0;
        text-align: center;
        color: rgb(46, 46, 46);
        font-family: '굵은노토';
    }
    #inside_headline{
        font-size: 30px;
        margin: 20px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
    }
    label{
        font-family: '굵은노토';
        font-size: 13px;
        color: rgb(49, 49, 49);
    }
    input{
        border: none;
    }
    span{
        display: inline-block;
    }
    input:focus {
        outline:none;
    }
    input::placeholder{
        color: rgb(216, 215, 215);
    }
    #container{
        padding: 50px;
        width: 600px;
        margin: 0 auto;
        border: 1px solid rgb(189, 187, 187);
    }
    .part{
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .guest_insert{
        width: 100px;
        margin: 10px 0;
    }
    .guest_input1{
        width: 600px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .guest_input1{
        font-size: 18px;
        font-family: '보통노토';
        color: rgb(46, 46, 46);
    }
    #tel1{
        width: 100px;
        color: rgb(97, 95, 95);
        font-family: '보통노토';
        border: none;
    }
    .guest_input2{
        font-size: 18px;
        font-family: '보통노토';
        width: 244px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .guest_input3{
        font-size: 18px;
        font-family: '보통노토';
        width: 440px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    #host{
        width: 150px;
        color: rgb(97, 95, 95);
        font-family: '보통노토';
        border: none;
    }
    .guest_input4{
        font-size: 18px;
        font-family: '보통노토';
        width: 196px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 2px solid rgb(247, 245, 245);
    }
    .gender_select{
        margin-top: 10px;
        margin-right: 5px;
        font-family: '보통노토';
        color: rgb(97, 95, 95);
    }
    #btn_id_check{
        padding: 2px;
        border: none;
        font-size: 16px;
        border-radius: 10px;
        background-color: white;
        font-family: '보통노토';
        color: rgb(97, 95, 95);
    }
    #btn_id_check:hover{
        border: none;
        background-color: rgb(97, 95, 95);
        color: white;
    }
    .btn_submit{
        padding-top: 8px;
        padding-bottom: 8px;
        background-color: rgb(245, 244, 244);
        width: 100%;
        border: none;
        font-family: '보통노토';
        border-radius: 3%;
    }
    #btn_continer button:hover{
        background-color: rgb(63, 62, 62);
        color: rgb(245, 244, 244);
        cursor: pointer;
    }
    .guest_input1:focus,.guest_input2:focus,.guest_input3:focus,.guest_input4:focus{
        border-bottom: 2px solid rgb(46, 46, 46);
    }
</style>
</head>
<body>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <p id="headline">ID / PW 찾기</p>
        <form action="guestJoinAction.do" method="GET">
        <div id="container">
                <p id="inside_headline">찾을 PW에 대한 정보를 입력해주세요</p>


                <div id="id_insert" class="part"><!--아이디 입력 부분 start-->
                    <span class="guest_insert"><label for="id">아이디</label></span><br>
                    <span><input  class="guest_input1" type="text" name="id" id="id" placeholder="아이디를 입력하세요"></span><br>
                </div><!--아이디 입력 부분 end-->



                <div id="id_insert" class="part"><!--이름 입력 부분 start-->
                    <span class="guest_insert"><label for="name">이름</label></span><br>
                    <span><input class="guest_input1" type="text" name="name" id="name" placeholder="이름 입력"></span>
                </div><!--이름 입력 부분 end-->


                <div id="id_insert" class="part"><!--이메일 부분 start-->
                    <span class="guest_insert"><label for="pass">이메일</label></span><br>
                    <span><input class="guest_input3" type="text" name="email" id="email" placeholder="이메일을 입력해주세요"></span>
                    <span><select name="host" id="host">
                                <option value="naver.com">@naver.com</option>
                                <option value="gmail.com">@gmail.com</option>
                                <option value="nate.com">@nate.com</option>
                                <option value="hanmail.com">@hanmail.com</option>
                                <option value="daum.net">@daum.net</option>
                            </select></span>
                </div><!--이메일 부분 end-->

                <div id="btn_continer">
                    <button class="btn_submit">찾기</button>
                </div>
            </div>
        </form><!--폼마지막 줄-->
    </section>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>
