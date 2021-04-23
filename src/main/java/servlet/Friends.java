package servlet;

import bean.User;
import service.FriendService;
import util.MyUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class Friends extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = MyUtil.jsonToMap(req);
        String userName = (String) map.get("userName");
        List<User> friends = FriendService.getFriends(userName);
        String json = MyUtil.toJson(friends,resp);
        System.out.println(json);
        resp.getWriter().println(json);
    }
}
