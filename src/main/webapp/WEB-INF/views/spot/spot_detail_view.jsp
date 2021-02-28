<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        font-family: '얇은노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Light.otf);
    }
    @font-face {
        font-family: '얇은노토2';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-DemiLight.otf);
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
    @font-face {
        font-family: '에스코어8';
        src: url(Font/S-Core_Dream_OTF/SCDream8.otf);
    }
    @font-face {
        font-family: '에스코어7';
        src: url(Font/S-Core_Dream_OTF/SCDream7.otf);
    }
    @font-face {
        font-family: '에스코어6';
        src: url(Font/S-Core_Dream_OTF/SCDream6.otf);
    }
    @font-face {
        font-family: '에스코어5';
        src: url(Font/S-Core_Dream_OTF/SCDream5.otf);
    }
    @font-face {
        font-family: '에스코어4';
        src: url(Font/S-Core_Dream_OTF/SCDream4.otf);
    }
    *{
        padding: 0;
        margin: 0;
    }
    #maintitle_img_headline{
        width: 1920px;
        height: 320px;
        box-sizing: border-box;
        background-image: url(../../../img/searchpage/detail_camping_viewimg.png);
    }
    #headLine_row{
        width: 100%;
        height: 20px;
        background-color: rgb(236, 236, 236);
    }
    section{
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }
    #maintitle_name_div{
        width: 1200px;
        margin: 0 auto;
        height: 320px;
        box-sizing: border-box;
    }
    #camping_sname_ptag{
        display: inline-block;
        font-family: '에스코어7';
        font-size: 32px;
        color: rgb(236, 236, 236);
        margin-top: 80px;
        margin-bottom: 10px;
        text-shadow: 3px 3px 3px black;
    }
    #camping_address_ptag{
        display: inline-block;
        font-family: '에스코어4';
        font-size: 21px;
        color: rgb(236, 236, 236);
        margin-bottom: 15px;
        text-shadow: 1px 1px 1px black;
    }
    #maintitle_name_div hr{
        border: 1px solid rgb(236, 236, 236);
        margin-bottom: 15px;
    }
    #tag_name{
        display: inline-block;
        color: rgb(236, 236, 236);
        font-family: '얇은노토';
        font-size: 15px;
        width: 50px;
        height: 30px;
        padding-top: 3px;
        box-sizing: border-box;
        border: 1px solid rgb(236, 236, 236);
        border-radius: 15px;
        text-align: center;
        margin-right: 10px;
    }
    #tag_content{
        font-family: '얇은노토';
        color: rgb(236, 236, 236);
    }
    section{
        width: 1200px;
        margin-bottom: 80px;
    }

    /*최초 캠핑장 정보 내역*/
    #main_content_container{
        position: relative;
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        margin-bottom: 50px;
        height: 500px;
        box-sizing: border-box;
    }
    #main_content_img{
        position: absolute;
        left: 0;
        width: 60%;
        height: 100%;
        box-sizing: border-box;
        padding: 10px;
    }
    #main_content_img img{
        width: 100%;
        height: 100%;
    }
    #maint_content_info{
        position: absolute;
        right: 0;
        width: 40%;
        height: 100%;
        box-sizing: border-box;
        padding: 10px;
    }
    .detail_content_div{
        position: relative;
        height: 10%;
        box-sizing: border-box;
        margin: 0;
        border-bottom: 1px solid rgb(236, 236, 236);
    }
    .detail_content_div_first{
        position: absolute;
        left: 0;
        box-sizing: border-box;
        width: 25%;
        height: 100%;
        vertical-align: middle;
        padding-top: 14px;
        padding-left: 20px;
        font-size: 14px;
        font-family: '에스코어6';
        color: rgb(44,42,41);
    }
    #detail_content_div_first{
        border-top: 2px solid red;
    }
    #detail_content_div_second{
        border-top: 2px solid rgb(44,42,41);
    }
    .detail_content_div_second{
        position: absolute;
        right: 0;
        box-sizing: border-box;
        width: 75%;
        height: 100%;
        vertical-align: middle;
        padding-top: 14px;
        padding-left: 15px;
        font-size: 13px;
        font-family: '에스코어4';
    }
    /*찜하기 예약하기 버튼 CSS*/
    .detail_content_div:last-child{
        padding-top: 8px;
    }
    #resevation_btn{
        display: inline-block;
        width: 30%;
        height: 80%;
        background-color: rgb(248, 169, 79);
        box-sizing: border-box;
        text-align: center;
        font-size: 14px;
    }
    #resevation_btn a{
        display: inline-block;
        padding-top: 7px;
        width: 100%;
        height: 100%;
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    #keep_btn{
        text-align: center;
        display: inline-block;
        height: 80%;
        width: 30%;
        background-color: rgb(50, 102, 136);
        box-sizing: border-box;
        font-size: 14px;
    }
    #keep_btn a{
        display: inline-block;
        padding-top: 7px;
        width: 100%;
        height: 100%;
        font-family: '에스코어5';
        text-decoration: none;
        color: white;
    }
    #homepage_move_btn{text-decoration: none; color: rgb(153, 153, 153);}
    #resevation_btn a:hover{background-color:rgb(248, 169, 79);}
    #keep_btn a:hover{background-color: rgb(50, 102, 136);}



    /*캠핑장 정보 안의 메뉴창 CSS*/
    #detail_information_maincontent{
        width: 1200px;
        margin: 30px auto;
    }
    .detail_information_menubar1{
        margin-bottom: 30px;
    }
    .detail_information_menubar1 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar1 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar1 td:first-child{
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .detail_information_menubar1 td:nth-child(2){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar1 td:nth-child(3){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar2{
        margin-bottom: 30px;
    }
    .detail_information_menubar2 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar2 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar2 td:first-child{
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar2 td:nth-child(2){
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .detail_information_menubar2 td:nth-child(3){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3{
        margin-bottom: 30px;
    }
    .detail_information_menubar3 table{
        box-sizing: border-box;
        border-collapse: collapse;
    }
    .detail_information_menubar3 td{
        width: 10%;
        text-align: center;
        box-sizing: border-box;
        padding: 10px;
        color: rgb(44,42,41);
    }
    .detail_information_menubar3 td:first-child{
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3 td:nth-child(2){
        background-color: rgb(128, 126, 126);
        border-right:1px solid white;
    }
    .detail_information_menubar3 td:nth-child(3){
        border-top: 1px solid rgb(44,42,41);
        border-right:1px solid white;
    }
    .menubar1-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }
    .menubar1-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar1-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar2-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar2-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }
    .menubar2-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-1:first-child{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-2{
        text-decoration: none;
        font-family: '에스코어5';
        color: white;
    }
    .menubar3-3{
        text-decoration: none;
        font-family: '에스코어5';
        color: rgb(44,42,41);
    }

    /*캠핑장 위치정보 CSS*/
    #detail_information_image{
        width: 1000px;
        height: 600px;
        margin: 0 auto;
        /*background-color: rgb(247, 186, 186);*/
        border: 1px solid rgb(236, 236, 236);
        text-align: center;
        box-sizing: border-box;
        margin-bottom: 30px;
    }

    /*캠핑장 긴글소개 CSS*/
    #detail_information_longinfo{
        width: 1200px;
        margin: 0 auto;
        margin-bottom: 30px;
        padding: 15px 0;
        font-family: '얇은노토';
        font-size: 14px;
        border-top: 2px solid rgb(44,42,41);
        border-bottom: 1px solid rgb(128, 126, 126);
    }


    /*캠핑장 시설정보 CSS*/
    #detail_information_detailinfo{
        width: 1200px;
        margin: 0 auto;
    }
    .camp_facility_info{
        display: inline-block;
        font-family: '에스코어6';
        color: rgb(44,42,41);
        font-size: 20px;
        margin-bottom: 10px;
    }

    /*캠핑장 시설정보 아이콘 CSS*/
    #container_icon{
        width: 100%;
        padding: 30px;
        box-sizing: border-box;
        /*background-color: rgb(117, 101, 101);*/
        border: 1px solid rgb(128, 126, 126);
        margin-bottom: 50px;
    }
    .icon_container{
        display: inline-block;
        width: 90px;
        height: 110px;
        box-sizing: border-box;
        margin-right: 30px;
    }
    #img_span{
        display: inline-block;
        width: 90px;
        height: 90px;
        box-sizing: border-box;
    }
    #img_span img{
        width: 100%;
        height: 100%;
    }
    #icon_index{
        width: 90px;
        height: 20px;
        box-sizing: border-box;
        text-align: center;
        font-family: '에스코어5';
        font-size: 13px;
        color: rgb(44,42,41);
    }


    /*상세정보창 CSS*/
    #container_info{
        width: 1200px;
        position: relative;
    }
    .container_info_first{
        position: absolute;
        left: 0;
        width: 20%;
    }
    .container_info_second{
        position: absolute;
        right: 0;
        width: 80%;
        height: 20px;
    }
    #camp_facility_info{
        width: 1200px;
    }
    .container_info_category{
        width: 1200px;
        position: relative;
        height: 40px;
        margin: 0;
    }
    .container_info_first{
        position: absolute;
        left: 0;
        width: 10%;
        height: 40px;
        box-sizing: border-box;
        padding: 10px;
        font-family: '에스코어7';
        font-size: 13px;
        color: rgb(44,42,41);
    }
    .container_info_second{
        /*background-color: rgb(231, 231, 231);*/
        margin: 0;
        position: absolute;
        right: 0;
        width: 90%;
        height: 40px;
        box-sizing: border-box;
        padding: 10px;
        border-bottom: 1px solid rgb(128, 126, 126);
        font-family: '에스코어5';
        font-size: 13px;
        color: rgb(153, 153, 153);
    }
    #top_category1{
        border-top: 2px solid red;
    }
    #top_category2{
        border-top: 2px solid rgb(44,42,41);
    }
    #last_category1{
        border-bottom: 2px solid rgb(44,42,41);
    }
    #last_category2{
        border-bottom: 2px solid rgb(44,42,41);
    }
