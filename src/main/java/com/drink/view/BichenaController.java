package com.drink.view;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.drink.ko.CartService;
import com.drink.ko.FaqService;
import com.drink.ko.NoticeService;
import com.drink.ko.OrderService;
import com.drink.ko.ProdRevService;
import com.drink.ko.ProdService;
import com.drink.ko.QnaService;
import com.drink.ko.UsersService;
import com.drink.ko.vo.CartVO;
import com.drink.ko.vo.FaqVO;
import com.drink.ko.vo.NoticeVO;
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
	private NoticeService noticeService;
	@Autowired
	private FaqService faqService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BCryptPasswordEncoder encoder;

	String realPath = "C:/swork/bichena1/src/main/webapp/img/";

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

	@RequestMapping("/main.ko")
	public String main() {
		return "/main.jsp";
	}

	@RequestMapping("/terms.ko")
	public String terms(UsersVO vo) {
		return "/WEB-INF/join/terms.jsp";
	}

	@RequestMapping("/insertPage.ko")
	public String insertPage(UsersVO vo) {
		return "/WEB-INF/join/insert.jsp";
	}

	@RequestMapping("/serviceTerms.ko")
	public String serviceTerms(UsersVO vo) {
		return "/WEB-INF/join/serviceTerms.jsp";
	}

	@RequestMapping("/personalTerms.ko")
	public String personalTerms(UsersVO vo) {
		return "/WEB-INF/join/personalTerms.jsp";
	}

	@RequestMapping("/insertUser.ko")
	public String insertUser(UsersVO vo) {
		usersService.insertUser(vo);

		return "/WEB-INF/join/success.jsp";
	}

	// 검색기능을 위한 모델 어트리뷰트
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 공지 쓰기
	@RequestMapping("/writeNotice.ko")
	public String writeNotice(NoticeVO vo) {
		return "WEB-INF/admin/insertNotice.jsp";
	}

	// 공지 등록
	@PostMapping(value = "/insertNotice.ko")
	public String insertNotice(NoticeVO vo) throws IllegalStateException, IOException {
		System.out.println("글 등록 초기");
		int not_no = noticeService.getMaxNotice();
		System.out.println("여기는, not_no가 받아지는 순간 : " + not_no);
		String filename = "not_no" + not_no + ".jsp";
		vo.setNot_no(not_no);
		System.out.println("vo 값을 확인해 봅시다. : " + vo);
		vo.setFilename(filename);
		// 총 파일의 갯수 + 1 을 한 숫자값을 가져와 pno + 숫자값.jsp 파일을 만들 준비를 함 == filename
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdir();
		} //폴더 생성
		FileWriter fw = null;
		// 파일에 문자를 쓰기 위한, 표준 라이브러리
		try {
			fw = new FileWriter(file + "/" + filename); // // 경로 + / + 파일.jsp
			fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
			fw.write(vo.getNot_content());
			fw.flush(); // 내보내기
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				fw.close();
			} catch(IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
		
	    noticeService.insertNotice(vo);
	    return "/getNoticeList.ko";
	}

	// 공지 수정
	@RequestMapping("/modifyNotice.ko")
	public String ModyfyNotice(NoticeVO vo, Model model) {
		System.out.println("공지 수정시 조회 :" + vo);
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/admin/updateNotice.jsp";
	}

	// 공지 수정 업데이트
	@RequestMapping("/updateNotice.ko")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo, HttpSession session) {
	    System.out.println("공지 업데이트 : " + vo);
	    
	    // 기존 파일 삭제
	    String fileName = "not_no" + vo.getNot_no() + ".jsp";
	    vo.setFilename(fileName);
	    File oldFile = new File(realPath + "/" + vo.getFilename());
	    System.out.println("옛날 파일 이름:" + oldFile);
	    if (oldFile.exists()) {
	        oldFile.delete(); // 파일 삭제
	    }
	    
	    // 새로운 파일 생성
	    int not_no = vo.getNot_no();
	    String filename = vo.getFilename();
	    vo.setNot_no(not_no);
	    vo.setFilename(filename);
	    // 총 파일의 갯수 + 1 을 한 숫자값을 가져와 pno + 숫자값.jsp 파일을 만들 준비를 함 == filename

	    File file = new File(realPath);
	    if (!file.exists()) {
	        file.mkdir();
	    } //폴더 생성
	    
	    FileWriter fw = null;
	    // 파일에 문자를 쓰기 위한, 표준 라이브러리
	    try {
	        fw = new FileWriter(file + "/" + filename); // // 경로 + / + 파일.jsp
	        fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
	        fw.write(vo.getNot_content());
	        fw.flush(); // 내보내기
	    } catch (IOException e) {
	        System.out.println(e.getMessage());
	    } finally {
	        try {
	            fw.close();
	        } catch (IOException e) {
	            System.out.println(e.getMessage());
	        }
	    }
	    System.out.println("공지 업데이트 확인부분 : " + vo);
	    noticeService.updateNotice(vo);
	    System.out.println("공지 업데이트 확인부분2 : " + vo);
	    return "getNoticeList.ko";
	}

	// 공지 삭제
	@RequestMapping("/deleteNotice.ko")
	public String deleteNotice(NoticeVO vo) {
		 // 파일 경로 설정
//		String realPath ="C:/swork/prjBichena4/src/main/webapp/notice/";
        String directoryPath = "C:/swork/prjBichena4/src/main/webapp/notice/";
        String fileName = "not_no" + vo.getNot_no() + ".jsp";
        
        // 파일 객체 생성
        File file = new File(directoryPath, fileName);
        System.out.println("파일명: " +  fileName);
        // 파일 삭제
        if (file.exists()) {
            if (file.delete()) {
                System.out.println("파일이 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("파일을 삭제하는 데 실패했습니다.");
            }
        } else {
            System.out.println("삭제할 파일이 존재하지 않습니다.");
        }
		noticeService.deleteNotice(vo);
		noticeService.updateNot_no1(vo);
		noticeService.updateNot_no2(vo);
		return "getNoticeList.ko";
	}

	// 공지 상세 조회
	@RequestMapping("/getNotice.ko")
	public String getNotice(NoticeVO vo, Model model) {
		System.out.println("공지 상세조회 : " + vo);
	    model.addAttribute("prevNextNotice", noticeService.getPrevNext(vo));
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/user/getNotice.jsp";
	}
	// 공지 상세 조회 (관리자)
	@RequestMapping("/adminGetNotice.ko")
	public String adminGetNotice(NoticeVO vo, Model model) {
		System.out.println("공지 상세조회 : " + vo);
	    model.addAttribute("prevNextNotice", noticeService.getPrevNext(vo));
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/admin/adminGetNotice.jsp";
	}

	// 공지 목록
	@RequestMapping("/getNoticeList.ko")
	public ModelAndView getNoticeListPost(NoticeVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange,
			HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = noticeService.noticeTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = Integer.parseInt(Notrange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getNot_title() == null)
			vo.setNot_title("");

		mav.addObject("pagination", vo);
		mav.addObject("noticeList", noticeService.noticeListPaging(vo)); // parameter로 때온 값들을 보내준다.
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				System.out.println("일단 여기까지는 찍고,");
				mav.setViewName("WEB-INF/admin/adminGetNoticeList.jsp");
			} else {
				mav.setViewName("WEB-INF/user/getNoticeList.jsp");
			}
			
		} else {
			mav.setViewName("WEB-INF/user/getNoticeList.jsp");
		}
		
		return mav;
	}

