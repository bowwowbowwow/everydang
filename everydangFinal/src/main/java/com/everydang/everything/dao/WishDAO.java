package com.everydang.everything.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CartVO;
import com.everydang.vo.WishVO;


public class WishDAO implements IWishDAO {
	//Singleton
	private static IWishDAO dao;
	
	public static IWishDAO getInstance() {
		if(dao == null) dao = new WishDAO();
		
		return dao;
	}
	
	
	
	@Override
	public int updateWish(CartVO vo) {
		int res = 0;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.update("wish.updateWish",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public WishVO selectWish(String mmId, String prCode) {
		WishVO vo = null;
		Map<String, Object> map = new HashMap<>();
		map.put("mm_id", mmId);
		map.put("pr_code", prCode);
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			vo = session.selectOne("wish.selectWish",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}
	
	public int insertWish(WishVO vo) {
		int res = 0;
		SqlSession session= MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.insert("wish.insertWish",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}



	@Override
	public int deleteWish(String memId, String prCode) {
		int res = 0;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		Map<String, Object> map = new HashMap<>();
		map.put("mm_id", memId);
		map.put("pr_code", prCode);
		
		try {
			res = session.delete("wish.deleteWish", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}


	@Override
	public List<WishVO> selectAllWish(String memId) {
		List<WishVO> list = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			list = session.selectList("wish.selectAllWish",memId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return list;
	}
}
