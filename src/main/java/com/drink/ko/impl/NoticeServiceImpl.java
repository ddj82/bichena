package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.NoticeService;
import com.drink.ko.impl.dao.NoticeDAO;
import com.drink.ko.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	// 글 등록
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDAO.insertNotice(vo);
	}

	// 글 수정
	public int updateNotice(NoticeVO vo) {
		return noticeDAO.updateNotice(vo);
	}

	// 글 삭제
	public int deleteNotice(NoticeVO vo) {
		return noticeDAO.deleteNotice(vo);
	}

	// 글상세 조회
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	// 글목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	// 페이징 처리된 글 목록 조회
	@Override
	public List<NoticeVO> noticeListPaging(NoticeVO vo) {
		int startList = vo.getStartList(); // 시작 목록 인덱스
		int sizePerPage = vo.getSizePerPage(); // 페이지 당 항목 수
		return noticeDAO.noticeListPaging(vo);
	}

	// 전체 글 수 조회
	@Override
	public int noticeTotalCnt(NoticeVO vo) {
		int startList = vo.getStartList(); // 시작 목록 인덱스
		int sizePerPage = vo.getSizePerPage(); // 페이지 당 항목 수
		return noticeDAO.getCount(vo);
	}
}
