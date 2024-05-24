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

//	String realPath = "C:/apache-tomcat-9.0.86/webapps/bichena/img/";
//	String realPathJSP = "C:/apache-tomcat-9.0.86/webapps/bichena/WEB-INF/product/";
	String realPath = "C:/swork/bichena/src/main/webapp/img/";
	String realPathJSP = "C:/swork/bichena/src/main/webapp/WEB-INF/product/";

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
	public String main(Model model) {
		ProdVO vo1 = new ProdVO();
		List<ProdVO> mainPageSlideListTakju = prodService.mainPageSlideListTakju(vo1);
		model.addAttribute("mainPageSlideListTakju", mainPageSlideListTakju);
		System.out.println(mainPageSlideListTakju);

		ProdVO vo2 = new ProdVO();
		List<ProdVO> mainPageSlideListGwasilju = prodService.mainPageSlideListGwasilju(vo2);
		model.addAttribute("mainPageSlideListGwasilju", mainPageSlideListGwasilju);
		System.out.println("과실주 슬라이드" + mainPageSlideListGwasilju);

		ProdVO vo3 = new ProdVO();
		List<ProdVO> mainPageSlideListChunju = prodService.mainPageSlideListChunju(vo3);
		model.addAttribute("mainPageSlideListChunju", mainPageSlideListChunju);
		System.out.println("청주 슬라이드" + mainPageSlideListChunju);

		ProdVO vo4 = new ProdVO();
		List<ProdVO> mainPageSlideListJeungryuju = prodService.mainPageSlideListJeungryuju(vo4);
		model.addAttribute("mainPageSlideListJeungryuju", mainPageSlideListJeungryuju);
		System.out.println("증류주 슬라이드" + mainPageSlideListJeungryuju);

		ProdRevVO revo = new ProdRevVO();
		List<ProdRevVO> mainRevList = prodRevService.mainRevList(revo);
		model.addAttribute("mainRevList", mainRevList);
		System.out.println("리뷰 슬라이드" + mainRevList);

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
		int not_no = noticeService.getMaxNotice();
		vo.setNot_no(not_no);
		noticeService.insertNotice(vo);
		return "redirect:/getNoticeList.ko";
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
		int not_no = vo.getNot_no();
		vo.setNot_no(not_no);
		System.out.println("공지 업데이트 확인부분 : " + vo);
		noticeService.updateNotice(vo);
		System.out.println("공지 업데이트 확인부분2 : " + vo);
		return "redirect:/getNoticeList.ko";
	}

	// 공지 삭제
	@RequestMapping("/deleteNotice.ko")
	public String deleteNotice(NoticeVO vo) {
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
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = noticeService.noticeTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getNot_title() == null)
			vo.setNot_title("");

		mav.addObject("keyword", keyword);
		mav.addObject("condition", condition);
		mav.addObject("pagination", vo);
		mav.addObject("noticeList", noticeService.noticeListPaging(vo)); // parameter로 때온 값들을 보내준다.
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
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
		int faq_no = faqService.faqTotalCnt(vo);
		faq_no += 1;
		vo.setFaq_no(faq_no);
		System.out.println("Faq 업로드 : " + vo);
		faqService.insertFaq(vo);
		return "redirect:/getFaqList.ko";
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
		return "redirect:/getFaqList.ko";
	}

	// Faq 목록
	@RequestMapping("/getFaqList.ko")
	public ModelAndView getFaqListPost(FaqVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = faqService.faqTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getFaq_title() == null)
			vo.setFaq_title("");

		mav.addObject("keyword", keyword);
		mav.addObject("condition", condition);
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

	@RequestMapping("/requestCertPage.ko")
	public String certPage(UsersVO vo) {
		return "/WEB-INF/join/requestCert.jsp";
	}

	@RequestMapping("/success.ko")
	public String success(UsersVO vo) {
		return "/WEB-INF/join/success.jsp";
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

	@RequestMapping(value = "/cer.ko")
	@ResponseBody
	public Object certification(HttpSession session, HttpServletRequest request) throws IOException {
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
			UsersVO vo = usersService.checkTel(resNode.get("phone").asText());
			System.out.println("vo : " + vo);
			if (vo == null) {
				map.put("imp_uid", resNode.get("imp_uid").asText());
				map.put("name", resNode.get("name").asText());
				map.put("birth", resNode.get("birthday").asText());
				map.put("phone", resNode.get("phone").asText());
			} else {
				return null;
			}

		}

		return map;
	}

	@RequestMapping("/mobileCer.ko")
	public String mobileCer(HttpSession session, HttpServletRequest request) throws IOException {
		String imp_uid = request.getParameter("imp_uid");
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_CERTIFICATION_URL + "/" + imp_uid);
		get.setHeader("Authorization", token);
		HttpResponse res = client.execute(get);
		ObjectMapper mapper = new ObjectMapper();
		String body = EntityUtils.toString(res.getEntity());
		JsonNode rootNode = mapper.readTree(body);
		JsonNode resNode = rootNode.get("response");

		if (resNode.asText().equals("null")) {
			return "main.ko";
		} else {
			UsersVO vo = usersService.checkTel(resNode.get("phone").asText());
			if (vo == null) {
				return "insertPage.ko?name=" + resNode.get("name").asText() + "&tel=" + resNode.get("phone").asText()
						+ "&birth=" + resNode.get("birthday").asText();
			} else {
				return "success.ko?result=1";
			}
		}
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
	public String payment(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ProdVO prodVO = new ProdVO();
		UsersVO userVO = new UsersVO();
		OrderVO orderVO = new OrderVO();
		CartVO cartVO = new CartVO();
		int count = 0;
		String[] stock = request.getParameter("o_stock").split(",");
		String[] pno = request.getParameter("p_no").split(",");

		userVO = usersService.checkTelId(request.getParameter("u_tel"), (String) session.getAttribute("userID"));
		for (int i = 0; i < stock.length; i++) {
			prodVO = prodService.prodOne(pno[i]);
			int ott = (prodVO.getP_price() * Integer.parseInt(stock[i]));
			userVO.setU_total(ott + userVO.getU_total());
			int levUp = usersService.updateTotal(userVO);
			if (userVO.getU_lev().equals("다이아")) {
				ott = ott - (int) Math.floor(ott * 0.1);
			} else if (userVO.getU_lev().equals("골드")) {
				ott = ott - (int) Math.floor(ott * 0.05);
			}
			if (levUp > 0) {
				userVO = usersService.checkId((String) session.getAttribute("userID"));
				session.setAttribute("uLev", userVO.getU_lev());
			}
			orderVO.setO_no(request.getParameter("o_no"));
			orderVO.setU_no(userVO.getU_no());
			orderVO.setU_name(userVO.getU_name());
			orderVO.setP_no(pno[i]);
			orderVO.setP_name(prodVO.getP_name());
			orderVO.setO_stock(stock[i]);
			orderVO.setO_total(ott);
			orderVO.setO_addr(request.getParameter("o_addr"));
			orderVO.setU_tel(request.getParameter("u_tel"));

			count += orderService.orderInsert(orderVO);

			cartVO.setP_no(prodVO.getP_no());
			cartVO.setU_id(userVO.getU_id());
			cartService.deleteCart(cartVO);

			// 구매수 만큼 재고수 (-)업데이트 처리
			int stockUpdate = prodVO.getP_stock() - Integer.parseInt(stock[i]);
			ProdVO prodVOstock = new ProdVO();
			prodVOstock.setP_no(prodVO.getP_no());
			prodVOstock.setP_stock(stockUpdate);
			prodService.stockUpdate(prodVOstock);
		}

		if (count > stock.length - 1) {
			return "orderComple.ko";
		} else {
			return "myCartList.ko";
		}
	}

	@RequestMapping(value = "/cancle.ko", method = RequestMethod.POST)
	@ResponseBody
	public int cancle(String mid, HttpSession session) throws IOException {
		UsersVO userVO = usersService.checkId((String) session.getAttribute("userID"));
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

		List<OrderVO> myOrderDetail = orderService.myOrderDetail(mid);
		int total = 0;

		if (asd.equals("null")) {
			return -1;
		} else {
			orderService.orderDelete(mid);

			// 취소시 구매수 만큼 재고수 (+)업데이트 처리
			List<OrderVO> delOrder = orderService.delOrderSelect(mid);
			for (int i = 0; i < delOrder.size(); i++) {
				OrderVO vo = new OrderVO();
				ProdVO prodVO = new ProdVO();
				vo = delOrder.get(i);

				// 취소된 주문의 상품 하나씩
				prodVO = prodService.prodOne(vo.getP_no());
				// 상품 하나의 재고 + 취소수량
				int stockUpdate = prodVO.getP_stock() + Integer.parseInt(vo.getO_stock());

				ProdVO prodVOstock = new ProdVO();
				prodVOstock.setP_no(prodVO.getP_no());
				prodVOstock.setP_stock(stockUpdate);
				prodService.stockUpdate(prodVOstock);
			}

			for (OrderVO detail : myOrderDetail) {
				ProdVO prodVO = new ProdVO();
				prodVO = prodService.prodOne(detail.getP_no());
				total += prodVO.getP_price() * Integer.parseInt(detail.getO_stock());
			}
			userVO.setU_total(userVO.getU_total() - total);
			usersService.updateTotal(userVO);

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
		model.addAttribute("users", usersService.selectOne(selId));
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
	@RequestMapping("/delUser.ko")
	public String quitMem(HttpSession session) throws Exception {
		System.out.println("회원 탈퇴 컨트롤러");
		String u_id = (String) session.getAttribute("userID");
		usersService.deleteUser(u_id);
		session.invalidate();
		return "/main.jsp";
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
		if (session.getAttribute("userNO") == null) {
			return "redirect:main.ko";
		}
		int u_no = (int) session.getAttribute("userNO");
		int ready = 0;
		int porter = 0;
		int complete = 0;
		List<OrderVO> myOrderList = orderService.myOrderList(u_no);
		List<OrderVO> myOrderConfirm = orderService.myOrderConfirm(u_no);

		for (int i = 0; i < myOrderConfirm.size(); i++) {
			String price = String.format("%,d", Integer.parseInt(myOrderConfirm.get(i).getP_price()));
			String tt = String.format("%,d", myOrderConfirm.get(i).getO_total());
			myOrderConfirm.get(i).setP_price(price);
			myOrderConfirm.get(i).setStr_total(tt);
		}

		for (int i = 0; i < myOrderList.size(); i++) {
			int a = 0;
			for (int j = 0; j < myOrderConfirm.size(); j++) {
				int total = myOrderConfirm.get(j).getO_total();
				if (myOrderList.get(i).getO_no().equals(myOrderConfirm.get(j).getO_no())) {
					a += total;
				}
			}
			myOrderList.get(i).setAllTotal(a);
		}

		for (int i = 0; i < myOrderList.size(); i++) {
			String price = String.format("%,d", myOrderList.get(i).getAllTotal());
			myOrderList.get(i).setStr_allTotal(price);
		}

		for (OrderVO count : myOrderList) {
			String state = count.getO_state();
			if (state.equals("상품 준비중")) {
				ready++;
			} else if (state.equals("배송중")) {
				porter++;
			} else if (state.equals("배송완료")) {
				complete++;
			}
		}
		model.addAttribute("myOrderConfirm", myOrderConfirm);
		model.addAttribute("myOrderList", myOrderList);
		model.addAttribute("ready", ready);
		model.addAttribute("porter", porter);
		model.addAttribute("complete", complete);

		return "/WEB-INF/user/myPageMain.jsp";
	}

	@RequestMapping("/myOrderDetail.ko")
	public String myOrderDetail(@RequestParam(value = "o_no") String o_no, Model model) {
		int total = 0;
		int dc = 0;
		int pt = 0;
		List<OrderVO> myOrderDetail = orderService.myOrderDetail(o_no);
		for (OrderVO detail : myOrderDetail) {
			total += detail.getO_total();
		}

		for (int i = 0; i < myOrderDetail.size(); i++) {
			String price = String.format("%,d", Integer.parseInt(myOrderDetail.get(i).getP_price()));
			int p_total = Integer.parseInt(myOrderDetail.get(i).getP_price())
					* Integer.parseInt(myOrderDetail.get(i).getO_stock());
			pt += p_total;
			String tt = String.format("%,d", myOrderDetail.get(i).getO_total());
			myOrderDetail.get(i).setP_price(price);
			myOrderDetail.get(i).setStr_total(tt);
		}

		dc = pt - total;

		String prodTotal = String.format("%,d", pt);
		String allTotal = String.format("%,d", total);
		String dcTotal = String.format("%,d", dc);

		model.addAttribute("myOrderDetail", myOrderDetail);
		model.addAttribute("allTotal", allTotal);
		model.addAttribute("prodTotal", prodTotal);
		model.addAttribute("dcTotal", dcTotal);

		return "/WEB-INF/user/myOrderDetail.jsp";
	}

	@RequestMapping("/orderCancleList.ko")
	public String orderCancleList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("userNO") == null) {
			return "redirect:main.ko";
		}
		int u_no = (int) session.getAttribute("userNO");
		int cancle = 0;
		int recall = 0;
		List<OrderVO> myOrderList = orderService.myCancleList(u_no);
		List<OrderVO> myOrderConfirm = orderService.myCancleConfirm(u_no);

		for (int i = 0; i < myOrderConfirm.size(); i++) {
			String price = String.format("%,d", Integer.parseInt(myOrderConfirm.get(i).getP_price()));
			String tt = String.format("%,d", myOrderConfirm.get(i).getO_total());
			myOrderConfirm.get(i).setP_price(price);
			myOrderConfirm.get(i).setStr_total(tt);
		}

		for (int i = 0; i < myOrderList.size(); i++) {
			int a = 0;
			for (int j = 0; j < myOrderConfirm.size(); j++) {
				int total = myOrderConfirm.get(j).getO_total();
				if (myOrderList.get(i).getO_no().equals(myOrderConfirm.get(j).getO_no())) {
					a += total;
				}
			}
			myOrderList.get(i).setAllTotal(a);
		}

		for (int i = 0; i < myOrderList.size(); i++) {
			String price = String.format("%,d", myOrderList.get(i).getAllTotal());
			myOrderList.get(i).setStr_allTotal(price);
		}

		for (OrderVO count : myOrderList) {
			String state = count.getO_state();
			if (state.equals("취소")) {
				cancle++;
			} else if (state.equals("환불")) {
				recall++;
			}
		}
		model.addAttribute("myOrderConfirm", myOrderConfirm);
		model.addAttribute("myOrderList", myOrderList);
		model.addAttribute("cancle", cancle);
		model.addAttribute("recall", recall);
		return "/WEB-INF/user/orderCancleList.jsp";
	}

	@GetMapping("/prodList.ko")
	public ModelAndView prodListAndFilteredProducts(ProdVO vo, ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String prodCurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String prodRange,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "sweet", required = false) String sweet,
			@RequestParam(value = "acidity", required = false) String acidity,
			@RequestParam(value = "carbonic", required = false) String carbonic,
			@RequestParam(value = "ingredient", required = false) String ingredient,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword, HttpSession session) {
		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodService.prodTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(prodCurrPageNo);
			range = Integer.parseInt(prodRange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (type != null) {
			mav.addObject("type", type);
		}
		if (sweet != null) {
			mav.addObject("sweet", sweet);
		}
		if (acidity != null) {
			mav.addObject("acidity", acidity);
		}
		if (carbonic != null) {
			mav.addObject("carbonic", carbonic);
		}
		if (ingredient != null) {
			mav.addObject("ingredient", ingredient);
		}
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			mav.addObject("searchKeyword", searchKeyword);
			vo.setSearchKeyword(searchKeyword); // ProdVO에 검색어 필드를 추가하고 setter를 사용
		}

		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pagination", vo);
		mav.addObject("prodList", prodService.prodList(vo));
		mav.setViewName("WEB-INF/user/prodList.jsp"); // 원래대로
//		mav.setViewName("WEB-INF/user/prodList2.jsp");

		return mav;
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

	@RequestMapping("myRevList.ko") // 마이페이지-리뷰
	public String myRevList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("userNO") == null) {
			return "redirect:main.ko";
		}
		int u_no = (int) session.getAttribute("userNO");
		List<ProdRevVO> myRevList = prodRevService.myRevList(u_no);
		model.addAttribute("myRevList", myRevList);
		return "WEB-INF/user/myRevList.jsp";
	}

	@RequestMapping("/myRevIstOrder.ko") // 작성 가능한 리뷰
	@ResponseBody
	public Object myRevIstOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("userNO") == null) {
			return "redirect:main.ko";
		}
		int u_no = (int) session.getAttribute("userNO");
		List<OrderVO> myRevIstOrder = orderService.myRevIstOrder(u_no);
		model.addAttribute("myRevIstOrder", myRevIstOrder);
		Map<String, Object> myRevIstOrderMap = new HashMap<>();
		myRevIstOrderMap.put("code", "OK");
		myRevIstOrderMap.put("myRevIstOrder", myRevIstOrder);
		return myRevIstOrderMap;
	}

	@PostMapping("/prodRevInsert.ko") // 리뷰 등록
	public String prodRevInsert(ProdRevVO vo, @RequestParam(value = "o_no") String o_no)
			throws IllegalStateException, IOException {
		System.out.println("리뷰등록 : " + vo);
		MultipartFile uploadFile = vo.getUploadFile();
		String realPathREV = realPath + "imgRev/";
		File f = new File(realPathREV);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!uploadFile.isEmpty()) {
			vo.setPr_img(uploadFile.getOriginalFilename());
			// 실질적으로 파일이 설정한 경로에 업로드 되는 지점
			uploadFile.transferTo(new File(realPathREV + vo.getPr_img()));
		}

		int cnt = prodRevService.prodRevInsert(vo);

		if (cnt > 0) {
			System.out.println("등록완료");
			return "orderRevchk.ko"; // 리뷰state 처리
		} else {
			System.out.println("등록실패");
			return "redirect:/myRevList.ko";
		}
	}

	@RequestMapping("/orderRevchk.ko") // 리뷰state 처리
	public String orderRevchk(OrderVO vo) {
		System.out.println(vo);
		orderService.orderRevchk(vo);
		return "redirect:/myRevList.ko";
	}

