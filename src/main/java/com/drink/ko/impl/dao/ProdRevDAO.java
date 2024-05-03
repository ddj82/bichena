package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.ProdRevVO;

@Repository
public class ProdRevDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProdRevVO> prodOneRev(String p_no) {
		return mybatis.selectList("ProdRevDAO.prodOneRev", p_no);
	}
	
	public int prodRevInsert(ProdRevVO vo) {
		return mybatis.insert("ProdRevDAO.prodRevInsert", vo);
	}
}
