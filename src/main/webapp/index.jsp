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
<div>
    <form onsubmit="return canLogin()">
        <h3>迷你聊天室</h3>
        <p>
            <label for="userName">账号：</label>
            <input id="userName" type="text" name="userName" required>
            <a href="${pageContext.request.contextPath}/register.jsp" >注册账号</a>
        </p>
        <p>
            <label for="password">密码：</label>
            <input id="password" type="password" name="password" required>
            <a href="" style="display: none">忘记密码</a>
        </p>
        <p>
            <input id="login" type="submit" value="登录">
            <span class="error" id="loginError" style="display: none"> 账号或密码错误！</span>
        </p>
    </form>
</div>


</body>
</html>
