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
		return mybatis.selectList("ProdDAO.prodList");
	}
	
	public int adminProdInsert(ProdVO vo) {
		return mybatis.insert("ProdDAO.adminProdInsert", vo);
	}
	
}