// 여기서 부터는 FAQ에 관련된 내용입니다----------------

	// Faq 쓰기
	@RequestMapping("/writeFaq.ko")
	public String writeFaq(FaqVO vo) {
		return "WEB-INF/admin/insertFaq.jsp";
	}

	// Faq 등록
	@PostMapping(value = "/insertFaq.ko")
	public String insertFaq(FaqVO vo) throws IllegalStateException, IOException {

		System.out.println("Faq 업로드 : " + vo);
		faqService.insertFaq(vo);
		return "/getFaqList.ko";
	}

	// Faq 수정
	@RequestMapping("/modifyFaq.ko")
	public String ModyfyFaq(FaqVO vo, Model model) {
		System.out.println("Faq 수정시 조회 :" + vo);
		model.addAttribute("faq", faqService.getFaq(vo));
		return "WEB-INF/admin/updateFaq.jsp";
	}

	// Faq 수정 업데이트
	@RequestMapping("/updateFaq.ko")
	public String updateFaq(@ModelAttribute("faq") FaqVO vo, HttpSession session) {

		System.out.println("Faq 업데이트 : " + vo);

		System.out.println("Faq업데이트 후 1번지점");
		faqService.updateFaq(vo);
		return "getFaqList.ko";
	}

	// Faq 삭제
	@RequestMapping("/deleteFaq.ko")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		faqService.updateFaq_no1(vo);
		faqService.updateFaq_no2(vo);
		return "getFaqList.ko";
	}
	
	// Faq 목록
	@RequestMapping("/getFaqList.ko")
	public ModelAndView getFaqListPost(FaqVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange,
			HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = faqService.faqTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = Integer.parseInt(Notrange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getFaq_title() == null)
			vo.setFaq_title("");

		mav.addObject("pagination", vo);
		mav.addObject("faqList", faqService.faqListPaging(vo)); // parameter로 때온 값들을 보내준다.
		
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				mav.setViewName("WEB-INF/admin/adminGetFaqList.jsp");
			} else {
				mav.setViewName("WEB-INF/user/getFaqList.jsp");
			}
			
		} else {
			mav.setViewName("WEB-INF/user/getFaqList.jsp");
		}
		
		return mav;
	}
	
	
	// 관리자 Faq 자세히 보기
	@RequestMapping("/adminGetFaq.ko")
	public String getFaq(FaqVO vo, Model model) {
		System.out.println("공지 상세조회 : " + vo);
		model.addAttribute("faq", faqService.getFaq(vo));
		return "WEB-INF/admin/getFaq.jsp";
	}
	
