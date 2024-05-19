package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.QnaService;
import com.drink.ko.impl.dao.QnaDAO;
import com.drink.ko.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDAO dao;

	@Override
	public List<QnaVO> qnaList(QnaVO vo) {
		return dao.qnaList(vo);
	}

	@Override
	public List<QnaVO> qnaListMy(QnaVO vo) {
		return dao.qnaListMy(vo);
	}

	@Override
	public int qnaTotalCnt(QnaVO vo) {
		return dao.qnaTotalCnt(vo);
	}
	
	@Override
	public int qnaMyTotalCnt(QnaVO vo) {
		return dao.qnaMyTotalCnt(vo);
	}

	@Override
	public QnaVO qnaView(String q_no) {
		return dao.qnaView(q_no);
	}

	@Override
	public int qnaAcontent(QnaVO vo) {
		return dao.qnaAcontent(vo);
	}
	
	@Override
	public int qnaState(QnaVO vo) {
		return dao.qnaState(vo);
	}

	@Override
	public int qnaDelete(String q_no) {
		return dao.qnaDelete(q_no);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		return dao.qnaInsert(vo);
	}


	
}
