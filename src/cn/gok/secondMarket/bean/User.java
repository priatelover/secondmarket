package cn.gok.secondMarket.bean;

public class User {
    private Integer userId;
    private String username;
    private String phone;
    private String password;
    private String gender;
    private Integer status;

    public User() {
    }

    public User(Integer userId, String username, String phone, String password, String gender, Integer status) {
        this.userId = userId;
        this.username = username;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.status = status;
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

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", status=" + status +
                '}';
    }
}
