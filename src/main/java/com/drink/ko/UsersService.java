package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.UsersVO;

public interface UsersService {
	int insertUser(UsersVO vo);
	UsersVO checkId(String id);
	UsersVO checkEmail(String email);
	int pwFind(UsersVO vo);
	void updateUser(UsersVO vo); //정보 수정
	void deleteUser(String u_id);  //회원 삭제
	UsersVO selectOne(String selId); //상세페이지
	UsersVO checkNick(String nick);
	UsersVO checkPw(String pw, String id);
	List<UsersVO> selectList(String keyword);
	UsersVO loginSelectOne(UsersVO vo);
	UsersVO idFindEmail(UsersVO vo);
	List<UsersVO> idFindPhone(UsersVO vo);
	String pwFindId(UsersVO vo);
	String pwFindStart(UsersVO vo);
	int kakaoLoginFirst(UsersVO vo);
	UsersVO kakaoLogin(UsersVO vo);
	int naverLoginFirst(UsersVO vo);
	UsersVO naverLogin(UsersVO vo);
	void updatePw(UsersVO vo);
	UsersVO checkTel(String tel);
	UsersVO checkTelId(String tel, String uid);
	int updateTotal(UsersVO vo);

	// 페이징 처리된 글 목록 조회
	List<UsersVO> getUserList(UsersVO vo);

	// 전체 글 수 조회
	int userTotalCnt(UsersVO vo);
	
	UsersVO loginAdmin(UsersVO vo); //관리자로그인
}

