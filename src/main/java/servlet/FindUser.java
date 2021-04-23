package servlet;

import bean.User;
import service.FriendService;
import service.UserService;
import util.MyUtil;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class FindUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, Object> map = MyUtil.jsonToMap(req);
        String userName = (String) map.get("userName");
        String user_1 = (String) map.get("user_1");

        User getUser = UserService.getUser(userName,false);
        map = new HashMap<>();
        if(getUser!=null){//存在该用户
            boolean isFriend = FriendService.isFriend(user_1,userName);
            map.put("sex",getUser.getSex());
            map.put("nickName",getUser.getNickName());
            map.put("personal_signature",getUser.getPersonal_signature());
            if(!isFriend){//如果不是朋友
                map.put("result",1);
            }else {//如果已经是朋友
                map.put("result",2);
            }
        }else {//不存在该用户
            map.put("result",0);
        }
        resp.getWriter().println(MyUtil.toJson(map,resp));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }
}
