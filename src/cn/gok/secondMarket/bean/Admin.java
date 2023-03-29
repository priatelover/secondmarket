package cn.gok.secondMarket.bean;

public class Admin {
    private Integer adminId;
    private Integer status;
    private String name;
    private String phone;
    private String gender;
    private String password;

    public Admin(Integer adminId, Integer status, String name, String phone, String gender, String password) {
        this.adminId = adminId;
        this.status = status;
        this.name = name;
        this.phone = phone;
        this.gender = gender;
        this.password = password;
    }

    public Admin() {
    }



    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", status=" + status +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
