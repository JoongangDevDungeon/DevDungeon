<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/message.css">
</head>
<script>

    $(function(){

        $("#name_check").click(function() {
            $.ajax({
                url : "/name_check",
                type : "POST",
                data : {'member_name' : $("#member_name").val()},
                dataType : "json",
                success : function(result) {
                    if(result==0){
                        if (confirm("포인트를 보내시려는 닉네임이 "+'"'+$("#member_name").val()+'"'+" 맞습니까?")==true){
                            $("#name_check").attr("disabled","disabled");
                            $("#member_name").attr("readonly","readonly");
                            $("#member_name").css("background-color", "#ccc");
                        }
                    }else{
                        alert("닉네임을 확인해주세요");
                    }
                },
                error : function(xhr, status, error) {
                    alert("실패");
                }
            });
        });

        $("#send_point").click(function(result) {

            if(!$("#member_name").prop('readonly')){
                alert("닉네임 확인 체크를 확인 해주세요.");
                return false;
            }
            if($("#point").val().length == 0){
                alert("보낼 포인트를 입력해주세요.");
                return false;
            }
            if($("#point").val() > ${my_point}){
                alert("보낼 포인트가 보유하고 있는 포인트 보다 많습니다.");
                return false;
            }

            $.ajax({
                url : "/send_point",
                type : "POST",
                data : {'point' : $("#point").val(), 'member_name' : $("#member_name").val()},
                dataType : "json",
                success : function(result) {
                        alert('"'+$("#member_name").val()+'"'+" 님 에게"+$("#point").val()+ " Point 보냈습니다.")
                        window.close()
                },
                error : function(xhr, status, error) {
                    alert("실패");
                }
            });

        });

    });


</script>
<style>
    .space{
        margin: 0 auto;
        width: 650px;
        height: 500px;
    }

    label{
        line-height: 40px;
        margin-right: 5px;
    }

    .text_space{
        width: 450px;
        height: 40px;
    }
    .point_space{
        float: left;
        width: 650px;
        height: 40px;
    }

    .point_btn{
        width: 90px;
        height: 40px;
        border-radius: 8px;
        border: none;
        background-color: #ff8080;
        color: white;
    }

    .banner{
        text-align: center;
    }

    h1{
        text-align: center;
    }
</style>
<body>
<div class="banner">
    <img src="/img/banner.png">
</div>
<form action="/message" method="post" onsubmit="return null_ck()">
    <div class="space">
            <h1>포인트 보내기</h1>
            <div class="point_space">
                <label>받는 사람</label>
                <input class="text_space" type="text" id="member_name" name="member_name" onchange="ck()"placeholder="받는 사람 닉네임 입력">
                <button class="point_btn" id="name_check" type="button">ID 확인</button>
            </div>
        <br><br><br>
            <div class="point_space">
                <label style="margin-right: 7px; margin-left: 20px;">포인트</label>
                <input class="text_space" type="text" id="point" name="point" onchange="ck()"placeholder="보낼 포인트를 입력">
                <button class="point_btn" id="send_point" type="button">보내기</button>

            </div>
        <br><br><br>
                <div class="btn btn-primary" style="width: 200px; height: 40px; float: left;" id="my_point" >My Point : ${my_point} P</div>

    </div>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>