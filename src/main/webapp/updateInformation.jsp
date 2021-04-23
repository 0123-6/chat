<%@ page import="service.UserService" %>
<%@ page import="bean.User" %>
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

<h3>更新个人信息</h3>
<%!
    private User user;
%>
<%
    String userName = (String) session.getAttribute("userName");
    user = UserService.getUser(userName,true);
%>

<script>
    varexistEmail = true;
    varsamePassword = true;
</script>

<form onsubmit="return updateInformation('<%=user.getUserName()%>','<%=user.getPassword()%>',
        '<%=user.getNickName()%>','<%=user.getSex()%>',
        '<%=user.getPersonal_signature()%>','<%=user.getEmail()%>')">
    <h4>账号信息</h4>
    <p>
        <label>账号：</label>
        <input type="text" id="userName" name="userName" value="<%=user.getUserName()%>" disabled>
    </p>
    <p>
        <label for="password">密码：</label>
        <input id="password" type="password" name="password" onblur="samePassword()" required="required" value="<%=user.getPassword()%>"></p>
    <p>
        <label for="password2">确认密码：</label>
        <input id="password2" type="password" name="password2" onblur="samePassword()" required="required" value="<%=user.getPassword()%>">
        <span id="samePassword" style="display: none;color: red">密码不一致!</span>
    </p>
    <p>
        <label for="email">电子邮箱：</label>
        <input id="email" type="email" name="email" onblur="okEmail('<%=user.getEmail()%>')" required="required" value="<%=user.getEmail()%>">
        <span id="existEmail" style="display: none;color: red">该email已存在!</span>
    </p>
    <h4>个人信息</h4>
    <p>
        <label for="nickname">昵称：</label>
        <input type="text" id="nickname" value="<%=user.getNickName()%>">
    </p>
    <p>
        <label>性别：</label>
        <input type="radio" id="man" name="sex" value="男">男
        <input type="radio" id="woman" name="sex" value="女">女
        <script>
            if('男'=='<%=user.getSex()%>') $("#man").prop("checked","checked");
            else $("#woman").prop("checked","checked");
        </script>
    </p>
    <p>
        <label for="personal_signature">个性签名：</label>
        <input type="text" id="personal_signature" value="<%=user.getPersonal_signature()%>">
    </p>
    <p>
        <input type="submit" value="更新">
        <a href="${pageContext.request.contextPath}/display.jsp">主页面</a>
        <span id="updateSuccess" style="display: none">更新成功</span>
        <span id="updateFalse" style="display: none;color: red">更新失败</span>
    </p>
</form>


</body>
</html>
