package com.ithuangyonghua.test;

import org.junit.Test;

import com.ithaungyonghua.dao.UserDao;
import com.ithuangyonghua.entity.UserEntity;

public class UserDaoTest {
	//��½����
	@Test
	public void login(){
		UserDao userDao = new UserDao();
    	UserEntity userEntity = new UserEntity();
    	userEntity.setName("123");
    	userEntity.setPassword("123");
    	userDao.login(userEntity);
	}
	//ע�����
	@Test
	public void redist(){
		UserDao userDao = new UserDao();
    	UserEntity userEntity = new UserEntity();
    	userEntity.setName("1234");
    	userEntity.setPassword("1234");
    	userDao.insertUser(userEntity);
    	
	}
 
}
