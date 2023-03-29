package cn.gok.secondMarket.dao.Imp;

import cn.gok.secondMarket.bean.Cart;
import cn.gok.secondMarket.dao.CartDao;
import cn.gok.secondMarket.utils.DBUtil;

import java.util.List;

public class CartDaoImp implements CartDao {
    @Override
    public Integer addCart(String userId, String goodsId, String time) {
        String sql = "insert into t_cart(goodsId,userId,createTime) values(?,?,?)";
        int update = DBUtil.update(sql,goodsId, userId, time);
        return update;
    }

    @Override
    public List<Cart> selectCartByUserId(String userId) {
        String sql="select * from t_user u,t_goods g,t_cart c where u.userId=c.UserId and g.goodsId=c.goodsId and c.userId=?";
        List<Cart> cartList = DBUtil.queryAll(sql, Cart.class, userId);
        return cartList;
    }
}
