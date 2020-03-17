package com.ithaungyonghua.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ithuangyonghua.entity.UserEntity;
import com.ithuangyonghua.utils.DBUtils;

public class UserDao extends DBUtils{
   
	 //查询用户是否存在
	  public void userExits(UserEntity user){
		  //第一步连接数据库
		  Connection connection = this.getConnection();
		  if(connection==null){
			  throw new RuntimeException("数据库连接失败");
		  }
		  String sql ="select * from user where name=? and passwrod =?";
		  PreparedStatement prepareStatement =null;
		  Object[] obj = new Object[]{user.getName(),user.getPassword()};
		  try {
			  prepareStatement = connection.prepareStatement(sql);
			  for (int i = 0; i < obj.length; i++) {
				  prepareStatement.setObject(i+1, obj[i]);
			}
			ResultSet executeQuery = prepareStatement.executeQuery();
			if(executeQuery.next()){
				System.out.println("用户存在");
			}else{
				System.out.println("用户不存在");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			this.closeConnection(connection);
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	  }
}
