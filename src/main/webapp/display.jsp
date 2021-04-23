<%@ page import="bean.User" %>
<%@ page import="service.UserService" %>
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
<%!
    private User user;
%>
<%
    String userName = (String) session.getAttribute("userName");
    user = UserService.getUser(userName,false);
%>
<script>
    $(document).ready(function(){
        getFriends('<%=userName%>');
    });
</script>
<div>
    <p>
        账号：
        <span id="userName"><%=user.getUserName()%></span>
    </p>
    <p>个性签名：<%=user.getPersonal_signature()%></p>
    <input type="button" id="logout" value="注销" onmouseup="logout('<%=userName%>')">
    <p>
        <a href="${pageContext.request.contextPath}/updateInformation.jsp">更新个人资料</a>
    </p>
    <p>
        <a href="${pageContext.request.contextPath}/addfriend.jsp">添加朋友</a>
    </p>
</div>

<div>
    <h3>通信录</h3>
    <div id="friends"></div>
    <img src="" alt="">
</div>
</body>
</html>
