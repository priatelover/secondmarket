package cn.gok.secondMarket.dao;

import cn.gok.secondMarket.bean.Admin;

public interface AdminDao {
    Admin loginAdmin(String phone, String pwd);
}
