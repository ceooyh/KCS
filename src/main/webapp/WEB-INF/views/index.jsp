<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="../../css/fonts/font.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function(){
	    var slideIndex = 1;
	    showSlides(slideIndex);
	    function currentSlide(n) {
	        showSlides(slideIndex = n);
	    }
	    
	    $(".prev").click(function(){
	    	var n=-1;
	    	showSlides(slideIndex += n);
	    });
	    
	    $(".next").click(function(){
	    	var n=-1;
	    	showSlides(slideIndex += n);
	    });
	    
	    function showSlides(n) {
	    	var i;
		    var slides = document.getElementsByClassName("mySlides");
		    var dots = document.getElementsByClassName("dot");
		    if (n > slides.length) {
			    slideIndex = 1
			}    
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
			    slides[i].style.display = "none";  
			}
			for (i = 0; i < dots.length; i++) {
			    dots[i].className = dots[i].className.replace(" active", "");
			}
			    slides[slideIndex-1].style.display = "block";  
			    dots[slideIndex-1].className += " active";
	    }
	    
	    
	    $('.bxslider').bxSlider({
	        mode: 'fade',
	        captions: true,
	        autoStart: true,
	        slideWidth: 1200,
	        speed: 1000,
	        page:true
	      });
	    $('.bxslider2').bxSlider({
	        mode: 'fade',
	        captions: true,
	        autoStart: true,
	        slideWidth: 1200,
	        speed: 1000,
	        page:true
	      });
	});
