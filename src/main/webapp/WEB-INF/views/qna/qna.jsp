<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>문의하기 페이지</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='main.css'>
<script src="../../lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var title = $("#title").val()
		var content = $("#content").val()
		$(btn).click(function() {
			if (title == null) {
				alert("제목을 반드시 입력해주세요.")
			} else
				(content == null)
			{
				alert("내용을 반드시 입력해주세요.")
			}
		})
	});
</script>
</head>
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

    * {
        padding: 0;
        margin: 0;
    }

    #container {
        padding: 20px;
        border: 1px solid rgb(46, 46, 46);
        border-radius: 8px;
        padding: 20px;
        margin: 80px auto;
        width: 704px;
    }

    #headline {
        width: 685px;
        border-top: 2px solid rgb(46, 46, 46);
        border-bottom: 2px solid rgb(46, 46, 46);
        padding: 10px;
        font-weight: bold;
        font-family: '굵은노토';
        font-size: 26px;
        text-align: center;
        color: rgb(46, 46, 46);
        margin-bottom: 15px;

    }
 	.part{
        border-top: 2px solid rgb(46, 46, 46);
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    #part_topic{
        border-top: 2px solid rgb(46, 46, 46);
        border-collapse: collapse;
        font-family: '굵은노토';
        text-align: center;
        padding: 5px;
    }
    .part_No{
        width: 30px;
        padding: 5px 0px;
        border-top: 2px solid #e8e8e8;
        border-bottom: 2px solid #e8e8e8;
    }
     .part_title{
        width: 200px;
        padding: 5px 0px;
        border-top: 2px solid #e8e8e8;
        border-bottom: 2px solid #e8e8e8;
        cursor: pointer;
    }  
    #part_select{
        width: 150px;
        padding: 5px 0px;
        border-top: 2px solid #e8e8e8;
        border-bottom: 2px solid #e8e8e8;
    }
    .part_content{
        width: 300px; 
        padding: 5px 0px;
        border-top: 2px solid #e8e8e8;
        border-bottom: 2px solid #e8e8e8;
        cursor: pointer;
    }
    #btn_page {
        text-decoration: none;
        color: rgb(46, 46, 46);
        margin-right: 5px;
        cursor: pointer;
    }
    .page_bar{
        margin: 5px;
        text-align: center;
    }
    #btn_page:hover{
        background-color: rgb(46, 46, 46);
        color: white;
    }
    #qna_link{
        text-decoration: none;
        color: rgb(46, 46, 46);
    }
    label {
        font-family: '보통노토';
        font-size: 13px;
        color: rgb(46, 46, 46);
    }

    input {
        border: none;
    }

    span {
        display: inline-block;
    }

    input:focus {
        outline: none;
    }

    input::placeholder {
        color: rgb(216, 215, 215);
    }

    .input_span input {
        border-bottom: 2px solid rgb(231, 231, 231);
        padding: 5px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        font-size: 20px;
    }

    #first_input {
        border-bottom: 2px solid rgb(231, 231, 231);
        padding: 5px 0;
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        font-size: 20px;
    }

    .input_span input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
    }

    #first_input:focus {
        border-bottom: 2px solid rgb(46, 46, 46);
    }

    .part_select {
        margin-bottom: 20px;
    }

    #qna_content_title {
        margin-bottom: 20px;
    }

    textarea {
        width: 700px;
        height: 100px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 10px;
        border: 1px solid rgb(216, 215, 215);
        color: rgb(46, 46, 46);
        font-family: '보통노토';
        resize: none;
    }

    #btn_enter {
        width: 695px;
        height: 50px;
        margin-top: 10px;
        margin-left: 5px;
        font-family: '굵은노토';
        font-size: 20px;
        background-color: rgb(231, 231, 231);
        border: none;
        border-radius: 10px;
        color: rgb(46, 46, 46);
        font-weight: bold;
        cursor: pointer;
    }

    #btn_enter:hover{
        color: rgb(231, 231, 231);
        background-color: rgb(46, 46, 46);
    }

    textarea::placeholder {
        color: rgb(216, 215, 215);
    }
