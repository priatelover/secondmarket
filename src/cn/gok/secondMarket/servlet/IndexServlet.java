package cn.gok.secondMarket.servlet;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.GoodsType;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", urlPatterns = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GoodsDao goodsDao = new GoodsDaoImp();
        List<Goods> goodsList = goodsDao.selectGoodsList();
        List<GoodsType> types = goodsDao.goodsTypes();
        req.getSession().setAttribute("goodsList", goodsList);
        req.getSession().setAttribute("goodsType",types);
        resp.sendRedirect("index.jsp");
    }
}
