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
<h3>添加朋友</h3>
<form action="/" method="post" onsubmit="return false">
    <input type="text" id="findUserName" placeholder="账号">
    <input type="submit" value="搜索" onmouseup="findUser('<%=session.getAttribute("userName")%>')">
    <a href="${pageContext.request.contextPath}/display.jsp"> 主页面 </a>
</form>

<p id="searchFalse" style="display: none;color: red">搜索失败</p>
<p id="notExist" style="color: red;display: none">该用户不存在</p>
<div id="userInformation" style="display: none">
    <p style="display: none">
        账号:<span id="userName"></span>
    </p>
    <p>
        性别：<span id="sex"></span>
    </p>
    <p>
        昵称：<span id="nickname"></span>
    </p>
    <p>
        个性签名：<span id="personal_signature"></span>
    </p>
    <p>
        <input id="addf" type="button" value="添加到通信录" onmouseup="addFriend('<%=session.getAttribute("userName")%>')"
        style="display: none">
        <input id="ok" type="button" value="已是你的好友" disabled style="display: none">
        <span id="addSuccess" style="display: none">添加成功</span>
        <span id="addFalse" style="display: none;color: red">添加失败</span>
        <span id="addFalseWhy" style="display: none;color: red">未知错误，添加失败</span>
    </p>
</div>




</body>
</html>
