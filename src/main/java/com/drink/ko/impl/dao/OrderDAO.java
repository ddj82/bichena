package com.drink.ko.impl.dao;

import java.util.List;

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
	
	public OrderVO myOrderDetail(String o_no) {
		return mybatis.selectOne("OrderDAO.myOrderDetail", o_no);
	}
	
	public int orderRevchk(OrderVO vo) {
		return mybatis.update("OrderDAO.orderRevchk", vo);
	}
	
	public List<OrderVO> adminOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.adminOrderList", vo);
	}
	
	public List<OrderVO> myRevIstOrder(int u_no) {
		return mybatis.selectList("OrderDAO.myRevIstOrder", u_no);
	}
	
	// 전체 글 수 조회
	public int orderTotalCnt(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.orderTotalCnt", vo);
	}
	
	public int orderInsert(OrderVO vo) {
		String pno = vo.getP_no();
		String[] pnoArray = pno.split(","); //고른 제품 번호
		String pname = "";
		String stock = "";
			
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
		mybatis.delete("OrderDAO.deleteOrder", mid);
	}
}
