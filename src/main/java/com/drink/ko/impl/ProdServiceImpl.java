package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.ProdService;
import com.drink.ko.impl.dao.ProdDAO;
import com.drink.ko.vo.ProdVO;

@Service
public class ProdServiceImpl implements ProdService {
	@Autowired
	private ProdDAO dao;

	@Override
	public ProdVO prodOne(String p_no) {
		return dao.prodOne(p_no);
	}

	@Override
	public List<ProdVO> prodList() {
		return dao.prodList();
	}

	@Override
	public int adminProdInsert(ProdVO vo) {
		return dao.adminProdInsert(vo);
	}
	
}