</script>
<style>
/*메인 슬라이드 이미지 CSS*/
    #main_imgslide_container{
        width: 100%;
        height: 870px;
        position: relative;
    }
    #slideimg_img{
        background-image: url(img/sample/bonfire-1867275.jpg);
        width: 100%;
        height: 100%;
        background-position: center;
        background-size: 100%;
    }
    #slide_down_btn{
        width: 100%;
        height: 50px;
        position: relative;
    }
    #slide_down_btn_right{
        display: inline-block;
        left: 0;
        width: 50%;
        height: 100%;
        position: absolute;
        background-color: black;
        text-align: right;
        box-sizing:border-box;
        padding-top:10px;
        padding-right: 100px;
    }
    #slide_down_btn_left{
        box-sizing:border-box;
        padding-top:10px;
        padding-left: 100px;
        display: inline-block;
        position: absolute;
        right: 0;
        width: 50%;
        height: 100%;
        background-color: rgb(255, 174, 108);
        text-align: left;
    }
    .btn_sitemove{
		text-align: center;
		text-decoration: none;
		font-family: '에스코어6';
	}
	#detail_go{
		color: white;
		margin-left: 20px;
		font-size: 20px;
	}
	#keyword_go{
		color:rgb(44,42,41);
		margin-right: 20px;
		font-size: 20px;
	}

    /*넥스트, 이전 버튼*/
    .prev, .next {
    	border:none;
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        background-color:rgba(44,42,41,0.3);
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
    }
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }
    .prev:hover, .next:hover {
        background-color: rgba(240,240,240,0.8);
    }

    /*그림 슬라이드 숨기기*/
    .mySlides {
        display: none
    }
    .fade {
        -webkit-animation-name: fade;
        -webkit-animation-duration: 1.5s;
        animation-name: fade;
        animation-duration: 1.5s;
    }
    .dot {
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  position:absolute;
	  bottom:20px;
	  transition: background-color 0.6s ease;
	}
	.active {
	  background-color: #717171;
	}
	@-webkit-keyframes fade {
	  	from {opacity: .4} 
	  	to {opacity: 1}
	}
	@keyframes fade {
		from {opacity: .4} 
		to {opacity: 1}
	}
	
    /*아래쪽 메인 파트 부분 CSS*/
    section{
        width: 100%;
        margin: 0 auto;
    }
    /*취향부분 CSS 시작*/
        #slider_img_favor{
            width: 100%;
            height: 700px;
            background-position: center;
            background-size: cover;
            background-image:url(../../img/indexpage/33.png) ;
            position: relative;
        }
        #slider_img_favor_headline{
            position: absolute;
            width: 1000px;
            text-align: center;
            top: 100px;
            left: 25%;
            font-size: 33px;
            color: rgb(36, 36, 36);
            font-family: '에스코어8';
        }
        #info_img_container{
            position: absolute;
            width: 1200px;
            height: 400px;
            font-size: 0;
            top: 25%;
            left: 18%;
        }
        #img_totalinfo{
            z-index: 10;
            box-shadow: 2px 2px 10px 3px rgba(0,0,0,0.5);
            position: absolute;
            display: inline-block;
            width: 300px;
            height: 400px;
            left: 0;
        }
        #img_totalinfo_img{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            background-image: url(../../img/indexpage/find.jpg);
            background-size: cover;
        }
        #img_totalinfo_text{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            font-family: '에스코어5';
            font-size: 14px;
            color: white;
            padding: 20px;
            background-color: orange;
        }
        #favor_btn{
            display: inline-block;
            width: 100px;
            height: 30px;
            font-size: 20px;
            border: 2px solid white;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        #img_container_all{
            position: absolute;
            right: 0;
            top:50px;
            display: inline-block;
            width: 900px;
            height: 300px;
            box-sizing: border-box;
            font-size: 0;
        }
        .img_container{
            width: 300px;
            height: 300px;
            box-sizing: border-box;
            display: inline-block;
            margin: 0;
            background-size: cover;
            font-size: 16px;
            cursor: pointer;
        }
        .img_container:hover{
            border: 8px solid orange;
        }
        #img_headLine{
            margin: 0 100px;
        }
        #img_info{
            display: inline-block;
            position: absolute;
            bottom: 0;
            width: 300px;
            height: 100px;
            padding-top: 30px;
            padding-left: 30px;
            box-sizing: border-box;
            font-family: '에스코어6';
            color: white;
            font-size: 15px;
            background-color: rgba(0,0,0,0.2);
        }
        /*취향부분 CSS 끝*/


        /*별점순 CSS 시작*/
        #slider_img_star{
            width: 100%;
            height: 700px;
            background-position: center;
            background-size: cover;
            background-image:url(../../img/indexpage/22.png) ;
            position: relative;
        }
        #slider_img_favor_headline2{
            position: absolute;
            width: 1000px;
            text-align: center;
            top: 100px;
            left: 25%;
            font-size: 33px;
            color: rgb(36, 36, 36);
            font-family: '에스코어8';
        }
        #info_img_container2{
            position: absolute;
            width: 1200px;
            height: 400px;
            font-size: 0;
            top: 25%;
            left: 18%;
        }
        #img_totalinfo2{
            z-index: 10;
            box-shadow: 2px 2px 10px 3px rgba(0,0,0,0.5);
            position: absolute;
            display: inline-block;
            width: 300px;
            height: 400px;
            left: 0;
        }
        #img_totalinfo_img2{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            background-image: url(../../img/indexpage/feedback.jpg);
            background-size: cover;
        }
        #img_totalinfo_text2{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            font-family: '에스코어5';
            font-size: 14px;
            color: white;
            padding: 20px;
            background-color: rgb(0, 195, 255);
        }
        #favor_btn2{
            display: inline-block;
            width: 100px;
            height: 30px;
            font-size: 20px;
            border: 2px solid white;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        #img_container_all2{
            position: absolute;
            right: 0;
            top:50px;
            display: inline-block;
            width: 900px;
            height: 300px;
            box-sizing: border-box;
            font-size: 0;
        }
        .img_container2{
            width: 300px;
            height: 300px;
            box-sizing: border-box;
            display: inline-block;
            margin: 0;
            background-size: cover;
            font-size: 16px;
            cursor: pointer;
        }
        .img_container2:hover{
            border: 8px solid rgb(0, 195, 255);
        }
        #img_headLine2{
            margin: 0 100px;
        }
        #img_info2{
            display: inline-block;
            position: absolute;
            bottom: 0;
            width: 300px;
            height: 100px;
            padding-top: 30px;
            padding-left: 30px;
            box-sizing: border-box;
            font-family: '에스코어6';
            color: white;
            font-size: 15px;
            background-color: rgba(0,0,0,0.2);
        }
        /*별점순 CSS 끝*/


        /*중간 광고배너시작*/
        #container_first_banner{
            width: 100%;
            height: 100px;
            background-color: rgb(255, 153, 0);
        }
        #container_all_firstbanner{
            width: 1200px;
            height: 100%;
            margin: 0 auto;
            box-sizing: border-box;
            position: relative;
        }
        #left_logo{
            position: absolute;
            width: 300px;
            height: 100%;
            box-sizing: border-box;
            text-align: center;
            padding-top: 30px;
        }
        #left_logo{font-family: '에스코어8'; color: white; font-size: 30px;}
        #right_banner{
            position: absolute;
            right: 0;
            width:900px;
            height: 100%;
            box-sizing: border-box;
        }
        #left_write{
            position: absolute;
            width: 600px;
            height: 100%;
            padding:25px;
            padding-left: 40px;
            box-sizing: border-box;
        }
        #right_write{
            box-sizing: border-box;
            position: absolute;
            width: 300px;
            height: 100%;
            padding-top: 40px;
            right: 0;
        }
        .left_border_write{color: white; font-family: '에스코어8';font-size: 17px;}
        .right_border_write{color: white; font-family: '에스코어4';font-size: 17px;}
        #left_button{text-decoration: none;color: white;border: 2px solid white;border-radius: 10px;padding: 5px;margin-right: 30px;font-family: '에스코어5';}
        #left_button:hover{color: rgb(255, 190, 93);background-color: white;}
        #right_button{text-decoration: none;color: white;font-family: '에스코어5';}
        /*첫 광고배너 끝*/


        /*리뷰수순 CSS 시작*/
        #slider_img_review{
            width: 100%;
            height: 700px;
            background-position: center;
            background-size: cover;
            background-image:url(../../img/indexpage/11.png) ;
            position: relative;
        }
        #slider_img_favor_headline3{
            position: absolute;
            width: 1000px;
            text-align: center;
            top: 100px;
            left: 25%;
            font-size: 33px;
            color: rgb(36, 36, 36);
            font-family: '에스코어8';
        }
        #info_img_container3{
            position: absolute;
            width: 1200px;
            height: 400px;
            font-size: 0;
            top: 25%;
            left: 18%;
        }
        #img_totalinfo3{
            box-shadow: 2px 2px 10px 3px rgba(0,0,0,0.5);
            position: absolute;
            display: inline-block;
            width: 300px;
            height: 400px;
            left: 0;
            z-index: 1;
        }
        #img_totalinfo_img3{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            background-image: url(../../img/indexpage/review.jpg);
            background-size: cover;
            background-position: center;
        }
        #img_totalinfo_text3{
            display: inline-block;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            font-family: '에스코어5';
            font-size: 14px;
            color: white;
            padding: 20px;
            background-color: rgb(255, 0, 170);
        }
        #favor_btn3{
            display: inline-block;
            width: 100px;
            height: 30px;
            font-size: 20px;
            border: 2px solid white;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        #img_container_all3{
            position: absolute;
            right: 0;
            top:50px;
            display: inline-block;
            width: 900px;
            height: 300px;
            box-sizing: border-box;
            font-size: 0;
        }
        .img_container3{
            width: 300px;
            height: 300px;
            box-sizing: border-box;
            display: inline-block;
            margin: 0;
            background-size: cover;
            font-size: 16px;
            cursor: pointer;
        }
        .img_container3:hover{
            border: 8px solid rgb(255, 0, 170);
        }
        #img_headLine3{
            margin: 0 100px;
        }
        #img_info3{
            display: inline-block;
            position: absolute;
            bottom: 0;
            width: 300px;
            height: 100px;
            padding-top: 30px;
            padding-left: 30px;
            box-sizing: border-box;
            font-family: '에스코어6';
            color: white;
            font-size: 15px;
            background-color: rgba(0,0,0,0.2);
        }
        /*리뷰수순 CSS 끝*/


        /*중간 광고배너 시작*/
        #middle_banner_container{
            position: relative;
            width: 100%;
            height: 700px;
            background-image: url(../../img/indexpage/banner_img.png);
        }
        #middle_banner_text_all{
            position: absolute;
            width: 400px;
            height: 80%;
            color: white;
            text-align: right;
            left: 10%;
            top: 10%;
        }
        .middle_banner_big_text{
            display: inline-block;
            font-family: '두꺼운로보';
            font-size: 90px;
        }
        .middle_banner_middle_text{
            display: inline-block;
            font-family: '두꺼운로보';
            font-size: 50px;
        }
        .middle_banner_mm_text{
            display: inline-block;
            font-family: '에스코어6';
            font-size: 25px;
        }
        .middle_banner_small_text{
            display: inline-block;
            font-family: '에스코어6';
            font-size: 13px;
        }
        #btn_move_site{
            display: inline-block;
            width: 200px;
            height: 30px;
            padding: 0;
            box-sizing: border-box;
            border: 2px solid white;
            border-radius: 10px;
            text-align: center;
            padding-top: 1px;
            margin-top: 40px;
        }
        #btn_move_site a{
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: white;
            font-size: 13px;
            font-family: '에스코어6';
        }
        #btn_move_site a:hover{
            text-decoration: underline;
        }
        /*중간 광고배너 끝*/
