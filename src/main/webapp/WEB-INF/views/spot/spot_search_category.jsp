<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/spot/spot_search_category.css">
<title>캠핑장 상세검색 페이지</title>

</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <div id="detail_condition"><!-- 선택창 시작 -->
            <form action="spotCategorySearch.do">
            	<div id="detail_condition_input"><!-- 상세검색창 시작 -->
	                <span id="detail_condition_headline">상세조건 검색</span>
	            </div><!-- 상세검색창 마지막 -->
                <div id="detail_camping_seach_div"><!--캠핑 상세검색창 시작-->
                    <div id="detail_camping_category_location" class="detail_camping_category"><!--카테고리 지역입력 시작-->
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="서울시" name="doNm" id="seoul"><label for="seoul">서울시</label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="부산시" name="doNm" id="busan"><label for="busan"><span>부산시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="대구시" name="doNm" id="daegu"><label for="daegu"><span>대구시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="인천시" name="doNm" id="incheon"><label for="incheon"><span>인천시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="광주시" name="doNm" id="gwangju"><label for="gwangju"><span>광주시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="대전시" name="doNm" id="daejeon"><label for="daejeon"><span>대전시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="울산시" name="doNm" id="ulsan"><label for="ulsan"><span>울산시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="세종시" name="doNm" id="saejong"><label for="saejong"><span>세종시</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="경기도" name="doNm" id="kyungki"><label for="kyungki"><span>경기도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="강원도" name="doNm" id="kangwon"><label for="kangwon"><span>강원도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="충청북도" name="doNm" id="chungcheongnamdo"><label for="chungcheongnamdo"><span>충청북도</span></label></span><br><br>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="충청남도" name="doNm" id="chungcheongbukdo"><label for="chungcheongbukdo"><span>충청남도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="전라남도" name="doNm" id="jeonlanamdo"><label for="jeonlanamdo"><span>전라남도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="전라북도" name="doNm" id="jeonlanamdobukdo"><label for="jeonlanamdobukdo"><span>전라북도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="경상남도" name="doNm" id="kyungsangnamdo"><label for="kyungsangnamdo"><span>경상남도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="경상북도" name="doNm" id="kyungsangbukdo"><label for="kyungsangbukdo"><span>경상북도</span></label></span>
                            <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="제주도" name="doNm" id="jaeju"><label for="jaeju"><span>제주도</span></label></span>
                    </div><!--카테고리 지역입력 마지막-->
    
                    <div id="detail_camping_category_campingtype" class="detail_camping_category"><!--카테고리 캠핑유형 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="gnrlSiteCo" id="gnrlSiteCo"><label for="gnrlSiteCo"><span>일반 야영장</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="autoSiteCo" id="autoSiteCo"><label for="autoSiteCo"><span>오토캠핑</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="glampSiteCo" id="glampSiteCo"><label for="glampSiteCo"><span>글램핑</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="caravSiteCo" id="caravSiteCo"><label for="caravSiteCo"><span>카라반</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="indvdlCaravSiteCo" id="indvdlCaravSiteCo"><label for="indvdlCaravSiteCo"><span>개인카라반</span></label></span>
                    </div><!--카테고리 캠핑유형 마지막-->
                    
                    <div id="detail_camping_category_landscape" class="detail_camping_category"><!--카테고리 입지구분 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="해변" name="lctCl" id="beach"><label for="beach"><span>해변</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="섬" name="lctCl" id="island"><label for="island"><span>섬</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="산" name="lctCl" id="mountain"><label for="mountain"><span>산</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="숲" name="lctCl" id="forest"><label for="forest"><span>숲</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="계곡" name="lctCl" id="valley"><label for="valley"><span>계곡</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="강" name="lctCl" id="river"><label for="river"><span>강</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="호수" name="lctCl" id="lake"><label for="lake"><span>호수</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="도심" name="lctCl" id="city"><label for="city"><span>도심</span></label></span>
                    </div><!--카테고리 입지구분 마지막-->
                    
                    <div id="detail_camping_category_facilities" class="detail_camping_category"><!--카테고리 바닥형태 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="siteBottomCl1" id="siteBottomCl1"><label for="siteBottomCl1"><span>잔디</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="siteBottomCl2" id="siteBottomCl2"><label for="siteBottomCl2"><span>파쇄석</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="siteBottomCl3" id="siteBottomCl3"><label for="siteBottomCl3"><span>테크</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="siteBottomCl4" id="siteBottomCl4"><label for="siteBottomCl4"><span>자갈</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="siteBottomCl5" id="siteBottomCl5"><label for="siteBottomCl5"><span>맨흙</span></label></span>
                        
                    </div><!--카테고리 바닥형태 마지막-->
                    
                    <div id="detail_camping_category_facilities" class="detail_camping_category"><!--카테고리 부가시설 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="전기" name="sbrsCl" id="electric"><label for="electric"><span>전기</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="무선인터넷" name="sbrsCl" id="wifi"><label for="wifi"><span>무선 인터넷</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="장작판매" name="sbrsCl" id="pet_open"><label for="pet_open"><span>장작판매</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="온수" name="sbrsCl" id="hot_water"><label for="hot_water"><span>온수</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="트렘폴린" name="sbrsCl" id="trampoline"><label for="trampoline"><span>트렘폴린</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="물놀이장" name="sbrsCl" id="pool"><label for="pool"><span>물놀이장</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="놀이터" name="sbrsCl" id="playground"><label for="playground"><span>놀이터</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="산책로" name="sbrsCl" id="trail"><label for="trail"><span>산책로</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="운동장" name="sbrsCl" id="field"><label for="field"><span>운동장</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="운동시설" name="sbrsCl" id="exercise"><label for="exercise"><span>운동시설</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="마트.편의점" name="sbrsCl" id="mart"><label for="mart"><span>마트.편의점</span></label></span>
                        
                    </div><!--카테고리 부가시설 마지막-->
                    
                    <div id="detail_camping_category_campingtheme" class="detail_camping_category"><!--카테고리 명소 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="일출명소" name="themaEnvrnCl" id="themaEnvrnCl1"><label for="themaEnvrnCl1"><span>일출명소</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="일몰명소" name="themaEnvrnCl" id="themaEnvrnCl2"><label for="themaEnvrnCl2"><span>일몰명소</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="수상레저" name="themaEnvrnCl" id="themaEnvrnCl3"><label for="themaEnvrnCl3"><span>수상레저</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="항공레저" name="themaEnvrnCl" id="themaEnvrnCl4"><label for="themaEnvrnCl4"><span>항공레저</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="스키낚시" name="themaEnvrnCl" id="themaEnvrnCl5"><label for="themaEnvrnCl5"><span>스키낚시</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="액티비티" name="themaEnvrnCl" id="themaEnvrnCl6"><label for="themaEnvrnCl6"><span>액티비티</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="봄꽃여행" name="themaEnvrnCl" id="themaEnvrnCl7"><label for="themaEnvrnCl7"><span>봄꽃여행</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="여름물놀이" name="themaEnvrnCl" id="themaEnvrnCl8"><label for="themaEnvrnCl8"><span>여름물놀이</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="가을단풍명소" name="themaEnvrnCl" id="themaEnvrnCl9"><label for="themaEnvrnCl9"><span>가을단풍명소</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="겨울눈꽃명소" name="themaEnvrnCl" id="themaEnvrnCl10"><label for="themaEnvrnCl10"><span>겨울눈꽃명소</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="걷기길" name="themaEnvrnCl" id="themaEnvrnCl11"><label for="themaEnvrnCl11"><span>걷기길</span></label></span>
                    </div><!--카테고리 명소 마지막-->
                    
                    <div id="detail_camping_category_campingtheme" class="detail_camping_category"><!--카테고리 캠핑테마 시작-->
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="animalCmgCl" id="animalCmgCl"><label for="animalCmgCl"><span>반려동물</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="trlerAcmpnyAt" id="trlerAcmpnyAt"><label for="trlerAcmpnyAt"><span>개인트레일러 동반</span></label></span>
                        <span class="category_campingtype_span"><input class="category_campingtype_input" type="checkbox" value="0" name="caravAcmpnyAt" id="caravAcmpnyAt"><label for="caravAcmpnyAt"><span>개인카라반 동반</span></label></span>
                    </div><!--카테고리 캠핑테마 마지막-->

                    <div id="detail_camping_category_btn" class="detail_camping_category"><!--검색버튼 배치 시작-->
                        <button type="submit" class="camping_category_btn">검색</button>
                        <button type="reset" class="camping_category_btn">초기화</button>
                    </div><!--검색버튼 배치 마지막-->

                </div><!--캠핑 상세검색창 마지막-->
            </form>
	    </div><!-- 선택창 마지막 -->
        

        <div id="headrow"></div>


        <div id="detail_camping_info">
            <h1>캠핑장 상세 리스트</h1>
            <hr id="h1_down_row">
            <c:forEach var="dto" items="${ requestScope.list}">
            	<div id="spot_detail_address">
	                    <div>
	                        <span id="review_count">리뷰수 ${dto.review_count}</span><span id="star_count">별점 ${dto.star}</span>
	                    </div>
				</div>
                <div id="camping_info_list">
                    <div id="spot_main_img">
                    	<c:choose>
							<c:when test="${dto.firstImageUrl eq '-'}">
		                        <img src="../../../img/searchpage/noimg.png">
							</c:when>
							<c:when test="${dto.firstImageUrl ne '-'}">
		                        <img src="${dto.firstImageUrl}">
							</c:when>
                    	</c:choose>
                    </div>
                    <div id="spot_main_content">
                        <span id="spot_name_title"><a href="spotDetailView.do?contentId=${dto.contentId}&facltNm=${dto.facltNm}">${dto.facltNm}</a></span><br>
                        <span id="online_intro">${dto.lineIntro}</span><br>
                        <span id="spot_address_title" class="spot_title">${dto.addr1} ${dto.addr2} </span><br>
                        <span id="spot_tel_title" class="spot_title">${dto.tel}</span><br>
                        <span id="spot_homepage_title" class="spot_title"><a href="${dto.homepage}">${dto.homepage}</a></span><br>
                        <span id="spot_theme_title">
                            <span>[부대시설]</span>
                            <p>${dto.sbrsCl}</p>
                        </span>
                    </div>
                    <div  id="spot_main_otherinfo">
                    	<c:choose>
                    		<c:when test="${dto.manageSttus eq '운영'}">
	                        	<span class="camping_status_info" id="status_open">OPEN</span>
                    		</c:when>
                    		<c:when test="${dto.manageSttus ne '운영'}">
	                        	<span class="camping_status_info" id="status_close">CLOSE</span>
                    		</c:when>
                    	</c:choose>
                    </div>
                </div>
                <hr id="h1_down_row">
            </c:forEach>
	            <div id="paging_write">
	            		<c:set var="parameter" value="doNm=${searchDTO.doNm}&gnrlSiteCo=${searchDTO.gnrlSiteCo}&autoSiteCo=${searchDTO.autoSiteCo}&glampSiteCo=${searchDTO.glampSiteCo}&caravSiteCo=${searchDTO.caravSiteCo}&indvdlCaravSiteCo=${searchDTO.indvdlCaravSiteCo}&lctCl=${searchDTO.lctCl}&siteBottomCl1=${searchDTO.siteBottomCl1}&siteBottomCl2=${searchDTO.siteBottomCl2}&siteBottomCl3=${searchDTO.siteBottomCl3}&siteBottomCl4=${searchDTO.siteBottomCl4}&siteBottomCl5=${searchDTO.siteBottomCl5}&sbrsCl=${searchDTO.sbrsCl}&themaEnvrnCl=${searchDTO.themaEnvrnCl}&animalCmgCl=${searchDTO.animalCmgCl}&trlerAcmpnyAt=${searchDTO.trlerAcmpnyAt}&caravAcmpnyAt=${searchDTO.caravAcmpnyAt}" />
		                <c:set var="page" value="${requestScope.page}" scope="page" />
		                <c:if test="${page.previousPageGroup }">
		                    <a class="page_arrow" href="spotCategorySearch.do?${parameter}&pageNo=${page.startPageOfPageGroup-1}">◀</a>
		                </c:if>
		                <c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
		                    <a id="paging_write_number" href="spotCategorySearch.do?${parameter}&pageNo=${i}">${i }</a>					
		                </c:forEach>
		                <c:if test="${page.nextPageGroup }">
		                    <a class="page_arrow" href="spotCategorySearch.do?${parameter}&pageNo=${page.endPageOfPageGroup+1}">▶</a>
		                </c:if>
		            </div>
		        </div><!-- detail_camping_info마지막 -->
    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>