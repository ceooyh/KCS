<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 찾기 페이지</title>
<style>
    @font-face {
        font-family: '보통노토';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Medium.otf);
    }
    @font-face {
        font-family: '얇은노토';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Light.otf);
    }
    @font-face {
        font-family: '얇은노토2';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-DemiLight.otf);
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
        font-family: '두꺼운로보';
        src: url(../../../Font/Roboto/Roboto-Bold.ttf);
    }
    @font-face {
        font-family: '에스코어8';
        src: url(../../../Font/S-Core_Dream_OTF/SCDream8.otf);
    }
    @font-face {
        font-family: '에스코어7';
        src: url(../../../Font/S-Core_Dream_OTF/SCDream7.otf);
    }
    @font-face {
        font-family: '에스코어6';
        src: url(../../../Font/S-Core_Dream_OTF/SCDream6.otf);
    }
    @font-face {
        font-family: '에스코어5';
        src: url(../../../Font/S-Core_Dream_OTF/SCDream5.otf);
    }
    @font-face {
        font-family: '에스코어4';
        src: url(../../../Font/S-Core_Dream_OTF/SCDream4.otf);
    }
    *{
        padding: 0;
        margin: 0;
    }
    #detail_condition{
        background-image: url(../../../img/searchpage/searchimg.png);
        background-repeat: no-repeat;
        height: 300px;
        box-sizing: border-box;
        padding-top: 30px;
    }
    #detail_condition_headline{
        display: inline-block;
        width: 100%;
        padding-bottom: 10px;
        border-bottom: 1px solid rgb(216, 216, 216);
        color: rgb(44, 42, 41);
        font-family: '보통노토';
    }
    #detail_condition_input{
        width: 900px;
        margin: 30px auto;
        background-color: white;
        border: 1px solid rgb(44, 42, 41);
        padding: 30px;
        box-sizing: border-box;
    }
    #collector_keyword_head{
        margin: 10px 0;
    }
    /*셀렉트 화살표 없애기*/
    #collector_keyword_select select{
        -webkit-appearance:none; 
        -moz-appearance:none;  
        appearance:none
    }
    /*테마선택창 이름*/
    .keyword_class{
        display: inline-block;
        width: 200px;
        font-family: '보통노토';
        color: rgb(44, 42, 41);
    }
    /*테마선택 셀렉트*/
    .keyword_select_class{
        color: rgb(44, 42, 41);
        width: 200px;
        font-family: '얇은노토2';
        padding: 4px;
    }
    #keyword_search_head{
        margin-top: 50px;
    }
    #keword_search_span{
        display: inline-block;
        width: 200px;
        font-family: '보통노토';
        color: rgb(44, 42, 41);
        margin-bottom: 10px;
    }
    #keyword_search_input{
        width: 600px;
        color: rgb(44, 42, 41);
        font-family: '얇은노토2';
        padding: 4px 4px 4px 10px;
    }
    #keyword_search_input::placeholder{
        color: rgb(216, 216, 216);
    }
    .search_btn{
        width: 100px;
        background-color: rgb(17, 17, 16);
        color: rgb(240, 240, 240);
        height: 30px;
        border: none;
    }
    #search_btn2{
        background-color: rgb(248, 185, 112);
    }
    .search_btn:hover{
        cursor: pointer;
    }
    #headrow{
        height: 20px;
        width: 100%;
        background-color: rgba(230, 230, 230, 0.5);
        margin-bottom: 40px;
    }
    #detail_camping_seach_div{
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }
    .detail_camping_category{
        width: 1200px;
        border-radius: 5px;
        background-color: white;
        margin-bottom: 20px;
        padding: 20px 20px 20px 20px;
        font-size: 14px;
        box-sizing: border-box;
        letter-spacing :2px;
        font-family: '보통노토';
    }
    .category_campingtype_span{
        margin-right: 20px;
    }
    .category_campingtype_input{
        margin-right: 4px;
    }
    .camping_category_btn{
        margin: 0 auto;
        width: 49%;
        height: 30px;
        font-family: '보통노토';
        background-color: rgb(218, 218, 218);
        color: rgb(44, 42, 41);
        border: none;
        cursor: pointer;
        letter-spacing :10px
    }
    .camping_category_btn:hover{
        background-color: rgb(44, 42, 41);
        color: rgb(240, 240, 240);
    }
    #detail_camping_category_btn{
        text-align: center;
        padding: 10px 20px 10px 20px;
    }
    .price_input{
        width: 100px;
        margin-right: 15px;
        margin-left: 15px;
        height: 23px;
        font-family: '얇은노토';

    }
    .price_input::placeholder{
        color: rgba(215,215,215);
    }



