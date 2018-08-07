package com.car.test.test;


/***
 * java连接mysql
 * 1.加载驱动，所谓驱动就是一个类。class
 * 2.获得数据库连接对象
 * 3.编写SQL语句
 * 4.创建SQL语句对象
 * 5.执行sql语句
 * 6.获取结果遍历打印
 * 7.释放资源
 * ***/

/**模块导入**/
import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;

public class jdbcdemo {

    public static void main(String[] args) throws Exception {

        Connection conn = null;
        Statement stmt = null;


            /*获取连接*/
            String driver = "com.mysql.jdbc.Driver"; //驱动类名
            String url = "jdbc:mysql://localhost:3306/cardemo"; //数据库名以及地址
            /*用户信息配置*/
            String user = "root";
            String pass = "buzhidaomima123~";

            Class.forName("com.mysql.jdbc.Driver"); //加载驱动

            System.out.println("连接数据库");
            conn = DriverManager.getConnection(url, user, pass); /*数据库连接*/

            /*创建语句对象*/
            System.out.println("实例化Statement对象");
            stmt = conn.createStatement();

            /*SQL语句*/
            String sql;
            sql = "select * from car ";

            /*获取结果并遍历打印*/
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {

                int id = rs.getInt("id");
                String type = rs.getString("type");
                String brand = rs.getString("brand");
                String information = rs.getString("information");


                System.out.print(id + "\t");
                System.out.print(type + "\t");
                System.out.print(brand + "\t");
                System.out.print(information + "\t");
                System.out.print("\n");


            }

            rs.close();
            stmt.close();
            conn.close();



    }
}


