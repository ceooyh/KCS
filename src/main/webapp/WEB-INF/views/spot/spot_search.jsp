<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/spot/spot_search.css">
<title>캠핑장 찾기 페이지</title>
<style>
    
    
</style>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <div id="detail_condition"><!-- 선택창 시작 -->
            <form action="spotSearch.do">
	            <div id="detail_condition_input"><!-- 상세검색창 시작 -->
	                <span id="detail_condition_headline">키워드검색창</span>
	                <div id="keyword_search_head"><!-- 키워드 선택창 시작 -->
	                    <input id="keyword_search_input" type="text" name="search" placeholder="검색어를 입력하세요">
	                    <button class="search_btn" id="search_btn2" type="submit">검색</button>
	                    <button class="search_btn" id="search_btn2" type="reset">초기화</button>
	                </div><!-- 키워드 선택창 마지막 -->
	            </div><!-- 상세검색창 마지막 -->
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
		                <c:set var="page" value="${requestScope.page}" scope="page" />
	                	<c:choose>
	                		<c:when test="${requestScope.search eq '' }">
		                		<c:if test="${page.previousPageGroup }">
			                    	<a class="page_arrow" href="findCampSpotView.do?pageNo=${page.startPageOfPageGroup-1}">◀</a>
				                </c:if>
				                <c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
				                    <a id="paging_write_number" href="findCampSpotView.do?pageNo=${i}">${i }</a>					
				                </c:forEach>
				                <c:if test="${page.nextPageGroup }">
				                    <a class="page_arrow" href="findCampSpotView.do?pageNo=${page.endPageOfPageGroup+1}">▶</a>
				                </c:if>
		                    </c:when>
		                	<c:otherwise>
		                    	<c:if test="${page.previousPageGroup }">
			                    	<a class="page_arrow" href="spotSearch.do?search=${requestScope.search}&pageNo=${page.startPageOfPageGroup-1}">◀</a>
				                </c:if>
				                <c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
				                    <a id="paging_write_number" href="spotSearch.do?search=${requestScope.search}&pageNo=${i}">${i }</a>					
				                </c:forEach>
				                <c:if test="${page.nextPageGroup }">
				                    <a class="page_arrow" href="spotSearch.do?search=${requestScope.search}&pageNo=${page.endPageOfPageGroup+1}">▶</a>
				                </c:if>
		                	</c:otherwise>
	                	</c:choose>
		            </div>
		        </div><!-- detail_camping_info마지막 -->
    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>