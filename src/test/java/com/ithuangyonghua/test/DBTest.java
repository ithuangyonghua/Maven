package com.ithuangyonghua.test;

import com.ithuangyonghua.utils.DBUtils;
//测试数据库是否连接成功
public class DBTest {
	public static void main(String[] args) {
		new DBUtils().getConnection();
	}
}
