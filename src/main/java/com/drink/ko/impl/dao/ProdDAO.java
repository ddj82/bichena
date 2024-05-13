package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.ProdVO;


@Repository
public class ProdDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public ProdVO prodOne(String p_no) {
		return mybatis.selectOne("ProdDAO.prodOne", p_no);
	}
	
	public List<ProdVO> prodList() {
		return mybatis.selectList("ProdDAO.prodListUser");
	}
	
	public List<ProdVO> prodList(ProdVO vo) {
		return mybatis.selectList("ProdDAO.prodList", vo);
	}
	
	public int prodTotalCnt(ProdVO vo) {
		return mybatis.selectOne("ProdDAO.prodTotalCnt", vo);
	}
	
	
	
	public int getPnoMaxNum() {
		return mybatis.selectOne("ProdDAO.getPnoMaxNum");
	}
	
	public int insertProduct(ProdVO vo) {
		return mybatis.insert("ProdDAO.insertProduct", vo);
	}
	public int updateProduct(ProdVO vo) { //셀렉트 치고 수정버튼 누르면 올 것
		return mybatis.update("ProdDAO.updateProduct", vo);
	}
	
}
