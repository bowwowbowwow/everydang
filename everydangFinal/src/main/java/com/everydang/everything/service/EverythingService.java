package com.everydang.everything.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everydang.everything.dao.EverythingDAO;
import com.everydang.everything.dao.IEverythingDAO;
import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;

public class EverythingService implements IEverythingService{
	// dao instance
	public IEverythingDAO dao;
	// Singleton
	private static EverythingService service;
	
	public static EverythingService getInstance() {
		if(service == null) service = new EverythingService();
		
		return service;
	}
	// Constructor
	public EverythingService() {
		dao = EverythingDAO.getInstance();
	}
	
	@Override
	public List<ProductVO> selectAllProduct() {
		return dao.selectAllProduct();
	}
	
	@Override
	public ProductVO selectProduct(String code) {
		return dao.selectProduct(code);
	}
	@Override
	public List<OptionVO> selectAllOption(String prCode) {
		return dao.selectAllOption(prCode);
	}

	@Override
	public List<OptionVO> selectAllFile(String prCode) {
		return dao.selectAllFile(prCode);
	}
	@Override
	public CartVO selectAllCart(String memId, String prCode) {
		// TODO Auto-generated method stub
		return dao.selectAllCart(memId,prCode);
	}
	@Override
	public int insertCart(CartVO vo) {
		return dao.insertCart(vo);
	}
	
	@Override
	public String checkCart(String prCode, String selOp) {
		return dao.checkCart(prCode,selOp);
	}
	@Override
	public int updateCart(CartVO vo) {
		return dao.updateCart(vo);
	}
	@Override
	public List<CartVO> selectAll() {
		return dao.selectAll();
	}
	@Override
	public List<CartVO> selectCartById(String memId) {
		return dao.selectCartById(memId);
	}
	@Override
	public CartVO selectCartByOption(String prCode, String crSelop) {
		return dao.selectCartByOption(prCode, crSelop);
	}
	@Override
	public int deleteCartItem(String prCode, String crSelop) {
		return dao.deleteCartItem(prCode, crSelop);
	}
}
