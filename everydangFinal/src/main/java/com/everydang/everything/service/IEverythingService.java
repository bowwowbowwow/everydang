package com.everydang.everything.service;

import java.util.List;

import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;

public interface IEverythingService {
	/**
	 * 
	 * @return 전체 상품 정보 (ProductVO)
	 */
	public List<ProductVO> selectAllProduct();
	/**
	 * 
	 * @param code : 상품 코드 (PR_CODE)
	 * @return 단일 상품 정보 (ProductVO)
	 */
	public ProductVO selectProduct(String code);
	
	public List<OptionVO> selectAllOption(String prCode);

	public List<OptionVO> selectAllFile(String prCode);
	/**
	 * 
	 * @param memId : 회원 아이디 (mm_id)
	 * @return CartVO
	 */
	public CartVO selectAllCart(String memId,String prCode);
	
	public int insertCart(CartVO vo);
	
	
	public int updateCart(CartVO vo);
	
	public List<CartVO> selectAll();
	
	public List<CartVO> selectCartById(String memId);
	
	public CartVO selectCartByOption(String prCode, String crSelop);
	
	public String checkCart(String prCode, String selOp);
	
	public int deleteCartItem(String prCode, String crSelop);
}
