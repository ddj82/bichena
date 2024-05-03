package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.OrderVO;

@Repository
public class OrderDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<OrderVO> myOrderList(int u_no) {
		return mybatis.selectList("OrderDAO.myOrderList", u_no);
	}
	
	public OrderVO myOrderDetail(String o_no) {
		return mybatis.selectOne("OrderDAO.myOrderDetail", o_no);
	}
	
	public int orderRevchk(OrderVO vo) {
		return mybatis.update("OrderDAO.orderRevchk", vo);
	}
	
	public List<OrderVO> adminOrderList() {
		return mybatis.selectList("OrderDAO.adminOrderList");
	}
}
