<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색 목록 페이지</title>
<style>
    @font-face {
        font-family: '보통노토';
        src: url(../../../Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Medium.otf);
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
    *{
        margin:0;
        padding:0;
    }
    #board_list_container{
        width: 1000px;
        margin: 120px auto;
        text-align: left;
    }
    #board_list_headline{
        color: ; rgb(44,42,41);
        font-size: 20px;
    }
    #search_bar{
        background-color: #e8e8e8;
        margin: 30px 0px;
        padding: 15px;
        text-align: right;
    }
    #board_list_title{
        text-decoration: none;
        color: black;
    }
    #search{
        height: 30px;
        border-color: #e8e8e8;
        color: black;
        border-radius: 3px;
        border: 1px solid #c8c8c8;
    }
    .page_number_design{
        width: 25px;
        border-radius: 5px;
        display: inline-block;
        background-color: #e8e8e8;
        color: rgb(2, 11, 48);
        text-decoration: none;
        text-align: center;
        margin: 5px;
    }
    #write_btn{
        display: inline-block;
        width: 80px;
        float: right;
        background-color: #e8e8e8;
        box-sizing: border-box;
    }
    .page_number_design:hover{
        background-color: rgb(250, 187, 71);
        color: rgb(17, 5, 124);
    }
    #write_btn:hover{
        background-color: rgb(250, 187, 71);
        color: rgb(17, 5, 124);

    }
    #btn_board_list_search{
        width: 60px;
        background-color: #646262;
        font-weight: bold;
        font-size: 16px;
        border : 1px solid #585858;
        border-radius: 3px;
        margin-left: 5px;
        padding: 5px;
        color: rgb(148, 144, 144);
    }
    #btn_board_list_search:hover{
        background-color: rgb(250, 202, 71);
	    color:#282828;
    }
    .board{
        width: 100%;
		margin:20px auto;
		border-collapse: collapse;
	}
	.board th, .board td{
		padding: 10px;
		text-align: center;
	}
	.board th{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
        color: rgb(44,42,41);
        font-size: 15px;
	}
	.board td{
		border-top : 1px solid #e8e8e8;
		border-bottom : 1px solid #e8e8e8;
	}
	.board tr:last-child > td {
		border-bottom : 1px solid #e8e8e8;
	}
	#search_things{
		height: 32px;
	}
    
</style>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>

    <div id="board_list_container">
        <h2 id="board_list_headline">커뮤니티 목록</h2>
        
        <div id="main">
            <!--검색 버튼 alink-->
            <div id="search_bar">
                <form action="boardSearch.do">
                	<select id="search_things" name="kind">
                		<option value="writer">아이디</option>
                		<option value="title">제목</option>
                	</select>
                    <input type="text" id="search" name="search" placeholder="검색어를 입력해 주세요."><button id="btn_board_list_search" type="submit">검색</button>
                </form>    
            </div>
            <table class="board">
                <tr>
                    <th>NO</th>
                    <th class="title">제목</th>
                    <th class="writer">작성자</th>
                    <th class="date">작성일</th>
                    <th>조회수</th>
                    <th id="blike">좋아요</th>
                    <th id="bhate">싫어요</th>
                </tr>

        <!-- jstl 주석처리,게시판 기능 추가 기존 게시판에 있는 내용을 el과 jstl로 표현 - -->

            <c:if test="${requestScope.list ==null}">
                <script>
                    location.href="boardList.do?pageNo=1";
                    
                </script>
            </c:if> 
            
            <c:forEach var="dto" items="${requestScope.list }">
                <tr>
                    <td>${dto.bno }</td>
                    <td><a id="board_list_title" href="boardView.do?bno=${dto.bno }"> ${dto.title }</a><span id="comment_count">  [${dto.comment_count}]</span></td>
                    <td>${dto.writer}</td>
                    <td>${dto.bdate }</td>
                    <td>${dto.views }</td>
                    <td>${dto.blike }</td>
                    <td>${dto.bhate }</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                                <a class="page_number_design" id="write_btn" href="boardList.do">전체목록</a>
                                <a class="page_number_design" id="write_btn" href="boardWriteView.do">글쓰기</a>
                </td>
            </tr>    
        
            </table>
        </div> 
    </div>


    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>

</body>
</html>