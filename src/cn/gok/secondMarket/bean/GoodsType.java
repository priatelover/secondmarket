package cn.gok.secondMarket.bean;

public class GoodsType {
    private String goodsType;

    public GoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public GoodsType() {
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    @Override
    public String toString() {
        return "GoodsType{" +
                "goodsType='" + goodsType + '\'' +
                '}';
    }
}
