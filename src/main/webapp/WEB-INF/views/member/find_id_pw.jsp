<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/find_id_pw.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
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
