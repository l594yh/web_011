package com.car.test.dao.impl;

import com.car.test.dao.UsersDao;
import com.car.test.db.DbUtils;
import com.car.test.entity.users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

//用户接口的实现类
public class UserDaoImpl extends SuperDaoImpl implements UsersDao {


    @Override
    public users login(String username, String password) {
        //在这里去真正实现用户登录功能.
        String sql = "select * from users where username=? and password=?";

        users loginUser = null;


        try {
            pstmt = DbUtils.getConnection().prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                loginUser = new users();
                loginUser.setUid(rs.getInt("uid"));
                loginUser.setUsername(rs.getString("username"));
                loginUser.setPassword(rs.getString("password"));
                loginUser.setBirthday(rs.getDate("birthday"));
                loginUser.setEmail(rs.getString("email"));
                loginUser.setRegdate(rs.getDate("regdate"));
            }
            return loginUser;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            this.destroyResource();
        }

    }

    @Override
    public boolean reg(users user) {
        String sql = "insert into users (username,password,email,birthday,regdate) values (?,?,?,?,?)";
        try {
            pstmt = DbUtils.getConnection().prepareStatement(sql);
            //给参数赋值
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setDate(4, com.car.utils.MyUtils.utilDateToSqlDate(user.getBirthday()));
            pstmt.setDate(5, com.car.utils.MyUtils.utilDateToSqlDate(user.getRegdate()));
            //执行更新语句
            int result = pstmt.executeUpdate();
            if (result > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            this.destroyResource(); //释放资源
        }
    }


}
