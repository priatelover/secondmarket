package cn.gok.secondMarket.bean;


import java.util.Date;

public class Order {
    private Integer orderId;
    private Integer goodsId;
    private Date orderTime;
    private Integer orderNum;
    private Integer orderStatus;
    private String goodsNum;
    private String goodsName;
    private String imgPath;
    private String goodsType;
    private Double price;


    public Order() {
    }

    public Order(Integer goodsId, String goodsNum, String goodsName, String imgPath, String goodsType, Double price, Integer orderId, Date orderTime, Integer orderNum, Integer orderStatus) {
        this.goodsId = goodsId;
        this.goodsNum = goodsNum;
        this.goodsName = goodsName;
        this.imgPath = imgPath;
        this.goodsType = goodsType;
        this.price = price;
        this.orderId = orderId;
        this.orderTime = orderTime;
        this.orderNum = orderNum;
        this.orderStatus = orderStatus;
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

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "Order{" +
                "goodsId=" + goodsId +
                ", goodsNum='" + goodsNum + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", price=" + price +
                ", orderId=" + orderId +
                ", orderTime=" + orderTime +
                ", orderNum=" + orderNum +
                ", orderStatus=" + orderStatus +
                '}';
    }
}