//	<!-- 05/15 -->
	@RequestMapping("/prodRevDelete.ko")
	public String prodRevDelete(ProdRevVO vo, HttpSession session, Model model) {
		vo.setU_no((int) session.getAttribute("userNO"));
		int cnt = prodRevService.prodRevDelete(vo);
		if (cnt > 0) {
			System.out.println("삭제완료");
			return "orderRevDelchk.ko"; // 리뷰state 처리
		} else {
			System.out.println("삭제실패");
			return "redirect:/myRevList.ko";
		}
	}

//	<!-- 05/15 -->
	@RequestMapping("/orderRevDelchk.ko") // 리뷰state 처리
	public String orderRevDelchk(OrderVO vo, HttpSession session) {
		orderService.orderRevDelchk(vo);
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				return "redirect:/adminRevList.ko";
			} else {
				return "redirect:/myRevList.ko";
			}
		} else {
			return "redirect:/main.ko";
		}
	}

	@RequestMapping("/qnaList.ko")
	public String qnaList(QnaVO vo,
//			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
//			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = qnaService.qnaTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
//		if (vo.getFaq_title() == null)
//		vo.setFaq_title("");
		model.addAttribute("pagination", vo);

		List<QnaVO> qnaList = qnaService.qnaList(vo);
		model.addAttribute("qnaList", qnaList);
		return "/WEB-INF/user/qnaList.jsp";
	}

	@RequestMapping("/qnaListMy.ko")
	public String qnaListMy(HttpSession session, QnaVO vo,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		if (session.getAttribute("userID") == null) {
			return "redirect:main.ko";
		}
		String q_writer = (String) session.getAttribute("userID");
		vo.setQ_writer(q_writer);
		int currPageNo = 0;
		int range = 0;
		int totalCnt = qnaService.qnaMyTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		model.addAttribute("paginationMy", vo);

		List<QnaVO> qnaList = qnaService.qnaListMy(vo);
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
	public String adminLoginPage(HttpSession session) {
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				return "redirect:adminOrderList.ko";
			}
		}
		return "/WEB-INF/admin/adminLogin.jsp";
	}

	// 검색기능을 위한 모델 어트리뷰트
	@ModelAttribute("conditionMapQNA")
	public Map<String, String> searchConditionMapQNA() {
		Map<String, String> conditionMapQNA = new HashMap<String, String>();
		conditionMapQNA.put("카테고리", "q_cate");
		conditionMapQNA.put("상태", "q_state");
		conditionMapQNA.put("제목", "q_title");
		conditionMapQNA.put("작성자", "q_writer");
		return conditionMapQNA;
	}

	@RequestMapping("/adminQnaList.ko")
	public String adminqnaList(QnaVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "q_cate", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = qnaService.qnaTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getQ_title() == null)
			vo.setQ_title("");
		model.addAttribute("pagination", vo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);

		List<QnaVO> qnaList = qnaService.qnaList(vo);
		model.addAttribute("qnaList", qnaList);
		return "/WEB-INF/admin/adminQna.jsp";
	}

	@RequestMapping("/adminOrderList.ko")
	public String adminOrderList(OrderVO vo,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

		int currPageNo = 0;
		int range = 0;
//		int totalCnt = orderService.orderTotalCnt(vo);
		int totalCnt = orderService.adminOrderRepeatCount(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		model.addAttribute("pagination", vo);

		List<OrderVO> adminOrderList = orderService.adminOrderList(vo);
		List<OrderVO> adminOrderRepeat = orderService.adminOrderRepeat(vo);

		for (int i = 0; i < adminOrderRepeat.size(); i++) {
			int a = 0;
			for (int j = 0; j < adminOrderList.size(); j++) {
				int total = adminOrderList.get(j).getO_total();
				if (adminOrderRepeat.get(i).getO_no().equals(adminOrderList.get(j).getO_no())) {
					a += total;
				}
			}
			adminOrderRepeat.get(i).setO_total(a);
		}

		model.addAttribute("adminOrderRepeat", adminOrderRepeat);
		model.addAttribute("adminOrderList", adminOrderList);

		return "/WEB-INF/admin/adminOrderList.jsp";
	}

	@GetMapping("/adminOrderDetail.ko")
	@ResponseBody
	public Object adminOrderDetail(@RequestParam(value = "o_no") String o_no, @RequestParam(value = "p_no") String p_no,
			Model model) {
		OrderVO vo = new OrderVO();
		vo.setP_no(p_no);
		vo.setO_no(o_no);
		vo = orderService.adminOrderDetail(vo);
		model.addAttribute("adminOrderDetail", vo);
		return vo;
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
		conditionMapProd.put("제조사", "pmade");
		conditionMapProd.put("상품번호", "pno");
		conditionMapProd.put("주종", "ptype");
		return conditionMapProd;
	}

	@RequestMapping("/adminProdList.ko")
	public String adminProdList(ProdVO vo, Model model,
			@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String searchKeyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodService.prodTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getP_name() == null) {
			vo.setP_name("");
		}
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			model.addAttribute("searchKeyword", searchKeyword);
			vo.setSearchKeyword(searchKeyword);
			System.out.println("searchKeyword : " + searchKeyword);
		}

		if (searchCondition != null && !searchCondition.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			vo.setSearchCondition(searchCondition);
			System.out.println("searchCondition : " + searchCondition);
		}

		List<ProdVO> adminProdList = prodService.prodList(vo);
		model.addAttribute("pagination", vo);
		model.addAttribute("adminProdList", adminProdList);
		System.out.println(adminProdList);
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
		vo.setP_no(pno);
		vo.setEditfile(editFilename);

		File file = new File(realPathJSP);
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
			return "redirect:adminProdList.ko";
		} else {
			System.out.println("등록실패");
			return "redirect:adminProdList.ko";
		}

	}

	@RequestMapping("/adminProdUpdate.ko")
	public String adminProdUpdate(ProdVO vo) throws IllegalStateException, IOException {
		// 기존 상품정보
		ProdVO oldvo = prodService.prodOne(String.valueOf(vo.getP_no()));

		// 기존 상품 상세페이지jsp파일
		File oldFile = new File(realPathJSP + oldvo.getEditfile());
		// 기존 상품 이미지파일
		File oldImg = new File(realPath + oldvo.getP_img());
		System.out.println("옛날 파일 경로,이름:" + oldFile);
		System.out.println("옛날 사진 경로,이름:" + oldImg);
		System.out.println("업데이트할 vo :" + vo);

		MultipartFile uplodFile = vo.getUploadFile();
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!(uplodFile == null || uplodFile.isEmpty())) {
			oldImg.delete(); // 기존 이미지 삭제
			vo.setP_img(uplodFile.getOriginalFilename());
			uplodFile.transferTo(new File(realPath + vo.getP_img()));
		} else {
			vo.setP_img(oldvo.getP_img());
		}

		// 기존 상품페이지jsp파일 삭제
		if (oldFile.exists()) {
			oldFile.delete(); // 파일 삭제
			System.out.println("기존 상세페이지jsp 삭제");
		}

		int pno = oldvo.getP_no();
		String editFilename = "pno" + pno + ".jsp";
		vo.setEditfile(editFilename);

		File file = new File(realPathJSP);
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
		int cnt = prodService.updateProduct(vo);

		if (cnt > 0) {
			System.out.println("수정완료");
			return "redirect:adminProdList.ko";
		} else {
			System.out.println("수정실패");
			return "redirect:adminProdList.ko";
		}

	}

	@RequestMapping("/adminProdDelete.ko")
	public String adminProdDelete(@RequestParam("p_no") String p_no) throws IllegalStateException, IOException {
		// 기존 상품정보
		ProdVO oldvo = prodService.prodOne(p_no);

		// 기존 상품 상세페이지jsp파일
		File oldFile = new File(realPathJSP + oldvo.getEditfile());
		// 기존 상품 이미지파일
		File oldImg = new File(realPath + oldvo.getP_img());

		if (oldFile.exists()) {
			oldImg.delete(); // 기존 이미지 있으면 삭제
			System.out.println("기존 이미지 삭제");
		}

		// 기존 상품페이지jsp파일 삭제
		if (oldFile.exists()) {
			oldFile.delete(); // 상세페이지jsp 있으면 삭제
			System.out.println("기존 상세페이지jsp 삭제");
		}

		int cnt = prodService.deleteProduct(p_no);

		if (cnt > 0) {
			System.out.println("삭제완료");
			return "redirect:adminProdList.ko";
		} else {
			System.out.println("삭제실패");
			return "redirect:adminProdList.ko";
		}

	}

	// 관리자 회원 목록 (+ select option)
	@RequestMapping("/getUserList.ko")
	@ResponseBody
	public ModelAndView getUserList(@ModelAttribute("searchWord") String searchWord,
			@ModelAttribute("searchVoca") String searchVoca,
			@ModelAttribute("selectedStateValue") String selectedStateValue,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, ModelAndView mav,
			HttpSession session) {

		UsersVO vo = new UsersVO();

		int currPageNo = 0;
		int range = 0;
		System.out.println("searchVoca: " + searchVoca);
		System.out.println("searchWord: " + searchWord);

		if (searchWord != null && !searchWord.isEmpty()) {
			vo.setSearchWord(searchWord);
		}
		if (searchVoca != null && !searchVoca.isEmpty()) {
			vo.setSearchVoca(searchVoca);
		}

		int totalCnt = usersService.userTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.setSearchVoca(searchVoca);
		vo.setSearchWord(searchWord);
		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getU_id() == null)
			vo.setU_id("");

		System.out.println("searchVoca111: " + searchVoca);

		if (orderBy == null) {
			// orderBy가 null일 때만 selectedStateValue를 기반으로 orderBy를 설정합니다.
			if (selectedStateValue != null) {
				System.out.println("orderBy0: " + orderBy);
				if (selectedStateValue.equals("1")) {
					System.out.println("orderBy1: " + orderBy);
					orderBy = "1";
				} else if (selectedStateValue.equals("0")) {
					orderBy = "0";
					System.out.println("orderBy2: " + orderBy);
				}
			}
		}
		vo.setOrderBy(orderBy);
		System.out.println("orderBy3: " + orderBy);
		System.out.println("토탈카운트: " + totalCnt);
		System.out.println("페이징: " + vo);

		List<UsersVO> userList = usersService.getUserList(vo);
		mav.addObject("pagination", vo);
		mav.addObject("userList", userList);
		mav.addObject("state", selectedStateValue);
		mav.addObject("voca", searchVoca);
		mav.addObject("word", searchWord);
		mav.setViewName("WEB-INF/admin/adminMemberList.jsp");
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
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		model.addAttribute("pagination", vo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);

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
		conditionMapRev.put("작성자", "unick");
		return conditionMapRev;
	}

	// 마이페이지 -> 탈퇴 안내페이지로 이동
	@RequestMapping("/delAcc.ko")
	public String delAcc(UsersVO vo) {
		return "/WEB-INF/login/delAccountInfo.jsp";
	}

	// 탈퇴 안내페이지 -> 비번 확인 페이지로(비번 확인 후 탈퇴)
	@RequestMapping("/delConfirm.ko")
	public String delConfirm(UsersVO vo) {
		return "/WEB-INF/login/delAccount.jsp";
	}

	@GetMapping("/adminChartData.ko")
	@ResponseBody
	public List<OrderVO> getChartData() {
		System.out.println("요청받음");
		int limit = 5;
		List<OrderVO> chartResult = orderService.chartResult(limit);
		System.out.println("차트 데이터 \n" + chartResult);
		return chartResult;
	}

	@RequestMapping("/adminChart.ko")
	public String adminChart() {
		return "WEB-INF/admin/adminChart.jsp";
	}

}
