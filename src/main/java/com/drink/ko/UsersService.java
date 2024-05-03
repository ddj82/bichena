package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.UsersVO;

public interface UsersService {
	public int insertUser(UsersVO vo);
	public UsersVO checkId(String id);
	public UsersVO loginSelectOne(UsersVO vo);
	public UsersVO idFindEmail(UsersVO vo);
	public UsersVO idFindPhon(UsersVO vo);
	public int pwFind(UsersVO vo);
	public String pwFindStart(UsersVO vo);
	public void updateUser(UsersVO vo); //정보 수정
	public void deleteUser(UsersVO vo); //회원 삭제
	public UsersVO selectOne(String selId); //상세페이지
	public UsersVO checkNick(String nick);
	public UsersVO checkPw(String pw, String id);
	public List<UsersVO> selectList(String keyword);
	public int kakaoLoginFirst(UsersVO vo);
	public UsersVO kakaoLogin(UsersVO vo);
}

