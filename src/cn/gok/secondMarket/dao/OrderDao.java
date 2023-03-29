package cn.gok.secondMarket.dao;

import cn.gok.secondMarket.bean.Order;

import java.util.List;

public interface OrderDao {
    Integer orderCount();
    List<Order> selectOrderList();
    List<Order> pageOrderList(Integer page);
}
