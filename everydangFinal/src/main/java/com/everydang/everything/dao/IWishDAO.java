package com.everydang.everything.dao;

import java.util.List;

import com.everydang.vo.CartVO;
import com.everydang.vo.WishVO;

public interface IWishDAO {
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

	public List<WishVO> selectAllWish(String memId);
	
	public int insertWish(WishVO vo);
	
	public int deleteWish(String memId, String prCode);
	
}
