package com.drink.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.drink.ko.vo.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/myCartList.ko")
	public String myCartList() {
		return "/WEB-INF/user/MycartList.jsp";
	}
	
	@RequestMapping("/cartInsert.ko")
	public String cartInsert() {
		return "/WEB-INF/user/CartInsert.jsp";
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

	@RequestMapping(value = "/selectcount.ko", produces = "application/json")
	@ResponseBody
	public Map<String, Object> selectCount(@RequestBody Map<String, Integer> requestData) {
		int productno = requestData.get("p_no"); // JSON에서 productno 추출
		System.out.println("장바구니 컨트롤러 진입");
		System.out.println("상품번호 값 확인 : " + productno);
		CartVO cartDetails = cartService.selectCart(productno); // 수정된 서비스 호출

		Map<String, Object> response = new HashMap<>();
		if (cartDetails != null && cartDetails.getC_stock() > 0) {
			System.out.println("이미 존재하는 상품 !");
			response.put("code", "no");
			response.put("c_stock", cartDetails.getC_stock()); // 현재 수량 추가
			response.put("c_total", cartDetails.getC_total()); // 현재 총 가격 추가
		} else {
			response.put("code", "ok");
		}
		return response;
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

	// 장바구니 삭제
	@PostMapping("/cartdelete.ko")
	public String deleteCart(@RequestBody List<Integer> productNos) {
		System.out.println("삭제 컨트롤러 진입");
		for (int productno : productNos) {
			System.out.println("상품번호값: " + productno);
			CartVO vo = new CartVO();
			vo.setP_no(productno);
			cartService.deleteCart(vo);
		}
		return "redirect:myCartList.ko";
	}
}
