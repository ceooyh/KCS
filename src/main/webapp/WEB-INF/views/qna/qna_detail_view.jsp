<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세페이지</title>
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
    *{
        margin: 0;
        padding: 0;
    }
    #container{
        width: 704px;
        border: 1px solid rgb(46, 46, 46);
        border-radius: 8px;
        padding: 20px;
        margin: 20px auto;
        font-family: '굵은노토';
    }
    #headline{
        text-align: center;
        font-family: '굵은노토';
        font-size: 26px;
        font-weight: bold;
        color: rgb(46, 46, 46);
        margin-bottom: 20px;
        border-bottom: 2px solid rgb(46, 46, 46);
        border-top: 2px solid rgb(46, 46, 46);
        padding: 10px;
    }
    label{
        font-family: '굵은노토';
        font-size: 16px;
        color: rgb(46, 46, 46);
    }
    span{
        display: inline-block;
        border-bottom: 2px solid rgb(231, 231, 231);
        margin-bottom: 5px;
        padding: 3px;
    }
    #qna_content_title{
        font-weight: bold;
        color: rgb(46, 46, 46);
    }
    #qna_content{
        width: 690px;
        height: 300px;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        margin-top: 5px;
        margin-bottom: 10px;
    }
    #qna_response{
        width: 690px;
        height: 100px;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        margin-top: 5px;
        margin-bottom: 10px;
    }
    textarea{
        width: 700px;
        height: 100px;
        resize: none;
        border: 2px solid rgb(231, 231, 231);
        border-radius: 10px;
        font-family: '굵은노토';
        font-size:16px;
        margin-top: 10px;
        padding: 8px;
    }
   
    #btn_modify{
        width: 100px;
        margin-right: 5px;
        margin-bottom: 10px;
        border: 2px solid rgb(46, 46, 46);
        background-color: rgb(231, 231, 231);
        border-radius: 5px;
        font-family: '보통노토';
        font-size:16px;
        color: rgb(46, 46, 46);
        cursor: pointer;
        float: right;
    }
    
    #btn_delete{
        width: 100px;
        margin-right: 5px;
        margin-bottom: 10px;
        border: 2px solid rgb(46, 46, 46);
        background-color: rgb(231, 231, 231);
        border-radius: 5px;
        font-family: '보통노토';
        font-size:16px;
        color: rgb(46, 46, 46);
        cursor: pointer;
        float: right;
    }
    #btn_modify:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(231, 231, 231);
    }
    #btn_delete:hover{
        background-color: rgb(46, 46, 46);
        color: rgb(231, 231, 231);
    }

    #btn_enter:hover{
        background-color: rgb(46, 46, 46);
    }
    hr{
        margin: 10px 0px;
        clear: both;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        function update_qna(obj) {
            var data = "";
            $.each($(obj).parent().parent().find("input"), function(i,o) {
                console.log(i,$(o).val());
                data += $(o).attr("name") + "=" + $(o).val()  + "&"; 
            });
            console.log(data);
            $.ajax({
                url : "qnaAjaxUpdate.do",
                data : data,
                method:"get",
                success:function(d){
                    d = d === "true"; 
                    if(d){
                        alert("수정 성공");
                    }else{
                        alert("수정 실패");						
                    }
                    location.href = "qnaViewMain.do";
                }
            });
        }
        function delete_member(obj) {
            var data = "";
            data = "id=" + $(obj).parent().parent().find("input").first().val();
            console.log(data);
            $.ajax({
                url : "qnaAjaxDelete.do",
                data : data,
                method:"get",
                success:function(d){
                    d = Number(d);
                    if(d==1){
                        alert("삭제 성공");
                    }else{
                        alert("삭제 실패");						
                    }
                    location.href = "qnaDelete.do";	
                }
            });
            e.preventDefault();	
		$(".update").click(function() {
			update_member($(this));
		});
		$(".delete").click(function() {
			delete_member($(this));
		});
</script>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
    <c:if test="${sessionScope.login != '0'}">
				<script>
					alert("권한이 없습니다. 로그인 후 이용해 주세요");
					location.href="loginView.do";
				</script>
	</c:if>
	<div id="container">
        <p id="headline">QnA</p><!--헤드라인-->
		<div class="qna_title">
                 <div class="part_select">
                     <p id="qna_content_title"><label for="#">[아이디]</label></p>
                     <span>${requestScope.dto.writer }</span>
                 </div><!--아이디-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[제목]</label></p>
                     <span>${requestScope.dto.title }</span>
                 </div><!--제목-->

                 <div class="part_select">
                     <p id="qna_content_title"><label for="title">[문의내용]</label></p>
                     <span id="qna_content">${requestScope.dto.content }</span>
                     </div>
                 </div><!--내용-->	
                
                <div id="btn_update">
                    <button id="btn_delete">삭제</button>
                    <c:if test="${sessionScope.response == '0' }">
                        <button id="btn_modify">수정</button>
                    </c:if>
                </div>
			<hr>
            <div class="response">
                <input type="hidden" name="qno" value="${requestScope.dto.response }">
                <p id="qna_content_title"><label for="title">[답변내용]</label></p>
                <span id="qna_response">${requestScope.dto.response}</span>
            </div> <!--답변-->
		</div><!--container-->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>