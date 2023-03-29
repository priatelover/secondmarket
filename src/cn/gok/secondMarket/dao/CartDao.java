package cn.gok.secondMarket.dao;

import cn.gok.secondMarket.bean.Cart;

import java.util.List;

public interface CartDao {
    Integer addCart(String userId,String goodsId,String time);
    List<Cart> selectCartByUserId(String userId);
}
