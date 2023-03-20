$(function() {

	let level = localStorage.getItem("member_level");
	let point = localStorage.getItem("member_point");
 	if (level) { 
  		$("#member_level").text("Lv."+level+"  ");
 		$("#member_point").text("포인트 : "+point);
  	}
    $("#member_point").click(function(){
        $.ajax({
            type : "GET",
            url : "/loginPoint",
            dataType : "json",
            success : function (map) {
                console.log(map);
                localStorage.setItem("member_level", map.member_level);
                localStorage.setItem("member_point", map.member_point);
                // level = result.member_level;
                // point = result.member_point;
                $("#member_level").text("Lv."+level+"  ");
                $("#member_point").val("포인트 : "+point);
                document.location.reload();
            },
            error : function(xhr){ alert("오류 발생"); }
        });
    });



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
                        let member_name = result.member_name;
                        let member_level = result.member_level;
                        let member_point = result.member_point;
                        $("#member_info").text(member_name + " 님 ");
                      	$("#member_level").text("Lv."+member_level);
 						$("#member_point").text("포인트 : "+member_point);
                        $("#guest").hide();
                        $("#login_success").show();
                        //값을 유지하기 위함
                        localStorage.setItem("member_level", member_level);
                        localStorage.setItem("member_point", member_point);
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

            $.ajax({
                type : "post",
                url : "/login",
                data : {"member_id" : member_id, "member_pw" : member_pw},
                dataType : "json",
                success : function (result) {
                    if(result.member_name != undefined) {
                        let member_name = result.member_name;
                        let member_level = result.member_level;
                        let member_point = result.member_point;
                        $("#member_info").text(member_name + " 님 ");
                     	$("#member_level").text("Lv."+member_level);
 						$("#member_point").text("포인트 : "+member_point);
                        $("#guest").hide();
                        $("#login_success").show();
                        //값을 유지하기 위함
                        localStorage.setItem("member_level", member_level);
                        localStorage.setItem("member_point", member_point);
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
                    let member_name = result.member_name;
                    let member_level = result.member_level;
                    let member_point = result.member_point;
                    $("#member_info").text(member_name + " 님 ");
                    $("#member_level").text("Lv."+member_level);
 					$("#member_point").text("포인트 : "+member_point);
                    $("#guest").hide();
                    $("#login_success").show();
                    localStorage.setItem("member_level", member_level);
                    localStorage.setItem("member_point", member_point);
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