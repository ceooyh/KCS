<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link rel="stylesheet" href="../../css/font.css">
<style>
    section{
        width: 100%;
    }
    #form_container{
        width: 800px;
        height: 500px;
        margin: 180px auto;
        border: 1px solid black;
        box-sizing: border-box;
        font-size: 0;
    }
    #img_insert{
        box-sizing: border-box;
        width: 100%;
        height: 400px;
        font-size: 0;
        color: white;
        text-align: center;
    }
    #reservation_campimg{
        display: inline-block;
        background-size: cover;
        width: 100%;
        height: 100%;
        font-size: 46px;
        box-sizing: border-box;
        padding-top: 150px;
        font-family: '에스코어7';
    }
    #date_insert{
        box-sizing: border-box;
        width: 100%;
        height: 50px;
        font-size: 0;
        border-bottom: 1px solid black;        
        padding-top: 10px;
    }
    #button_insert{
        box-sizing: border-box;
        width: 100%;
        height: 50px;
        font-size: 0px;
        padding-left: 35px;
    }
    .date_headline{
        font-family: '에스코어8';
        color: rgb(44,42,41);
        box-sizing: border-box;
        font-size: 16px;
    }
    #start_date_insert{
        display: inline-block;
        width: 50%;
        height: 100%;
        font-size: 16px;
        text-align: center;
    }
    #end_date_insert{
        display: inline-block;
        width: 50%;
        height: 100%;
        font-size: 16px;
        text-align: center;
    }
    .book_btn{
        width: 30%;
        text-align: center;
        font-size: 16px;
        height: 70%;
        margin-top: 7px;
        border: none;
        background-color: rgb(215, 215, 215);
        color: rgb(44,42,41);
        cursor: pointer;
        box-sizing: border-box;
        margin-right: 20px;
        border-radius: 3px;
        font-family: '에스코어6';
    }
    .book_btn:hover{
        background-color: rgb(44,42,41);
        color: white;
    }
</style>
</head>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	    <section>
	        <form action="bookAction.do">
	            <div id="form_container">
	                <div id="img_insert">
	                    <span id="reservation_campimg" style="background-image: url(../../../img/searchpage/캠핑장사진.jpg">${requestScope.dto.facltNm}</span>
	                </div>
	                <div id="date_insert">
	                    <span id="start_date_insert">
	                        <span class="date_headline">예약 시작일</span>
	                        <input id="start_date" name="start_date" type="date" min="${requestScope.dto.today}">
	                    </span>
	                    <span id="end_date_insert">
	                        <span class="date_headline">예약 종료일</span>
	                        <input id="end_date" name="end_date" type="date" max="${requestScope.dto.today}+365">
	                    </span>
	                </div>
	                <div id="button_insert">
	                    <button class="book_btn" id="btn_reservation" type="submit">예약하기</button>
	                    <button class="book_btn" type="reset">초기화하기</button>
	                    <button  class="book_btn"  type="button" onclick="location.href='indexView.do';">돌아가기</button>
	                </div>
	            </div>
	            <input type="hidden" name="contentId" value="${requestScope.dto.contentId}">
	            <input type="hidden" name="bizrno" value="${requestScope.dto.bizrno}">
	        </form>
	    </section>
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>