<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 사용자 예약내역페이지</title>
<style type="text/css">
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
    section{
    	margin-bottom: 100px;
    }
    #headline_comment{
         text-align: center;
        font-family: '굵은노토';
        color: rgb(46,46,46);
        margin-bottom: 40px;
        margin-top: 40px;
        font-size: 32px;
    }
     #reservation_table{
        width: 1500px;
        margin: 0 auto;
        margin-top: 40px;
    }
    #reservation_table table{
        border-collapse: collapse;
    }
    .head_name{
        width: 150px;
        height: 30px;
        font-size: 14px;
        padding-top: 10px;
        text-align: center;
        color: rgb(46,46,46);
        border-top: 2px solid rgb(215, 215,215);
        border-bottom: 2px solid rgb(215, 215,215);
        font-family: '굵은노토';
    }
    .inside_content{
        width: 150px;
        height: 60px;
        padding-top: 30px;
        font-size: 14px;
        text-align: center;
        color: rgb(46,46,46);
        border-bottom: 1px solid rgb(215, 215,215);
        font-family: '굵은노토';
    }
    #status_click_button{
        text-decoration: none;
        color: rgb(46,46,46);
        background-color: rgb(233, 233, 233);
        border: 1px solid rgb(46,46,46);
        border-radius: 5px;
        padding:4px ;
    }
    #status_click_button:hover{
        color: rgb(233, 233, 233);
        background-color: rgb(46,46,46);
        border:none;
    }
    #reservation_headline_img{
    	width: 100%;
    }
    #Cancel_click_button{text-decoration: none; color: white; background-color: rgb(46,46,46); border: 1px solid rgb(46,46,46); border-radius: 5px;padding: 6px;}
    #accept_click_button{text-decoration: none; color: white; background-color: rgb(46,46,46); border: 1px solid rgb(46,46,46); border-radius: 5px;padding: 6px;}
    #Cancel_click_button:hover{color: rgb(46,46,46); background-color: rgb(233, 233, 233); border: none; }
    #accept_click_button:hover{color: rgb(46,46,46); background-color: rgb(233, 233, 233); border: none;}
</style>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
		function delete_reservation(obj) {
			var data = "";
			data = "bno=" + $(obj).prev().val();
			$.ajax({
				url : "manageBookCancel.do",
				data : data,
				method:"get",
				success:function(d){
					d = d === "true";
					if(d){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");						
					}
					location.href = "manageBookListView.do";	
				}
			});
		}
		function accept_reservation(obj) {
			var data = "";
			data = "bno=" + $(obj).prev().val();
			$.ajax({
				url : "manageBookAccept.do",
				data : data,
				method:"get",
				success:function(d){
					d = d === "true";
					if(d){
						alert("수락 성공");
					}else{
						alert("수락 실패");						
					}
					location.href = "manageBookListView.do";	
				}
			});
		}
		$(function() {
			$("#accept_click_button").click(function() {
				accept_reservation($(this));
			});
			$("#Cancel_click_button").click(function() {
				delete_reservation($(this));
			});
		});
</script>
</head>
<body>
<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<img src="../../../img/reservationpage/reservation.png" id="reservation_headline_img">
    <section>
        <p id="headline_comment">사업자 고객 예약관리 테이블</p>
        <div id="reservation_table">
        <form action="" id="reservation_frm">
            <table>
                <thead>
                    <tr>
                        <th><p class="head_name">예약번호</p></th>
                        <th><p class="head_name">시작일</p></th>
                        <th><p class="head_name">종료일</p></th>
                        <th><p class="head_name">예약일</p></th>
                        <th><p class="head_name">캠핑장번호</p></th>
                        <th><p class="head_name">예약자 아이디</p></th>
                        <th><p class="head_name">예약 상태</p></th>
                        <th><p class="head_name">캠핑장 이름</p></th>
                        <th><p class="head_name">수락</p></th>
                        <th><p class="head_name">거절</p></th>
                    </tr>
                </thead>
                <tbody>
		                    <c:forEach var="dto" items="${requestScope.list }">
		                            <tr>
		                                <td id="td_bno"><p class="inside_content">${dto.bno}</p></td><!--번호-->
		                                <td><p class="inside_content">${dto.start_date}</p></td><!--시작일-->
		                                <td><p class="inside_content">${dto.end_date}</p></td><!--종료일-->
		                                <td><p class="inside_content">${dto.book_date}</p></td><!--예약일-->
		                                <td><p class="inside_content">${dto.contentId}</p></td><!--캠핑장 번호-->
		                                <td><p class="inside_content" id="dto_id">${dto.id}</p></td><!--예약자 아이디-->
		                                <td><p class="inside_content">${dto.status}</p></td><!--예약상태-->
		                                <td><p class="inside_content">${dto.facltNm}</p></td><!--캠핑장 이름-->
		                                <c:choose>
		                                	<c:when test="${dto.status == 0}">
				                                <td><p class="inside_content">
				                                <input type="hidden" name="bno" value="${dto.bno }">
				                                <a id="accept_click_button" href="#">수락</a></p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 1}">
				                                <td><p class="inside_content">수락완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 2}">
				                                <td><p class="inside_content">결제완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 3}">
				                                <td><p class="inside_content">이용완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 4}">
				                                <td><p class="inside_content">예약거절됨</p></td>
		                                	</c:when>
		                                </c:choose>
		                                <c:choose>
		                                	<c:when test="${dto.status == 0}">
				                                <td><p class="inside_content">
				                                <input type="hidden" name="bno" value="${dto.bno }">
				                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 1}">
				                                <c:choose>
		                                			<c:when test="${dto.start_date <= requestScope.today}">
						                                <td><p class="inside_content">기간만료</p></td>
		                                			</c:when>
		                                			<c:otherwise>
						                                <td><p class="inside_content">
						                                <input type="hidden" name="bno" value="${dto.bno }">
						                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</c:when>
		                                	<c:when test="${dto.status == 2}">
		                                		<c:choose>
		                                			<c:when test="${dto.start_date <= requestScope.today}">
						                                <td><p class="inside_content">기간만료</p></td>
		                                			</c:when>
		                                			<c:otherwise>
						                                <td><p class="inside_content">
						                                <input type="hidden" name="bno" value="${dto.bno }">
						                                <a id="Cancel_click_button" href="#">예약거절</a></p></td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</c:when>
		                                	<c:when test="${dto.status == 3}">
				                                <td><p class="inside_content">이용완료</p></td>
		                                	</c:when>
		                                	<c:when test="${dto.status == 4}">
				                                <td><p class="inside_content">예약거절됨</p></td>
		                                	</c:when>
		                                </c:choose>
		                            </tr>
		                    </c:forEach>
                </tbody>
            </table>
		</form>
        </div>
    </section>
<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>