package com.car.test.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

//自定义一个数据库工具类
public class DbUtils {

    //私有静态常量，常量必须初始化
    private static final String driver;
    private static final String username;
    private static final String password;
    private static final String url;
    private static Connection conn = null;

    static {

        String t_driver = null;
        String t_username = null;
        String t_url = null;
        String t_password = null;

        try {
            Properties pro = new Properties();
            InputStream in = DbUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            pro.load(in);

            t_driver = pro.getProperty("driver");
            t_username = pro.getProperty("username");
            t_password = pro.getProperty("password");
            t_url = pro.getProperty("url");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        driver = t_driver;
        username = t_username;
        password = t_password;
        url = t_url;


        try {
            Class.forName(driver);//加载驱动
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    //设计一个单例模式
    public static Connection getConnection() throws Exception{
        //说明conn没有初始化过。
        if(conn==null){
            conn = DriverManager.getConnection(url,username,password);
        }
        return conn;
    }
}
