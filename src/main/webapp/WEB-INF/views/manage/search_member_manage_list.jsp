<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #member_list_container{
        width: 1000px;
        margin: 120px auto;
        text-align: left;
    }
    #member_list_headline{
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
    .member_list_table{
    	width: 100%;
    	text-align: center;
    	margin: 0 auto;
    }
    .member_list_title{
    	margin: 0 5px 0 5px;
    }
    .member_list_table_line{
    	border-bottom: 2px solid #e8e8e8;
    	padding: 20px 0;
    }
    #search{
        height: 30px;
        border-color: #e8e8e8;
        color: black;
        border-radius: 3px;
        padding-left: 7px;
        border: 1px solid #c8c8c8;
        box-sizing: border-box;
    }
  
    #btn_member_list_search{
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
    #btn_member_list_search:hover{
        background-color: rgb(250, 202, 71);
	    color:#282828;
    }
   
	#search_things{
		height: 30px;
	}
	.page_bar{
		text-align: center;
		margin: 20px 0 20px 150px;
		
	}
	#member_delete_btn{
		text-decoration: none;
		width: 60px;
		height: 30px;
		color: white;
		padding: 10px;
		border-radius: 5px;
		background-color: #646262;
		font-size: 12px;
	}
	#member_delete_btn:hover{
		background-color: rgb(250, 202, 71);
	    color:#282828;
	}
</style>
</head>
<body>

	    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>

    <div id="member_list_container">
        <h2 id="member_list_headline">전체 회원 목록</h2>
        
        <div id="main">
            <!--검색 버튼 alink-->
            <div id="search_bar">
                <form action="MemberSearch.do">
                	<select id="search_things" name="kind">
                		<option value="name">이름</option>
                		<option value="id">아이디</option>
                		<option value="user_type">회원구분</option>
                	</select>
                    <input type="text" id="search" name="search" placeholder="검색어를 입력해 주세요."><button id="btn_member_list_search" type="submit">검색</button>
                </form>
            </div>
        
            <table class="member_list_table">
                <tr class="member_list_table_line">
                    <th class="member_list_title" id="id">아이디</th>
                    <th class="member_list_title"	id="pass">비밀번호</th>
                    <th class="member_list_title" id="name">이름</th>
                    <th class="member_list_title" id="telNum">전화번호</th>
                    <th class="member_list_title" id="birth">생년월일</th>
                    <th class="member_list_title" id="email">이메일</th>
                    <th class="member_list_title" id="gender">성별</th>
                    <th class="member_list_title" id="user_type">회원구분</th>
                    <th class="member_list_title" id="management">관리</th>
                </tr>


            <c:if test="${requestScope.list ==null}">
                <script>
                    location.href="memberManageListView.do?pageNo=1";
                    
                </script>
            </c:if> 
            <c:forEach var="member" items="${requestScope.list }">
                <tr>
                    <td class="member_list_table_line">${member.id}</td>
                    <td class="member_list_table_line">${member.pass }</td>
                    <td class="member_list_table_line">${member.name}</td>
                    <td class="member_list_table_line">
                    	<span class="telNum" id="tel1">${member.tel1 }</span>-<span class="telNum" id="tel2">${member.tel2 }</span>-<span class="telNum" id="tel3">${member.tel3 }</span>
                    </td>
                    <td class="member_list_table_line">${member.birth }</td>
                    <td class="member_list_table_line">
                    	<span class="email" id="email1">${member.email1 }</span>@<span class="email" id="email2">${member.email2 }</span>
                    </td>
                    <td class="member_list_table_line">
                    		<c:choose>
                    			<c:when  test="${member.gender == 1 }">
                    				<span>여자</span>
                    			</c:when>
                    			<c:otherwise>
                    				<span>남자</span>
                    			</c:otherwise>
                    		</c:choose>
                    </td>
                    <td class="member_list_table_line">
                    		<c:choose>
                    			<c:when  test="${member.user_type == 1 }">
                    				<span>일반사용자</span>
                    			</c:when>
                    			<c:when  test="${member.user_type == 2 }">
                    				<span>사업자</span>
                    			</c:when>
                    			<c:otherwise>
                    				<span>관리자</span>
                    			</c:otherwise>
                    		</c:choose>
                    </td>
                    <td class="member_list_table_line"><a href="memberDeleteAction.do?id=${member.id}" id="member_delete_btn">삭제</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                        <div class="page_bar">
                            <a href="memberManageListView.do" id="member_delete_btn">전체 목록 보기</a>
                        </div>
                </td>
            </tr>    
            </table>
  
        </div>
    </div>

    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>

</body>
</html>