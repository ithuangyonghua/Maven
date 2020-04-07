package com.ithaungyonghua.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ithuangyonghua.entity.UserEntity;
import com.ithuangyonghua.utils.DBUtils;
/**
 * 用户Dao
 * @author Hyh
 *
 */
public class UserDao extends DBUtils {

	// 查询用户已注册
	public boolean userExitsByName(UserEntity user) {
		// 第一步连接数据库
		Connection connection = this.getConnection();
		if (connection == null) {
			throw new RuntimeException("数据库连接失败");
		}
		String sql = "select * from user where name = ?";
		PreparedStatement prepareStatement = null;
		Object[] obj = new Object[] { user.getName() };
		try {
			prepareStatement = connection.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1, obj[i]);
			}
			ResultSet executeQuery = prepareStatement.executeQuery();
			if (executeQuery.next()) {
				// System.out.println("用户存在");
				return true;
			} else {
				// System.out.print ln("用户不存在");
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			this.closeConnection(connection);
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	    // 查询用户存在
		public boolean login(UserEntity user) {
			// 第一步连接数据库
			Connection connection = this.getConnection();
			if (connection == null) {
				throw new RuntimeException("数据库连接失败");
			}
			 String sql ="select * from user where name=? and passwrod =?";
			PreparedStatement prepareStatement = null;
			Object[] obj = new Object[] { user.getName(),user.getPassword()};
			try {
				prepareStatement = connection.prepareStatement(sql);
				for (int i = 0; i < obj.length; i++) {
					prepareStatement.setObject(i + 1, obj[i]);
				}
				ResultSet executeQuery = prepareStatement.executeQuery();
				if (executeQuery.next()) {
					// System.out.println("用户存在");
					return true;
				} else {
					// System.out.print ln("用户不存在");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			} finally {
				this.closeConnection(connection);
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	// 注册功能
	public int insertUser(UserEntity user) {
		Connection connection = this.getConnection();
		if (connection == null) {
			throw new RuntimeException("数据库连接失败");
		}
		PreparedStatement prepareStatement = null;
		Object[] obj = new Object[] { user.getName(), user.getPassword(),user.getXingbie(),user.getZhuanye(),user.getXingqu(),user.getJianjie()};
		if (!userExitsByName(user)) {
			String sql = "insert into user(name,passwrod,xingbie,zhuanye,xingqu,jianjie) values (?,?,?,?,?,?)";
			try {
				prepareStatement = connection.prepareStatement(sql);
				for (int i = 0; i < obj.length; i++) {
					prepareStatement.setObject(i + 1, obj[i]);
				}
				int insertResult = prepareStatement.executeUpdate();
				return insertResult;
			} catch (SQLException e) {
				e.printStackTrace();
				return 0;
			}
		} else {
			return 0;
		}

	}

}
