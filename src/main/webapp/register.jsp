<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>迷你聊天室</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" href="generic.css">
    <script charset="gb2312" src="ajax.js" type="text/javascript" ></script>
    <script charset="gb2312" src="jquery.js" type="text/javascript" ></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>

<script>
    varexistUser = true;
    varexistEmail = true;
    varsamePassword = false;
</script>
<h3>注册账号</h3>
<form onsubmit="return canRegister()">
    <p>
        <label for="userName">账号：</label>
        <input type="text" id="userName" name="userName" onblur="existUser()" required="required">
        <span id="existName" style="display: none;color: red">该账号已存在!</span>
    </p>
    <p>
        <label for="password">密码：</label>
        <input id="password" type="password" name="password" onblur="samePassword()" required="required"></p>
    <p>
        <label for="password2">确认密码：</label>
        <input id="password2" type="password" name="password2" onblur="samePassword()" required="required">
        <span id="samePassword" style="display: none;color: red">密码不一致!</span>
    </p>
    <p>
        <label for="email">电子邮箱：</label>
        <input id="email" type="email" name="email" onblur="existEmail()" required="required">
        <span id="existEmail" style="display: none;color: red">该email已存在!</span>
    </p>
    <p>
        <input type="submit" value="注册">
        <a href="${pageContext.request.contextPath}/"> 返回登录页面 </a>
        <span id="registerSuccess" style="display: none">注册成功</span>
        <span id="registerFalse" style="display: none;color: red">注册失败</span>
    </p>
</form>

</body>
</html>
