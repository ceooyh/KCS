<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/login.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
</head>
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