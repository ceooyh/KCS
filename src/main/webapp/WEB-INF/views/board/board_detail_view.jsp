<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/board/board_detail_view.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/board/board_detail_view.js"></script>
<title>게시판 상세 페이지</title>
</head>
<body>
	<jsp:include page="../template/header.jsp" flush="false"></jsp:include>

	<div id="board_detail_container">
		<section id="">
			<h2 id="board_detail_headline">게시판 페이지</h2>

			<div class="part_select" id="part_selecrt_title">
				<span class="board_detail_span">[제목]</span><span class="board_detail_span" id="board_title">${requestScope.board.title }</span>
			</div>
			<div class="part_select">
				<span class="board_detail_span">[작성자]</span><span id="board_writer_info">${requestScope.board.writer }</span>
			</div>
			<div class="part_select">
				<span class="board_detail_span">[작성일]</span><span id="board_writer_info">${requestScope.board.bdate }</span>
			</div>
			<div class="part_select">
				<span class="board_detail_span">[조회수]</span><span id="board_writer_info">${requestScope.board.views }</span>
			</div>
			<div class="part_select_content">
				<span class="board_detail_span" id="board_content">[내용]</span><span id="content_view">${requestScope.board.content }</span>
			</div>
	
            <div id="file_list">
		 	       <span class="board_detail_span">[첨부파일]</span><br>
                            <c:forEach var="f" items="${requestScope.file }">
                            
                                <a href="fileDownload.do?writer=${f.writer }&fileName=${f.fileName}">
                                <span>${f.fileName}</span></a>
		 	       			<c:if test="${sessionScope.id eq requestScope.board.writer }">
                            	<span><a href="deleteFile.do?bno=${requestScope.board.bno }&fbno=${f.fbno }">파일삭제</a></span><br>
                            </c:if>
                            </c:forEach>
                                
			</div>

			<section id="board_like_hate">
				<div class="part_like_hate">
					<a href="plusLikeHate.do?bno=${requestScope.board.bno }&mode=0" class="btn_like_hate"> 
						<img src="../../../img/boardLike/like.png" style="width: 50px;">
							<span class="board_detail_span">${requestScope.board.blike }</span>
					</a> 
					<a href="plusLikeHate.do?bno=${requestScope.board.bno }&mode=1" class="btn_like_hate"> 
						<img id="hate_img" src="../../../img/boardLike/like.png">
							<span class="board_detail_span">${requestScope.board.bhate }</span>
					</a>
				</div>
			</section>
			
			<div class="prev_next_list_btn">
				<a href="boardList.do" class="move">목록보기</a> 
			</div>
	
			<div class="delete_update_btn">
				<c:if test="${sessionScope.id eq requestScope.board.writer }">
					<a href="deleteBoard.do?bno=${requestScope.board.bno }"
						class="modify">삭제</a>
					<a href="updateBoard.do?bno=${requestScope.board.bno}" class="modify">수정</a>
				</c:if>
			</div>
		</section>
		
		
		
		<section id="comment_write_box">
        	<c:if test="${sessionScope.login == true}">
            	<div class="comment_form">
                	<form id="comment">
						<p id="comment_headline">[댓글을 작성해주세요]</p>
                    	<input type="hidden" name="bno" value="${requestScope.board.bno }" readonly="readonly">
                    	<input type="hidden" name="writer" value="${sessionScope.id }">
                    	<span class="writer">${sessionScope.id }</span>
                        <textarea id="comment_area" name="content" maxlength="500"></textarea>
                        <p class="length">0/500</p>
                        <p id="comment_insert"><button id="comment_insert_btn" type="button">등록</button></p>
                    </form>							
                </div>
            </c:if>
		</section>
		
		<hr>

		<section class="comment_list">
			<table id="part_comment_box">
				<tr>
					<th class="part_comment">
						<label id="board_detail_label" for="writer">[작성자]</label>
					</th>              
					<th class="part_comment">
						<label  for="cdate">[작성일]</label>
					</th>             
					<th class="part_comment_content">
						<label for="content">[댓글]</label>
					</th>           
					<th class="part_comment">
						<label for="clilke">[좋아요]</label>
					</th>           
					<th class="part_comment">
						<label for="bhate">[싫어요]</label>
					</th>
				</tr>      
				<c:forEach var="comment" items="${requestScope.commentList}">
				<tr id="list_border">
					<td class="part_comment_view">
						<span id="comment_writer">${comment.writer}</span>
					</td>               
					<td class="part_comment_view">
						<span id="comment_cdate">${comment.cdate}</span>
					</td>               
					<td id="part_comment_view_content">
						<span id="comment_content">${comment.content}</span>
					</td>               
					<td class="part_comment_view">
						<span id="comment_clike"><a id="comment_like" href="commentLike.do?cno=${comment.cno}&bno=${requestScope.board.bno}">${comment.clike}</a></span>
					</td>
					<td class="part_comment_view">
						<span id="comment_chate"><a id="comment_hate" href="commentHate.do?cno=${comment.cno}&bno=${requestScope.board.bno}">${comment.chate}</a></span> 
					</td>
				</tr>	              
				</c:forEach>
			</table>
		</section>		
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>

</body>
</html>