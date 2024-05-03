package com.drink.view;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.drink.ko.UsersService;
import com.drink.ko.impl.CertificationService;
import com.drink.ko.impl.MailSendService;
import com.drink.ko.vo.KaKaoVO;
import com.drink.ko.vo.UsersVO;

@SessionAttributes({ "userID", "userNO" })
@Controller
public class LoginController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private BCryptPasswordEncoder encoder;

	private KaKaoVO kakao;

	String accessToken;

	@RequestMapping("/login.ko")
	@ResponseBody
	public String login(UsersVO vo, Model model) {

		System.out.println("/login.ko 여기까지 진입 성공");

		String pw = vo.getU_pw();
		System.out.println("getU_pw 암호화 전 비밀번호: " + vo.getU_pw());
		UsersVO user = usersService.loginSelectOne(vo);
		System.out.println(user);

		if (user != null) {
			System.out.println("getU_pw 암호화한 비밀번호: " + vo.getU_pw());
			Boolean result = encoder.matches(pw, user.getU_pw());
			if (result == true) {
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				return "main.jsp";
			} else {
				return "loginFail.ko?error=1";
			}
		}
		return "loginFail.ko?error=1";
	}

	@RequestMapping("/loginFail.ko")
	public String loginFail(@RequestParam(value = "error") String error, Model model) {
		model.addAttribute("error", error);
		return "/WEB-INF/login/login.jsp";
	}

	@RequestMapping("/idFind.ko")
	@ResponseBody
	public UsersVO idFind(UsersVO vo, @RequestParam(value = "menu", defaultValue = "", required = false) String menu,
			Model model) {
		System.out.println("@RequestParam으로 받은 menu : " + menu);
		System.out.println("vo.getPhon : " + vo.getU_tel());
		System.out.println("idFind 컨트롤러를 탔습니다.");
		System.out.println("UsersVO vo.getEmail : " + vo.getU_email());
		if (menu != null && menu.equals("email")) {
			return usersService.idFindEmail(vo);
		} else if (menu != null && menu.equals("phon")) {
			return usersService.idFindPhon(vo);
		} else {
			return null;
		}

	}

	// 로그아웃
	@RequestMapping("/logout.ko")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		System.out.println("logout.ko 메서드를 탔습니다.");
		sessionStatus.setComplete();
		session.invalidate();
		return "redirect:/main.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("/pwFind.ko")
	@ResponseBody
	public String pwFind(UsersVO vo) {
		System.out.println("pwFind 메서드를 탔습니다. : " + vo.getU_id());
		int i = usersService.pwFind(vo);
		System.out.println("i : " + i);
		if (i == 0) {
			System.out.println("해당 id가 없습니다..");
		} else if (i > 0) {
			System.out.println("해당 id가 있습니다..");
			String vovo = usersService.pwFindStart(vo);
			System.out.println("UsersVO vovo : " + vovo);
			return usersService.pwFindStart(vo);
		}
		return null;
	}

	// 변경했음.
	@RequestMapping("/kakao.ko")
	public String kakaoLogin(@RequestParam String code, Model model) {
		kakao = new KaKaoVO();
//		1. 인가 코드 받기 (@RequestParam String code)
		System.out.println("code : " + code);
//	    2. 토큰 받기
		accessToken = kakao.getAccessToken(code);
		System.out.println("accessToken : " + accessToken);
//	    3. 사용자 정보 받기
		Map<String, Object> userInfo = kakao.getUserInfo(accessToken);
		UsersVO vo = new UsersVO();
		vo.setU_id((String) userInfo.get("kakaoID"));
		vo.setU_email((String) userInfo.get("email"));
		vo.setU_name((String) userInfo.get("name"));
		vo.setU_tel((String) userInfo.get("phone_number1"));
		vo.setAddr1((String) userInfo.get("baseAddress"));
		vo.setAddr2((String) userInfo.get("detail_address"));
		vo.setAddr3((String) userInfo.get("zone_number"));
		System.out.println("vo.getAddr3 : " + vo.getAddr3());
		vo.setU_birth((String) userInfo.get("birthday"));
		vo.setU_gen((String) userInfo.get("gen"));
		String gender = (String) userInfo.get("gen");
		if (gender.equals("male")) {
			vo.setU_gen("남자");
		} else if (gender.equals("female")) {
			vo.setU_gen("여자");
		}
		vo.setU_nick((String) userInfo.get("nickName"));
		System.out.println("gen : " + vo.getU_gen());
		UsersVO user = usersService.kakaoLogin(vo);
		if (user == null) {
			int i = usersService.kakaoLoginFirst(vo);
			if (i > 0) {
				System.out.println("카카오 데이터 업데이트 완료");
				user = usersService.kakaoLogin(vo);
				System.out.println("user.getU_id : " + user.getU_id());
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				return "/main.jsp";
			} else if (i <= 0) {
				System.out.println("카카오 데이터 업데이트 실패");
				return "/login.jsp?error=1";
			}
		} else {
			model.addAttribute("userID", user.getU_id());
			model.addAttribute("userNO", user.getU_no());
			return "/main.jsp";
		}
		return "/login.jsp?error=1";
	}

	@RequestMapping("/mailCheck.ko")
	@ResponseBody
	public String mailCheck(@RequestParam(value = "email", defaultValue = "", required = false) String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일1 : " + email);
		return mailService.joinEmail(email);
	}

	@GetMapping("/check/sendSMS.ko")
	public @ResponseBody String sendSMS(String phoneNumber) {

		System.out.println("controller");

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		CertificationService.certifiedPhoneNumber(phoneNumber, numStr);
		return numStr;
	}

	@RequestMapping("/loginPage.ko")
	public String loginPage(UsersVO vo) {
		return "/WEB-INF/login/login.jsp";
	}

	@RequestMapping("/idf.ko")
	public String idf(UsersVO vo) {
		return "/WEB-INF/login/idFind.jsp";
	}

	@RequestMapping("/pwf.ko")
	public String pwf(UsersVO vo) {
		return "/WEB-INF/login/pwFind.jsp";
	}

	@RequestMapping("/confirm.ko")
	public String confirm(UsersVO vo) {
		return "/WEB-INF/login/userMyPassConfirm.jsp";
	}

	@RequestMapping("/modify.ko")
	public String modify(UsersVO vo) {
		return "/WEB-INF/login/myInfoModi.jsp";
	}

}
