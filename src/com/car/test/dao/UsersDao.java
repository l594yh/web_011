package com.car.test.dao;


import com.car.test.entity.users;

//封装了用户的所有业务逻辑接口
public interface UsersDao {

    //用户登录接口
    public users login(String username, String password);

    //用户注册
    public boolean reg(users user);


    //用户订单





}
