package com.drink.ko.impl.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니에 상품 추가
	public void insertCart(CartVO vo) {
		System.out.println("장바구니에 상품 추가: " + vo);
		mybatis.insert("CartDAO.insertCart", vo);
	}

	// 장바구니에서 상품 제거
	public void deleteCart(CartVO vo) {
		System.out.println("장바구니에서 상품 제거: " + vo);
		mybatis.delete("CartDAO.deleteCart", vo); 
	}

	// 장바구니 상품 수정
	public void updateCart(CartVO vo) {
		System.out.println("장바구니 정보 업데이트: " + vo);
		mybatis.update("CartDAO.updateCart", vo);
	}

	//장바구니 중복상품여부 조회 
	public CartVO selectCart(Map<String, String> params) {
		System.out.println("장바구니 조회할 상품번호 : " + params);
		return mybatis.selectOne("CartDAO.selectCount", params);
	}

	//장바구니 리스트 조회
	public List<CartVO> selectAllCarts(CartVO vo) {
		System.out.println("장바구니 리스트 조회: " + vo);
		return mybatis.selectList("CartDAO.selectAllCarts", vo);
	}

	public int selectQuantity(int productno) {
		System.out.println("장바구니 수량, 가격을 가져올 상품번호 : " + productno);
		return mybatis.selectOne("CartDAO.selectQuantity",productno);
	}
	
	public CartVO selectOrder(CartVO vo) {
		return mybatis.selectOne("CartDAO.selectOrder", vo);
	}
	
	public String orderNoCreate() {
		return mybatis.selectOne("CartDAO.orderNoCreate");
	}
	
	public int cartSelectCount(String u_id) {
		return mybatis.selectOne("CartDAO.cartSelectCount", u_id);
	}

}