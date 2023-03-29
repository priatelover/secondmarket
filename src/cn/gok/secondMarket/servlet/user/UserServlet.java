package cn.gok.secondMarket.servlet.user;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.User;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;
import cn.gok.secondMarket.dao.Imp.UserDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if ("register".equals(method)){
            register(request,response);
        }else if ("verify".equals(method)){
            verify(request,response);
        }else {
            onload(request,response);
        }
    }

    private void onload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone=(String)request.getSession().getAttribute("phone");

        String pwd = (String) request.getSession().getAttribute("pwd");
        UserDaoImp userDaoImp = new UserDaoImp();
        User user = userDaoImp.loginUser(phone, pwd);
        if (user!=null){
            GoodsDao goodsDao = new GoodsDaoImp();
            List<Goods> goodsList = goodsDao.selectGoodsList();
            request.getSession().setAttribute("goodsList",goodsList);
            request.getSession().setAttribute("user",user);
            response.sendRedirect("index.jsp");
        }else {
            response.sendRedirect("static/login.jsp");
        }
    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = request.getParameter("phone");
        UserDaoImp userDaoImp = new UserDaoImp();
        boolean b = userDaoImp.selectByPhone(phone);
        PrintWriter writer = response.getWriter();
        writer.write(b+"");
        writer.flush();
        writer.close();
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        UserDaoImp userDaoImp = new UserDaoImp();
        Integer integer = userDaoImp.insertNewUser(phone, pwd);
        if (integer>0){
            PrintWriter writer = response.getWriter();
            writer.write("{\"msg\":\"用户注册成功\",\"num\":\"1\"}");
            writer.flush();
            writer.close();
        }
    }
}
