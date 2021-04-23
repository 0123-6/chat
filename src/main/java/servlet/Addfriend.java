package servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import service.FriendService;
import util.MyUtil;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Addfriend extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, Object> map = MyUtil.jsonToMap(req);
        String user_1 = (String) map.get("user_1");
        String user_2 = (String) map.get("user_2");
        boolean b = FriendService.addFriend(user_1, user_2);

        Map<String,Object> map2 = new HashMap<>();
        if(b){
            map2.put("result",1);//success
        }else {
            map2.put("result",0);//false
        }
        int a = 1;
        resp.getWriter().println(MyUtil.toJson(map2,resp));
    }
}
