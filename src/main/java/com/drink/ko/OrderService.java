package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.OrderVO;

public interface OrderService {
	List<OrderVO> myOrderList(int u_no);
	OrderVO myOrderDetail(String o_no);
	int orderRevchk(OrderVO vo);
	List<OrderVO> adminOrderList();
}
