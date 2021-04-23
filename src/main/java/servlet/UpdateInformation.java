package servlet;

import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateInformation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User(req.getParameter("userName"),req.getParameter("password"),
                req.getParameter("nickname"), req.getParameter("sex"),
                req.getParameter("personal_signature"),req.getParameter("email"));
        boolean b = UserService.updateUser(user);
        if(b) resp.getOutputStream().println("1");
        else resp.getOutputStream().println("0");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
