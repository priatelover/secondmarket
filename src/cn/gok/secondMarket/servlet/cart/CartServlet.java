package cn.gok.secondMarket.servlet.cart;

import cn.gok.secondMarket.bean.Cart;
import cn.gok.secondMarket.dao.Imp.CartDaoImp;
import cn.gok.secondMarket.utils.FormatTime;
import com.alibaba.fastjson2.JSON;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("goCart".equals(method)){
            goCart(request,response);
        }else if ("selectCart".equals(method)){
            selectCart(request,response);
        }
    }

    private void selectCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        CartDaoImp cartDaoImp = new CartDaoImp();
        List<Cart> cartList = cartDaoImp.selectCartByUserId(userId);
        String jsonString = JSON.toJSONString(cartList);
        PrintWriter writer = response.getWriter();
        writer.write(jsonString);
        writer.flush();
        writer.close();
    }

    private void goCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String goodsId = request.getParameter("goodsId");
        FormatTime time = new FormatTime();
        String formatTime = time.formatTime();
        CartDaoImp cartDaoImp = new CartDaoImp();
        Integer num = cartDaoImp.addCart(userId, goodsId, formatTime);
        PrintWriter writer = response.getWriter();
        if (num==1){

            writer.write("{\"msg\":\"添加成功\"}");
            writer.flush();
            writer.close();
        }else {
            writer.write("{\"msg\":\"添加失败\"}");
            writer.flush();
            writer.close();
        }

    }
}
