package cn.gok.secondMarket.dao.Imp;

import cn.gok.secondMarket.bean.Admin;
import cn.gok.secondMarket.dao.AdminDao;
import cn.gok.secondMarket.utils.DBUtil;

public class AdminDaoImp implements AdminDao {
    @Override
    public Admin loginAdmin(String phone, String pwd) {
        String sql = "select * from t_admin where phone = ? and password = ?";
        Admin admin = DBUtil.queryForObject(sql, Admin.class, phone, pwd);
        return admin;
    }
}
