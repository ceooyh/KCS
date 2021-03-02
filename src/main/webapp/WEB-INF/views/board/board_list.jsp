<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/board/board_list.css">
<title>게시판 목록 페이지</title>
</head>
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
                        <div class="page_bar">
                            <c:if test="${pagging.previousPageGroup }">
                                <a class="page_number_design" href="boardList.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
                            </c:if>
                            <c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
                            end="${pagging.endPageOfPageGroup}">
                                <a class="page_number_design" href="boardList.do?pageNo=${i }">${i}</a>
                            </c:forEach>
                        
                            <c:if test="${pagging.nextPageGroup }">
                                <a class="page_number_design" href="boardList.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
                            </c:if>
                             
                           
                                <a class="page_number_design" id="write_btn" href="boardWriteView.do">글쓰기</a>
                        </div>
                </td>
            </tr>    
        
            </table>
        </div>
    </div>


    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>

</body>
</html>