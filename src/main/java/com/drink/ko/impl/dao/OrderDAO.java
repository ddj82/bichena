package com.drink.ko.impl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.OrderVO;
import com.drink.ko.vo.ProdVO;

@Repository
public class OrderDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<OrderVO> myOrderList(int u_no) {
		return mybatis.selectList("OrderDAO.myOrderList", u_no);
	}
	
	public List<OrderVO> myOrderConfirm(int u_no) {
		return mybatis.selectList("OrderDAO.myOrderConfirm", u_no);
	}
	
	public List<OrderVO> myOrderDetail(String o_no) {
		return mybatis.selectList("OrderDAO.myOrderDetail", o_no);
	}
	
	public List<OrderVO> myCancleList(int u_no) {
		return mybatis.selectList("OrderDAO.myCancleList", u_no);
	}
	
	public List<OrderVO> myCancleConfirm(int u_no) {
		return mybatis.selectList("OrderDAO.myCancleConfirm", u_no);
	}
	
	public int orderRevchk(OrderVO vo) {
		return mybatis.update("OrderDAO.orderRevchk", vo);
	}
	
	public int orderRevDelchk(OrderVO vo) {
		return mybatis.update("OrderDAO.orderRevDelchk", vo);
	}
	
	public List<OrderVO> adminOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.adminOrderList", vo);
	}
	
	public List<OrderVO> adminOrderRepeat(OrderVO vo) {
		return mybatis.selectList("OrderDAO.adminOrderRepeat", vo);
	}
	
	public OrderVO adminOrderDetail(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.adminOrderDetail", vo);
	}
	
	public List<OrderVO> myRevIstOrder(int u_no) {
		return mybatis.selectList("OrderDAO.myRevIstOrder", u_no);
	}
	
	// 전체 글 수 조회
	public int orderTotalCnt(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.orderTotalCnt", vo);
	}
	
	public int adminOrderRepeatCount(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.adminOrderRepeatCount", vo);
	}
	
	public int orderInsert(OrderVO vo) {
		String pno = vo.getP_no();
		String[] pnoArray = pno.split(","); //고른 제품 번호
		String pname = "";
			
		for (int i = 0; i < pnoArray.length; i++) {
			ProdVO pVO = new ProdVO();
			if (i == pnoArray.length -1) {
				pVO =  mybatis.selectOne("ProdDAO.prodOne", pnoArray[i]);
				pname += pVO.getP_name();
			} else {
				pVO =  mybatis.selectOne("ProdDAO.prodOne", pnoArray[i]);
				pname += pVO.getP_name();
				pname += ",";
			}
		}
		vo.setP_name(pname);
		return mybatis.insert("OrderDAO.insertOrder", vo);
	}
		
	public void orderDelete(String mid) {
		mybatis.update("OrderDAO.deleteOrder", mid);
	}
	
	public List<OrderVO> delOrderSelect(String mid) {
		return mybatis.selectList("OrderDAO.delOrderSelect", mid);
	}
	
	public List<OrderVO> chartResult(@Param("limit") int limit){
		System.out.println("DAO탔음" + limit);
		return mybatis.selectList("OrderDAO.chartResult" ,limit);
	}
}
