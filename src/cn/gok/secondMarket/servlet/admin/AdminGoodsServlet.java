package cn.gok.secondMarket.servlet.admin;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.User;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminGoodsServlet", urlPatterns = "/AdminGoodsServlet")
public class AdminGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("delete".equals(method)){
            delete(request,response);
        }else if("search".equals(method)){
            search(request,response);
        }else if("update".equals(method)){
            update(request,response);
        }else if("updateAction".equals(method)){
            updateAction(request,response);
        }
        else {
            onload(request,response);
        }
    }

    private void onload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        GoodsDao goodsDao = new GoodsDaoImp();
        List<Goods> goodsList = goodsDao.selectGoodsList();
        request.getSession().setAttribute("goodsList",goodsList);
        response.sendRedirect("static/admin/goodsInfo.jsp");
    }

    private void updateAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("Id");
        String num = request.getParameter("num");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        String path = request.getParameter("path");
        GoodsDao goodsDao = new GoodsDaoImp();
        Integer integer = goodsDao.updateGoodsInfo(num, name, type, price, id);
        response.sendRedirect("AdminGoodsServlet");

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodsId = request.getParameter("goodsId");
        List<Goods> goodsList = (List<Goods>) request.getSession().getAttribute("goodsList");
        for (int i = 0; i <goodsList.size() ; i++) {
            if (goodsId.equals(goodsList.get(i).getGoodsId().toString())){
                Goods goods =goodsList.get(i);
                request.getSession().setAttribute("goodsOne",goods);
                break;
            }
        }

        request.getRequestDispatcher("static/admin/goodsUpdate.jsp").forward(request,response);

    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String goodsName = request.getParameter("goodsName");
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        GoodsDao goodsDao = new GoodsDaoImp();
        List<Goods> goodsList = goodsDao.selectGoodsByInput(goodsName,price,type);
        request.getSession().setAttribute("goodsList",goodsList);
        response.sendRedirect("static/admin/goodsInfo.jsp");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
    }
}
