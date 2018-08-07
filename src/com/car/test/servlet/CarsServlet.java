package com.car.test.servlet;

import com.car.test.dao.CarsDao;
import com.car.test.dao.impl.CarsDaoImpl;
import com.car.test.entity.Car;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(value = {"/CarsServlet"})
public class CarsServlet extends HttpServlet {
    private String action;
    private CarsDao cDao = new CarsDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        if (req.getParameter("action") != null) {
            this.action = req.getParameter("action");

        }
        switch (this.action) {

            case "byType":
                queryAllCarsByType(req, resp);
                break;
        }


    }

    private void queryAllCarsByType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/plain;character=utf-8");
        PrintWriter out = resp.getWriter();

        String type = req.getParameter("type");
        List<Car> carList = cDao.queryAllCarsByType(type);
        //把java集合转换为json集合。//jsonlib/fastjson/gson/jackson
        JSONArray jsonArray = JSONArray.fromObject(carList);
        System.out.println(jsonArray);
//        for (Car c : carList) {
////            System.out.println(c);
////        }

        out.write(jsonArray.toString());
        out.flush();
        out.close();
    }
}