</style>
</head>
<body>
    <jsp:include page="template/header.jsp" flush="false"></jsp:include>
    <div id="main_imgslide_container">
        <div id="slideimg_img" class="mySlides fade">
	        <img src="../../img/indexpage/1.png" alt="">
        </div>
        <div id="slideimg_img" class="mySlides fade">
	        <img src="../../img/indexpage/2.png" alt="">
        </div>
        <div id="slideimg_img" class="mySlides fade">
	        <img src="../../img/indexpage/3.png" alt="">
        </div>
    </div>
    <div style="text-align:center">
			 <span class="dot"></span> 
			 <span class="dot"></span> 
			 <span class="dot"></span> 
	</div>
	<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
	<button class="next" onclick="plusSlides(1)">&#10095;</button>
    
    <div id="slide_down_btn">
        <span id="slide_down_btn_right">
			<a class="btn_sitemove" id="detail_go" href="spotCategorySearch.do">+ 상세검색페이지 이동</a> 
        </span>
        <span id="slide_down_btn_left">
			<a class="btn_sitemove" id="keyword_go" href="findCampSpotView.do">키워드검색페이지 이동 +</a>
        </span>
    </div>    


	<c:choose>
		<c:when test="${sessionScope.login == null}">
			 <section>
		        <div id="container_first_banner">
		            <div id="container_all_firstbanner">
		                    <div id="left_logo">
		                        <span>KOREACAMPSPOT</span>
		                    </div>
		                    
		                    <div id="right_banner">
		                        <div id="left_write">
		                            <span class="left_border_write">KCS 회원이신가요? </span><span class="right_border_write">로그인을 통해서 다양한 기능을 확인하세요</span><br>
		                            <span class="left_border_write">KCS 회원이 아니신가요? </span><span class="right_border_write">회원가입을 통해서 추천을 받아보세요</span>
		                        </div>
		                        <div id="right_write">
		                            <a id="left_button" href="selectJoinView.do">회원가입</a><a id="right_button" href="loginView.do">로그인</a>
		                        </div>
		                    </div>
		            </div>
		        </div>
		
		        <div id="slider_img_star">
		            <span id="slider_img_favor_headline2">
		                <span id="img_headLine2">＜KCS 최고별점 캠핑장 TOP3＞</span>
		            </span>
		
		            <div id="info_img_container2">
		                <div id="img_totalinfo2">
		                    <span id="img_totalinfo_img2">
		
		                    </span>
		                    <span id="img_totalinfo_text2">
		                        <span id="favor_btn2">추천해요</span>
		                        <p>당신의 취향이 뭔지 모르시겠다구요?</p>
		                        <p>그렇다면 별점이 높은 캠핑장은 어떤가요?</p>
		                        <p>당신을 KCS 최고 별점 캠핑장으로 초대합니다.</p>
		                    </span>
		                </div>
		                <div id="img_container_all2">
			                <c:forEach var="list" items="${ requestScope.starlist}">
			                    <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container2" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container2" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
			                </c:forEach>
		                </div>
		            </div>
		        </div>
		
		        <div id="middle_banner_container">
		            <div id="middle_banner_text_all">
		                <span class="middle_banner_big_text">PICK</span><br>
		                <span class="middle_banner_big_text">YOUR</span><br>
		                <span class="middle_banner_middle_text">FAVORITE</span><br><br><br>
		                <span class="middle_banner_mm_text">다양한 캠핑장을</span><br>
		                <span class="middle_banner_mm_text">KCS에서 추천받으세요</span>
		                <span class="middle_banner_small_text">아직도 취향선택을 안하신 회원분들</span>
		                <span class="middle_banner_small_text">취향을 선택하시고 </span>
		                <span class="middle_banner_small_text">맞춤 캠핑장을 추천받으세요</span><br>
		                <c:choose>
		                	<c:when test="${sessionScope.login == true}">
				                <span id="btn_move_site"><a href="guestFavoriteUpdateView.do">회원가입 / 취향정보수정</a></span>
		                	</c:when>
		                	<c:when test="${sessionScope.login == false}">
				                <span id="btn_move_site"><a href="selectJoinView.do">회원가입 / 취향정보수정</a></span>
		                	</c:when>
		                </c:choose>
		            </div>
		        </div>
		
		        <div id="slider_img_review">
		            <span id="slider_img_favor_headline3">
		                <span id="img_headLine3">＜찜횟수가 가장 많은 캠핑장 TOP3＞</span>
		            </span>
		
		            <div id="info_img_container3">
		                <div id="img_totalinfo3">
		                    <span id="img_totalinfo_img3">
		
		                    </span>
		                    <span id="img_totalinfo_text3">
		                        <span id="favor_btn3">추천해요</span>
		                        	<p>인기가 좋은 캠핑장을 추천드립니다.</p>
		                        	<p>KCS에서 가장많은 찜을 받은 캠핑장을 추천해드려요</p>
		                    </span>
		                </div>
		                <div id="img_container_all3">
		                    <c:forEach var="list" items="${requestScope.keeplist}">
			                    <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container3" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container3" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
			                </c:forEach>
		                </div>
		            </div>
		        </div>
		    </section>
		</c:when>
		
		
		<c:when test="${sessionScope.login == true}">
			<c:choose>
				<c:when test="${sessionScope.user_type == 0}">
					 <section>
	       				 <div id="container_first_banner">
				            <div id="container_all_firstbanner">
				                    <div id="left_logo">
				                        <span>KOREACAMPSPOT</span>
				                    </div>
				                    
				                    <div id="right_banner">
				                        <div id="left_write">
				                            <span class="left_border_write">KCS 회원이신가요? </span><span class="right_border_write">로그인을 통해서 다양한 기능을 확인하세요</span><br>
				                            <span class="left_border_write">KCS 회원이 아니신가요? </span><span class="right_border_write">회원가입을 통해서 추천을 받아보세요</span>
				                        </div>
				                        <div id="right_write">
				                            <a id="left_button" href="selectJoinView.do">회원가입</a><a id="right_button" href="loginView.do">로그인</a>
				                        </div>
				                    </div>
				            </div>
				        </div>
						
						
						<div id="slider_img_star">
				            <span id="slider_img_favor_headline2">
				                <span id="img_headLine2">＜KCS 최고별점 캠핑장 TOP3＞</span>
				            </span>
				
				            <div id="info_img_container2">
				                <div id="img_totalinfo2">
				                    <span id="img_totalinfo_img2">
				
				                    </span>
				                    <span id="img_totalinfo_text2">
				                        <span id="favor_btn2">추천해요</span>
				                        <p>당신의 취향이 뭔지 모르시겠다구요?</p>
				                        <p>그렇다면 별점이 높은 캠핑장은 어떤가요?</p>
				                        <p>당신을 KCS 최고 별점 캠핑장으로 초대합니다.</p>
				                    </span>
				                </div>
				                <div id="img_container_all2">
				                    <c:forEach var="list" items="${ requestScope.starlist}">
					                    <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container2" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container2" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
					                </c:forEach>
				                </div>
				            </div>
				        </div>
	
	
				        <div id="middle_banner_container">
				            <div id="middle_banner_text_all">
				                <span class="middle_banner_big_text">PICK</span><br>
				                <span class="middle_banner_big_text">YOUR</span><br>
				                <span class="middle_banner_middle_text">FAVORITE</span><br><br><br>
				                <span class="middle_banner_mm_text">다양한 캠핑장을</span><br>
				                <span class="middle_banner_mm_text">KCS에서 추천받으세요</span>
				                <span class="middle_banner_small_text">아직도 취향선택을 안하신 회원분들</span>
				                <span class="middle_banner_small_text">취향을 선택하시고 </span>
				                <span class="middle_banner_small_text">맞춤 캠핑장을 추천받으세요</span><br>
				                 <c:choose>
				                	<c:when test="${sessionScope.login == true}">
						                <span id="btn_move_site"><a href="guestFavoriteUpdateView.do">회원가입 / 취향정보수정</a></span>
				                	</c:when>
				                	<c:when test="${sessionScope.login == false}">
						                <span id="btn_move_site"><a href="selectJoinView.do">회원가입 / 취향정보수정</a></span>
				                	</c:when>
				                </c:choose>
				            </div>
				        </div>
				
				
				        <div id="slider_img_review">
					            <span id="slider_img_favor_headline3">
					                <span id="img_headLine3">＜찜횟수가 가장 많은 캠핑장 TOP3＞</span>
					            </span>
					
					            <div id="info_img_container3">
					                <div id="img_totalinfo3">
					                    <span id="img_totalinfo_img3">
					                    </span>
					                    <span id="img_totalinfo_text3">
					                        <span id="favor_btn3">추천해요</span>
						                        <p>인기가 좋은 캠핑장을 추천드립니다.</p>
			                        			<p>KCS에서 가장많은 찜을 받은 캠핑장을 추천해드려요</p>
					                    </span>
					                </div>
					                <div id="img_container_all3">
					                    <c:forEach var="list" items="${ requestScope.keeplist}">
						                    <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container3" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container3" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
						                </c:forEach>
					                </div>
					            </div>
					        </div>
				    
				    </section>
					
				</c:when>
				
				
				<c:when test="${sessionScope.user_type == 1}">
					<section>
				        <div id="container_first_banner">
				            <div id="container_all_firstbanner">
				                    <div id="left_logo">
				                        <span>KOREACAMPSPOT</span>
				                    </div>
				                    
				                    <div id="right_banner">
				                        <div id="left_write">
				                            <span class="left_border_write">KCS 회원이신가요? </span><span class="right_border_write">로그인을 통해서 다양한 기능을 확인하세요</span><br>
				                            <span class="left_border_write">KCS 회원이 아니신가요? </span><span class="right_border_write">회원가입을 통해서 추천을 받아보세요</span>
				                        </div>
				                        <div id="right_write">
				                            <a id="left_button" href="selectJoinView.do">회원가입</a><a id="right_button" href="loginView.do">로그인</a>
				                        </div>
				                    </div>
				            </div>
				        </div>
				
				        
				        <div id="slider_img_favor">
				            <span id="slider_img_favor_headline">
				                <span id="img_headLine">＜당신의 취향에 맞는 캠핑＞</span>
				            </span>
				
				            <div id="info_img_container">
				                <div id="img_totalinfo">
				                    <span id="img_totalinfo_img">
				
				                    </span>
				                    <span id="img_totalinfo_text">
				                        <span id="favor_btn">추천해요</span>
				                        <p>당신의 취향에 맞춘 최고의 캠핑장을 찾아서 여행을 떠나보세요</p>
				                        <p>새로운 장소와 인연이 당신을 기다립니다.</p>
				                    </span>
				                </div>
				                <div id="img_container_all">
				                   <c:forEach var="list" items="${ requestScope.favoritelist}">
					                    <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
					                </c:forEach>
				                </div>
				            </div>
				        </div>
				
				
						 <div id="middle_banner_container">
						            <div id="middle_banner_text_all">
						                <span class="middle_banner_big_text">PICK</span><br>
						                <span class="middle_banner_big_text">YOUR</span><br>
						                <span class="middle_banner_middle_text">FAVORITE</span><br><br><br>
						                <span class="middle_banner_mm_text">다양한 캠핑장을</span><br>
						                <span class="middle_banner_mm_text">KCS에서 추천받으세요</span>
						                <span class="middle_banner_small_text">아직도 취향선택을 안하신 회원분들</span>
						                <span class="middle_banner_small_text">취향을 선택하시고 </span>
						                <span class="middle_banner_small_text">맞춤 캠핑장을 추천받으세요</span><br>
						                 <c:choose>
						                	<c:when test="${sessionScope.login == true}">
								                <span id="btn_move_site"><a href="guestFavoriteUpdateView.do">회원가입 / 취향정보수정</a></span>
						                	</c:when>
						                	<c:when test="${sessionScope.login == false}">
								                <span id="btn_move_site"><a href="selectJoinView.do">회원가입 / 취향정보수정</a></span>
						                	</c:when>
						                </c:choose>
						            </div>
						   </div>
				
				
				        <div id="slider_img_star">
				            <span id="slider_img_favor_headline2">
				                <span id="img_headLine2">＜KCS 최고별점 캠핑장 TOP3＞</span>
				            </span>
				
				            <div id="info_img_container2">
				                <div id="img_totalinfo2">
				                    <span id="img_totalinfo_img2">
				
				                    </span>
				                    <span id="img_totalinfo_text2">
				                        <span id="favor_btn2">추천해요</span>
				                        <p>당신의 취향이 뭔지 모르시겠다구요?</p>
				                        <p>그렇다면 별점이 높은 캠핑장은 어떤가요?</p>
				                        <p>당신을 KCS 최고 별점 캠핑장으로 초대합니다.</p>
				                    </span>
				                </div>
				                <div id="img_container_all2">
				                    <c:forEach var="list" items="${ requestScope.starlist}">
				                    	<c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container2" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container2" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
					                </c:forEach>
				                </div>
				            </div>
				        </div>
				
				       
				    </section>
				</c:when>
				<c:when test="${sessionScope.user_type == 2}">
					<section>
				        <div id="container_first_banner">
				            <div id="container_all_firstbanner">
				                    <div id="left_logo">
				                        <span>KOREACAMPSPOT</span>
				                    </div>
				                    
				                    <div id="right_banner">
				                        <div id="left_write">
				                            <span class="left_border_write">KCS 회원이신가요? </span><span class="right_border_write">로그인을 통해서 다양한 기능을 확인하세요</span><br>
				                            <span class="left_border_write">KCS 회원이 아니신가요? </span><span class="right_border_write">회원가입을 통해서 추천을 받아보세요</span>
				                        </div>
				                        <div id="right_write">
				                            <a id="left_button" href="selectJoinView.do">회원가입</a><a id="right_button" href="loginView.do">로그인</a>
				                        </div>
				                    </div>
				            </div>
				        </div>
				
				
				        <div id="slider_img_star">
				            <span id="slider_img_favor_headline2">
				                <span id="img_headLine2">＜KCS 최고별점 캠핑장 TOP3＞</span>
				            </span>
				
				            <div id="info_img_container2">
				                <div id="img_totalinfo2">
				                    <span id="img_totalinfo_img2">
				
				                    </span>
				                    <span id="img_totalinfo_text2">
				                        <span id="favor_btn2">추천해요</span>
				                        <p>당신의 취향이 뭔지 모르시겠다구요?</p>
				                        <p>그렇다면 별점이 높은 캠핑장은 어떤가요?</p>
				                        <p>당신을 KCS 최고 별점 캠핑장으로 초대합니다.</p>
				                    </span>
				                </div>
				                <div id="img_container_all2">
				                    <c:forEach var="list" items="${ requestScope.starlist}">
							             <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container2" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container2" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info2">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
					                </c:forEach>
				                </div>
				            </div>
				        </div>
				
				
				
				        <div id="middle_banner_container">
				            <div id="middle_banner_text_all">
				                <span class="middle_banner_big_text">PICK</span><br>
				                <span class="middle_banner_big_text">YOUR</span><br>
				                <span class="middle_banner_middle_text">FAVORITE</span><br><br><br>
				                <span class="middle_banner_mm_text">다양한 캠핑장을</span><br>
				                <span class="middle_banner_mm_text">KCS에서 추천받으세요</span>
				                <span class="middle_banner_small_text">아직도 취향선택을 안하신 회원분들</span>
				                <span class="middle_banner_small_text">취향을 선택하시고 </span>
				                <span class="middle_banner_small_text">맞춤 캠핑장을 추천받으세요</span><br>
				                <c:choose>
				                	<c:when test="${sessionScope.login == true}">
						                <span id="btn_move_site"><a href="guestFavoriteUpdateView.do">회원가입 / 취향정보수정</a></span>
				                	</c:when>
				                	<c:when test="${sessionScope.login == false}">
						                <span id="btn_move_site"><a href="selectJoinView.do">회원가입 / 취향정보수정</a></span>
				                	</c:when>
				                </c:choose>
				            </div>
				        </div><!-- 중간 배너2 끝 -->
				
				
				
				        <div id="slider_img_review">
				            <span id="slider_img_favor_headline3">
				                <span id="img_headLine3">＜찜횟수가 가장 많은 캠핑장 TOP3＞</span>
				            </span>
				
				            <div id="info_img_container3">
				                <div id="img_totalinfo3">
				                    <span id="img_totalinfo_img3">
				
				                    </span>
				                    <span id="img_totalinfo_text3">
				                        <span id="favor_btn3">추천해요</span>
					                        <p>인기가 좋은 캠핑장을 추천드립니다.</p>
		                        			<p>KCS에서 가장많은 찜을 받은 캠핑장을 추천해드려요</p>
				                    </span>
				                </div>
				                <div id="img_container_all3">
				                    <c:forEach var="list" items="${ requestScope.keeplist}">
							           <c:choose>
				                    		<c:when test="${list.firstImageUrl ne '-'}">
							                    <div class="img_container3" style="background-image: url(${list.firstImageUrl});" onclick="location.href='spotDetailView.do?contentId=${list.contentId}&facltNm=${list.facltNm}'">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:when>
				                    		<c:otherwise>
							                    <div class="img_container3" style="background-image: url(../../img/indexpage/캠핑장사진.jpg);">
							                        <span id="img_info3">${list.facltNm}</span>
							                    </div>
				                    		</c:otherwise>
				                    	</c:choose>
					                </c:forEach>
				                </div>
				            </div>
				        </div>
				    
				    </section>
				</c:when>
			</c:choose>
		</c:when>
		
	</c:choose>

	
    <jsp:include page="template/footer.jsp" flush="false"></jsp:include>
</html>