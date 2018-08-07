package com.car.test.servlet;


import com.car.test.dao.UsersDao;
import com.car.test.dao.impl.UserDaoImpl;
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

//封装跟用户所有相关的Servlet

@WebServlet(value = {"/UsersServlet"})


public class UsersServlet extends HttpServlet {

    private String action; //表示要执行的动作的名字
    private UsersDao uDao = new UserDaoImpl();


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
            case "login":
                //执行用户登陆
                login(req, resp);
                break;
            case "logout":
                logout(req, resp);
                break;
            case "reg":
                reg(req, resp);
                break;

        }
    }

    /*用户登录功能*/
    /*同步提交
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username"); //注意参数名称与HTML里面的input名称要一致
        String password = req.getParameter("password"); //注意参数名称与HTML里面的input名称要一致
        users loginUser = uDao.login(username, password);


        if (loginUser != null) {
            //说明登陆成功 跳转首页
            req.getSession().setAttribute("loginUser",loginUser);
            resp.sendRedirect(req.getContextPath() + "/index.jsp");

        } else {
            //说明登陆失败
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            System.out.println("登录失败");
        }
    }
    */

    /*异步提交*/


    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=utf-8");

        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username"); //注意参数名称与HTML里面的input名称要一致
        String password = req.getParameter("password"); //注意参数名称与HTML里面的input名称要一致
        users loginUser = uDao.login(username, password);


        if (loginUser != null) {
            //说明登陆成功 跳转首页
            req.getSession().setAttribute("loginUser", loginUser);
            //resp.sendRedirect(req.getContextPath() + "/index.jsp");

            out.print("success");
            out.flush();
            out.close();

        } else {
            //说明登陆失败
            //resp.sendRedirect(req.getContextPath() + "/login.jsp");
            // System.out.println("登录失败");

            out.print("failure");
            out.flush();
            out.close();
        }
    }

    /*用户注销功能*/
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.把sesson中保存的用户对象删除了。
        if (req.getSession().getAttribute("loginUser") != null) {
            req.getSession().removeAttribute("loginUser");
        }
        //2.页面跳转到登录页面
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }

    /*用户注册方法-异步提交方法*/

    private void reg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String data = req.getParameter("data"); //获得json格式的数据。
        System.out.println(data);
        //如何把json对象转换为java对象。
        JSONObject jsonObject = JSONObject.fromObject(data);
        JsonConfig jsonConfig = new JsonConfig();

        //jsonobject.tobean 方法会把日期自动转为系统日期
        jsonConfig.setRootClass(users.class);
        JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[] {"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss"}));

        users user = (users) JSONObject.toBean(jsonObject, users.class);
        user.setRegdate(new Date());

        System.out.println(user);
        if (uDao.reg(user)) {
            //说明注册成功
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