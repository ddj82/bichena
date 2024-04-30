package com.drink.ko.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.ProdRevVO;

@Repository
public class ProdRevDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProdRevVO> prodOneRev(String pno) {
		return mybatis.selectList("ProdRevDAO.prodOneRev", pno);
	}
}
