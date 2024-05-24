package com.drink.view;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.drink.ko.UsersService;
import com.drink.ko.impl.CertificationService;
import com.drink.ko.impl.MailSendService;
import com.drink.ko.impl.NaverLoginService;
import com.drink.ko.vo.KaKaoVO;
import com.drink.ko.vo.UsersVO;
import com.google.gson.Gson;

@SessionAttributes({ "userID", "userNO", "howLogin", "uLev","uNick"})
@Controller
public class LoginController {

	@Autowired
	UsersService usersService;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private BCryptPasswordEncoder encoder;

//	naver
	private NaverLoginService naverService = new NaverLoginService();
	String naver = ""; // naver 토큰

	private KaKaoVO kakao = null;
	String accessToken;

	@RequestMapping("/loginErr.ko")
	public String loginErr() {
		return "redirect:/WEB-INF/login/login.jsp?error=1";
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
	public String confirm(UsersVO vo, HttpSession session) {
		if (session.getAttribute("userID") == null) {
			return "redirect:main.ko";
		}
		return "/WEB-INF/login/userMyPassConfirm.jsp";
	}

	@RequestMapping("/modify.ko")
	public String modify(UsersVO vo) {
		return "/WEB-INF/login/myInfoModi.jsp";
	}

	@RequestMapping("/pwFindShow.ko")
	public String pwFindShow(@RequestParam(value = "email", defaultValue = "", required = false) String email) {
		return "/WEB-INF/login/pwFindShow.jsp?email=" + email;
	}

	@RequestMapping("/loginFailure.ko")
	public String loginFailure() {
		return "/WEB-INF/join/success.jsp?result=1";
	}

	@RequestMapping("/logoutProceeding.ko")
	public String logoutProceeding(@RequestParam(value = "logout", defaultValue = "", required = false) String i) {
		if (i.equals("2")) {
			return "/WEB-INF/login/logout.jsp?logout=2";
		} else if (i.equals("3")) {
			return "/WEB-INF/login/logout.jsp?logout=3";
		} else if (i.equals("s2")) {
			return "/WEB-INF/login/logout.jsp?logout=s2";
		} else if (i.equals("s3")) {
			return "/WEB-INF/login/logout.jsp?logout=s3";
		} else {
			return "logout.ko";
		}
	}

	@RequestMapping("/login.ko")
	@ResponseBody
	public String login(UsersVO vo, Model model, HttpServletResponse response,
			@RequestParam(value = "remember", defaultValue = "", required = false) String remember) {

		String pw = vo.getU_pw();
		UsersVO user = usersService.loginSelectOne(vo);

		if (user != null) {
			Boolean result = encoder.matches(pw, user.getU_pw());
			if (result == true) {
				System.out.println(user);
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				model.addAttribute("howLogin", user.getU_state());
				model.addAttribute("uLev", user.getU_lev());
				if (remember != null && !(remember.equals(""))) {
					Cookie rcookie = new Cookie("remember", user.getU_id());
					rcookie.setMaxAge(60 * 60);
					response.addCookie(rcookie);
					System.out.println("id 쿠키 생성완료");
				} else {
					Cookie noCookie = new Cookie("remember", "");
					noCookie.setMaxAge(0);
					response.addCookie(noCookie);
					System.out.println("id 쿠키 삭제완료");
				}
				return "main.ko";
			} else {
				return "loginErr.ko";
			}
		}
		return "loginErr.ko";
	}

	// 동준, 관리자로그인, 0510
	@RequestMapping("/loginAdmin.ko")
	@ResponseBody
	public String loginAD(UsersVO vo, Model model) {
		String id = vo.getU_id();
		if (id != null) {
			if (id.equals("admin")) {

				String pw = vo.getU_pw();
				UsersVO user = usersService.loginAdmin(vo);

				if (user != null) {
					Boolean result = encoder.matches(pw, user.getU_pw());
					if (result == true) {
						model.addAttribute("userID", user.getU_id());
						model.addAttribute("userNO", user.getU_no());
						model.addAttribute("howLogin", user.getU_state());
						model.addAttribute("uLev", user.getU_lev());
						return "adminOrderList.ko";
					} else {
						return "loginErr3.ko";
					}
				}
			} else {
				return "loginErr2.ko";
			}
		}
		return "loginErr2.ko";
	}

	@RequestMapping("/loginErr2.ko")
	public String loginErr2() {
		return "redirect:main.ko?err=1";
	}

	@RequestMapping("/loginErr3.ko")
	public String loginErr3() {
		return "redirect:adminLoginPage.ko?err=3";
	}
	// 0510 끝

	// 05-07 수정
	@RequestMapping("/idFind.ko")
	public String idFind(UsersVO vo, Model model) {
		List<UsersVO> userList = usersService.idFindPhone(vo);
		if (userList == null) {
			return "redirect:/WEB-INF/login/idFind.jsp?error=1";
		} else {
			model.addAttribute("userList", userList);
			return "/WEB-INF/login/idFindSearch.jsp";
		}
	}

//	양예진 수정
	@RequestMapping("/logoutKaKao.ko")
	@ResponseBody
	public String logoutKaKao(HttpSession session, SessionStatus sessionStatus, RedirectAttributes ra) throws Exception {
		if (kakao != null) {
			kakao.kakaoLogout(accessToken, session.getAttribute("userID").toString());
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet httpGet = new HttpGet(
					"https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
			HttpResponse res = client.execute(httpGet);
			String body = EntityUtils.toString(res.getEntity());
			System.out.println("로그아웃 후: " + body);
		}
		sessionStatus.setComplete();
		session.invalidate();
		return "success";
	}
	
	@RequestMapping("/logout.ko")
	public String logout(HttpSession session, SessionStatus sessionStatus, RedirectAttributes ra) throws Exception {
		sessionStatus.setComplete();
		session.invalidate();
		return "redirect:/main.ko";
	}

//	양예진 수정 끝	

	@RequestMapping("/logoutNaver.ko")
	@ResponseBody
	public String logoutNaver(HttpSession session, SessionStatus sessionStatus, RedirectAttributes ra)
			throws Exception {
		naverService.naverLogout(naver);
		sessionStatus.setComplete();
		session.invalidate();
		return "success";
	}

	// 05-05수정
	@RequestMapping("/pwFindId.ko")
	@ResponseBody
	public String pwFind(UsersVO vo) {
		System.out.println("pwFindId 메서드를 탔습니다. : " + vo.getU_email());
		String email = usersService.pwFindId(vo);
		if (email == null || email == "") {
			return "error";
		} else {
			return email;
		}
	}

	@RequestMapping("/pwFindStart.ko")
	@ResponseBody
	public String pwFindStart(UsersVO vo) {
		return usersService.pwFindStart(vo);
	}

	// 05-05수정 끝
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

	@RequestMapping("/kakao.ko")
	public String kakaoLogin(@RequestParam(value = "code", defaultValue = "", required = false) String code,
			@RequestParam(value = "version", defaultValue = "", required = false) String version, HttpSession session,
			Model model) throws Exception {

		System.out.println("code : " + code);
		System.out.println("version : " + version);
		kakao = new KaKaoVO(version);
		// 1. 인가 코드 받기 (@RequestParam String code)
		System.out.println("code : " + code);
		// 2. 토큰 받기
		accessToken = kakao.getAccessToken(code, session);
		if (accessToken == null || accessToken == "") {
			return "main.ko";
		}

		Map<String, Object> userInfo = kakao.getUserInfo(accessToken, session);
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
				model.addAttribute("howLogin", user.getU_state());
				model.addAttribute("uLev", user.getU_lev());
				model.addAttribute("uNick", user.getU_nick());
				return "main.ko";
			} else if (i <= 0) {
				System.out.println("카카오 데이터 업데이트 실패");
				return "loginErr.ko";
			}
		} else {

			if (user.getU_state() == 2 && user.getU_id().equals(vo.getU_id())) {
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				model.addAttribute("howLogin", user.getU_state());
				model.addAttribute("uLev", user.getU_lev());
				model.addAttribute("uNick", user.getU_nick());
				return "main.ko";
			} else {
				model.addAttribute("userID", user.getU_id());
				return "logoutProceeding.ko?logout=s2";
			}

//				model.addAttribute("userID", user.getU_id());
//				model.addAttribute("userNO", user.getU_no());
//				// 수정1
//				System.out.println("howLogin : " + user.getU_state());
//				model.addAttribute("howLogin", user.getU_state());
//				return "main.ko";
		}
		return "loginErr.ko";
	}