//	// Faq 상세 조회 (관리자)
//	@RequestMapping("/adminGetFaq.ko")
//	public String adminGetFaq(FaqVO vo, Model model) {
//		System.out.println("Faq 상세조회 : " + vo);
//		model.addAttribute("faq", faqService.getFaq(vo));
//		return "WEB-INF/admin/adminGetFaq.jsp";
//	}

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

	@RequestMapping("/checkEmail.ko")
	@ResponseBody
	public int checkEmail(UsersVO vo) {
		int count = 0;
		if (usersService.checkEmail(vo.getU_email()) == null) {
			count = 0;
		} else {
			count = 1;
		}
		return count;
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

	// 아임포트 결제금액 변조는 방지하는 함수
	public void setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
	@RequestMapping(value = "/pay.ko")
	public String payment(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		OrderVO orderVO = new OrderVO();
		CartVO cartVO = new CartVO();
		String total = request.getParameter("o_total");
		int o_total = Integer.parseInt(total);
		int count = 0;
		
		UsersVO userVO = new UsersVO(); //유저 한줄
		userVO = usersService.checkTel(request.getParameter("u_tel"), (String) session.getAttribute("userID"));

		orderVO.setO_no(request.getParameter("o_no"));
		orderVO.setU_no(userVO.getU_no());
		orderVO.setU_name(request.getParameter("u_name"));
		orderVO.setP_no(request.getParameter("p_no"));
		orderVO.setP_name(request.getParameter("p_name"));
		orderVO.setO_stock(request.getParameter("o_stock"));
		orderVO.setO_total(o_total);
		orderVO.setO_addr(request.getParameter("o_addr"));
		orderVO.setU_tel(request.getParameter("u_tel"));

		count = orderService.orderInsert(orderVO);

		if (count > 0) {
			String pno = orderVO.getP_no();
			String[] p_no = pno.split(",");
			for (int i = 0; i < p_no.length; i++) {
				cartVO.setP_no(Integer.parseInt(p_no[i]));
				cartService.deleteCart(cartVO);
			}

			return "orderComple.ko";
		} else {
			return "myCartList.ko";
		}
	}

	@RequestMapping(value = "/cancle.ko", method = RequestMethod.POST)
	@ResponseBody
	public int cancle(String mid) throws IOException {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			orderService.orderDelete(mid);
			System.err.println("환불성공");
			return 1;
		}
	}

	@RequestMapping("/orderComple.ko")
	public String orderComplete(OrderVO vo) {
		return "/WEB-INF/user/orderComple.jsp";
	}

	@RequestMapping("/orderDelete.ko")
	public String orderDelete(OrderVO vo) {
		return "/WEB-INF/user/orderComple.jsp";
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

	@RequestMapping("/infoForm.ko")
	public String infoForm(HttpSession session, Model model) {
		String selId = (String) session.getAttribute("userID");
		System.out.println("userID: " + selId);
		model.addAttribute("users", usersService.selectOne(selId));
		System.out.println("정보->수정폼 탔냐. 네~");
		return "WEB-INF/login/myInfoModi.jsp";
	}

	// 회원 정보 업데이트
	@RequestMapping("/upInfo.ko")
	public String updateUser(Model model, @RequestParam("u_id") String userId, UsersVO vo) {
		usersService.updateUser(vo);
		UsersVO updateUser = usersService.selectOne(vo.getU_id());
		model.addAttribute("users", updateUser);
		System.out.println("정보수정: " + vo);
		return "WEB-INF/login/userMyInfo.jsp";
	}

	@RequestMapping("/changePwForm.ko")
	public String changePwForm(UsersVO vo) {
		return "WEB-INF/login/pwChange.jsp";
	}

	// 비번 수정
	@RequestMapping("/updatePw.ko")
	public String updatePw(@RequestParam("u_pw") String userPw, UsersVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("userID");
		vo.setU_id(id);
		usersService.updatePw(vo);
		UsersVO updateUser = usersService.selectOne(id);
		model.addAttribute("users", updateUser);
		System.out.println("비번수정: " + vo);
		return "userInfo.ko";
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

	@RequestMapping("/myPage.ko")
	public String myPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("userNO");
		List<OrderVO> myOrderList = orderService.myOrderList(u_no);
		System.out.println(myOrderList);
		model.addAttribute("myOrderList", myOrderList);
		return "/WEB-INF/user/myPageMain.jsp";
	}

	@GetMapping("/myOrderDetail.ko")
	public String myOrderDetail(@RequestParam(value = "o_no") String o_no, Model model) {
		OrderVO myOrderDetail = orderService.myOrderDetail(o_no);
		List<ProdVO> list = new ArrayList<>();
		ProdVO prodVO = new ProdVO();
		String pno = myOrderDetail.getP_no();
		String ostock = myOrderDetail.getO_stock();
		String[] p_no = pno.split(",");
		String[] o_stock = ostock.split(",");
		for (int i = 0; i < p_no.length; i++) {
			prodVO = prodService.prodOne(p_no[i]);
			prodVO.setO_stock(o_stock[i]);
			list.add(prodVO);
		}
		
		model.addAttribute("detailList", list);
		model.addAttribute("myOrderDetail", myOrderDetail);
		
		return "/WEB-INF/user/myOrderDetail.jsp";
	}

	@GetMapping("/prodList.ko")
	public String prodList(Model model) {
		List<ProdVO> prodList = prodService.prodList();
		model.addAttribute("prodList", prodList);
		return "/WEB-INF/user/prodView.jsp";
	}

	@RequestMapping("/prodOne.ko")
	public String prodOne(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO prodOne = prodService.prodOne(p_no);
		model.addAttribute("prodOne", prodOne);
		return "/WEB-INF/user/prodOneView.jsp";
	}

	@PostMapping("/prodOneRev.ko")
	@ResponseBody
	public Object prodOneRev(@RequestParam(value = "p_no") String p_no, Model model) {
		List<ProdRevVO> prodOneRev = prodRevService.prodOneRev(p_no);
		model.addAttribute("prodNotice", prodOneRev);

		Map<String, Object> prodOneRevMap = new HashMap<>();
		prodOneRevMap.put("code", "OK");
		prodOneRevMap.put("prodOneRev", prodOneRev);
		return prodOneRevMap;
	}

	@RequestMapping("myRevList.ko")
	public String myRevList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("userNO");
		List<ProdRevVO> myRevList = prodRevService.myRevList(u_no);
		model.addAttribute("myRevList", myRevList);
		return "WEB-INF/user/myRevList.jsp";
	}

	@RequestMapping("/myRevIstOrder.ko")
	@ResponseBody
	public Object myRevIstOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("userNO");
		List<OrderVO> myRevIstOrder = orderService.myRevIstOrder(u_no);
		model.addAttribute("myRevIstOrder", myRevIstOrder);
		Map<String, Object> myRevIstOrderMap = new HashMap<>();
		myRevIstOrderMap.put("code", "OK");
		myRevIstOrderMap.put("myRevIstOrder", myRevIstOrder);
		return myRevIstOrderMap;
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
		return "/WEB-INF/user/qnaList.jsp";
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
			return "redirect:main.ko";
		}
	}

	@RequestMapping("/adminLoginPage.ko")
	public String adminLoginPage() {
		return "/WEB-INF/admin/adminLogin.jsp";
	}

	@RequestMapping("/adminQnaList.ko")
	public String adminqnaList(Model model) {
		List<QnaVO> qnaList = qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "/WEB-INF/admin/adminQna.jsp";
	}

