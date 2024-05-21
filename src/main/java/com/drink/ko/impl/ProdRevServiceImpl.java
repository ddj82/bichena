package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.ProdRevService;
import com.drink.ko.impl.dao.ProdRevDAO;
import com.drink.ko.vo.ProdRevVO;

@Service
public class ProdRevServiceImpl implements ProdRevService {
	@Autowired
	private ProdRevDAO dao;

	@Override
	public List<ProdRevVO> prodOneRev(String p_no) {
		return dao.prodOneRev(p_no);
	}

	@Override
	public int prodRevInsert(ProdRevVO vo) {
		return dao.prodRevInsert(vo);
	}

	@Override
	public List<ProdRevVO> myRevList(int u_no) {
		return dao.myRevList(u_no);
	}

	@Override
	public List<ProdRevVO> adminRevList(ProdRevVO vo) {
		return dao.adminRevList(vo);
	}

	@Override
	public int revTotalCnt(ProdRevVO vo) {
		return dao.revTotalCnt(vo);
	}

	@Override
	public int prodRevDelete(ProdRevVO vo) {
		return dao.prodRevDelete(vo);
	}

	@Override
	public ProdRevVO revDelSelect(ProdRevVO vo) {
		return dao.revDelSelect(vo);
	}

	@Override
	public List<ProdRevVO> mainRevList(ProdRevVO vo) {
		return dao.mainRevList(vo);
	}
}
