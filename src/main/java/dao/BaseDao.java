package dao;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static util.MyUtil.*;

public class BaseDao {

    static {
        try {
            init();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static DataSource dataSource;

    private static void init() throws IOException {
        Properties prop = new Properties();
        InputStream is = BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
        prop.load(is);
        String driver = prop.getProperty("driver");
        String url = prop.getProperty("url");
        String user = prop.getProperty("user");
        String password = prop.getProperty("password");
        String connectionTimeout = prop.getProperty("connectionTimeout");
        String idleTimeout = prop.getProperty("idleTimeout");
        String maximumPoolSize = prop.getProperty("maximumPoolSize");

        HikariConfig config = new HikariConfig();
        config.setDriverClassName(driver);
        config.setJdbcUrl(url);
        config.setUsername(user);
        config.setPassword(password);
        config.addDataSourceProperty("connectionTimeout",connectionTimeout);//连接超时：1s
        config.addDataSourceProperty("idleTimeout",idleTimeout);//空闲超时：60s
        config.addDataSourceProperty("maximumPoolSize",maximumPoolSize);//最大连接数：10
        dataSource = new HikariDataSource(config);
    }

    private static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public static List<List> select(String sql, Object[] params){
        try(Connection connection = getConnection()){
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                for (int i = 0; i < params.length; i++) {
                    statement.setObject(i+1,params[i]);
                }
                ResultSet set = statement.executeQuery();
                List<List> list = new ArrayList<>();
                int cols = set.getMetaData().getColumnCount();
                while (set.next()){
                    List l = new ArrayList();
                    for (int i = 0; i < cols; i++) {
                        l.add(set.getObject(i+1));
                    }
                    list.add(l);
                }
                return list;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bugNull();
    }

    public static int update(String sql,Object[] params){
        try(Connection connection = getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                for (int i = 0; i < params.length; i++) {
                    statement.setObject(i + 1, params[i]);
                }
                return statement.executeUpdate();
            }
        } catch (SQLException throwables) {
//            throwables.printStackTrace();
            System.err.println("更新操作失败!");
        }
        return -1;
    }

    public static int update(String[] sql,Object[][] params){
        try(Connection connection = getConnection()) {
            connection.setAutoCommit(false);
            int updateSum = 0;
            for (int i = 0; i < sql.length; i++) {
                try (PreparedStatement statement = connection.prepareStatement(sql[i])) {
                    for (int j = 0; j < params[i].length; j++) {
                        statement.setObject(j + 1, params[i][j]);
                    }
                    updateSum += statement.executeUpdate();
                }
            }
            connection.commit();
            return updateSum;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bugNum();
    }

}
