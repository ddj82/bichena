package com.drink.ko.impl.dao;

import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.UsersVO;

@Repository
public class UsersDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private BCryptPasswordEncoder encoder;

	// 내 정보 수정
	public void updateUser(UsersVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	// 닉네임 중복검사
	public UsersVO checkNick(String nick) {
		return mybatis.selectOne("UserDAO.checkNick", nick);
	}

	// 회원계정 삭제
	public void deleteUser(String u_id) {
		mybatis.update("UserDAO.deleteUser", u_id);
	}

	// 내 정보 상세조회
	public UsersVO selectOne(String selId) {
		return mybatis.selectOne("UserDAO.selectOne", selId);
	}

	// 비밀번호 재확인 후 내 정보 진입
	public UsersVO checkPw(String pw, String id) {
		UsersVO vo = mybatis.selectOne("UserDAO.checkId", id);

		boolean is = encoder.matches(pw, vo.getU_pw());

		if (is) {
			return mybatis.selectOne("UserDAO.loginSelectOne", vo);
		} else {
			return null;
		}
	}

	public List<UsersVO> selectList(String keyword) { // 얘는 keyword 던짐
		return mybatis.selectList("UserDAO.selectList", keyword);
	}

	public int insertUser(UsersVO vo) {
		if (vo.getU_nick() == null) {
			vo.setU_nick(vo.getU_name());
		}
		vo.setU_birth(vo.getU_birth().replace("-", ""));
		String encodingStr = encoder.encode(vo.getU_pw());
		vo.setU_pw(encodingStr);

		return mybatis.insert("UserDAO.insertUser", vo);
	}

	public UsersVO checkId(String id) {
		return mybatis.selectOne("UserDAO.checkId", id);
	}

	public UsersVO checkEmail(String email) {
		return mybatis.selectOne("UserDAO.checkEmail", email);
	}
	
	// 로그인
	public UsersVO loginSelectOne(UsersVO vo) {
		System.out.println("UserDAOMybatis를 탔습니다.");

		System.out.println("loginSelectOne  else : " + vo.getU_id());
		UsersVO gap = mybatis.selectOne("UserDAO.checkId", vo.getU_id());
		if (gap == null) {
			return null;
		}
		boolean is = encoder.matches(vo.getU_pw(), gap.getU_pw());
		System.out.println("is : " + is);
		if (is) {
			vo.setU_pw(gap.getU_pw());
			return mybatis.selectOne("UserDAO.loginSelectOne", vo);
		} else {
			return null;
		}

	}

	public UsersVO idFindEmail(UsersVO vo) {
		System.out.println("idFind의 UserDAOMybatis를 탔습니다.");
		System.out.println("idFind의 Username : " + vo.getU_email());
		return mybatis.selectOne("UserDAO.idFindEmail", vo);
	}

	public List<UsersVO> idFindPhone(UsersVO vo) {
		System.out.println("idFindPhon의 UserDAOMybatis를 탔습니다.");
		System.out.println("idFind의 Username : " + vo.getU_email());
		return mybatis.selectList("UserDAO.idFindPhone", vo);
	}

	public int pwFind(UsersVO vo) {
		return mybatis.selectOne("UserDAO.pwFind", vo);
	}

	public String pwFindId(UsersVO vo) {
		return mybatis.selectOne("UserDAO.pwFindId", vo);
	}

	public String pwFindStart(UsersVO vo) {
	      Random rnd = new Random();

	      StringBuffer randomAlpanumerics = new StringBuffer();

	      for (int i = 0; i < 12; i++) {
	         if (i < 3)
	            randomAlpanumerics.append((char) ((rnd.nextInt(26)) + 'A'));
	         else if(i < 5)
	            randomAlpanumerics.append(rnd.nextInt(10));
	         else if(i < 7)
	            randomAlpanumerics.append((char)((rnd.nextInt(26)) + 'a' ));
	         else
	            randomAlpanumerics.append(rnd.nextInt(10));
	      }

	      String random = randomAlpanumerics.toString();

	      System.out.println("단방향 암호화 진행 : " + random);

	      String encodingStr = encoder.encode(random); // 암호화 처리된 문자열로 리턴(로그인 할 때 비밀번호)

	      vo.setN_pw(encodingStr);

	      int i = mybatis.update("UserDAO.pwFindStart", vo);

	      if (i == 0) {
	         System.out.println("pwFindStart : 에러에러에러");
	      } else if (i > 0) {
	         return random;
	      }
	      return null;
	   }

	public int kakaoLoginFirst(UsersVO vo) {
		return mybatis.insert("UserDAO.kakaoLoginFirst", vo);
	}

	public UsersVO kakaoLogin(UsersVO vo) {
		return mybatis.selectOne("UserDAO.kakaoLogin", vo);
	}

	public int naverLoginFirst(UsersVO vo) {
		return mybatis.insert("UserDAO.naverLoginFirst", vo);
	}

	public UsersVO naverLogin(UsersVO vo) {
		return mybatis.selectOne("UserDAO.naverLogin", vo);
	}
	
	public void updatePw(UsersVO vo) {
		String encodingStr = encoder.encode(vo.getU_pw());
		vo.setU_pw(encodingStr);
		mybatis.update("UserDAO.updatePw", vo);
	}
	
	public UsersVO checkTel(String tel) {
		UsersVO vo = new UsersVO();
		vo.setU_tel(tel);
		return mybatis.selectOne("UserDAO.checkTel", vo);
	}
	
	public UsersVO checkTelId(String tel, String uid) {
		UsersVO vo = new UsersVO();
		vo.setU_tel(tel);
		vo.setU_id(uid);
		return mybatis.selectOne("UserDAO.checkTelId", vo);
	}

	public List<UsersVO> getUserList(UsersVO vo) {
		System.out.println("DAO  : " + vo.getSearchVoca() + vo.getSearchWord());
		return mybatis.selectList("UserDAO.getUserList", vo);
	}
	
	public int getCount(UsersVO vo) {
		return mybatis.selectOne("UserDAO.getCount", vo);
	}
	
	public int updateTotal(UsersVO vo) {
		mybatis.update("UserDAO.updateTotal",vo);
		return mybatis.update("UserDAO.updateLev",vo);
	}
	
	//동준, 관리자로그인
	public UsersVO loginAdmin(UsersVO vo) {
		return mybatis.selectOne("UserDAO.loginAdmin", vo);
	}
}