package com.car.test.dao.impl;

import javax.naming.PartialResultException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//所有业务逻辑的接口父类
public class SuperDaoImpl {

    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected CallableStatement cstmt;
    protected ResultSet rs;

    //设计为protected修饰符的目的是为了让子类集成

    protected void destroyResource() {
        try {
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
            if (pstmt != null) {
                pstmt.close();
                pstmt = null;
            }
            if (cstmt != null) {
                cstmt.close();
                cstmt = null;
            }
            if (rs != null) {
                rs.close();
                rs = null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
