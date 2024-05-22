package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.OrderVO;

public interface OrderService {
	List<OrderVO> myOrderList(int u_no);
	List<OrderVO> myOrderConfirm(int u_no);
	List<OrderVO> myOrderDetail(String o_no);
	List<OrderVO> myCancleList(int u_no);
	List<OrderVO> myCancleConfirm(int u_no);
	int orderRevchk(OrderVO vo);
	int orderRevDelchk(OrderVO vo);
	List<OrderVO> adminOrderList(OrderVO vo);
	List<OrderVO> adminOrderRepeat(OrderVO vo);
	List<OrderVO> myRevIstOrder(int u_no);
	OrderVO adminOrderDetail(OrderVO vo);
	int orderTotalCnt(OrderVO vo);// 전체 글 수 조회
	int orderInsert(OrderVO vo);
	void orderDelete(String mid);
	List<OrderVO> delOrderSelect(String mid);
	List<OrderVO> chartResult(int limit);
	int adminOrderRepeatCount(OrderVO vo);
}
