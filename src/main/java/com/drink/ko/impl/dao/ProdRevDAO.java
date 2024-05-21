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

	public List<ProdRevVO> myRevList(int u_no) {
		return mybatis.selectList("ProdRevDAO.myRevList", u_no);
	}

	public List<ProdRevVO> adminRevList(ProdRevVO vo) {
		return mybatis.selectList("ProdRevDAO.adminRevList", vo);
	}

	public int revTotalCnt(ProdRevVO vo) {
		return mybatis.selectOne("ProdRevDAO.revTotalCnt", vo);
	}

	public int prodRevDelete(ProdRevVO vo) {
		return mybatis.delete("ProdRevDAO.prodRevDelete", vo);
	}

	public ProdRevVO revDelSelect(ProdRevVO vo) {
		return mybatis.selectOne("ProdRevDAO.revDelSelect", vo);
	}

	public List<ProdRevVO> mainRevList(ProdRevVO vo) {
		return mybatis.selectList("ProdRevDAO.mainRevList", vo);
	}
}
