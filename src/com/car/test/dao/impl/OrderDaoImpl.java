package com.car.test.dao.impl;

import com.car.test.dao.orderDao;
import com.car.test.db.DbUtils;
import com.car.test.entity.order;

import java.sql.PreparedStatement;

public class OrderDaoImpl extends SuperDaoImpl implements orderDao {

    @Override
    public boolean ord(order ord) {
        String sql = "insert into orders (brand,car_type,service,retday) values (?,?,?,?)";
        //PreparedStatement pstm = null;
        try {
            pstmt = DbUtils.getConnection().prepareStatement(sql);
            //给参数赋值
            pstmt.setString(1, ord.getBrand());
            pstmt.setString(2, ord.getCar_type());
            pstmt.setString(3, ord.getService());
            pstmt.setDate(4, com.car.utils.MyUtils.utilDateToSqlDate(ord.getRetday()));
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
