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
	public void deleteUser(String u_id) {
		System.out.println("삭제 serviceImple");
		System.out.println("UsersVO vo 있느냐?? : " + u_id);
		usersDAO.deleteUser(u_id);
	}

	// 비밀번호 재확인 후 내 정보 진입
	@Override
	public UsersVO checkPw(String pw, String id) {
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

	@Override
	public UsersVO checkEmail(String email) {
		return usersDAO.checkEmail(email);
	}

	// 로그인
	@Override
	public UsersVO loginSelectOne(UsersVO vo) {
		return usersDAO.loginSelectOne(vo);
	}

	@Override
	public UsersVO idFindEmail(UsersVO vo) {
		System.out.println("idFind의 UserServeImpl까지는 탔습니다.");
		System.out.println("idFind name : " + vo.getU_email());
		return usersDAO.idFindEmail(vo);
	}

	@Override
	public List<UsersVO> idFindPhone(UsersVO vo) {
		System.out.println("idFind의 UserServeImpl까지는 탔습니다.");
		System.out.println("idFind name : " + vo.getU_email());
		return usersDAO.idFindPhone(vo);
	}

	@Override
	public int pwFind(UsersVO vo) {
		return usersDAO.pwFind(vo);
	}

	@Override
	public String pwFindId(UsersVO vo) {
		return usersDAO.pwFindId(vo);
	}

	@Override
	public String pwFindStart(UsersVO vo) {
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

	@Override
	public int naverLoginFirst(UsersVO vo) {
		return usersDAO.naverLoginFirst(vo);
	}

	@Override
	public UsersVO naverLogin(UsersVO vo) {
		return usersDAO.naverLogin(vo);
	}

	// 동준, 관리자로그인
	@Override
	public UsersVO loginAdmin(UsersVO vo) {
		return usersDAO.loginAdmin(vo);
	}

	@Override
	public void updatePw(UsersVO vo) {
		System.out.println("비번 수정 간다.");
		usersDAO.updatePw(vo);
	}

	@Override
	public UsersVO checkTel(String tel) {
		return usersDAO.checkTel(tel);
	}
	
	@Override
	public UsersVO checkTelId(String tel, String uid) {
		return usersDAO.checkTelId(tel, uid);
	}

	@Override
	public List<UsersVO> getUserList(UsersVO vo) {
		return usersDAO.getUserList(vo);
	}
	
	@Override
	public int userTotalCnt(UsersVO vo){
		return usersDAO.getCount(vo);
	}

	@Override
	public int updateTotal(UsersVO vo) {
		return usersDAO.updateTotal(vo);
	}
	
}
