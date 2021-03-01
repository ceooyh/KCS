<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개 페이지</title>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    section{
        width: 1200px;
        margin: 0 auto;
    }
    #writer_section{
    	text-align: center;
        width: 100%;
        margin: 150px auto;
    }
</style>
</head>
<body>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
	  <section>
	        <div id="writer_section">
	                <img id="section_line_img" src="../../../img/infopage/section_Image.png" alt="">
	        </div>
	    </section>
	 <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>