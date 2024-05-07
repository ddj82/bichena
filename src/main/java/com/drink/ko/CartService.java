package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.CartVO;


public interface CartService {

	public void insertCart(CartVO vo);

	public void deleteCart(CartVO vo);

	public void updateCart(CartVO vo);

//	public int selectCart(int productno);
	public CartVO selectCart(int productno);
	
	public List<CartVO> selectList(CartVO vo);
}
