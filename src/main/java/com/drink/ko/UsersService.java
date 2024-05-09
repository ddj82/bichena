package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.UsersVO;

public interface UsersService {
	int insertUser(UsersVO vo);
	UsersVO checkId(String id);
	int pwFind(UsersVO vo);
	void updateUser(UsersVO vo); //정보 수정
	void deleteUser(UsersVO vo); //회원 삭제
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
	List<UsersVO> getUserList(UsersVO vo);
}

