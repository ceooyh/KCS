	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/book/review_write.css">
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script defer src="../../../js/book/review_write.js"></script>
<title>후기 작성 페이지</title>

</head>
<body>
 <section>
 <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
        <form action="reviewWriteAction.do" enctype="multipart/form-data" method="post">
            <div id="container">
            	<input type="hidden" name="contentId" value="${requestScope.contentId }">
            	<input type="hidden" name="facltNm" value="${requestScope.facltNm }">
            	<input type="hidden" name="bno" value="${requestScope.bno }">
                        <p id="headline">캠핑장후기</p><!--헤드라인-->
                        <div class="part_select">
                            <span id="qna_content_title"><label for="title">[후기내용]</label></span>
                            <div class="star-box">
                                <span class="star star_left"></span>
                                <span class="star star_right"></span>
                              
                                <span class="star star_left"></span>
                                <span class="star star_right"></span>
                              
                                <span class="star star_left"></span>
                                <span class="star star_right"></span>
                              
                               <span class="star star_left"></span>
                               <span class="star star_right"></span>
                              
                               <span class="star star_left"></span>
                               <span class="star star_right"></span>
                               <input value=""	type="hidden" placeholder="별점점수부분" name="star" id="star">
                              </div>
                            <textarea name="content" id="content" cols="95" rows="20" placeholder="문의내용을 입력하세요" style="resize: none;"></textarea>
                            <div id="file_form">
								<span id="textarea_head">[첨부파일 등록]</span>
									<div id="file_list">
										<p><input class='file_list' type="file" name="file" id="file"></p>
										<p><input class='file_list' type="file" name="file" id="file"></p>
										<p><input class='file_list' type="file" name="file" id="file"></p>
									</div>
							</div>
                            <div id="btn_submit">
                            <button id="btn" type="submit">전송</button>
                            </div>
                        </div><!--내용 입력란-->
            </div><!--container 마지막 부분-->
        </form>
    </section>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>