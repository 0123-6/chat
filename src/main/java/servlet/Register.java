package servlet;

import bean.User;
import service.LoginService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = new User();
        user.setUserName(req.getParameter("userName"));
        user.setPassword(req.getParameter("password"));
        user.setEmail(req.getParameter("email"));
        boolean ok = LoginService.register(user);
        if(ok){//注册成功
            resp.getOutputStream().println("1");
        }else {
            resp.getOutputStream().println("0");
            System.err.println("返回码无效，请debug！");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }
}
