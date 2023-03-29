package cn.gok.secondMarket.bean;

public class Goods {
    private Integer goodsId;
    private String goodsNum;
    private String goodsName;
    private String imgPath;
    private String goodsType;
    private Double price;

    public Goods() {
    }

    public Goods(Integer goodsId, String goodsNum, String goodsName, String imgPath, String goodsType, Double price) {
        this.goodsId = goodsId;
        this.goodsNum = goodsNum;
        this.goodsName = goodsName;
        this.imgPath = imgPath;
        this.goodsType = goodsType;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", goodsNum='" + goodsNum + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", price=" + price +
                '}';
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