	// naver 추가하기.
	@RequestMapping("/NaverLoginCallback.ko")
	public String naverLoginCallback(@RequestParam Map<String, String> resValue, Model model, HttpSession session) {
		System.out.println("NaverLoginCallback.ko 진입");
		// code 를 받아오면 code 를 사용하여 access_token를 발급받는다.
		naver = naverService.requestNaverLoginAcceccToken(resValue, "authorization_code", session);
		if (naver == null || naver == "") {
			return "main.ko";
		}
		UsersVO vo = naverService.apiExamMemberProfile(naver);

		UsersVO user = usersService.naverLogin(vo);
		if (user != null) {
			System.out.println("이미 가입한 사용자입니다.");
			if (user.getU_state() == 1 && user.getU_id().equals(vo.getU_id())) {
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				model.addAttribute("howLogin", user.getU_state());
				model.addAttribute("uLev", user.getU_lev());
				model.addAttribute("uNick", user.getU_nick());
				return "main.ko";
			} else {
				return "logoutProceeding.ko?logout=s3";
			}
		} else if (user == null) {
			int i = usersService.naverLoginFirst(vo);
			if (i <= 0) {
				return "loginErr.ko";
			} else if (i > 0) {
				user = usersService.naverLogin(vo);
				model.addAttribute("userID", user.getU_id());
				model.addAttribute("userNO", user.getU_no());
				model.addAttribute("howLogin", user.getU_state());
				model.addAttribute("uLev", user.getU_lev());
				model.addAttribute("uNick", user.getU_nick());
				return "main.ko";
			}
		}

		return "loginErr.ko";
	}
}
