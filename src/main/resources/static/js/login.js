$(function() {

    $("#member_id").on("keyup",function(key){
        if(key.keyCode==13) {

            const member_id = $("#member_id").val();
            const member_pw = $("#member_pw").val();

            $.post({
                type : "post",
                url : "/login",
                data : {"member_id" : member_id, "member_pw" : member_pw},
                dataType : "json",
                success : function (result) {
                    if(result.member_name != undefined) {
                        var member_name = result.member_name;
                        $("#member_info").text(member_name + " 님 ");
                        $("#guest").hide();
                        $("#login_success").show();
                    } else {
                        location.href="/index?error=login_fail";
                    }
                },
                error : function (xhr) {
                    alert("로그인 오류 발생");
                }
            });
        }
    });

    $("#member_pw").on("keyup",function(key){
        if(key.keyCode==13) {

            const member_id = $("#member_id").val();
            const member_pw = $("#member_pw").val();

            $.post({
                type : "post",
                url : "/login",
                data : {"member_id" : member_id, "member_pw" : member_pw},
                dataType : "json",
                success : function (result) {
                    if(result.member_name != undefined) {
                        var member_name = result.member_name;
                        $("#member_info").text(member_name + " 님 ");
                        $("#guest").hide();
                        $("#login_success").show();
                    } else {
                        location.href="/index?error=login_fail";
                    }
                },
                error : function (xhr) {
                    alert("로그인 오류 발생");
                }
            });
        }
    });

    $("#login_btn").click(function() {
        const member_id = $("#member_id").val();
        const member_pw = $("#member_pw").val();

        $.post({
            type : "post",
            url : "/login",
            data : {"member_id" : member_id, "member_pw" : member_pw},
            dataType : "json",
            success : function (result) {
                if(result.member_name != undefined) {
                    var member_name = result.member_name;
                    $("#member_info").text(member_name + " 님 ");
                    $("#guest").hide();
                    $("#login_success").show();
                } else {
                    location.href="/index?error=login_fail";
                }
            },
            error : function (xhr) {
                alert("로그인 오류 발생");
            }
        });
    });

});