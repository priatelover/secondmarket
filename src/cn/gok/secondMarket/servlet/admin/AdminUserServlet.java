package cn.gok.secondMarket.servlet.admin;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.User;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;
import cn.gok.secondMarket.dao.Imp.UserDaoImp;
import cn.gok.secondMarket.dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserServlet", urlPatterns = "/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
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

    private void updateAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userStatus = request.getParameter("userStatus");
        String userId = request.getParameter("userId");
        UserDaoImp userDaoImp = new UserDaoImp();
        Integer integer = userDaoImp.updateUserStatus(userStatus, userId);
        response.sendRedirect("AdminUserServlet");
    }


    private void onload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserDao userDao = new UserDaoImp();
        GoodsDao goodsDao = new GoodsDaoImp();
        List<Goods> goodsList = goodsDao.selectGoodsList();
        List<User> userList = userDao.selectUsers();
        request.getSession().setAttribute("userList",userList);
        request.getSession().setAttribute("goodsList",goodsList);
        response.sendRedirect("static/admin/userInfo.jsp");
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        UserDao userDaoImp = new UserDaoImp();
        List<User> userList = userDaoImp.selectUsersByInput(username, phone, gender);
        request.getSession().setAttribute("userList",userList);
        response.sendRedirect("static/admin/userInfo.jsp");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        UserDaoImp userDaoImp = new UserDaoImp();
        userDaoImp.deleteUserById(Integer.valueOf(userId));
        UserDao userDao = new UserDaoImp();
        List<User> userList = userDao.selectUsers();
        request.getSession().setAttribute("userList",userList);
        response.sendRedirect("AdminUserServlet");
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        List<User> userList = (List<User>) request.getSession().getAttribute("userList");
        for (int i = 0; i <userList.size() ; i++) {
            if (userId.equals(userList.get(i).getUserId().toString())){
                User user =userList.get(i);
                request.getSession().setAttribute("userOne",user);
                break;
            }
        }
        request.getRequestDispatcher("static/admin/userUpdate.jsp").forward(request,response);
    }
}
