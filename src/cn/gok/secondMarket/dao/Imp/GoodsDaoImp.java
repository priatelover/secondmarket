package cn.gok.secondMarket.dao.Imp;

import cn.gok.secondMarket.bean.Goods;
import cn.gok.secondMarket.bean.GoodsType;
import cn.gok.secondMarket.dao.GoodsDao;
import cn.gok.secondMarket.utils.DBUtil;
import com.mysql.cj.util.StringUtils;

import java.util.List;

public class GoodsDaoImp implements GoodsDao {
    @Override
    /*
     * 查询所有的商品信息
     */
    public List<Goods> selectGoodsList() {
        String sql = "select * from t_goods";
        return DBUtil.queryAll(sql, Goods.class) ;
    }

    @Override
    public List<Goods> selectGoodsByInput(String name, String price, String type) {
        StringBuilder stringBuilder = new StringBuilder("select * from t_goods where 1=1");
        if (!StringUtils.isNullOrEmpty(name)){
            stringBuilder.append(" and goodsName like '%").append(name).append("%'");
        }if (!StringUtils.isNullOrEmpty(price)){
            stringBuilder.append(" and price <").append(price);
        }if (!StringUtils.isNullOrEmpty(type)){
            stringBuilder.append(" and goodsType like '%").append(type).append("%'");
        }
        List<Goods> list = DBUtil.queryAll(stringBuilder.toString(), Goods.class);
        return list;
    }

    @Override
    public Integer updateGoodsInfo(String num, String name, String type, String price, String id) {
        String sql="update t_goods set goodsNum =? ,goodsName = ?,goodsType = ?,price = ? where goodsId = ?";

        return DBUtil.update(sql,num,name,type,price,id);
    }

    @Override
    public List<Goods> goodsPage(Integer page, Integer num) {
        String sql="select * from t_goods limit ?,?";
        List<Goods> goodsList = DBUtil.queryAll(sql, Goods.class, (page - 1) * num, num);
        return goodsList;
    }

    @Override
    public Integer addNewGoods(String goodsNum, String goodsName, String imgPath, String goodsType, String price, String userId) {
        String sql="insert into t_goods(goodsNum,goodsName,imgPath,goodsType,price,userId) values(?,?,?,?,?,?)";
        int i = DBUtil.update(sql, goodsNum, goodsName, imgPath, goodsType, Double.parseDouble(price), Integer.parseInt(userId));
        return i;
    }

    @Override
    public List<GoodsType> goodsTypes() {
        String sql="select DISTINCT(goodsType) from t_goods";
        List<GoodsType> types = DBUtil.queryAll(sql,GoodsType.class);
        return  types;
    }
}
