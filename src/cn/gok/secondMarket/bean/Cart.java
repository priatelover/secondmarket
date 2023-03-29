package cn.gok.secondMarket.bean;

import java.util.Date;

public class Cart {
    private Integer cartId;
    private Integer userId;
    private String username;
    private String phone;
    private String password;
    private String gender;
    private Integer status;
    private Integer goodsId;
    private String goodsNum;
    private String goodsName;
    private String imgPath;
    private String goodsType;
    private Double price;
    private Date createTime;

    public Cart() {
    }

    public Cart(Integer cartId, Integer userId, String username, String phone, String password, String gender, Integer status, Integer goodsId, String goodsNum, String goodsName, String imgPath, String goodsType, Double price, Date createTime) {
        this.cartId = cartId;
        this.userId = userId;
        this.username = username;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.status = status;
        this.goodsId = goodsId;
        this.goodsNum = goodsNum;
        this.goodsName = goodsName;
        this.imgPath = imgPath;
        this.goodsType = goodsType;
        this.price = price;
        this.createTime = createTime;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", status=" + status +
                ", goodsId=" + goodsId +
                ", goodsNum='" + goodsNum + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", price=" + price +
                ", createTime=" + createTime +
                '}';
    }
}
