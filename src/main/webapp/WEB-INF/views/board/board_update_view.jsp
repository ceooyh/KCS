<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/board/board_update_view.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../script/board/board_update_view.js"></script>
<title>게시판 수정 페이지</title>
</head>

<body>


	<c:if test="${sessionScope.login == null || sessionScope.login == false  }">
		<c:set var="page" target="${sessionScope }" value="${pageContext.request.requestURI}${pageContext.request.queryString }" property="resultPage" scope="session"/>
		${pageContext.request.requestURI}${pageContext.request.queryString }
		<script>
			alert("로그인을 하셔야 이용할수 있습니다.");
			location.href="loginView.do";
		</script>
	</c:if>
	
	
	
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	
 
	<section class="board_write_container">
		<h2 id="board_write_headline">게시글 수정 페이지</h2>
				<form action="updateBoardAction.do?bno=${requestScope.board.bno }" enctype="multipart/form-data" method="post">
				<div id="container">
						<div id="title_box"><!--게시판 글쓰기 작성시작-->
							<span id="title_head"><label for="title">[제목]</label></span>
							<input type="text" id="board_write_title" name="title" value="${requestScope.board.title }">
						</div>
				
				<div id="writer_box"><!--게시판 작성자-->
					<span id="writer_head"><label for="writer">[작성자]</label></span>
					<span id="session_writer"><input type="hidden" id="writer" name="writer" value="${sessionScope.id }">
						${sessionScope.id }</span>
				</div>
				
				<div id="textarea_box"><!--게시판 내용-->
					<span id="textarea_head"><label for="content">[내용]</label></span>
					<span id="textarea_body"><textarea name="content" id="content">${requestScope.board.content }</textarea></span>
				</div>
	
				<div id="file_form">
					<span id="textarea_head">[첨부파일 등록]</span>
						<div id="file_list">
							<p><button type="button" class="plusminus_btn" id="plus">+</button> <button type="button" class="plusminus_btn" id="minus">-</button></p>
							<p><input class='file_list' type="file" name="file" id="file" ></p>
							<p><input class='file_list' type="file" name="file" id="file" ></p>
							<p><input class='file_list' type="file" name="file" id="file" ></p>
						</div>
				</div>
		
		
		<!-- 페이징 처리 --> 
				<div id="board_write_page">
					<span id="back_to_list_btn"><a href="boardList.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="write_update_page_btn">목록보기</a></span>
					<span id="back_btn"><a href="javascript:history.back();" class="write_update_page_btn">뒤로가기</a></span>
						<button class="write_update_page_btn">수정하기</button>
					</div>
			</div><!-- #container 마감 -->
			</form><!--폼 마감-->
	</section><!--섹션 마감-->
	
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>


</body>
</html>