package service;

import bean.User;
import dao.BaseDao;

import java.util.List;

public class UserService {
    public static User getUser(String userName,boolean self){
        if(!self){
            String sql = "select username,nickname,sex,personal_signature from users where username = ?";
            Object[] objects = {userName};
            List<List> lists = BaseDao.select(sql, objects);
            if(lists.isEmpty()){
                return null;
            }else {
                List list = lists.get(0);
                String nickName = (String) list.get(1);
                String sex = ((String) list.get(2));
                String personal_signature = (String) list.get(3);
                User user = new User(userName,nickName,sex,personal_signature);
                return user;
            }
        }else {
            String sql = "select username,password,nickname,sex,personal_signature,email from users where username = ?";
            Object[] objects = {userName};
            List<List> lists = BaseDao.select(sql, objects);
            if(lists.isEmpty()){
                return null;
            }else {
                List list = lists.get(0);
                String password = (String) list.get(1);
                String nickName = (String) list.get(2);
                String sex = ((String) list.get(3));
                String personal_signature = (String) list.get(4);
                String email = (String) list.get(5);
                User user = new User(userName,password,nickName,sex,personal_signature,email);
                return user;
            }
        }

    }

    public static boolean updateUser(User user){
        String sql = "update users set password=?,nickname=?,sex=?,personal_signature=?,email=? " +
                "where username = ?";
        Object[] params = {user.getPassword(),user.getNickName(),user.getSex(),user.getPersonal_signature(),
        user.getEmail(),user.getUserName()};
        int update = BaseDao.update(sql, params);
        return update == 1;
    }

    public static boolean existUser(String userName){
        String sql = "select id from users where username = ?";
        Object[] objects = {userName};
        List<List> lists = BaseDao.select(sql, objects);
        return lists.size() == 1;
    }

    public static boolean existEmail(String email){
        String sql = "select id from users where email = ?";
        Object[] objects = {email};
        List<List> lists = BaseDao.select(sql, objects);
        return lists.size() == 1;
    }
}
