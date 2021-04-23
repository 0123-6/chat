package service;

import bean.User;
import dao.BaseDao;

import java.util.ArrayList;
import java.util.List;

public class FriendService {
    public static boolean addFriend(String user_1,String user_2){
        String sql = "insert into friends(user_1,user_2) " +
                "values(?,?),(?,?)";
        Object[] params = {user_1,user_2,user_2,user_1};
        int update = BaseDao.update(sql, params);
        if(update!=2) System.err.println("添加好友失败");
        return update==2;
    }

    public static boolean isFriend(String user_1,String user_2){
        String sql = "select id from friends where user_1 = ? and user_2 = ?";
        Object[] params = {user_1,user_2};
        List<List> select = BaseDao.select(sql, params);
        return select.size()==1;
    }

    public static List<User> getFriends(String userName){
        String sql = "select user_2 from friends where user_1 = ?";
        Object[] params = {userName};
        List<List> lists = BaseDao.select(sql, params);
        List<User> userList = new ArrayList<>();
        for (int i = 0; i < lists.size(); i++) {
            String friendName = (String) lists.get(i).get(0);
            User friend = UserService.getUser(friendName, false);
            userList.add(friend);
        }
        return userList;
    }
}
