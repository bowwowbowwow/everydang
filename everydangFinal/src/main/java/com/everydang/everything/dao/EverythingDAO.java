package com.everydang.everything.dao;

import java.security.interfaces.RSAKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;

public class EverythingDAO implements IEverythingDAO {
	// Singleton
	private static IEverythingDAO dao;
	
	public static IEverythingDAO getInstance() {
		if(dao == null) dao = new EverythingDAO();
		
		return dao;
	}
	
	@Override
	public List<ProductVO> selectAllProduct() {
		List<ProductVO> list = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			list = session.selectList("everything.selectAllProduct");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public ProductVO selectProduct(String code) {
		ProductVO vo = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			vo = session.selectOne("everything.selectProduct", code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}

	@Override
	public List<OptionVO> selectAllOption(String prCode) {
		List<OptionVO> optionList = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		try {
			optionList = session.selectList("everything.selectAllOption", prCode);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return optionList;
	}
	
	@Override
	public List<OptionVO> selectAllFile(String prCode) {
		List<OptionVO> fileList = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		try {
			fileList = session.selectList("everything.selectAllFile", prCode);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return fileList;
	}
	// 장바구니 정보 가져오기 
	@Override
	public CartVO selectAllCart(String memId,String prCode) {
		CartVO vo = null;
		Map<String, Object> map = new HashMap<>();
		map.put("mm_id", memId);
		map.put("pr_code", prCode);
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		try {
			vo = session.selectOne("everything.selectAllCart", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}
	// 장바구니 넣기 
	@Override
	public int insertCart(CartVO vo) {
		int res = 0;
		SqlSession session= MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			res = session.insert("everything.insertCart",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	

	@Override
	public int updateCart(CartVO vo) {
		int res = 0; 
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
					 
			res = session.update("everything.updateCart",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	public List<CartVO> selectAll() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		List<CartVO> list = session.selectList("everything.selectAll");
		
		if(session!=null) session.close();
		
		return list;
	}

	@Override
	public List<CartVO> selectCartById(String memId) {
		List<CartVO> cartList = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		try {
			cartList = session.selectList("everything.selectCartById", memId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cartList;
	}

	@Override
	public CartVO selectCartByOption(String prCode, String crSelop) {
		CartVO vo = null;
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		
		try {
			Map<String , Object> map = new HashMap<>();
			map.put("pr_code",prCode);
			map.put("cr_selop",crSelop);
			
			vo = session.selectOne("everything.selectCartByOption",map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return vo;
	}

	@Override
	public String checkCart(String prCode, String selOp) {
		String memId = null;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();

		try {
			Map<String, Object> map = new HashMap<>();
			map.put("pr_code", prCode);
			map.put("cr_selop", selOp);
			
			memId = session.selectOne("everything.checkCart",map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return memId;
	}

	@Override
	public int deleteCartItem(String prCode, String crSelop) {
		int res = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("pr_code", prCode);
		map.put("cr_selop", crSelop);
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		try {
			res = session.delete("everything.deleteCartItem",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		
		return res;
	}
	
}
