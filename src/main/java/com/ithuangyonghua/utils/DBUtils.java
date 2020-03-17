package com.ithuangyonghua.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtils {
//	private static String Driver = "com.mysql.jdbc.Driver";
//	private static String DBurl ="jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
//	private static String user ="root";
//	private static String passward= "123";
	private static String Driver  ;
	private static String DBurl;
	private static String user ;
	private static String passward;

	// 连接驱动
	static {
		InputStream resourceAsStream = DBUtils.class.getResourceAsStream("/db.properites");
		Properties properties = new Properties();
		try {
			properties.load(resourceAsStream);
			Driver = properties.getProperty("Driver");
			DBurl = properties.getProperty("DBurl");
			user = properties.getProperty("user");
			passward = properties.getProperty("passward");
			Class.forName(Driver);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(DBurl, user, passward);
			System.out.println("数据库连接成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	public void closeConnection(Connection coll){
		if(coll !=null){
			try {
				coll.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

}
