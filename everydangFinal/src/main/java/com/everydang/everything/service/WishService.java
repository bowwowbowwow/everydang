package com.everydang.everything.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everydang.everything.dao.IWishDAO;
import com.everydang.everything.dao.WishDAO;
import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CartVO;
import com.everydang.vo.WishVO;

public class WishService implements IWishService {
	// dao instance 
	public IWishDAO dao;
	
	//Singleton 
	private static WishService service;
	
	public static WishService getInstance() {
		if(service == null) service = new WishService();
		
		return service;
	}
	// Constructor 
	public WishService() {
		dao = WishDAO.getInstance();
	}
	
	
	@Override
	public int updateWish(CartVO vo) {
		return dao.updateWish(vo);
	}

	@Override
	public WishVO selectWish(String mmId, String prCode) {
		return dao.selectWish(mmId, prCode);
	}
	
	public int insertWish(WishVO vo) {
		return dao.insertWish(vo);
	}
	@Override
	public int deleteWish(String memId, String prCode) {
		return dao.deleteWish(memId, prCode);
	}
	@Override
	public List<WishVO> selectAllWish(String mmId) {
		return dao.selectAllWish(mmId);
	}
}
