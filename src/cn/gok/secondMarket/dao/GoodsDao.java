package cn.gok.secondMarket.dao;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.GoodsType;

import java.util.List;

public interface GoodsDao {
    List<Goods> selectGoodsList();
    List<Goods> selectGoodsByInput(String name,String price,String type);
    Integer updateGoodsInfo(String num,String name,String type,String path,String id);
    List<Goods> goodsPage(Integer page,Integer num);
    Integer addNewGoods(String goodsNum,String goodsName,String imgPath,String goodsType,String price,String userId);
    List<GoodsType> goodsTypes();
}