</style>
</head>
<body>
<!-- 메인화면 제일 위 캠핑장 이름 주소부분 start-->
    <div id="maintitle_img_headline">
            <div id="maintitle_name_div">
                <span id="camping_sname_ptag">${requestScope.spotDTO.facltNm}</span><br>
                <span id="camping_address_ptag">${requestScope.spotDTO.addr1}</span>
                <hr>
            </div>
    </div>
<!-- 메인화면 제일 위 캠핑장 이름 주소부분 end-->
    <div id="headLine_row"></div>
    <section>
<!-- 캠핑장 기본 이미지, 기본 정보 부분 start -->
	        <div id="main_content_container">
	            <div id="main_content_img">
	            	<c:choose>
	            		<c:when test="${requestScope.spotDTO.firstImageUrl ne '-'}">
			                <img src="${requestScope.spotDTO.firstImageUrl}" alt="">
	            		</c:when>
	            		<c:otherwise>
			                <img src="../../../img/searchpage/noimg" alt="">
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div id="maint_content_info">
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first" id="detail_content_div_first">주소</span>
	                    <span class="detail_content_div_second" id="detail_content_div_second">${requestScope.spotDTO.addr1} ${requestScope.spotDTO.addr2}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">연락처</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.tel}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">캠핑장 환경</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.lctCl}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">캠핑장 유형</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.induty}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">계절오픈</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.operPdCl}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">운영요일</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.operDeCl}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">홈페이지</span>
	                    <span class="detail_content_div_second"><a id="homepage_move_btn" href="${requestScope.spotDTO.homepage}">${requestScope.spotDTO.homepage}</a></span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">애완동물출입 여부</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.animalCmgCl }</span>
	                </div>
	                <div class="detail_content_div">
	                    <span class="detail_content_div_first">캠핑장 특징</span>
	                    <span class="detail_content_div_second">${requestScope.spotDTO.featureNm}</span>
	                </div>
	                <div class="detail_content_div">
	                    <span id="resevation_btn"><a href="">예약하기</a></span>
	                    <span id="keep_btn"><a href="">찜하기</a></span>
	                </div>
	            </div>
	        </div>
