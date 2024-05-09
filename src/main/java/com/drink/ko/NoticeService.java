package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.NoticeVO;

public interface NoticeService {
	// 글 등록
	public int insertNotice(NoticeVO vo);

	// 글 수정
	public int updateNotice(NoticeVO vo);

	// 글 삭제
	public int deleteNotice(NoticeVO vo);

	// 글상세 조회
	public NoticeVO getNotice(NoticeVO vo);

	// 페이징 처리된 글 목록 조회
	public List<NoticeVO> noticeListPaging(NoticeVO vo);

	// 전체 글 수 조회
	public int noticeTotalCnt(NoticeVO vo);
}
