<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원정보 수정 페이지</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/business_info_update.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/member/business_info_update.js"></script>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <p id="headline">회원 수정 페이지</p>
        <form action="businessInfoUpdateAction.do" method="POST" enctype="multipart/form-data">
        <div id="container">
                <p id="inside_headline">회원님의 정보를 수정해주세요</p>
                <div id="id_insert" class="part"><!--아이디 입력 부분 start-->
                        <span class="guest_insert"><label for="id">아이디</label></span><br>
                        <span><input  class="guest_input1" type="text" value="${requestScope.dto.id }" name="id" id="id" placeholder="아이디를 입력하세요" readonly></span><br>
                </div><!--아이디 입력 부분 end-->




                <div id="id_insert" class="part"><!--비밀번호 입력 부분 start-->
                        <span class="guest_insert"><label for="pass">비밀번호입력</label></span><br>
                        <span><input  class="guest_input1" type="password" name="pass" id="pass" placeholder="비밀번호 입력"></span>
                </div><!--비밀번호 입력 부분 end-->
                    
                    
                    
                    
                <div id="id_insert" class="part"><!--비밀번호 확인 부분 start-->
                        <span class="guest_insert"><label for="passcheck">비밀번호확인</label></span><br>
                        <span><input class="guest_input1" type="password" name="passcheck" id="passcheck" placeholder="비밀번호 확인"></span>
                </div><!--비밀번호 확인 부분 end-->
                    



                <div id="id_insert" class="part"><!--이름 입력 부분 start-->
                    <span class="guest_insert"><label for="name">이름</label></span><br>
                    <span><input class="guest_input1" type="text" value="${requestScope.dto.name }" name="name" id="name" placeholder="이름 입력"></span>
                </div><!--이름 입력 부분 end-->




                <div id="id_insert" class="part"><!--전화번호 입력 부분 start-->
                    <span class="guest_insert"><label for="tel2">전화번호</label></span><br>
                        <span><select name="tel1" id="tel1">
                                <option value="010" <c:if test="${requestScope.dto.tel1 eq '010'}">checked</c:if>>010</option>
                                <option value="019" <c:if test="${requestScope.dto.tel2 eq '019'}">checked</c:if>>019</option>
                                <option value="011" <c:if test="${requestScope.dto.tel3 eq '011'}">checked</c:if>>011</option>
                            </select></span>
                            <span><input class="guest_input2" type="text" value="${requestScope.dto.tel2 }" name="tel2" id="tel2" class="tel" placeholder="0000"></span>
                            <span><input class="guest_input2" type="text" value="${requestScope.dto.tel3 }" name="tel3" id="tel3" class="tel" placeholder="0000"></span>
                </div><!--전화번호 입력 부분 end-->




                <div id="id_insert" class="part"><!--이메일 부분 start-->
                    <span class="guest_insert"><label for="pass">이메일</label></span><br>
                    <span><input class="guest_input3" type="text" value="${requestScope.dto.email1 }" name="email" id="email" placeholder="이메일을 입력해주세요"></span>
                    <span><select name="host" id="host">
                                <option value="naver.com" <c:if test="${requestScope.dto.email2 eq 'naver.com'}">selected</c:if>>@naver.com</option>
                                <option value="gmail.com" <c:if test="${requestScope.dto.email2 eq 'gmail.com'}">selected</c:if>>@gmail.com</option>
                                <option value="nate.com" <c:if test="${requestScope.dto.email2 eq 'nate.com'}">selected</c:if>>@nate.com</option>
                                <option value="hanmail.com" <c:if test="${requestScope.dto.email2 eq 'hanmail.com'}">selected</c:if>>@hanmail.com</option>
                                <option value="daum.net" <c:if test="${requestScope.dto.email2 eq 'daum.net'}">selected</c:if>>@daum.net</option>
                            </select></span>
                </div><!--이메일 부분 end-->




                <div id="id_insert" class="part"><!--생일/성별 start-->
                    <span class="guest_insert"><label for="year">생일/성별</label></span><br>
                    <span><input  class="guest_input4" type="text" id="year" name="year" value="${requestScope.birth_year }" placeholder="년"></span>
                    <span><input class="guest_input4" type="text" id="month" name="month" value="${requestScope.birth_month }" placeholder="월"></span>
                    <span><input  class="guest_input4" type="text" id="day" name="day" value="${requestScope.birth_day }" placeholder="일"></span><br>
                    <div id="checkbox_gender">
                        <span class="gender_select"><input id="gender_woman" type="checkbox" value="1" class="checkbox" name="gender" <c:if test="${requestScope.dto.gender == 1}">checked</c:if> ><label for="gender_woman"><span>여성</span></label></span>
                        <span class="gender_select"><input id="gender_man" type="checkbox" value="0" class="checkbox" name="gender" <c:if test="${requestScope.dto.gender == 0}">checked</c:if> ><label for="gender_man"><span>남성</span></label></span>
                    </div>
                </div><!--생일 성별 end-->


                <div id="id_insert" class="part"><!--사업자 등록번호 입력 start-->
                    <span class="guest_insert"><label for="business_no">사업자등록번호</label></span><br>
                    <span><input class="guest_input4" type="text" value="${requestScope.business_no1 }" id="business_no1" name="business_no1" placeholder="000"></span>
                    <span><input class="guest_input4" type="text" value="${requestScope.business_no2 }" id="business_no2" name="business_no2" placeholder="00"></span>
                    <span><input class="guest_input4" type="text" value="${requestScope.business_no3 }" id="business_no3" name="business_no3" placeholder="00000"></span><br>
                 </div><!--사업자 등록번호 입력 end-->

                <div id="btn_continer">
                    <button class="btn_submit">정보수정</button>
                    <button type="button" class="btn_before">이전</button>
                </div>
            </div>
        </form><!--폼마지막 줄-->
    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>