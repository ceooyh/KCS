<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	<div id="container">
		<section class="info">
			<h2 id="headline">캠핑장 정보 수정</h2>
			<form action="applyUpdateSpotAction.do">
				<table>
					<tr>
						<th><label for="sname">캠핑장 이름 : </label></th>
						<td><input type="text" class="sname" name="sname" id="sname">
						</td>
					</tr>
					<tr>
						<th><label for="address1">캠핑장 주소 :</label></th>
						<td><input type="text" name="address1" id="address1"
							placeholder="시/도"> <input type="text" name="address2"
							id="address2" placeholder="읍/면/리"> <input type="text"
							name="address3" id="address3" placeholder="상세주소""></td>
					</tr>
					<tr>
						<th><label for="tel1">전화번호 : </label></th>
						<td><input type="text" class="tel" name="tel1" id="tel1">
							- <input type="text" class="tel" name="tel2" id="tel2"> -
							<input type="text" class="tel" name="tel2" id="tel2"></td>
					</tr>
					<tr>
						<th>캠프장 태그 선택 :</th>
						<td><a href="apply_spot2.jsp">태그 선택</a></td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>
