package cn.gok.secondMarket.dao.Imp;

import cn.gok.secondMarket.bean.Order;
import cn.gok.secondMarket.dao.OrderDao;
import cn.gok.secondMarket.utils.DBUtil;

import java.util.List;

public class OrderDaoImp implements OrderDao {
    @Override
    public Integer orderCount() {
        String sql="select count(orderId) from t_order";
        int i = DBUtil.queryForCount(sql);
        return i;
    }

    @Override
    public List<Order> selectOrderList() {
        String sql = "select * from t_order,t_goods where t_order.goodsId = t_goods.goodsId limit 0,10";
        List<Order> orderList = DBUtil.queryAll(sql, Order.class);
        return orderList;
    }

    @Override
    public List<Order> pageOrderList(Integer page) {
        String sql = "select * from t_order,t_goods where t_order.goodsId = t_goods.goodsId limit ?,10";
        List<Order> orderList = DBUtil.queryAll(sql, Order.class,(page-1)*10);
        return orderList;
    }
}
