package cn.gok.secondMarket.dao;

import cn.gok.secondMarket.bean.User;

import java.util.List;

public interface UserDao {
    List<User> selectUsers();
    List<User> selectUsersByInput(String name,String phone,String gender);
    boolean deleteUserById(Integer id);
    Integer updateUserStatus(String status, String id);
    boolean selectByPhone(String phone);
    Integer insertNewUser(String phone,String pwd);
    User loginUser(String phone,String pwd);
}