/*캠핑장 리스트 목록 css */
    #spot_detail_search_container{
        border-bottom: 2px solid rgb(165, 165, 165);
        margin-bottom: 40px;
    }
    #detail_camping_info{
        width: 1200px;
        margin: 0 auto;
    }
    #detail_camping_info h1{
        margin-bottom: 40px;
        font-family: '굵은노토';
        font-size: 30px;
        color: rgb(44, 42, 41);
    }
    #h1_down_row{
        margin-bottom: 10px;
    }
    #camping_info_list{
        width: 100%;
        box-sizing: border-box;
        height: 300px;
        margin-bottom: 10px;
        position: relative;
    }
    #spot_main_img{
        position: absolute;
        left: 0;
        width: 30%;
        height: 100%;
        box-sizing: border-box;
        margin: 0;
        box-sizing: border-box;
        padding: 20px;
    }
    #spot_main_img> img{
        width: 100%;
        height: 100%;
        border:1px solid rgb(44, 42, 41);
        box-shadow: 3px 3px 3px gray;
    }
    #spot_main_content{
        position: absolute;
        left: 30%;
        width: 50%;
        height: 100%;
        box-sizing: border-box;
        margin: 0;
        box-sizing: border-box;
        padding: 20px;
    }
    #spot_main_otherinfo{
        position: absolute;
        right: 0;
        width: 20%;
        height: 100%;
        box-sizing: border-box;
        margin: 0;
        box-sizing: border-box;
        padding: 20px;
    }
    #spot_name_title{
        display: inline-block;
        font-family: '에스코어8';
        font-size: 32px;
        margin-bottom: 10px;
    }
    #spot_name_title>a{
        /*text-shadow: 2px 2px 2px rgb(163, 163, 162);*/
        text-decoration: none;
        color: rgb(252, 177, 80);
    }
    #spot_name_title>a:hover{
        color: rgb(172, 245, 130);
        text-decoration: underline;
    }
    #online_intro{
        display: inline-block;
        font-family: '에스코어5';
        font-size: 23px;
        color: rgb(44, 42, 41);
        margin-bottom: 10px;
    }
    .spot_title{
        display: inline-block;
        font-size: 14px;
        font-family: '에스코어5';
        color: rgb(44, 42, 41);
        padding-left: 25px;
        box-sizing: border-box;
        height: 30px;
        vertical-align: middle;
    }
    #spot_address_title{
        background-image: url(../../../img/searchpage/location.png);
        background-size: 20px;
        background-repeat: no-repeat;
    }
    #spot_tel_title{
        background-image: url(../../../img/searchpage/telephone.png);
        background-size: 20px;
        background-repeat: no-repeat;
    }
    #spot_homepage_title{
        background-image: url(../../../img/searchpage/homepage.png);
        background-size: 20px;
        background-repeat: no-repeat;
    }
    #spot_homepage_title a{
        color: rgb(44, 42, 41);
        font-family: '에스코어5';
        text-decoration: none;
    }
    #spot_homepage_title a:hover{
        text-decoration: underline;
    }
    .camping_status_info{
        font-family: '두꺼운로보';
        display: inline-block;
        font-size: 12px;
        color: white;
        width: 40px;
        height: 40px;
        vertical-align: middle;
        text-align: center;
        box-sizing: border-box;
        padding-top: 14px;
        border-radius: 50%;
    }
    #status_open{
        background-color: rgb(18, 0, 180);
    }
    #status_close{
        background-color: rgb(170, 0, 0);
    }
    #spot_theme_title{
        display: inline-block;
        width: 100%;
        height: 74px;
        border: 1px solid rgb(252, 177, 80);
        padding: 10px;
        box-sizing: border-box;
    }
    #spot_theme_title span{
        display: inline-block;
        font-family: '에스코어7';
        color: rgb(44, 42, 41);
        font-size: 13px;
        margin-bottom: 10px;
    }
    #spot_theme_title p{
        font-family: '에스코어5';
        font-size: 12px;
        padding-left: 20px;
        letter-spacing :2px;
    }
    #paging_write{
        width: 1200px;
        margin: 0 auto;
        text-align: center;
        margin-top: 20px;
        margin-bottom: 50px;
    }
    #paging_write a{
        text-decoration: none;
        /*color: rgb(44, 42, 41);*/
        font-family: '굵은노토';
        font-size: 14px;
    }
    .page_arrow{
        color: rgb(44, 42, 41);
        margin: 0 20px;
    }
    #paging_write_number{
        display: inline-block;
        background-color: rgb(44, 42, 41);
        color: white;
        padding: 3px;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        margin-left: 3px;
        margin-right: 3px;
    }
    #paging_write_number:hover{
        background-color: rgb(165, 165, 165);
        color: rgb(44, 42, 41);
    }
    .page_arrow:hover{
        color: rgb(165, 165, 165);
    }
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
                        <span id="spot_name_title"><a href="spotDetailView.do?facltNm=${dto.facltNm}">${dto.facltNm}</a></span><br>
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