<!-- 캠핑장 기본 이미지, 기본 정보 부분 end -->


<!-- 캠핑장 상세내역 start -->		
        <div id="detail_information_maincontent">

            <div id="location1"></div>


			<!--중간안내바 start -->
            <div class="detail_information_menubar1">
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar1-1">위치안내</a></td><td><a href="#location2" class="menubar1-2">캠핑장소개</a></td><td><a href="#location3" class="menubar1-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div>
            <!--중간안내바 end -->



			<!--캠핑장 지도 start -->
            <div id="detail_information_image">
                <img src="map" alt="">지도 들어가는곳
            </div>
			<!--캠핑장 지도 end -->



            <div id="location2"></div>



			<!--중간안내바 start -->
            <div class="detail_information_menubar2" id="detail_information_menubar1">
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar2-1">위치안내</a></td><td><a href="#location2" class="menubar2-2">캠핑장소개</a></td><td><a href="#location3" class="menubar2-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div>
            <!--중간안내바 end -->
            
            
            
            <!-- 캠핑장 긴소개글 start -->
            <div id="detail_information_longinfo">
            	<c:choose>
            		
            		<c:when test="${requestScope.spotDTO.intro ne '-'}">
            			<p>${requestScope.spotDTO.intro}</p>
            		</c:when>
            		
            		
            		<c:otherwise>
            			<p>캠핑장 소개글을 등록하지 않았습니다.</p>
            		</c:otherwise>
            		
            	</c:choose>
            </div>
            <!-- 캠핑장 긴소개글 end -->
            
            

            <div id="location3"></div>



			<!--중간안내바 start -->
            <div class="detail_information_menubar3" id="detail_information_menubar1">
                <table>
                    <tr>
                        <td><a href="#location1" class="menubar3-1">위치안내</a></td><td><a href="#location2" class="menubar3-2">캠핑장소개</a></td><td><a href="#location3" class="menubar3-3">캠핑장상세내역</a></td>
                    </tr>
                </table>
            </div>
            <!--중간안내바 end -->