//	@RequestMapping("/adminOrderList.ko")
//	public String adminOrderList(Model model) {
//		List<OrderVO> adminOrderList = orderService.adminOrderList();
//		model.addAttribute("adminOrderList", adminOrderList);
//		return "/WEB-INF/admin/adminOrderList.jsp";
//	}
	@RequestMapping("/adminOrderList.ko")
	public String adminOrderList(OrderVO vo,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = orderService.orderTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = Integer.parseInt(Notrange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		model.addAttribute("pagination", vo);

		List<OrderVO> adminOrderList = orderService.adminOrderList(vo);
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
		System.out.println("관리자가 qna상세보기 : " + q_no);
		QnaVO qnaView = qnaService.qnaView(q_no);
		model.addAttribute("qnaView", qnaView);
		System.out.println(qnaView);
		return "/WEB-INF/admin/adminQnaView.jsp";
	}

	// 검색기능을 위한 모델 어트리뷰트
	@ModelAttribute("conditionMapProd")
	public Map<String, String> searchConditionMapProd() {
		Map<String, String> conditionMapProd = new HashMap<String, String>();
		conditionMapProd.put("상품명", "pname");
		conditionMapProd.put("상품번호", "pno");
		conditionMapProd.put("주종", "ptype");
		return conditionMapProd;
	}

	@RequestMapping("/adminProdList.ko")
	public String adminProdList(ProdVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "pname", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodService.prodTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = Integer.parseInt(Notrange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		List<ProdVO> adminProdList = prodService.prodList(vo);
		model.addAttribute("pagination", vo);
		model.addAttribute("adminProdList", adminProdList);
		return "/WEB-INF/admin/adminProdView.jsp";
	}

	@GetMapping("/adminProdDetail.ko")
	public String adminProdDetail(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO adminProdDetail = prodService.prodOne(p_no);
		model.addAttribute("prodOne", adminProdDetail);
		return "/WEB-INF/admin/adminProdOneView.jsp";
	}

	@RequestMapping("/productDetailpage.ko")
	public String productDetailpage(@RequestParam String p_no) {
		return "/WEB-INF/product/pno" + p_no + ".jsp";
	}

	@RequestMapping("/adminProdInsertBtn.ko")
	public String adminProdInsertBtn() {
		return "/WEB-INF/admin/adminProdInsert.jsp";
	}

	@RequestMapping("/adminProdUpdateSet.ko")
	public String adminProdUpdate(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO prodOne = prodService.prodOne(p_no);
		model.addAttribute("prodOne", prodOne);
		return "/WEB-INF/admin/adminProdUpdate.jsp";
	}

	@RequestMapping("/adminProdInsert.ko")
	public String adminProdInsert(ProdVO vo) throws IllegalStateException, IOException {
		MultipartFile uplodFile = vo.getUploadFile();
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!(uplodFile == null || uplodFile.isEmpty())) {
			vo.setP_img(uplodFile.getOriginalFilename());
			uplodFile.transferTo(new File(realPath + vo.getP_img()));
		}

		int pno = prodService.getPnoMaxNum();
		String editFilename = "pno" + pno + ".jsp";
		vo.setEditfile(editFilename);

		File file = new File("C:/swork/bichena1/src/main/webapp/WEB-INF/product");
		if (!file.exists()) {
			file.mkdirs();
		}

		FileWriter fw = null;
		try {
			fw = new FileWriter(file + "/" + editFilename);
			fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
			fw.write(vo.getEdithtml());
			fw.flush();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println(vo);
		int cnt = prodService.insertProduct(vo);

		if (cnt > 0) {
			System.out.println("등록완료");
			return "adminProdList.ko";
		} else {
			System.out.println("등록실패");
			return "redirect:adminProdList.ko";
		}

	}

//	@RequestMapping("/adminProdUpdate.ko")
//	public String adminProdUpdate(ProdVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
//		File f = new File(realPath);
//		if (!f.exists()) {
//			f.mkdirs();
//		}
//		
//		if (!(uplodFile == null || uplodFile.isEmpty())) {
//			vo.setP_img(uplodFile.getOriginalFilename());
//			uplodFile.transferTo(new File(realPath + vo.getP_img()));
//		}
//		
//		int pno = prodService.getPnoMaxNum();
//		String editFilename = "pno" + pno + ".jsp";
//		vo.setEditfile(editFilename);
//		
//		File file = new File("C:/swork/bichena/src/main/webapp/WEB-INF/product");
//		if (!file.exists()) {
//			file.mkdirs();
//		}
//		
//		FileWriter fw = null;
//		try {
//			fw = new FileWriter(file + "/" + editFilename);
//			fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
//			fw.write(vo.getEdithtml());
//			fw.flush();
//		} catch (IOException e) {
//			System.out.println(e.getMessage());
//		} finally {
//			try {
//				fw.close();
//			} catch (IOException e) {
//				System.out.println(e.getMessage());
//			}
//		}
//		int cnt = prodService.updateProduct(vo);
//		
//		if (cnt > 0) {
//			System.out.println("수정완료");
//			return "adminProdList.ko";
//		} else {
//			System.out.println("수정실패");
//			return "redirect:adminProdList.ko";
//		}
//		
//	}

	@RequestMapping("/getUserList.ko")
	public ModelAndView getUserList(@ModelAttribute("searchWord") String searchWord,
			@ModelAttribute("searchVoca") String searchVoca, ModelAndView mav) {
		UsersVO vo = new UsersVO();
		vo.setSearchVoca(searchVoca);
		vo.setSearchWord(searchWord);

		List<UsersVO> userList = usersService.getUserList(vo);
		mav.addObject("userList", userList);
		mav.setViewName("WEB-INF/admin/memberList.jsp");
		return mav;
	}

	@RequestMapping("/userDetail.ko")
	@ResponseBody
	public UsersVO userDetail(UsersVO vo) {
		String selId = vo.getU_id();
		return usersService.selectOne(selId);
	}

	// 검색 select option
	@ModelAttribute("conditionMapMem")
	public Map<String, String> searchVocaMap() {
		Map<String, String> conditionMapMem = new HashMap<>();
		conditionMapMem.put("회원번호", "u_no");
		conditionMapMem.put("ID", "u_id");
		conditionMapMem.put("회원명", "u_name");
		conditionMapMem.put("휴대전화", "u_tel");
		conditionMapMem.put("이메일", "u_email");
		return conditionMapMem;
	}

	@RequestMapping("adminRevList.ko")
	public String adminRevList(ProdRevVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "pname", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodRevService.revTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = Integer.parseInt(Notrange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		model.addAttribute("pagination", vo);

		List<ProdRevVO> adminRevList = prodRevService.adminRevList(vo);
		model.addAttribute("adminRevList", adminRevList);
		return "WEB-INF/admin/adminRevList.jsp";
	}

	// 검색기능을 위한 모델 어트리뷰트
	@ModelAttribute("conditionMapRev")
	public Map<String, String> searchConditionMapRev() {
		Map<String, String> conditionMapRev = new HashMap<String, String>();
		conditionMapRev.put("상품명", "pname");
		conditionMapRev.put("상품번호", "pno");
		conditionMapRev.put("별점", "prstar");
		return conditionMapRev;
	}
}
