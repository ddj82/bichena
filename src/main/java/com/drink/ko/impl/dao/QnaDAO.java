package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.QnaVO;

@Repository
public class QnaDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<QnaVO> qnaList(QnaVO vo) {
		return mybatis.selectList("QnaDAO.qnaList", vo);
	}
	
	public List<QnaVO> qnaListMy(QnaVO vo) {
		return mybatis.selectList("QnaDAO.qnaListMy", vo);
	}
	
	public int qnaTotalCnt(QnaVO vo) {
		return mybatis.selectOne("QnaDAO.qnaTotalCnt", vo);
	}
	
	public int qnaMyTotalCnt(QnaVO vo) {
		return mybatis.selectOne("QnaDAO.qnaMyTotalCnt", vo);
	}

	public QnaVO qnaView(String q_no) {
		return mybatis.selectOne("QnaDAO.qnaView", q_no);
	}
	
	public int qnaAcontent(QnaVO vo) {
		return mybatis.update("QnaDAO.qnaAcontent", vo);
	}
	
	public int qnaState(QnaVO vo) {
		return mybatis.update("QnaDAO.qnaState", vo);
	}
	
	public int qnaDelete(String q_no) {
		return mybatis.update("QnaDAO.qnaDelete", q_no);
	}
	
	public int qnaInsert(QnaVO vo) {
		return mybatis.insert("QnaDAO.qnaInsert", vo);
	}
	
}
