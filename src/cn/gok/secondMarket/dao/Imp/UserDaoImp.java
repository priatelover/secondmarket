package cn.gok.secondMarket.dao.Imp;

import cn.gok.secondMarket.bean.User;
import cn.gok.secondMarket.dao.UserDao;
import cn.gok.secondMarket.utils.DBUtil;
import com.mysql.cj.util.StringUtils;

import java.util.List;

public class UserDaoImp implements UserDao {
    @Override
    public List<User> selectUsers() {
        String sql = "select * from t_user";
        return DBUtil.queryAll(sql, User.class);
    }

    @Override
    public List<User> selectUsersByInput(String name, String phone, String gender) {
        StringBuilder stringBuilder = new StringBuilder("select * from t_user where 1=1");
        if (!StringUtils.isNullOrEmpty(name)) {
            stringBuilder.append(" and username like '%").append(name).append("%'");
        }
        if (!StringUtils.isNullOrEmpty(phone)) {
            stringBuilder.append(" and phone like '%").append(phone).append("%'");
        }
        if (!StringUtils.isNullOrEmpty(gender)) {
            stringBuilder.append(" and gender =").append(gender);
        }
        return DBUtil.queryAll(stringBuilder.toString(), User.class);
    }

    @Override
    public boolean deleteUserById(Integer id) {
        String sql = "delete from t_user where userId =?";
        int i = DBUtil.update(sql, id);
        return i > 0 ? true : false;
    }

    @Override
    public Integer updateUserStatus(String status, String id) {
        String sql = "update t_user set status=? where userId=?";
        int update = DBUtil.update(sql, status, id);
        return update;
    }

    @Override
    public boolean selectByPhone(String phone) {
        String sql = "select * from t_user where phone=?";
        User user = DBUtil.queryForObject(sql, User.class, phone);
        return user == null ? true : false;
    }

    @Override
    public Integer insertNewUser(String phone, String pwd) {
        String sql = "insert into t_user(phone,password) values(?,?)";
        int update = DBUtil.update(sql, phone, pwd);
        return update;
    }

    @Override
    public User loginUser(String phone, String pwd) {
        String sql ="select * from t_user where phone = ? and password = ?";
        User user = DBUtil.queryForObject(sql, User.class, phone, pwd);
        return user;
    }
}
