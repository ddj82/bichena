package com.drink.ko.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.ProdVO;

@Repository
public class ProdDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public ProdVO prodOne(String pno) {
		return mybatis.selectOne("ProdDAO.prodOne", pno);
	}
	
	public List<ProdVO> prodList() {
		return mybatis.selectList("ProdDAO.prodList");
	}
	
}
