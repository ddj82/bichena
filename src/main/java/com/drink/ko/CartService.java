package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.CartVO;


public interface CartService {

	public void insertCart(CartVO vo);

	public void deleteCart(CartVO vo);

	public void updateCart(CartVO vo);

	public CartVO selectCart(int productno);
	
	public List<CartVO> selectList(CartVO vo);
	
	public CartVO selectOrder(CartVO vo);
	
	String orderNoCreate(); //주문번호생성
	
	int cartSelectCount(String u_id);
}
