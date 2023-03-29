package cn.gok.secondMarket.servlet.admin;

import cn.gok.secondMarket.bean.Admin;
import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.User;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.dao.Imp.AdminDaoImp;
import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;
import cn.gok.secondMarket.dao.Imp.UserDaoImp;
import cn.gok.secondMarket.dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String role = request.getParameter("role");
        System.out.println(role);
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        String page = request.getParameter("page");
        String num = request.getParameter("num");
        if (1 == Integer.parseInt(role)) {
            Admin admin = new AdminDaoImp().loginAdmin(phone, pwd);
            if (admin != null) {

                UserDao userDao = new UserDaoImp();
                GoodsDao goodsDao = new GoodsDaoImp();

                List<Goods> goodsList = goodsDao.goodsPage(1, 10);

                List<User> userList = userDao.selectUsers();
                request.getSession().setAttribute("userList", userList);
                request.getSession().setAttribute("goodsList", goodsList);
                request.getSession().setAttribute("admin", admin);
                response.sendRedirect("static/admin/adminUI.jsp");
            } else {
                response.sendRedirect("static/login.jsp");
            }
        }
        if (2 == Integer.parseInt(role)) {
            request.getSession().setAttribute("phone", phone);
            request.getSession().setAttribute("pwd", pwd);
            response.sendRedirect("UserServlet");
        }
    }
}
