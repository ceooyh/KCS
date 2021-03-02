'use strict';

$(function(){
    $(".comment_form textarea").keyup(function() {
        $(this).next().text($(this).val().length+"/500");
    });
    $("#comment_insert_btn").click(function(){
        var data = $("#comment").serialize();
        $.ajax({
            url : "insertComment.do",
            data : data,
            method:"get",
            success:function(d){
                alert("댓글 등록 성공 : " + d);
                location.reload();	
            }
        });
    });
    $(".btn_like_hate").click(function(){
        // 0 - like, 1 - hate
        // bno;
        var obj = $(this);
        d = "bno=${requestScope.board.bno}&mode="+$(this).index();
        console.log(d);
        $.ajax({
            url : "plusLikeHate.do",
            data : d,
            method : "get",
            success:function(result){
                result = result.trim();
                if(result == "false"){
                    alert("로그인후 이용하실 수 있습니다.");
                    location.href="loginView.do";
                }
                console.log(result, result.length);
                $(obj).children("span").html(result);
                
            },
            error : function(request, status, error) {
                alert(request.responseText.trim());
                location.href="loginView.do";
                
            }
        });
    });
});