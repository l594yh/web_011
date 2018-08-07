package com.car.test.servlet;

import com.car.test.dao.impl.OrderDaoImpl;
import com.car.test.dao.orderDao;
import com.car.test.entity.order;
import com.car.test.entity.users;
import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(value = {"/orderServlet"})
public class orderServlet extends HttpServlet {
    private String action;
    private orderDao oDao = new OrderDaoImpl();

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

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
            case "order":
                ord(req, resp);
                break;

        }

    }

    public void ord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String data = req.getParameter("data");
        System.out.println(data);

        //如何把json对象转换为java对象。
        JSONObject jsonObject = JSONObject.fromObject(data);
        JsonConfig jsonConfig = new JsonConfig();

        //jsonobject.tobean 方法会把日期自动转为系统日期
        jsonConfig.setRootClass(order.class);
        JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[] {"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss"}));

        order orde = (order) JSONObject.toBean(jsonObject, order.class);


        if (oDao.ord(orde)) {
            //提交成功
            out.write("success");
            out.flush();
            out.close();
        } else {
            out.write("failure");
            out.flush();
            out.close();
        }



    }


}
