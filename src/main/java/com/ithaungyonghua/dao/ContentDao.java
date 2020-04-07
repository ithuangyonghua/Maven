package com.ithaungyonghua.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ithuangyonghua.entity.ContentEntity;
import com.ithuangyonghua.entity.LanMuEntity;
import com.ithuangyonghua.utils.DBUtils;

/**
 * 内容Dao
 * 
 * @author Hyh
 *
 */
public class ContentDao extends DBUtils {
	/**
	 * 内容是否存在
	 * 
	 * @param name
	 * @return
	 */
	public boolean findByName(String name) {
		Connection connection = this.getConnection();
		if (connection == null) {
			return false;
		}
		String sql = "select * from content where name = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { name };
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1, obj[i]);
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
	 * 内容添加
	 * 
	 * @param lanmu
	 * @return
	 */
	public int insertContentEntity(ContentEntity coneitity) {
		Connection connection = this.getConnection();
		if (connection == null) {
			return 0;
		}
		String sql = "insert into content(name,keyword,titlename,creator,writedate,jianjie,content) values (?,?,?,?,?,?,?) ";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { coneitity.getName(), coneitity.getKeyword(), coneitity.getTitlename(),
					coneitity.getCreator(), coneitity.getWriteDate(), coneitity.getJianjie(), coneitity.getContent() };
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
     * 返回查询所有内容
     * @return
     */
	public List<ContentEntity> findAll() {
		List<ContentEntity> list = new ArrayList<ContentEntity>();
		
		Connection connection = this.getConnection();
		if (connection == null) {
			return null;
		}
		String sql = "select * from content";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
		    ResultSet rs = prepareStatement.executeQuery();
		    while (rs.next()) {
		    	ContentEntity contentEntity = new ContentEntity();
		    	contentEntity.setId(rs.getInt("id"));
		    	contentEntity.setName(rs.getString("name"));
		    	contentEntity.setKeyword(rs.getString("keyword"));
		    	contentEntity.setTitlename(rs.getString("titlename"));
		    	contentEntity.setCreator(rs.getString("creator"));
		    	contentEntity.setWriteDate(rs.getString("writedate"));
		    	contentEntity.setJianjie(rs.getString("jianjie"));
		    	contentEntity.setContent(rs.getString("content"));
		    	list.add(contentEntity);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		}
		return list;  

	}
	public List<ContentEntity> findNameAndTitlename(String newsname,String titlename) {
		List<ContentEntity> list = new ArrayList<ContentEntity>();
		
		Connection connection = this.getConnection();
		if (connection == null) {
			return null;
		}
		String sql = "select * from content where name like ? and titlename like ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			Object[] obj = new Object[] { newsname, titlename};
			for (int i = 0; i < obj.length; i++) {
				prepareStatement.setObject(i + 1, "%" + obj[i] +"%");
			}
		    ResultSet rs = prepareStatement.executeQuery();
		    while (rs.next()) {
		    	ContentEntity contentEntity = new ContentEntity();
		    	contentEntity.setId(rs.getInt("id"));
		    	contentEntity.setName(rs.getString("name"));
		    	contentEntity.setKeyword(rs.getString("keyword"));
		    	contentEntity.setTitlename(rs.getString("titlename"));
		    	contentEntity.setCreator(rs.getString("creator"));
		    	contentEntity.setWriteDate(rs.getString("writedate"));
		    	contentEntity.setJianjie(rs.getString("jianjie"));
		    	contentEntity.setContent(rs.getString("content"));
		    	list.add(contentEntity);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		}
		return list;  

	}
}
