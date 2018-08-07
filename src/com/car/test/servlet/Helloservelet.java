package com.car.test.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;


@WebServlet(value = {"/Helloservelet"})

public class Helloservelet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //System.out.println("你好！");
        /********************
         * 给浏览器输出
         * 1.设置输出contentType
         * 2.在获得数据流
         * ** *************/

        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<h1>你好</h1>");
        out.println("<hr>");
        out.flush();//清空缓冲区
        out.close();






    }
}
