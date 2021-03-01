<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 검수 페이지</title>
<script src="../../../lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".agree_select").click(function(){
			if($("#guest_nonagree").is(":checked") == true){
				console.log('yes');
			}else{
				console.log('no');
			}
		});
		
		/*비동의가 되어있을시 다음페이지로 넘어가지 못하도록함*/
		$(".btn_next_level").click(function(){
			if($("#guest_nonagree").is(":checked") == true){
				alert("동의를 하지 않으시면 회원가입을 진행 할 수 없습니다.");
				return false;
			}
		});
		
		/*동의 버튼 변경 구현*/
		$("#guest_agree").click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="guest_agree"]').prop('checked',false);
			 	$(this).prop('checked',true);
			}
		});
		/*비동의 버튼 변경 구현*/
		$("#guest_nonagree").click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="guest_agree"]').prop('checked',false);
			 	$(this).prop('checked',true);
			}
		});
	});
</script>
<style>
    @font-face {
        font-family: '보통노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Medium.otf);
    }
    @font-face {
        font-family: '굵은노토';
        src: url(Font/NotoSansCJKkr-hinted/NotoSansCJKkr-Black.otf);
    }
    @font-face {
        font-family: '검은고딕';
        src: url(Font/검은고딕/OFL.txt);
    }
    @font-face {
        font-family: '보통로보';
        src: url(Font/Roboto/Roboto-Medium.ttf);
    }
    @font-face {
        font-family: '두꺼운로보';
        src: url(Font/Roboto/Roboto-Bold.ttf);
    }
     *{
        margin:0;
        padding: 0;
    }
    section{
        width: 700px;
        margin: 30px auto;
        margin-bottom: 110px;
    }
    #headline_select_join{
        padding:10px;
        margin: 20px 0;
        font-family: '굵은노토';
        font-size: 30px;
        color: rgb(245, 167, 104);
        text-align: center;
        /*border: 2px solid rgb(156, 156, 156);*/
        border-radius: 10px;
        width: 700px;
        display: inline-block;
        box-sizing: border-box;
    }
    #select_join_container{
        box-sizing: border-box;
        padding: 40px 50px 30px 50px;
        width: 700px;
        border: 1px solid rgb(46, 46, 46);
    }

    #select_join_agree_btn{
        width: 150px;
        margin: 0 auto;
        font-family: '보통노토';
    }
    .information_text{
        font-family: '보통노토';
        color: rgb(46, 46, 46);
    }
    input[type="checkbox"]{
        display: none;
    }
    #select_join_agree_btn input[type="checkbox"] + label span{
        color: rgb(46, 46, 46);
        border-radius: 5px;
        padding: 8px 10px;
        margin-right: 10px;
        display: inline-block;
        cursor:pointer;
        vertical-align:middle;
        border: 1px solid rgb(216, 215, 215);
    }
    #select_join_agree_btn input[type="checkbox"] + label span:hover{
        color: white;
        background-color: rgb(92, 91, 91);
        border: none;
    }
    #select_join_agree_btn input[type="checkbox"]:checked + label span{
        background-color: rgb(144, 248, 24);
        color: rgb(255, 255, 255);
    }
    #choise_btn_div{
        width: 700px;
        margin: 20px auto;
        text-align: center;
        padding: 0;
        box-sizing: border-box;
    }
    .btn_next_level{
        font-family: '굵은노토';
        box-sizing: border-box;
        text-decoration: none;
        color: rgb(238, 238, 238);
        background-color: rgb(46, 46, 46);
        border-radius: 4px;
        width: 350px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 100px;
        padding-right: 100px;
    }
    .btn_next_level:hover{
        color: rgb(238, 238, 238);
        background-color: rgb(114, 114, 114);
    }
</style>
</head>
<body>
	<jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
    <section>
        <h1 id="headline_select_join">개인정보 수집 ‧ 이용 ‧ 제공 동의서</h1>
        <div id="select_join_container">
            <div id="information_provision">
                <p class="information_text">본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법], 제15조 및 제17조에 따라</p>
                <p class="information_text">아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.</p><br><br>
                <p class="information_text">□ 개인정보의 수집 및 이용에 관한 사항</p>
                <p class="information_text">- 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호, </p>
                <p class="information_text">주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 外 이력서 기재 내용 일체</p>
                <p class="information_text">- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서</p>
                <p class="information_text">류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.</p><br><br>
                <p class="information_text">□ 개인정보의 보관 및 이용 기간</p>
                <p class="information_text">- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우</p>
                <p class="information_text">[개인정보 보호법] 제21조에 따라 처리합니다.</p><br>
            </div>
            <div id="select_join_agree_btn">
                <span class="agree_select"><input id="guest_agree" type="checkbox" value="1" class="checkbox" name="guest_agree"><label for="guest_agree" class="label"><span>동의</span></label></span>
                <span class="agree_select"><input id="guest_nonagree" type="checkbox" value="0" class="checkbox"  name="guest_agree"><label for="guest_nonagree" class="label"><span>비동의</span></label></span>
            </div>
        </div>
        
        <div id="choise_btn_div">
            <a class="btn_next_level" id="business_join_btn" href="businessJoinView.do">사업자 가입이동</a>
            <a class="btn_next_level" id="guest_join_btn" href="guestJoinView.do">일반 가입자 이동</a>
        </div>
    </section>
	<jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>