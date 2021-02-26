<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<script>
    var pageNo = 1;//전역변수
    $(function(){
        
    });
</script>
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
        padding: 0;
        margin: 0;
    }
    #container{
        padding: 20px;
        border: 1px solid black;
        margin: 20px auto;
        width: 1200px; 
        text-align: center;
    }
    #headline{
        width: 1200px;
        border-top: 2px solid rgb(46, 46, 46);
        font-family: '굵은노토';
        font-size: 30px;
        text-align: center;
        color: rgb(46, 46, 46);
        margin-bottom: 15px;
    }
    #part_topic{
        border-bottom: 2px solid rgb(46, 46, 46);
        border-top: 2px solid rgb(46, 46, 46);
        border-collapse: collapse;
        font-family: '굵은노토';
        padding: 5px;
    }
    .part_No{
        width: 30px;
        padding: 5px;
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    .part_title{
        width: 200px;
        padding: 5px;
        border-bottom: 2px solid rgb(46, 46, 46);
    }  
    #part_select{
        width: 150px;
        padding: 5px;
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    .part_content{
        width: 300px; 
        padding: 5px;
        border-bottom: 2px solid rgb(46, 46, 46);
    }
    #btn{
        text-decoration: none;
        color: black;
        margin-right: 5px;
    }
    .page_bar{
        margin: 5px;
    }
</style>
</head>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
            <c:if test="${requestScope.list ==null}">
                <script>
                    location.href=".do?pageNo=1";
                    
                </script>
            </c:if>
	<div id="container">
        <p id="headline">문의사항 상세페이지</p>
        <div class="part">
            <table id="part_topic">
                <tr >
                    <th class="part_No">[No]</th>
                    <th class="part_title">[제목]</th>
                    <th id="part_select">[작성자]</th>
                    <th class="part_content">[내용]</th>
                    <th id="part_select">[작성일]</th>
                    <th id="part_select">[조회]</th>
                    <th id="part_select">[답변]</th>
                </tr>

                <c:forEach var="qna" items="${requestScope.list }">
                    <tr class="part_topic">
                        <td class="part_No"><p>${qna.qno }</p></td>
                        <td class="part_title"><p>${qna.title }</p></td>
                        <td id="part_select"><p>${qna.writer}</p></td>
                        <td class="part_content"><p>${qna.content }</p></td>
                        <td id="part_select"><p>${qna.qdate }</p></td>
                        <td id="part_select"><p>${qna.status }</p></td>
                        <td id="part_select"><p>${qna.response }</p></td>
                    </tr>
                </c:forEach>

                <tr>
                    <td colspan="7">
                        <div class="page_bar">
                            <c:if test="${pagging.previousPageGroup }">
                                <a href=" .do?pageNo=${pagging.startPageOfPageGroup - 1 }" id="btn">◀</a>
                            </c:if>
                            <c:forEach var="i" begin="${pagging.startPageOfPageGroup}"
                                end="${pagging.endPageOfPageGroup}">
                                <a href=".do?pageNo=${i }" id="btn">${ i}</a>
                            </c:forEach>

                            <c:if test="${pagging.nextPageGroup }">
                                <a href=" .do?pageNo=${pagging.endPageOfPageGroup + 1 }" id="btn">▶</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>
</body>
</html>