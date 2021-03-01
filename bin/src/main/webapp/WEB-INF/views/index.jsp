<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
	#Shincheonji {
		height: 550px;
		padding-top: 100px;
	}
</style>
</head>
<body>
    <jsp:include page="template/header.jsp" flush="false"></jsp:include>
    <p id="Shincheonji">조진 페이지 자꾸 엑박떠서 바꿈</p>
    <jsp:include page="template/footer.jsp" flush="false"></jsp:include>
</html>