package com.drink.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drink.ko.CartService;
import com.drink.ko.ProdService;
import com.drink.ko.UsersService;
import com.drink.ko.vo.CartVO;
import com.drink.ko.vo.ProdVO;
import com.drink.ko.vo.UsersVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private ProdService prodService;

	@RequestMapping("/myCartList.ko")
	public String myCartList() {
		return "/WEB-INF/user/myCartList.jsp";
	}

	// 내 장바구니 리스트 불러오기
	@RequestMapping("/cartSelect.ko")
	@ResponseBody
	public List<CartVO> selectCart(@RequestParam("u_id") String u_id) {
		System.out.println("컨트롤러 진입");
		CartVO vo = new CartVO();
		vo.setU_id(u_id);
		List<CartVO> cartlist = cartService.selectList(vo);
		return cartlist;
	}

	// 장바구니 추가
	@RequestMapping("/cartinsert.ko")
	public String insertcart(CartVO vo) {
		System.out.println("controller 진입");
		cartService.insertCart(vo);
		return "prodOne.ko?p_no=" + vo.getP_no();
	}

	// ======================== 수정부분 ==========================
	// 장바구니 중복값 추가
	@RequestMapping(value = "/selectcount.ko", produces = "application/json")
	@ResponseBody
	public Map<String, Object> selectCount(@RequestBody Map<String, String> requestData) {
		String productno = requestData.get("p_no");
		String userid = requestData.get("u_id");
		System.out.println("장바구니 컨트롤러 진입");
		System.out.println("컨트롤러 상품번호 값 확인 : " + productno);
		System.out.println("컨트롤러 u_id 값 확인 : " + userid);
		Map<String, String> params = new HashMap<>();
		params.put("u_id", userid);
		params.put("p_no", productno);
		CartVO cartDetails = cartService.selectCart(params);

		Map<String, Object> response = new HashMap<>();
		if (cartDetails != null && cartDetails.getU_id() != null && userid.equals(cartDetails.getU_id())) {
			System.out.println("이미 존재하는 상품 !");
			response.put("code", "no");
			response.put("c_stock", cartDetails.getC_stock());
			response.put("c_total", cartDetails.getC_total());
		} else {
			response.put("code", "ok");
		}

		return response;
	}

	// ======================== 수정부분 ==========================
	// 장바구니 삭제
	@PostMapping("/cartdelete.ko")
	public String deleteCart(@RequestBody Map<String, Object> requestData) {
		List<String> productNos = (List<String>) requestData.get("p_no");
		String u_id = (String) requestData.get("u_id");
		System.out.println("삭제 컨트롤러 진입: userID = " + u_id);

		for (String productNo : productNos) {
			System.out.println("상품번호값: " + productNo);
			CartVO vo = new CartVO();
			vo.setP_no(Integer.parseInt(productNo.trim()));
			vo.setU_id(u_id);
			cartService.deleteCart(vo);
		}
		return "redirect:/myCartList.ko";
	}

	// 장바구니 변경
	@PostMapping("/cartupdate.ko")
	public ResponseEntity<?> updateCart(@RequestBody CartVO vo) {
		System.out.println("업데이트할 상품 정보 : " + vo);
		try {
			cartService.updateCart(vo);
			return ResponseEntity.ok("변경 성공");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("오류 발생");
		}
	}

	// 상품재고 확인
	@RequestMapping(value = "/stockcheck.ko", produces = "application/json")
	@ResponseBody
	public Map<String, Object> stockchk(@RequestBody Map<String, Integer> request) {
		System.out.println("재고수량 컨트롤러 진입");
		int p_no = request.get("p_no");
		System.out.println("값 확인 : " + p_no);
		ProdVO product = prodService.prodStock(p_no);
		System.out.println("상품재고 : " + product.getP_stock());
		Map<String, Object> response = new HashMap<>();
		response.put("p_stock", product.getP_stock());
		return response;

	}

	// navbar 카트이미지 숫자표시
	@RequestMapping(value = "/cartSelectCount.ko", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Integer> cartSelectCount(@RequestBody CartVO vo) {
		String u_id = vo.getU_id();
		System.out.println("장바구니 목록 조회 u_id = " + u_id);
		int count = cartService.cartSelectCount(u_id);
		System.out.println("값 확인 : " + u_id + ", " + count);
//	      Map<String, Integer> response = new HashMap<>();
//	      response.put("count", count);
		return ResponseEntity.ok(count);
	}

	@RequestMapping("/orderNoCreate.ko")
	@ResponseBody
	public String orderNoCreate() {
		return cartService.orderNoCreate();
	}

	// 장바구니에서 주문
	@RequestMapping("/order.ko")
	@ResponseBody
	public Map<String, Object> order(@RequestBody List<Integer> productNos, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int price = 0;
		String id = (String) session.getAttribute("userID");
		String p_name = "";
		String p_no = "";
		String addr = "";
		String stock = "";
		UsersVO users = new UsersVO();
		users = usersService.checkId(id);
		addr += users.getAddr1() + " " + users.getAddr2() + " " + users.getAddr3();

		for (int i = 0; i < productNos.size(); i++) {
			if (i == productNos.size() - 1) {
				CartVO vo = new CartVO();
				vo.setP_no(productNos.get(i));
				vo.setU_id(id);
				vo = cartService.selectOrder(vo);
				p_name += vo.getP_name();
				p_no += vo.getP_no();
				price += vo.getC_total();
				stock += vo.getC_stock();
			} else {
				CartVO vo = new CartVO();
				vo.setP_no(productNos.get(i));
				vo.setU_id(id);
				vo = cartService.selectOrder(vo);
				p_name += vo.getP_name() + ",";
				p_no += vo.getP_no() + ",";
				price += vo.getC_total();
				stock += vo.getC_stock() + ",";

			}
		}
		
		if(users.getU_lev().equals("다이아")) {
			int dc = (int)Math.floor(price * 0.1);
			price = price - dc;
		} else if (users.getU_lev().equals("골드")) {
			int dc = (int)Math.floor(price * 0.05);
			price = price - dc;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("user", users);
		map.put("p_name", p_name);
		map.put("p_no", p_no);
		map.put("price", price);
		map.put("addr", addr);
		map.put("c_stock", stock);

		return map;
	}
}
