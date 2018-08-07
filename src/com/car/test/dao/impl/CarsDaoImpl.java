package com.car.test.dao.impl;

import com.car.test.dao.CarsDao;
import com.car.test.db.DbUtils;
import com.car.test.entity.Car;
import com.car.test.view.Catalog;

import java.util.ArrayList;
import java.util.List;

public class CarsDaoImpl extends SuperDaoImpl implements CarsDao {


    @Override
    public List<Car> queryAllCarsByType(String type) {
        String sql = "select * from car where type=?";
        List<Car> list = new ArrayList<Car>();
        try {
            pstmt = DbUtils.getConnection().prepareStatement(sql);
            pstmt.setString(1, type);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Car c = new Car();
                c.setId(rs.getInt("id"));
                c.setType(rs.getString("type"));
                c.setBrand(rs.getString("brand"));
                c.setInformation(rs.getString("information"));
                c.setPrice(rs.getInt("price"));
                c.setStatus(rs.getInt("status"));
                c.setYears(rs.getInt("years"));
                c.setPic(rs.getString("pic"));
                list.add(c);
            }
            return list;

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            this.destroyResource();
        }
    }


    @Override
    public List<Catalog> queryCarsCatalog() {
        String[] type = {"轿车", "SUV", "MPV"};
        String sql = "";
        List<Catalog> list = new ArrayList<Catalog>();
        try {
            //怎么写呢？
            for (String t : type) {

                sql = "select distinct brand from car where type = '" + t + "'";
                stmt = DbUtils.getConnection().createStatement();
                rs = stmt.executeQuery(sql);
                Catalog c = new Catalog();
                List<String> brands = new ArrayList<String>();
                c.setType(t);
                c.setBrand(brands);
                while (rs.next()) {

                    brands.add(rs.getString("brand"));
                }

                list.add(c);
            }

            return list;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            this.destroyResource();
        }
    }



    @Override
    public List<Car> queryAllCarsByTypeAndBrand(String type, String brand) {
        String sql = "select * from car where type=? and brand=?";
        List<Car> list = new ArrayList<Car>();
        try{
            pstmt = DbUtils.getConnection().prepareStatement(sql);
            //付参数
            pstmt.setString(1,type);
            pstmt.setString(2,brand);

            rs = pstmt.executeQuery();
            //遍历这个结果集
            while(rs.next()){
                Car c = new Car();

                c.setId(rs.getInt("id"));
                c.setType(rs.getString("type"));
                c.setBrand(rs.getString("brand"));
                c.setInformation(rs.getString("information"));
                c.setPrice(rs.getInt("price"));
                c.setStatus(rs.getInt("status"));
                c.setYears(rs.getInt("years"));
                c.setPic(rs.getString("pic"));
                list.add(c);
            }
            return list;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
        finally{
            this.destroyResource();
        }
    }
}
