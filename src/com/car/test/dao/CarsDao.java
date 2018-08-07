package com.car.test.dao;


import com.car.test.entity.Car;
import com.car.test.view.Catalog;

import java.util.List;

//汽车的业务接口
public interface CarsDao {

    //按照类型查找所有的汽车.

    public List<Car> queryAllCarsByType(String type);

    //左侧目录接口

    public List<Catalog> queryCarsCatalog();

    public List<Car> queryAllCarsByTypeAndBrand(String type,String brand);


}

