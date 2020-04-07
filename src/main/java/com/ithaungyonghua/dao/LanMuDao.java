package com.ithaungyonghua.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ithuangyonghua.entity.LanMuEntity;
import com.ithuangyonghua.utils.DBUtils;
import com.mysql.fabric.xmlrpc.base.Array;

/**
 * 栏目DAO
 * 
 * @author Hyh
 *
 */
public class LanMuDao extends DBUtils {
	/**
	 * 栏目是否存在
	 * 
	 * @param name
	 * @return
	 */
	public boolean findByName(String name) {
		Connection connection = this.getConnection();
		if (connection == null) {
			return false;
		}
		String sql = "select * from lanmu where name = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { name };
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1,obj[i]);
			}
			ResultSet executeQuery = prepareStatement.executeQuery();
			if (executeQuery.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConnection(connection);
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	};

	/**
	 * 栏目添加
	 * 
	 * @param lanmu
	 * @return
	 */
	public int insertLanmu(LanMuEntity lanmu) {
		Connection connection = this.getConnection();
		if (connection == null) {
			return 0;
		}
		String sql = "insert into lanmu(name,createor,createDate) values (?,?,?) ";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { lanmu.getName(), lanmu.getCreator(), lanmu.getCreatorDate() };
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1, obj[i]);
			}
			int result = prepareStatement.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConnection(connection);
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
    /**
     * 返回查询所有栏目的ResultSet
     * @return
     */
	public List<LanMuEntity> findAll() {
		List<LanMuEntity> list = new ArrayList<LanMuEntity>();
		
		Connection connection = this.getConnection();
		if (connection == null) {
			return null;
		}
		String sql = "select * from lanmu";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
		    ResultSet rs = prepareStatement.executeQuery();
		    while (rs.next()) {
		    	LanMuEntity lm = new LanMuEntity();
		    	lm.setId(rs.getInt("id"));
		    	lm.setName(rs.getString("name"));
		    	lm.setCreator(rs.getString("createor"));
		    	lm.setCreatorDate(rs.getString("createDate"));
		    	list.add(lm);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		}
		return list;  

	}
	public List<LanMuEntity> findAllByName(String name) {
		List<LanMuEntity> list = new ArrayList<LanMuEntity>();
		
		Connection connection = this.getConnection();
		if (connection == null) {
			return null;
		}
		String sql = "select * from lanmu where name like ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { name };
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1, "%" + obj[i] +"%");
			}
		    ResultSet rs = prepareStatement.executeQuery();
		    while (rs.next()) {
		    	LanMuEntity lm = new LanMuEntity();
		    	lm.setId(rs.getInt("id"));
		    	lm.setName(rs.getString("name"));
		    	lm.setCreator(rs.getString("createor"));
		    	lm.setCreatorDate(rs.getString("createDate"));
		    	list.add(lm);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		}
		return list;  

	}
}