</style>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
		<c:if test="${sessionScope.login == null}">
			<script>
				alert("권한이 없습니다. 로그인 후 이용해 주세요");
				location.href = "loginView.do";
			</script>
		</c:if>
	<section>
		<div id="container">
            <p id="headline">QnA</p>
	
			<c:choose>
				
				<c:when test="${sessionScope.user_type == 0}">
					
					<div class="part">
						<table id="part_topic">
							<tr>
								<th class="part_No">[No]</th>
								<th class="part_title">[제목]</th>
								<th class="part_content">[내용]</th>
								<th id="part_select">[작성자]</th>
								<th id="part_select">[작성일]</th>
								<th id="part_select">[조회]</th>
								<th id="part_select">[답변]</th>
							</tr>
	
                            <c:forEach var="qna" items="${requestScope.list }">
								<tr class="part_topic">
									<td class="part_No"><p>${qna.qno }</p></td>
									<td class="part_title"><a id="qna_link"
										href="qnaView.do?qno=${dto.qno }">${qna.title }</a></td>
									<td class="part_content"><a id="qna_link"
										href="qnaView.do?qno=${dto.qno }">${qna.content }</a></td>
									<td id="part_select"><p>${qna.writer}</p></td>
									<td id="part_select"><p>${qna.qdate }</p></td>
							        <td id="part_select"><c:choose>
											<c:when test="${requestScope.dto.status==0}">0</c:when>
											<c:otherwise>1</c:otherwise>
										</c:choose></td>
									<td id="part_select"><c:choose>
											<c:when test="${requestScope.dto.status==0}">0</c:when>
											<c:otherwise>1</c:otherwise>
										</c:choose></td>
                                    </tr>
                                </c:forEach>
						</table>
					</div>
				</c:when>

				<c:when test="${sessionScope.user_type == 1}">
					
					<div class="guestQnA">
						<form action="sendQnA.do" method="get">
							<div class="part_select">
								<p>
									<label for="#">[아이디]</label>
								</p>
								<span class="input_span"><input id="first_input" type="text" name="id" id="id" value="${sessionScope.id}" readonly></span>
							</div>
							

							<div class="part_select">
								<p>
									<label for="title">[제목]</label>
								</p>
								<span class="input_span"><input type="text" name="title"
									id="title" placeholder="제목을 입력해주세요"></span>
							</div>
						

							<div class="part_select">
								<p id="qna_content_title">
									<label for="title">[문의내용]</label>
								</p>
								<textarea name="content" id="content" cols="95" rows="20"
									placeholder="문의내용을 입력하세요"></textarea>
								<div>
									<button id="btn_enter" type="submit">문의 등록</button>
								</div>
							</div>
							
						</form>
					</div>


					<div class="part">
						
						<table id="part_topic">
							<tr>
								<th class="part_No">[No]</th>
								<th class="part_title">[제목]</th>
								<th class="part_content">[내용]</th>
								<th id="part_select">[작성자]</th>
								<th id="part_select">[작성일]</th>
								<th id="part_select">[조회]</th>
								<th id="part_select">[답변]</th>
							</tr>

							<c:forEach var="qna" items="${requestScope.list }">
								<tr class="part_topic">
									<td class="part_No"><p>${qna.qno }</p></td>
									<td class="part_title"><a id="qna_link"
										href="qnaView.do?qno=${dto.qno }">${qna.title }</a></td>
									<td class="part_content"><a id="qna_link"
										href="qnaView.do?qno=${dto.qno }">${qna.content }</a></td>
									<td id="part_select"><p>${qna.writer}</p></td>
									<td id="part_select"><p>${qna.qdate }</p></td>
									<td id="part_select"><c:choose>
											<c:when test="${requestScope.dto.status==0}">0</c:when>
											<c:otherwise>1</c:otherwise>
										</c:choose></td>
									<td id="part_select"><c:choose>
											<c:when test="${requestScope.dto.status==0}">0</c:when>
											<c:otherwise>1</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:when>


				
				<c:when test="${sessionScope.user_type == 2}">
					<div class="businessQnA">
						<form action="sendQnA.do" method="get">
							<div class="part_select">
								<p>
									<label for="#">[아이디]</label>
								</p>
								<span class="input_span"><input id="first_input"
									type="text" name="id" id="id" value="${sessionScope.id}" readonly></span>
							</div>
							

							<div class="part_select">
								<p>
									<label for="title">[제목]</label>
								</p>
								<span class="input_span"><input type="text" name="title"
									id="title" placeholder="제목을 입력해주세요"></span>
							</div>
							

							<div class="part_select">
								<p id="qna_content_title">
									<label for="title">[문의내용]</label>
								</p>
								<textarea name="content" id="content" cols="95" rows="20"
									placeholder="문의내용을 입력하세요"></textarea>
								<div>
									<button id="btn_enter" type="submit">문의 등록</button>
								</div>
							</div>
							
						</form>

						<div class="part">
						
							<table id="part_topic">
								<tr>
									<th class="part_No">[No]</th>
									<th class="part_title">[제목]</th>
									<th class="part_content">[내용]</th>
									<th id="part_select">[작성자]</th>
									<th id="part_select">[작성일]</th>
									<th id="part_select">[조회]</th>
									<th id="part_select">[답변]</th>
								</tr>

								<c:forEach var="qna" items="${requestScope.list }">
									<tr class="part_topic">
										<td class="part_No"><p>${qna.qno }</p></td>
										<td class="part_title"><a id="qna_link"
											href="qnaView.do?qno=${dto.qno }">${qna.title }</a></td>
										<td class="part_content"><a id="qna_link"
											href="qnaView.do?qno=${dto.qno }">${qna.content }</a></td>
										<td id="part_select"><p>${qna.writer}</p></td>
										<td id="part_select"><p>${qna.qdate }</p></td>
										<td id="part_select"><c:choose>
												<c:when test="${requestScope.dto.status==0}">0</c:when>
												<c:otherwise>1</c:otherwise>
											</c:choose></td>
										<td id="part_select"><c:choose>
												<c:when test="${requestScope.dto.status==0}">0</c:when>
												<c:otherwise>1</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</c:when>
			</c:choose>
			
			<div class="page_bar">
				<c:if test="${pagging.previousPageGroup }">
					<a href=" qnaList.do?pageNo=${pagging.startPageOfPageGroup - 1 }"
						id="btn_page">◀</a>
				</c:if>
				<c:forEach var="i" begin="${pagging.startPageOfPageGroup}"
					end="${pagging.endPageOfPageGroup}">
					<a href="qnaList.do?pageNo=${i }" id="btn_page">${ i}</a>
				</c:forEach>

				<c:if test="${pagging.nextPageGroup }">
					<a href="qnaList.do?pageNo=${pagging.endPageOfPageGroup + 1 }"
						id="btn_page">▶</a>
				</c:if>
			</div>
		</div>
		<!--container 마지막 부분-->
	</section>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>