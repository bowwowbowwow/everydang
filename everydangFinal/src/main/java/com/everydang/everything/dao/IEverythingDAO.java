package com.everydang.everything.dao;

import java.util.List;
import java.util.Map;

import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;

public interface IEverythingDAO {
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
	public CartVO selectAllCart(String memId, String prCode);
	
	/**
	 * 장바구니 추가 메서드 
	 * @param vo
	 * @return int 1: 성공 0: 실패 
	 */
	public int insertCart(CartVO vo);
	
	/**
	 * 장바구니에 상품을 넣어놨는지 ? 
	 * @param prCode
	 * @return String: 아이디 반환 => 있다면 update/ 없다면 
	 */
	public String checkCart(String prCode, String selOp);
	
	public int updateCart(CartVO vo);
	/**
	 * 모든 장바구니 정보 
	 * @return
	 */
	public List<CartVO> selectAll();
	
	public List<CartVO> selectCartById(String memId);
	
	/**
	 * 상품 이름과 옵션 이름을 사용해 장바구니 내에 해당 옵션을 가진 장바구니가 있는지 검사
	 */
	public CartVO selectCartByOption(String prCode, String crSelop);
	/**
	 * 상품코드로 상품 삭제 
	 * @param prCode
	 * @param crSelop 
	 * @return
	 */
	public int deleteCartItem(String prCode, String crSelop);
}
