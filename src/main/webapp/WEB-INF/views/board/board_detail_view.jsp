<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
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

#board_detail_container {
	width: 800px;
	margin: 0 auto;
	margin-bottom: 200px;
	padding: 20px;
	border: 1px solid black;
	padding-top: 150px;
}

#board_detail_headline {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	padding: 10px;
	font-family: '두꺼운로보';
}

.part_select {
	height: 50px;
	font-family: '굵은노토';
	box-sizing: border-box;
	padding-bottom: 10px;
	padding-left: 5px;
}
#part_selecrt_title > #board_title{
	margin-left: 34px;
}
#board_writer_info{
	margin-left: 20px;
}

.part_select_content {
	font-family: '굵은노토';
	padding-left: 5px;
}

#header_label{
	font-family: '굵은노토';
	font-size: 13px;
	color: rgb(46, 46, 46);
	font-weight: bold;
}

.board_detail_span {
	display: inline-block;
	border-bottom: 2px solid rgb(231, 231, 231);
	color: rgb(44,42,41);
	padding: 5px 0;
	font-size: 15px;
}


#content_view {
	display: inline-block;
	width: 100%;
	height: 200px;
	padding: 10px;
	font-size: 12px;
	color: rgb(44,42,41);
	box-sizing: border-box;
	border-radius: 10px;
	font-family: '보통노토';
	border: 2px solid rgb(231, 231, 231);
	margin: 5px 0px;
}
.prev_next_list_btn{
	margin: 20px 0 0 360px;
}

.modify {
	width: 80px;
	margin-right: 5px;
	font-weight: normal;
	padding: 5px 0px;
	font-size: 14px;
	text-align: center;
	text-decoration: none;
	background-color: rgb(248,203,173);
	color: white;
	box-sizing: border-box;
	display: inline-block;
	border-radius: 3px;
	float: right;
}

.move {
	width: 80px;
	margin-right: 5px;
	font-weight: normal;
	padding: 5px 0px;
	font-size: 14px;
	text-align: center;
	text-decoration: none;
	background-color: rgb(248,203,173);
	color: white;
	box-sizing: border-box;
	display: inline-block;
	border-radius: 3px;
	float: left;
}
.modify:hover{
	background-color: rgb(215,215,215);
	color : white;
}
.move:hover{
	background-color: rgb(215,215,215);
	color : white;
    
}
#board_like_hate{
	clear: both;
	display: inline-block;
	margin: 30px 0 0 286px;
}
.part_like_hate{
	margin: 0 10px;
	float: left;
}
.btn_like_hate{
	margin: 0 20px;
	cursor: pointer;
}
#hate_img{
	width: 50px;
	position: relative;
	transform: rotate(0.5turn);
	z-index: -1;
	cursor: pointer;
}
#comment_write_box{
	clear: both;
}
#comment_headline{
	margin: 15px 0;
	font-family: '보통노토';
}

#comment_insert, .length{
	text-align: right;
}

#comment_insert_btn{
	background-color: rgb(44,42,41);
	color: white;
	width: 80px;
	margin-right: 5px;
	font-weight: normal;
	font-size: 14px;
	text-align: center;
	box-sizing: border-box;
	border-radius: 3px;
}
#comment_insert_btn:hover{
	background-color: rgb(215,215,215);
	color: color:rgb(44,42,41);
}

#comment_area{
	margin-top: 10px;
	width: 100%;
	height: 100px;
	resize: none;
	font-size: 12px;
	padding: 10px;
	box-sizing: border-box;
}
.comment_list{
	width: 100%;
	box-sizing: border-box;
	margin: 0 auto;
}
#part_comment_box{
	width: 100%;
	height: 100px;
	text-align: center;
	border: 1px solid black;
	box-sizing: border-box;
	border-collapse: collapse;
}
.part_comment_content{
	width: 500px;
	font-size: 15px;
}
.part_comment{
	width: 100px;
	font-size: 15px;
}

#hate_btn{
	width: 50px; 
	transform: rotate(0.5turn);
	position: relative;
	z-index: -1;
}
.part_comment_view{
	width: 100px;
	box-sizing: border-box;
}
#part_comment_view_content{
	width: 800px;
	font-size: 20px;
	font-weight: normal;
	text-align: center;
	padding: 0;
	box-sizing: border-box;
}
#list_border{
	border: 1px solid black;
}
#list_border > td{
	font-size: 12px;
	padding: 0;
	
}
#comment_like{
	text-decoration: none;
	color: blue;
}
#comment_hate{
	text-decoration: none;
	color: red;
}
</style>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		$(".comment_form textarea").keyup(function() {
			$(this).next().text($(this).val().length+"/500");
		});
		$("#comment_insert_btn").click(function(){
			var data = $("#comment").serialize();
			$.ajax({
				url : "insertComment.do",
				data : data,
				method:"get",
				success:function(d){
					alert("댓글 등록 성공 : " + d);
					location.reload();	
				}
			});
		});
		$(".btn_like_hate").click(function(){
			// 0 - like, 1 - hate
			// bno;
			var obj = $(this);
			d = "bno=${requestScope.board.bno}&mode="+$(this).index();
			console.log(d);
			$.ajax({
				url : "plusLikeHate.do",
				data : d,
				method : "get",
				success:function(result){
					result = result.trim();
					if(result == "false"){
						alert("로그인후 이용하실 수 있습니다.");
						location.href="loginView.do";
					}
					console.log(result, result.length);
					$(obj).children("span").html(result);
					
				},
				error : function(request, status, error) {
					alert(request.responseText.trim());
					location.href="loginView.do";
					
				}
			});
		});
	});
</script>
</head>
<body>
	<!-- jstl 주석처리  -->
    
        <c:if test="${sessionScope.login == null || sessionScope.login == false  }">
            <c:set var="page" target="${sessionScope }" value="${pageContext.request.requestURI}${pageContext.request.queryString }" property="resultPage" scope="session"/>
            ${pageContext.request.requestURI}${pageContext.request.queryString }
            <script>
                alert("로그인을 하셔야 이용할수 있습니다.");
                location.href="loginView.do";
            </script>
        </c:if>
    
   
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
					<a class="btn_like_hate"> 
						<img src="../../../img/boardLike/like.png" style="width: 50px;">
							<span class="board_detail_span">${requestScope.board.blike }</span>
					</a> 
					<a class="btn_like_hate"> 
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