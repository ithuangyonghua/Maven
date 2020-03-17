package com.ithuangyonghua.test;

import com.ithaungyonghua.dao.UserDao;
import com.ithuangyonghua.entity.UserEntity;

public class UserDaoTest {
    public static void main(String[] args) {
    	UserDao userDao = new UserDao();
    	UserEntity userEntity = new UserEntity();
    	userEntity.setName("123");
    	userEntity.setPassword("123");
    	userDao.userExits(userEntity);
	}
}
