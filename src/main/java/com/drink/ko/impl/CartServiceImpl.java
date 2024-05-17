package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.CartService;
import com.drink.ko.impl.dao.CartDAO;
import com.drink.ko.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public void insertCart(CartVO vo) {
		cartDAO.insertCart(vo);
	}

	@Override
	public void deleteCart(CartVO vo) {
		cartDAO.deleteCart(vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		cartDAO.updateCart(vo);
	}

	@Override
	public CartVO selectCart(int productno) {
		return cartDAO.selectCart(productno);
	}
//	@Override
//	public int selectCart(int productno) {
//		return cartDAO.selectCart(productno);
//	}

	@Override
	public List<CartVO> selectList(CartVO vo) {
		return cartDAO.selectAllCarts(vo);
	}
	
	@Override
	public CartVO selectOrder(CartVO vo) {
		return cartDAO.selectOrder(vo);
	}

	@Override
	public String orderNoCreate() {
		return cartDAO.orderNoCreate();
	}

	@Override
	public int cartSelectCount(String u_id) {
		return cartDAO.cartSelectCount(u_id);
	}

}
