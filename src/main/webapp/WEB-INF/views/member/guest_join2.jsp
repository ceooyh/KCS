<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/member/guest_join2.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/member/guest_join2.js"></script>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <div id="container">
    <form id="guest_join2_frm" action="guestJoinFavoriteAction.do">
        <p id="headline">취향 정보 입력란</p>
            <div id="camp_type" class="category">
                <p id="category_1">캠핑의 종류</p>
                <input type="checkbox" id="camping" name="gnrlSiteCo" value="0"><label for="camping"><span>#일반야영장</span></label>
                <input type="checkbox" id="autocamping" name="autoSiteCo"  value="0"><label for="autocamping"><span>#오토캠핑</span></label>
                <input type="checkbox" id="glamping" name="glampSiteCo"  value="0"><label for="glamping"><span>#글램핑</span></label>
                <input type="checkbox" id="caravan" name="caravSiteCo"  value="0"><label for="caravan"><span>#카라반</span></label>
                <input type="checkbox" id="caravan" name="indvdlCaravSiteCo"  value="0"><label for="caravan"><span>#개인카라반</span></label>
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
                <input type="checkbox" id="sbrsCl1" name="sbrsCl"  value="전기"><label for="sbrsCl1"><span>#전기</span></label>
                <input type="checkbox" id="sbrsCl2" name="sbrsCl"  value="무선인터넷"><label for="sbrsCl2"><span>#무선인터넷</span></label>
                <input type="checkbox" id="sbrsCl3" name="sbrsCl"  value="장작판매"><label for="sbrsCl3"><span>#장작판매</span></label>
                <input type="checkbox" id="sbrsCl4" name="sbrsCl"  value="온수"><label for="sbrsCl4"><span>#온수</span></label>
                <input type="checkbox" id="sbrsCl5" name="sbrsCl"  value="트렘폴린"><label for="sbrsCl5"><span>#트렘폴린</span></label>
                <input type="checkbox" id="sbrsCl6" name="sbrsCl"  value="물놀이장"><label for="sbrsCl6"><span>#물놀이장</span></label>
                <input type="checkbox" id="sbrsCl7" name="sbrsCl"  value="놀이터"><label for="sbrsCl7"><span>#놀이터</span></label>
                <input type="checkbox" id="sbrsCl8" name="sbrsCl"  value="산책로"><label for="sbrsCl8"><span>#산책로</span></label>
                <input type="checkbox" id="sbrsCl9" name="sbrsCl"  value="운동장"><label for="sbrsCl9"><span>#운동장</span></label>
                <input type="checkbox" id="sbrsCl10" name="sbrsCl"  value="운동시설"><label for="sbrsCl10"><span>#운동시설</span></label>
                <input type="checkbox" id="sbrsCl11" name="sbrsCl"  value="마트.편의점"><label for="sbrsCl11"><span>#마트.편의점</span></label>
            </div>
            <div id="btn_submit">
                <button type="button" id="btn_submit_favorite">회원가입</button>
                <a href="loginView.do">건너뛰기</a>
            </div>
          </form>
    </div><!--container-->
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>