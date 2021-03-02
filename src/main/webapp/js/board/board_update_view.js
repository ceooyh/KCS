'use strict';

$(function(){
    var count = 3;//첨부파일 태그 개수
    $("#plus").click(function(){
        if(count == 5) return;
        count++;
        $("#file_list").append("<p><input class='file_list' type='file' name='file'></p>");
    });
    $("#minus").click(function(){
        if(count == 1) return;
            $(this).parent().parent().children("p").last().remove();
        count--;
    });
});