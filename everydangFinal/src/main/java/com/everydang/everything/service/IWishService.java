package com.everydang.everything.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CartVO;
import com.everydang.vo.WishVO;

public interface IWishService {
	/**
	 * 위시리스트 값 바꾸기 
	 * @param vo
	 * @return
	 */
	public int updateWish(CartVO vo);
	
	/**
	 * 위시리스트 값 (1,0) 가져오기 
	 * @param mmId
	 * @param prCode
	 * @return
	 */
	public WishVO selectWish(String mmId, String prCode);
	
	/**
	 * 특정 사용자의 위시리스트 가져오기  
	 * @param mmId
	 * @return
	 */
	public List<WishVO> selectAllWish(String mmId);
	
	public int insertWish(WishVO vo) ;
	
	public int deleteWish(String memId, String prCode);
	
	
}
