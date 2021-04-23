package service;

import bean.User;
import dao.BaseDao;

import java.util.List;

public class LoginService {

    public static boolean login(String userName,String password){//待实现：掉号
        String sql = "select id from users where username = ? and password = ?";
        Object[] params = {userName,password};
        List<List> select = BaseDao.select(sql, params);
        boolean ok = select.size() == 1;
        if(ok){
            String sql1 = "insert ignore into onlines(username) values(?)";
            Object[] params1 = {userName};
            int update = BaseDao.update(sql1, params1);
            if(update==0 ){
                System.err.println("注意：该账号已登录!");
            }
        }
        return ok;
    }

    public static boolean logout(String userName){
        String sql = "delete from onlines where username = ?";
        Object[] params = {userName};
        int rows = BaseDao.update(sql,params);
        if(rows!=1) System.err.println("可以注销，但注销失败!");
        return rows==1;
    }

    public static Boolean register(User user){
        String sql = "insert into users(username,password,nickname,sex,personal_signature,email) values(?,?,?,?,?,?)";
        Object[] params = new Object[]{user.getUserName(),user.getPassword(),"","男","",user.getEmail()};
        int rows = BaseDao.update(sql,params);
        if(rows!=1) System.err.println("新账号可以注册，但写数据库失败");
        return rows==1;
    }
}
