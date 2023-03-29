package cn.gok.secondMarket.servlet.admin;

import cn.gok.secondMarket.bean.Order;
import cn.gok.secondMarket.dao.Imp.OrderDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AdminOrderServlet", urlPatterns = "/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("pagination".equals(method)){
            pagination(request,response);
        }else {
            OrderDaoImp orderDaoImp = new OrderDaoImp();
            Integer orderCount = orderDaoImp.orderCount();
            List<Order> orderList = orderDaoImp.selectOrderList();
            HttpSession session = request.getSession();
            session.setAttribute("orderCount",orderCount);
            session.setAttribute("orderList",orderList);
            response.sendRedirect("static/admin/ordersInfo.jsp");
        }

    }

    private void pagination(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        OrderDaoImp orderDaoImp = new OrderDaoImp();
        List<Order> orderList = orderDaoImp.pageOrderList(Integer.valueOf(page));
        HttpSession session = request.getSession();
        session.setAttribute("orderList",orderList);
        response.sendRedirect("static/admin/ordersInfo.jsp");
    }
}
