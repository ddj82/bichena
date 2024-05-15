package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.OrderService;
import com.drink.ko.impl.dao.OrderDAO;
import com.drink.ko.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO dao;

	@Override
	public List<OrderVO> myOrderList(int u_no) {
		return dao.myOrderList(u_no);
	}

	@Override
	public OrderVO myOrderDetail(String o_no) {
		return dao.myOrderDetail(o_no);
	}

	@Override
	public int orderRevchk(OrderVO vo) {
		return dao.orderRevchk(vo);
	}

	@Override
	public int orderRevDelchk(String o_no) {
		return dao.orderRevDelchk(o_no);
	}

	@Override
	public List<OrderVO> adminOrderList(OrderVO vo) {
		return dao.adminOrderList(vo);
	
	}

	// 페이징 처리된 글 목록 조회
	@Override
	public List<OrderVO> myRevIstOrder(int u_no) {
		return dao.myRevIstOrder(u_no);
	}

	// 전체 글 수 조회
	@Override
	public int orderTotalCnt(OrderVO vo) {
		return dao.orderTotalCnt(vo);
	}

	@Override
	public int orderInsert(OrderVO vo) {
		return dao.orderInsert(vo);
	}
		
	@Override
	public void orderDelete(String mid) {
		dao.orderDelete(mid);
	}

}
