package com.car.test.test;

import com.car.test.db.DbUtils;

import java.sql.Connection;

public class DbUtilsDemo {

    public static void main(String[] args) throws Exception {

        Connection conn1 = DbUtils.getConnection();
        Connection conn2 = DbUtils.getConnection();

        System.out.println(conn1 == conn2);
    }
}
