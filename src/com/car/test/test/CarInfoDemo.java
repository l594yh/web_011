package com.car.test.test;

import com.car.test.dao.CarsDao;
import com.car.test.dao.impl.CarsDaoImpl;
import com.car.test.entity.Car;
import com.car.test.view.Catalog;

import java.util.List;

public class CarInfoDemo {

    public static void main(String[] args) {

        CarsDao cDao = new CarsDaoImpl();
        List<Catalog> list = cDao.queryCarsCatalog();
        for(Catalog c:list) {
            System.out.println(c);
        }

    }
}
