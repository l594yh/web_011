package com.car.test.test;

import com.car.test.dao.UsersDao;
import com.car.test.dao.impl.UserDaoImpl;
import com.car.test.entity.users;
public class UsersDaoDemo {
    public static void main(String[] args) {
        String username = "admin";
        String password = "123456";
        UsersDao uDao = new UserDaoImpl();
        users loginUser = uDao.login(username,password);
        if (loginUser!=null){
            System.out.println("登陆成功");
        }
        else {
            System.out.println("登陆失败");
        }

    }
}
