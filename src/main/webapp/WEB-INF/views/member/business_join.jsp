<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입 페이지</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/business_join.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/member/business_join.js"></script>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <p id="headline">회원 가입 페이지</p>
        <form action="guestJoinAction.do" method="GET">
        <div id="container">
                <p id="inside_headline">회원님의 정보를 입력해주세요</p>
                <div id="id_insert" class="part"><!--아이디 입력 부분 start-->
                        <span class="guest_insert"><label for="id" class="label">아이디</label></span><br>
                       	<div class="input_result" id="input_result1"></div>
                        <span><input  class="guest_input1 input" type="text" name="id" id="id" placeholder="아이디를 입력하세요"></span><br>
                        <span class="guest_insert"><button id="btn_id_check" type="button">중복검사</button></span><br>
                </div><!--아이디 입력 부분 end-->




                <div id="id_insert" class="part"><!--비밀번호 입력 부분 start-->
                        <span class="guest_insert"><label for="pass" class="label">비밀번호입력</label></span><br>
                        <div class="input_result" id="input_result2"></div>
                        <span><input  class="guest_input1" type="password" name="pass" id="pass" placeholder="비밀번호 입력"></span>
                </div><!--비밀번호 입력 부분 end-->
                    
                    
                    
                    
                <div id="id_insert" class="part"><!--비밀번호 확인 부분 start-->
                        <span class="guest_insert"><label for="passcheck" class="label">비밀번호확인</label></span><br>
                        <div class="input_result" id="input_result3"></div>
                        <span><input class="guest_input1" type="password" name="passcheck" id="passcheck" placeholder="비밀번호 확인"></span>
                </div><!--비밀번호 확인 부분 end-->
                    



                <div id="id_insert" class="part"><!--이름 입력 부분 start-->
                    <span class="guest_insert"><label for="name" class="label">이름</label></span><br>
                    <div class="input_result" id="input_result4"></div>
                    <span><input class="guest_input1" type="text" name="name" id="name" placeholder="이름 입력"></span>
                </div><!--이름 입력 부분 end-->




                <div id="id_insert" class="part"><!--전화번호 입력 부분 start-->
                    <span class="guest_insert"><label for="tel2" class="label">전화번호</label></span><br>
                    <div class="input_result" id="input_result5"></div>
                        <span><select name="tel1" id="tel1">
                                <option value="010">010</option>
                                <option value="019">019</option>
                                <option value="011">011</option>
                            </select></span>
                            <span><input class="guest_input2" type="number" name="tel2" id="tel2" class="tel" placeholder="0000"></span>
                            <span><input class="guest_input2" type="number" name="tel3" id="tel3" class="tel" placeholder="0000"></span>
                </div><!--전화번호 입력 부분 end-->




                <div id="id_insert" class="part"><!--이메일 부분 start-->
                    <span class="guest_insert"><label for="pass" class="label">이메일</label></span><br>
                    <div class="input_result" id="input_result6"></div>
                    <span><input class="guest_input3" type="text" name="email" id="email" placeholder="이메일을 입력해주세요"></span>
                    <span><select name="host" id="host">
                                <option value="">직접입력</option>
                                <option value="naver.com">@naver.com</option>
                                <option value="gmail.com">@gmail.com</option>
                                <option value="nate.com">@nate.com</option>
                                <option value="hanmail.com">@hanmail.com</option>
                                <option value="daum.net">@daum.net</option>
                            </select></span>
                </div><!--이메일 부분 end-->




                <div id="id_insert" class="part"><!--생일/성별 start-->
                    <span class="guest_insert"><label for="year" class="label">생일/성별</label></span><br>
                    <div class="input_result" id="input_result7"></div>
                    <span><input  class="guest_input4" type="number" id="year" name="year" placeholder="년"></span>
                    <span><input class="guest_input4" type="number" id="month" name="month" placeholder="월"></span>
                    <span><input  class="guest_input4" type="number" id="day" name="day" placeholder="일"></span><br>
                    <div id="checkbox_gender">
                        <span class="gender_select"><input id="gender_woman" type="checkbox" value="1" class="checkbox" name="gender"><label for="gender_woman" class="label"><span>여성</span></label></span>
                        <span class="gender_select"><input id="gender_man" type="checkbox" value="0" class="checkbox"  name="gender" checked><label for="gender_man" class="label"><span>남성</span></label></span>
                    </div>
                </div><!--생일 성별 end-->


                <div id="id_insert" class="part"><!--사업자 등록번호 입력 start-->
                    <span class="guest_insert"><label for="business_no" class="label">사업자등록번호</label></span><br>
                    <div class="input_result" id="input_result8"></div>
                    <span><input class="guest_input4" type="number" id="business_no1" name="business_no1" placeholder="000"></span>
                    <span><input class="guest_input4" type="number" id="business_no2" name="business_no2" placeholder="00"></span>
                    <span><input class="guest_input4" type="number" id="business_no3" name="business_no3" placeholder="00000"></span><br>
                 </div><!--사업자 등록번호 입력 end-->


                <div id="btn_continer">
                    <button class="btn_submit" id="btn_submit">회원가입</button>
                    <button type="button" class="btn_before">이전</button>
                </div>
            </div>
        </form><!--폼마지막 줄-->
    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>