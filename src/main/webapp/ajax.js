function existUser() {
    window.varexistUser = true;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange=function () {
        if(this.readyState === 4 && this.status === 200){
            var value = this.responseText;
            if(1 == value) document.getElementById("existName").style.display = "inline";
            else document.getElementById("existName").style.display = "none";
            window.varexistUser = (1 == value);
        }
    };
    xhttp.open("POST","/existUser",true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var userName = document.getElementById("userName").value;
    xhttp.send("userName="+userName);
}

function existEmail() {
    window.varexistEmail = true;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange=function () {
        if(this.readyState === 4 && this.status === 200){
            var value = this.responseText;
            if(1 == value) document.getElementById("existEmail").style.display = "inline";
            else document.getElementById("existEmail").style.display = "none";
            window.varexistEmail = (1 == value);
        }
    };
    xhttp.open("POST","/existEmail",true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var email = document.getElementById("email").value;
    xhttp.send("email="+email);
}

function canLogin() {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST","/login",true);
    var userName = document.getElementById("userName").value;
    var password = document.getElementById("password").value;
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange=function () {
        if(this.readyState === 4 && this.status === 200){
            var value = this.responseText;
            if(1 == value){
                document.getElementById("loginError").style.display = "none";
                window.location.href = "/display.jsp";
            }
            else document.getElementById("loginError").style.display = "inline";
        }
    };
    xhttp.send("userName="+userName+"&password="+password);
    return false;
}

function canRegister(){
    if(window.varexistUser) document.getElementById("existName").style.display = "inline";
    if(window.varexistEmail) document.getElementById("existEmail").style.display = "inline";
    if(window.varexistUser || !window.varsamePassword ||window.varexistEmail ||
        "" == document.getElementById("password").value) {//失败
        document.getElementById("registerSuccess").style.display = "none";
        document.getElementById("registerFalse").style.display = "inline";
        return false;
    }
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange=function () {
        if(this.readyState === 4 && this.status === 200){
            var value = this.responseText;
            if(1 == value){//注册成功
                window.varexistUser = true;
                window.varexistEmail = true;
                document.getElementById("registerFalse").style.display = "none";
                document.getElementById("registerSuccess").style.display = "inline";
            }
        }
    };
    xhttp.open("POST","/register",true);
    var userName = document.getElementById("userName").value;
    var password = document.getElementById("password").value;
    var email = document.getElementById("email").value;
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("userName="+userName+"&password="+password+"&email="+email);
    return false;
}

function samePassword(){
    window.varsamePassword = false;
    var password = document.getElementById("password").value;
    var password2 = document.getElementById("password2").value;
    if(password == password2){
        window.varsamePassword = true;
        document.getElementById("samePassword").style.display = "none";
    }else {
        window.varsamePassword = false;
        document.getElementById("samePassword").style.display = "inline";
    }
}

function post(url,params){
    var temp = document.createElement("form");
    temp.action = url;
    temp.method = "post";
    temp.style.display = "none";
    for(var x in params){
        var opt = document.createElement("textarea");
        opt.name = x;
        opt.value = params[x];
        temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    temp.submit();
    return temp;
}

function logout(userName){//如何解决js函数传参，传递数字字符串？
    var params = {userName:userName};
    post("/logout",params);
}

function updateInformation(olduserName,oldpassword,oldnickname,oldsex,oldpersonal_signature,oldEmail){
    var newEmail = document.getElementById("email").value;
    if(!window.varsamePassword ||(window.varexistEmail&&(oldEmail!=newEmail) )|| "" == document.getElementById("password").value) {//失败
        document.getElementById("updateSuccess").style.display = "none";
        document.getElementById("updateFalse").style.display = "inline";
        return false;
    }
    var userName = document.getElementById("userName").value;
    var password = document.getElementById("password").value;
    var nickname = document.getElementById("nickname").value;
    var sex = $("input[name='sex']:checked").val();
    var personal_signature = document.getElementById("personal_signature").value;
    var email = document.getElementById("email").value;
    // if(userName==olduserName && password==oldpassword && nickname==oldnickname
    // && sex==oldsex && personal_signature==oldpersonal_signature && email==oldEmail){
    //     document.getElementById("updateFalse").style.display = "none";
    //     document.getElementById("updateSuccess").style.display = "inline";
    //     return false;
    // }
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange=function () {
        if(this.readyState === 4 && this.status === 200){
            var value = this.responseText;
            if(1 == value){//更新成功
                document.getElementById("updateFalse").style.display = "none";
                document.getElementById("updateSuccess").style.display = "inline";
            }else {
                document.getElementById("updateFalse").style.display = "inline";
                document.getElementById("updateSuccess").style.display = "none";
            }
        }
    };
    xhttp.open("POST","/updateInformation",true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("userName="+userName+"&password="+password+"&nickname="+nickname+"&sex="+sex+"&personal_signature="+personal_signature+"&email="+email);
    return false;
}

function okEmail(oldEmail){
    var newEmail = document.getElementById("email").value;
    if(oldEmail==newEmail){
        window.varexistEmail = true;
        document.getElementById("existEmail").style.display = "none";
    }
    else existEmail();
}