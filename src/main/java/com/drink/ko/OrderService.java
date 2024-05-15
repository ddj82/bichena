package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.OrderVO;

public interface OrderService {
	List<OrderVO> myOrderList(int u_no);
	OrderVO myOrderDetail(String o_no);
	int orderRevchk(OrderVO vo);
	int orderRevDelchk(String o_no);
	List<OrderVO> adminOrderList(OrderVO vo);
	List<OrderVO> myRevIstOrder(int u_no);
	int orderTotalCnt(OrderVO vo);// 전체 글 수 조회
	int orderInsert(OrderVO vo);
	void orderDelete(String mid);
}
