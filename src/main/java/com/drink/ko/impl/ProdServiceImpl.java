package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.ProdService;
import com.drink.ko.ProdVO;

@Service
public class ProdServiceImpl implements ProdService {
	@Autowired
	ProdDAO dao;

	@Override
	public ProdVO prodOne(String pno) {
		return dao.prodOne(pno);
	}

	@Override
	public List<ProdVO> prodList() {
		return dao.prodList();
	}
	
}
