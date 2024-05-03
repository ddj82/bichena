package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.UsersService;
import com.drink.ko.impl.dao.UsersDAO;
import com.drink.ko.vo.UsersVO;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDAO usersDAO;

	// 회원정보 수정
	@Override
	public void updateUser(UsersVO vo) {
		System.out.println("수정 serviceImple");
		usersDAO.updateUser(vo);
	}

	// 회원계정 삭제
	@Override
	public void deleteUser(UsersVO vo) {
		System.out.println("삭제 serviceImple");
		usersDAO.deleteUser(vo);
	}

	// 비밀번호 재확인 후 내 정보 진입
	@Override
	public UsersVO checkPw(String pw, String id) {
		System.out.println("비번 재확인 Impl");
		return usersDAO.checkPw(pw, id);
	}

	// 회원정보 상세조회
	@Override
	public UsersVO selectOne(String selId) {
		return usersDAO.selectOne(selId);
	}

	@Override
	public List<UsersVO> selectList(String keyword) {
		return usersDAO.selectList(keyword);
	}

	// 닉 중복체크
	@Override
	public UsersVO checkNick(String nick) {
		System.out.println("checkNick : " + nick);
		return usersDAO.checkNick(nick);
	}

	@Override
	public int insertUser(UsersVO vo) {
		return usersDAO.insertUser(vo);
	}

	@Override
	public UsersVO checkId(String id) {
		return usersDAO.checkId(id);
	}

	// 로그인
	@Override
	public UsersVO loginSelectOne(UsersVO vo) {
		System.out.println("UserServeImpl까지는 탔습니다.");
		System.out.println("vo : " + vo);
		return usersDAO.loginSelectOne(vo);
	}

	@Override
	public UsersVO idFindEmail(UsersVO vo) {
		System.out.println("idFind의 UserServeImpl까지는 탔습니다.");
		System.out.println("idFind name : " + vo.getU_email());
		return usersDAO.idFindEmail(vo);
	}

	@Override
	public UsersVO idFindPhon(UsersVO vo) {
		System.out.println("idFind의 UserServeImpl까지는 탔습니다.");
		System.out.println("idFind name : " + vo.getU_email());
		return usersDAO.idFindPhon(vo);
	}

	@Override
	public int pwFind(UsersVO vo) {
		System.out.println("UsersServeImpl vo.id : " + vo.getU_id());
		return usersDAO.pwFind(vo);
	}

	@Override
	public String pwFindStart(UsersVO vo) {
		System.out.println("pwFindStart vo.id : " + vo.getU_id());
		return usersDAO.pwFindStart(vo);
	}

	@Override
	public int kakaoLoginFirst(UsersVO vo) {
		return usersDAO.kakaoLoginFirst(vo);
	}

	@Override
	public UsersVO kakaoLogin(UsersVO vo) {
		return usersDAO.kakaoLogin(vo);
	}
}