<!-- 캠핑장 자세한 정보 모음 창 start -->
            <div id="detail_information_detailinfo">
			<!-- 캠핑장 아이콘 표시부분 start -->
                <span class="camp_facility_info">[캠핑장시설정보]</span>
                <div id="container_icon">
                    	<c:forEach var="iconlist" items="${sbrsClList}">
                    		<c:choose>
                    			
                    			<c:when test="${iconlist eq '전기'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/electro.png" alt=""></span>
			                        	<p id="icon_index">전기</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '무선인터넷'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/wifi.png" alt=""></span>
			                        	<p id="icon_index">무선인터넷</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '장작'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/firewood.png" alt=""></span>
			                        	<p id="icon_index">장작</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '온수'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/hotwater.png" alt=""></span>
			                        	<p id="icon_index">온수</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '트렘폴린'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/Trempoline.png" alt=""></span>
			                        	<p id="icon_index">트렘폴린</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '수영장'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/pool.png" alt=""></span>
			                        	<p id="icon_index">수영장</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '놀이터'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/playground.png" alt=""></span>
			                        	<p id="icon_index">놀이터</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '산책로'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/walking.png" alt=""></span>
			                        	<p id="icon_index">산책로</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '운동장'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/ground.png" alt=""></span>
			                        	<p id="icon_index">운동장</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '운동시설'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/gym.png" alt=""></span>
			                        	<p id="icon_index">운동시설</p>
			                    	</span>
                    			</c:when>
                    			
                    			
                    			<c:when test="${iconlist eq '마트'}">
		                    		<span class="icon_container">	
			                        	<span id="img_span"><img src="../../../img/FacilitiesIcon/mart.png" alt=""></span>
			                        	<p id="icon_index">마트</p>
			                    	</span>
                    			</c:when>
                    			
                    		</c:choose>
	                    	
	                    </c:forEach>
                </div>
              	<!-- 캠핑장 아이콘 표시부분 end -->
                
                
                
              	<!-- 캠핑장 상세정보 표시부분 start -->
                <span class="camp_facility_info">[캠핑장상세정보]</span>
                <div id="container_info">
	                
	                    <div class="container_info_category">
	                        <span class="container_info_first" id="top_category1">주요시설</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.gnrlSiteCo ne '-'}">
	                        		<span class="container_info_second">일반야영장</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.autoSiteCo ne '-'}">
	                        		<span class="container_info_second">자동차야영장</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.glampSiteCo ne '-'}">
	                        		<span class="container_info_second">글램핑</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.caravSiteCo ne '-'}">
	                        		<span class="container_info_second">카라반</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.indvdlCaravSiteCo ne '-'}">
	                        		<span class="container_info_second">개인카라반</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
	                        		<span class="container_info_second">주요시설 구분 없음</span>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">사이트간격</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.sitedStnc ne '-'}">
	                        		<span class="container_info_second">${requestScope.spotDTO.sitedStnc}m</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:otherwise>
	                        		<span class="container_info_second">없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">바닥형태</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.siteBottomCl1 ne '-'}">
			                        <span class="container_info_second">잔디</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.siteBottomCl2 ne '-'}">
			                        <span class="container_info_second">파쇄석</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.siteBottomCl3 ne '-'}">
			                        <span class="container_info_second">테크</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.siteBottomCl4 ne '-'}">
			                        <span class="container_info_second">자갈</span>
	                        	</c:when>
	                        	
	                        
	                        	<c:when test="${requestScope.spotDTO.siteBottomCl5 ne '-'}">
			                        <span class="container_info_second">맨흙</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">정보없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">사이트크기</span>
	                        <span class="container_info_second">${requestScope.spotDTO.siteMg1Width} X ${requestScope.spotDTO.siteMg1Vrticl} (${requestScope.spotDTO.siteMg1Co}개)</span>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">캠핑장비대여</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.eqpmnLendCl ne '-'}">
			                        <span class="container_info_second">${requestScope.spotDTO.eqpmnLendCl}</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">장비대여 없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">애완동물출입</span>
	                         <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.animalCmgCl ne '-'}">
			                        <span class="container_info_second">${requestScope.spotDTO.animalCmgCl}</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">불가능</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">화장실개수</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.toiletCo ne '-'}">
			                        <span class="container_info_second">${requestScope.spotDTO.toiletCo}개</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first">샤워실개수</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.swrmCo ne '-'}">
			                        <span class="container_info_second">${requestScope.spotDTO.swrmCo}</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
	                    <div class="container_info_category">
	                        <span class="container_info_first" id="last_category1">개수대개수</span>
	                        <c:choose>
	                        
	                        	<c:when test="${requestScope.spotDTO.wtrplCo ne '-'}">
			                        <span class="container_info_second">${requestScope.spotDTO.wtrplCo}</span>
	                        	</c:when>
	                        	
	                        	<c:otherwise>
			                        <span class="container_info_second">없음</span>
	                        	</c:otherwise>
	                        	
	                        </c:choose>
	                    </div>
	                    
                </div>
                <!-- 캠핑장 상세정보 표시부분 end -->
                
            </div>
<!-- 캠핑장 자세한 정보 모음 창 start -->
        </div>
<!-- 캠핑장 상세내역 end -->
    </section>
</body>
</html>