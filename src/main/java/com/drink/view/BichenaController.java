package com.drink.view;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.drink.ko.OrderService;
import com.drink.ko.ProdRevService;
import com.drink.ko.ProdService;
import com.drink.ko.QnaService;
import com.drink.ko.UsersService;
import com.drink.ko.vo.OrderVO;
import com.drink.ko.vo.ProdRevVO;
import com.drink.ko.vo.ProdVO;
import com.drink.ko.vo.QnaVO;
import com.drink.ko.vo.UsersVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BichenaController {
	@Autowired
	private ProdService prodService;
	@Autowired
	private ProdRevService prodRevService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private BCryptPasswordEncoder encoder;

	String realPath = "C:/swork/bichena/src/main/webapp/img/";

	public final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public final String IMPORT_CERTIFICATION_URL = "https://api.iamport.kr/certifications";

	// "아임포트 Rest Api key로 설정";
	public final String KEY = "5332741436286106";
	// "아임포트 Rest Api Secret로 설정";
	public final String SECRET = "xGMw5WNK4QaCvoXJtVwSp7VWp2HtteV0RPzVrRvMfNGe6GfLsRyaBM3GlRLdF93YHnAHea1XgPZu4Yj1";
	// 아임포트 가맹점 식별코드 값
	public final String IMPORT_ID = "imp70405420";

	@RequestMapping("/insertUser.ko")
	public String insertUser(UsersVO vo) {
		usersService.insertUser(vo);
		
		return "/WEB-INF/join/success.jsp";
	}

	@RequestMapping("/checkId.ko")
	@ResponseBody
	public int checkId(UsersVO vo) {
		int count = 0;
		if (usersService.checkId(vo.getU_id()) == null) {
			count = 0;
		} else {
			count = 1;
		}
		return count;
	}

	@RequestMapping("/terms.ko")
	public String terms(UsersVO vo) {
		return "/WEB-INF/join/terms.jsp";
	}

	@RequestMapping("/requestCertPage.ko")
	public String certPage(UsersVO vo) {
		return "/WEB-INF/join/requestCert.jsp";
	}
	
	@RequestMapping("/insertPage.ko")
	public String insertPage(UsersVO vo) {
		return "/WEB-INF/join/insert.jsp";
	}

	// 아임포트 인증(토큰)을 받아주는 함수
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	@RequestMapping(value = "/cer.ko", method = RequestMethod.POST)
	@ResponseBody
	public Object certification(HttpServletRequest request) throws IOException {
		String imp_uid = request.getParameter("imp_uid");
		String token = getImportToken();
		Map<String, String> map = new HashMap<String, String>();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_CERTIFICATION_URL + "/" + imp_uid);
		get.setHeader("Authorization", token);

		HttpResponse res = client.execute(get);
		ObjectMapper mapper = new ObjectMapper();
		String body = EntityUtils.toString(res.getEntity());
		JsonNode rootNode = mapper.readTree(body);
		JsonNode resNode = rootNode.get("response");

		if (resNode.asText().equals("null")) {
			System.out.println("내역이 없습니다.");
			map.put("msg", "인증 과정 중 오류 발생");
		} else {
			map.put("imp_uid", resNode.get("imp_uid").asText());
			map.put("name", resNode.get("name").asText());
			map.put("birth", resNode.get("birthday").asText());
			map.put("phone", resNode.get("phone").asText());
		}

		return map;
	}

	// 나의 정보
	@RequestMapping("/userInfo.ko")
	public String viewMypage(HttpSession session, Model model) {
		String selId = (String) session.getAttribute("userID");
		model.addAttribute("users", usersService.selectOne(selId));
		return "/WEB-INF/login/userMyInfo.jsp";
	}

	// 비밀번호 재확인 후 내 정보 진입
	@RequestMapping("/reconPw.ko")
	@ResponseBody
	public int reconfirmPw(@RequestParam("u_pw") String pw, HttpSession session) {
		String id = (String) session.getAttribute("userID");
		int count = 0;

		if (usersService.checkPw(pw, id) != null) {
			count = 1;
		} else {
			count = 0;
		}

		return count;
	}

	// 회원 정보 수정
	@RequestMapping("/upInfo.ko")
	public String updateUser(UsersVO vo, Model model) {
		System.out.println("정보수정: " + vo);
		usersService.updateUser(vo);
		model.addAttribute("user", vo);
		return "userMyInfo.jsp";
	}

	// 회원계정 삭제
	@ResponseBody
	@RequestMapping("/delUser.ko")
	public String quitMem(HttpSession session) throws Exception {
		System.out.println("회원 탈퇴 컨트롤러");
		UsersVO vo = (UsersVO) session.getAttribute("user");
		usersService.deleteUser(vo);
		session.invalidate();
		return "success";
	}

	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping("/checkNick.ko")
	public int checkNick(UsersVO vo) throws Exception {
		int count = 0;
		if (usersService.checkNick(vo.getU_nick()) == null) {
			System.out.println("닉 중복 : " + usersService.checkNick(vo.getU_nick()));
			count = 0;
		} else {
			System.out.println("닉 중복 : " + usersService.checkNick(vo.getU_nick()));
			count = 1;
		}
		return count;
	}

	@RequestMapping("main.ko")
	public String main() {
		return "/main.jsp";
	}

	@RequestMapping("/myPage.ko")
	public String myPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("userNO");
		List<OrderVO> myOrderList = orderService.myOrderList(u_no);
		System.out.println(myOrderList);
		model.addAttribute("myOrderList", myOrderList);
		return "/WEB-INF/user/myPageMain.jsp";
	}

	@GetMapping("myOrderDetail.ko")
	public String myOrderDetail(@RequestParam(value = "o_no") String o_no, Model model) {
		OrderVO myOrderDetail = orderService.myOrderDetail(o_no);
		model.addAttribute("myOrderDetail", myOrderDetail);
		return "/WEB-INF/user/myOrderDetail.jsp";
	}

	@GetMapping("/prodList.ko")
	public String prodList(Model model) {
		List<ProdVO> prodList = prodService.prodList();
		model.addAttribute("prodList", prodList);
		return "/WEB-INF/user/prodView.jsp";
	}

	@GetMapping("/prodOne.ko")
	public String prodOne(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO prodOne = prodService.prodOne(p_no);
		model.addAttribute("prodOne", prodOne);
		return "/WEB-INF/user/prodOneView.jsp";
	}

	@PostMapping("/prodOneRev.ko")
	@ResponseBody
	public Object prodOneNotice(@RequestParam(value = "p_no") String p_no, Model model) {
		List<ProdRevVO> prodOneRev = prodRevService.prodOneRev(p_no);
		model.addAttribute("prodNotice", prodOneRev);

		Map<String, Object> prodOneRevMap = new HashMap<>();
		prodOneRevMap.put("code", "OK");
		prodOneRevMap.put("prodOneRev", prodOneRev);
		return prodOneRevMap;
	}

	@PostMapping("/prodRevInsert.ko")
	public String prodRevInsert(ProdRevVO vo, @RequestParam(value = "o_no") String o_no)
			throws IllegalStateException, IOException {
		System.out.println(vo);
		MultipartFile uploadFile = vo.getUploadFile();
		realPath += "imgRev/";
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!uploadFile.isEmpty()) {
			vo.setPr_img(uploadFile.getOriginalFilename());
			// 실질적으로 파일이 설정한 경로에 업로드 되는 지점
			uploadFile.transferTo(new File(realPath + vo.getPr_img()));
		}

		int cnt = prodRevService.prodRevInsert(vo);

		if (cnt > 0) {
			System.out.println("등록완료");
			return "orderRevchk.ko";
		} else {
			System.out.println("등록실패");
			return "redirect:/index.jsp";
		}
	}

	@RequestMapping("/orderRevchk.ko")
	public String orderRevchk(OrderVO vo) {
		int cnt = orderService.orderRevchk(vo);
		System.out.println(vo);

		if (cnt > 0) {
			System.out.println("변경완료");
			return "myPage.ko";
		} else {
			System.out.println("변경실패");
			return "redirect:/index.jsp";
		}
	}

	@RequestMapping("/qnaList.ko")
	public String qnaList(Model model) {
		List<QnaVO> qnaList = qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "/WEB-INF/user/qna.jsp";
	}

	@GetMapping("/qnaView.ko")
	public String qnaView(@RequestParam(value = "q_no") String q_no, Model model) {
		QnaVO qnaView = qnaService.qnaView(q_no);
		model.addAttribute("qnaView", qnaView);
		return "/WEB-INF/user/qnaView.jsp";
	}

	@PostMapping("/qnaAcontent.ko")
	public String qnaAcontent(QnaVO vo) {
		int cnt = qnaService.qnaAcontent(vo);

		if (cnt > 0) {
			System.out.println("답변완료");
			return "qnaState.ko?q_no=" + vo.getQ_no();
		} else {
			System.out.println("답변실패");
			return "redirect:/index.jsp";
		}
	}

	@RequestMapping("/qnaState.ko")
	public String qnaState(QnaVO vo) {
		vo.setQ_state("답변완료");
		int cnt = qnaService.qnaState(vo);

		if (cnt > 0) {
			System.out.println("상태변경완료");
		}
		return "qnaList.ko";
	}

	@GetMapping("/qnaDelete.ko")
	public String qnaDelete(@RequestParam(value = "q_no") String q_no) {
		int cnt = qnaService.qnaDelete(q_no);

		if (cnt > 0) {
			System.out.println("삭제완료");
			return "qnaList.ko";
		} else {
			System.out.println("삭제실패");
			return "redirect:/index.jsp";
		}
	}

	@GetMapping("/qnaInsertbtn.ko")
	public String qnaInsertbtn() {
		return "/WEB-INF/user/qnaInsert.jsp";
	}

	@PostMapping("/qnaInsert.ko")
	public String qnaInsert(QnaVO vo) throws IllegalStateException, IOException {
		System.out.println(vo);
		MultipartFile uploadFile = vo.getUploadFile();
		realPath += "imgQna/";
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!uploadFile.isEmpty()) {
			vo.setQ_img(uploadFile.getOriginalFilename());
			// 실질적으로 파일이 설정한 경로에 업로드 되는 지점
			uploadFile.transferTo(new File(realPath + vo.getQ_img()));
		}

		int cnt = qnaService.qnaInsert(vo);

		if (cnt > 0) {
			System.out.println("등록완료");
			return "qnaList.ko";
		} else {
			System.out.println("등록실패");
			return "redirect:/index.jsp";
		}
	}

	@RequestMapping("/admin.ko")
	public String admin() {
		return "/WEB-INF/admin/adminMain.jsp";
	}

	@RequestMapping("/adminQnaList.ko")
	public String adminqnaList(Model model) {
		List<QnaVO> qnaList = qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "/WEB-INF/admin/adminQna.jsp";
	}

	@RequestMapping("/adminOrderList.ko")
	public String adminOrderList(Model model) {
		List<OrderVO> adminOrderList = orderService.adminOrderList();
		model.addAttribute("adminOrderList", adminOrderList);
		return "/WEB-INF/admin/adminOrderList.jsp";
	}

	@GetMapping("/adminOrderDetail.ko")
	@ResponseBody
	public Object adminOrderDetail(@RequestParam(value = "o_no") String o_no, Model model) {
		OrderVO adminOrderDetail = orderService.myOrderDetail(o_no);
		model.addAttribute("adminOrderDetail", adminOrderDetail);
		return adminOrderDetail;
	}
	
	@RequestMapping("/adminQnaView.ko")
	public String adminQnaView(@RequestParam(value = "q_no") String q_no, Model model) {
		System.out.println("관리자가 qna상세보기 : "+q_no);
		QnaVO qnaView = qnaService.qnaView(q_no);
		model.addAttribute("qnaView", qnaView);
		System.out.println(qnaView);
		return "/WEB-INF/admin/adminQnaView.jsp";
	}

	@GetMapping("/adminProdList.ko")
	public String adminProdList(Model model) {
		List<ProdVO> adminProdList = prodService.prodList();
		model.addAttribute("adminProdList", adminProdList);
		return "/WEB-INF/admin/adminProdView.jsp";
	}
	
	@GetMapping("/adminProdDetail.ko")
	@ResponseBody
	public Object adminProdDetail(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO adminProdDetail = prodService.prodOne(p_no);
		model.addAttribute("adminProdDetail", adminProdDetail);
		return adminProdDetail;
	}
}
