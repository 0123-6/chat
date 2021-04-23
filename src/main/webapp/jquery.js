function findUser(user_1) {
    var userName = $("#findUserName").val();
    var list = {
        userName: userName,
        user_1:user_1
    };
    $.ajax({
        type:"POST",
        contentType:"application/json;charset=UTF-8",
        url:"/findUser",
        data:JSON.stringify(list),
        success:function (result){//0 不存在,1 存在，不是好友,2 已是好友
            $("#searchFalse").css({"display":"none"});
            if(0==result["result"]){
                $("#userInformation").css({"display":"none"});
                $("#notExist").css({"display":"inline"});
            }else{
                $("#notExist").css({"display":"none"});
                $("#userInformation").css({"display":"inline"});
                $("#addFalse").css({"display":"none"});
                $("#addFalseWhy").css({"display":"none"});
                $("#addSuccess").css({"display":"none"});
                $("#sex").text(result["sex"]);
                $("#userName").text(userName);
                $("#nickname").text(result["nickName"]);
                $("#personal_signature").text(result["personal_signature"]);
                if(1==result["result"]){
                    $("#ok").css({"display":"none"});
                    $("#addf").css({"display":"inline"});
                }else {//2
                    $("#addf").css({"display":"none"});
                    $("#ok").css({"display":"inline"});
                }
            }
        },
        error:function (e){
            $("#notExist").css({"display":"none"});
            $("#userInformation").css({"display":"none"});
            $("#searchFalse").css({"display":"inline"});
        }
    });
    return false;
}

function addFriend(user_1) {
    var user_2 = $("#userName").text();
    var list = {
        user_1:user_1,
        user_2:user_2
    };
    $.ajax({
        type:"POST",
        contentType:"application/json;charset=UTF-8",
        url:"/addfriend",
        data:JSON.stringify(list),
        success:function (result){
            if(1==result["result"]){
                $("#addFalse").css({"display":"none"});
                $("#addFalseWhy").css({"display":"none"});
                $("#addSuccess").css({"display":"inline"});
            }
            else {
                $("#addSuccess").css({"display":"none"});
                $("#addFalseWhy").css({"display":"none"});
                $("#addFalse").css({"display":"inline"});
            }
        },
        error:function (e){
            $("#addSuccess").css({"display":"none"});
            $("#addFalse").css({"display":"none"});
            $("#addFalseWhy").css({"display":"inline"});
        }
    });
}

function getFriends(userName) {
    var list = {
      userName:userName
    };
    $.ajax({
        type:"POST",
        contentType:"application/json;charset=UTF-8",
        url:"/friends",
        data:JSON.stringify(list),
        success:function (result){
            var len = result.length;
            var html = [];
            html.push("<ol>");
            for (var i = 0; i < len; i++) {
                html.push("<li>"+result[i]["userName"]+"</li>");
            }
            html.push("</ol>");
            $("#friends").html(html.join(""));
        },
        error:function (e){
            alert("获取好友列表失败!")
        }
    });

}

























