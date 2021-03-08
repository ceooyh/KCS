<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 검수 페이지</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/select_join.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/member/select_join.js"></script>
</head>
<body>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <h1 id="headline_select_join">개인정보 수집 ‧ 이용 ‧ 제공 동의서</h1>
        <div id="select_join_container">
            <div id="information_provision">
                <p class="information_text">본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법], 제15조 및 제17조에 따라</p>
                <p class="information_text">아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.</p><br><br>
                <p class="information_text">□ 개인정보의 수집 및 이용에 관한 사항</p>
                <p class="information_text">- 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호, </p>
                <p class="information_text">주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 外 이력서 기재 내용 일체</p>
                <p class="information_text">- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서</p>
                <p class="information_text">류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.</p><br><br>
                <p class="information_text">□ 개인정보의 보관 및 이용 기간</p>
                <p class="information_text">- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우</p>
                <p class="information_text">[개인정보 보호법] 제21조에 따라 처리합니다.</p><br>
            </div>
            <div id="select_join_agree_btn">
                <span class="agree_select"><input id="guest_agree" type="checkbox" value="1" class="checkbox" name="guest_agree"><label for="guest_agree" class="label"><span>동의</span></label></span>
                <span class="agree_select"><input id="guest_nonagree" type="checkbox" value="0" class="checkbox"  name="guest_agree"><label for="guest_nonagree" class="label"><span>비동의</span></label></span>
            </div>
        </div>
        
        <div id="choise_btn_div">
            <a class="btn_next_level" id="business_join_btn" href="businessJoinView.do">사업자 가입이동</a>
            <a class="btn_next_level" id="guest_join_btn" href="guestJoinView.do">일반 가입자 이동</a>
        </div>
    </section>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>