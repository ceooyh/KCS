<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../css/fonts/font.css">
<link rel="stylesheet" href="../../../css/manage/member_manage_list.css">
<title>Insert title here</title>

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
                            <c:if test="${pagging.previousPageGroup }">
                                <a class="page_number_design" href="memberManageListView.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
                            </c:if>
                            <c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
                            end="${pagging.endPageOfPageGroup}">
                                <a class="page_number_design" href="memberManageListView.do?pageNo=${i }">${i}</a>
                            </c:forEach>
                        
                            <c:if test="${pagging.nextPageGroup }">
                                <a class="page_number_design" href="memberManageListView.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
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