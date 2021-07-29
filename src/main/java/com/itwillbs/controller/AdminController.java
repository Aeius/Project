package com.itwillbs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderDetailBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.OrderDetailService;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.ProductService;

@Controller
public class AdminController {

	@Inject
	private AdminService adminService;

	@Inject
	private OrderService orderService;

	@Inject
	private OrderDetailService orderDetailService;

	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private FaqBoardService faqBoardService;
	
	@Resource(name = "uploadPath") //=> servlet-context.xml 에 업로드 폴더 경로 지정된거 불러옴
	private String uploadPath; // 파일 업로드 경로

	// ------------------ 상품등록 ---------------------
	@RequestMapping(value = "/productAdd.ad", method = RequestMethod.GET)
	public String productAdd() {
		return "/AdminLTE-master/pages/productAdd";
	}
	@RequestMapping(value = "/productAddPro.ad", method = RequestMethod.POST)
	public String productAddPro(MultipartHttpServletRequest request, @RequestParam MultipartFile[] file) throws Exception {
							// 여러 파일 MultipartHttpServletRequest, @RequestParam MultipartFile[] 배열
		UUID uid = UUID.randomUUID(); // 랜덤문자열
		String saveName = ""; // upload 폴더에 저장되는 파일명
		
		// ProductBean에 입력값 담기
		ProductBean productBean = new ProductBean();
		productBean.setProduct_name(request.getParameter("product_name"));
		productBean.setProduct_detail(request.getParameter("product_detail"));
		productBean.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		productBean.setProduct_size(Integer.parseInt(request.getParameter("product_size")));
		productBean.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));
		// 체크박스 다중값 담기
		String[] category = request.getParameterValues("product_category");
		String selectedCategory = "";
		for(int i=0; i<category.length; i++) { // 체크한 갯수만큼 반복
			 selectedCategory += category[i] + "/"; // => "/"기호로 구분
		}
		productBean.setProduct_category(selectedCategory);
		// 파일 담기
		for(int i=0; i<file.length; i++) { // 파일 갯수만큼 반복
			// 저장되는 파일명 = 랜덤문자열_원래파일이름 => 같은 상품은 같은 랜덤문자열 
													//=> for문 안에서 UUID 선언시 각 파일마다 랜덤문자열 달라짐
			saveName = uid.toString() + "_" + file[i].getOriginalFilename(); 
			
			// upload 폴더로 복사 => webapp > resources > upload 폴더 있어야함
			File target = new File(uploadPath, saveName);
			FileCopyUtils.copy(file[i].getBytes(), target);
			
			// jsp 파일 폼 태그 순서대로 저장됨
			if(i==0) { // 첫번째 파일 = 메인 이미지
				productBean.setProduct_main_image(saveName);
			} else if(i==1) { // 두번째파일 = 디테일 이미지
				productBean.setProduct_detail_image(saveName);
			}
		}
		
		productService.insertProduct(productBean); // adminService -> productService 로 변경했음
		
		return "redirect:/productList.ad";
	}

	// ------------------ 상품목록 ---------------------
	@RequestMapping(value = "/productList.ad", method = RequestMethod.GET)
	public String productList(Model model) {
		ArrayList<ProductBean> allList = productService.getProductAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/productList";
	}
	
	// ------------------ 상품판매개시 ---------------------
	@RequestMapping(value = "/productReleasePro.ad", method = RequestMethod.GET)
	public String productReleasePro(HttpServletRequest request) {
		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
		productService.setStatusRelease(product_idx);
		return "redirect:/productList.ad";
	}
	
	// ------------------ 상품판매중단 ---------------------
	@RequestMapping(value = "/productDiscontinuePro.ad", method = RequestMethod.GET)
	public String productDiscontinuePro(HttpServletRequest request) {
		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
		productService.setStatusDiscontinue(product_idx);
		return "redirect:/productList.ad";
	}
	
	// ------------------ 상품수정 ---------------------
	@RequestMapping(value = "/productUpdate.ad", method = RequestMethod.GET)
	public String productUpdate(HttpServletRequest request, Model model) {
		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
		ProductBean productBean = productService.getProductInfo(product_idx);
		model.addAttribute("productBean", productBean);
		return "/AdminLTE-master/pages/productUpdate";
	}
	@RequestMapping(value = "/productUpdatePro.ad", method = RequestMethod.POST)
	public String productUpdatePro(MultipartHttpServletRequest request, @RequestParam MultipartFile[] file) throws Exception {
		
		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
		ProductBean productBean = productService.getProductInfo(product_idx); // 기존 정보 불러옴
		
		productBean.setProduct_name(request.getParameter("product_name"));
		productBean.setProduct_detail(request.getParameter("product_detail"));
		productBean.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		productBean.setProduct_size(Integer.parseInt(request.getParameter("product_size")));
		productBean.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));

		String[] category = request.getParameterValues("product_category");
		String selectedCategory = "";
		for(int i=0; i<category.length; i++) {
			 selectedCategory += category[i] + "/";
		}
		productBean.setProduct_category(selectedCategory);

		UUID uid = UUID.randomUUID(); 
		String saveName = ""; 
		for(int i=0; i<file.length; i++) {
			if(file[i].getOriginalFilename()=="") { //파일 미선택시
				continue; // 변경안하고 넘어감 (기존 파일 유지)
			} else { // 파일 선택시
				saveName = uid.toString() + "_" + file[i].getOriginalFilename(); 
				File target = new File(uploadPath, saveName);
				FileCopyUtils.copy(file[i].getBytes(), target);
				if(i==0) { // 첫번째 파일 = 메인 이미지
					productBean.setProduct_main_image(saveName);
				} else if(i==1) { // 두번째파일 = 디테일 이미지
					productBean.setProduct_detail_image(saveName);
				}
			}
		}
		
		productService.updateProduct(productBean);
		
		return "redirect:/productList.ad";
	}

	// ------------------ 주문목록 ---------------------
	@RequestMapping(value = "/orderList.ad", method = RequestMethod.GET)
	public String orderList(Model model) {
		ArrayList<OrderBean> allList = orderService.getOrderAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/orderList";
		// insert into orderlist
		// values(null,'one@naver.com','홍길동','010-1234-1234',14243,'주소','무슨동','몇호',50000,0,0,'배송중','2021-07-22','무통장',5837573);
		// 'one@naver.com' 부분에는 본인 DB에 있는 회원아이디 넣어야 합니다!
	}

	// ------------------ 주문상세 ---------------------
	@RequestMapping(value = "/orderDetail.ad", method = RequestMethod.GET)
	public String orderDetail(Model model, HttpServletRequest request) {

		int order_idx = Integer.parseInt(request.getParameter("order_idx"));

		OrderBean orderBean = orderService.getOrderInfo(order_idx); // orderBean에 주문 정보 받아오기
		
		// OrderDetailBean에 주문번호, 상품번호, 개수 받아오기 (같은 주문번호에 여러 상품 주문 가능 -> 리스트 사용) 
		ArrayList<OrderDetailBean> orderProductList = orderDetailService.getOrderProductList(order_idx);

		ArrayList<ProductBean> orderProductInfo = new ArrayList<ProductBean>(); // 상품번호를 통해 해당 상품 정보를 가져옴
		for (OrderDetailBean bean : orderProductList) {
			ProductBean productBean = productService.getProductInfo(bean.getOrder_detail_product_idx()); // 상품 정보 받아오기
			orderProductInfo.add(productBean); // 리스트에 추가
		}

		model.addAttribute("orderBean", orderBean);
		model.addAttribute("orderProductList", orderProductList);
		model.addAttribute("orderProductInfo", orderProductInfo);

		return "/AdminLTE-master/pages/orderDetail";
	}

	// ------------------ 주문 상태 변경 ---------------------
	@RequestMapping(value = "/orderStatusChange.ad", method = RequestMethod.POST)
	public String orderStatusChange(HttpServletRequest request) {

		int order_idx = Integer.parseInt(request.getParameter("idx"));
		String order_status = request.getParameter("status");

		OrderBean orderBean = orderService.getOrderInfo(order_idx);
		orderBean.setOrder_status(order_status);
		if(order_status.equals("주문취소")) {
			orderService.sendEmail(orderBean); // 메일 발송
		}

		orderService.updateOrderStatus(orderBean);

		return "redirect:/orderList.ad";
	}

	// ------------------ 관리자 로그아웃 ------------------------
	@RequestMapping(value = "/logout.ad", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/dailyShop/member/index";
	}
	
	// ------------------ 관리자 메인페이지 이동 ------------------------
	@RequestMapping(value = "/index.sh", method = RequestMethod.GET)
	public String index(HttpSession session) {
		//세션 값가져오기
		String member_email=(String)session.getAttribute("member_email");
		return "/dailyShop/member/index";
	}
	
	// ------------------ 회원관리 > 전체회원 ----------------------
	@RequestMapping(value = "/memberList.ad", method = RequestMethod.GET)
	public String memberList(HttpSession session, Model model) {
		//  member정보 전체를 조회
		List<MemberBean> mbList=memberService.getMemberList();
		//Model mbList,mbList 데이터 담아 가기
		model.addAttribute("mbList", mbList);
		return "/AdminLTE-master/pages/memberList";
	}
	
	// ------------------ 회원관리 > 구독자 ---------------------
//		@RequestMapping(value = "/subscribeList.ad", method = RequestMethod.GET)
//		public String subscribeList(HttpSession session, Model model) {
//			//  member정보 전체를 조회
//			List<MemberBean> mbList=memberService.getMemberList();
//			//Model mbList,mbList 데이터 담아 가기
//			model.addAttribute("mbList", mbList);
//			return "/AdminLTE-master/pages/subscribeList";
//		}
	
	// ------------------ 공지관리 > FAQ 등록 ------------------
	@RequestMapping(value = "/faqWrite.ad", method = RequestMethod.GET)
	public String faqWrite() {
		//  /WEB-INF/views/pages/faqWrite.jsp 이동
		return "/AdminLTE-master/pages/faqWrite";
	}
	
	@RequestMapping(value = "/board/faqWritePro", method = RequestMethod.POST)
	public String faqWritePro(FaqBoardBean fbb) {
		// 글쓰기 메서드 호출
		faqBoardService.insertfaqBoard(fbb);
		//  /board/list 가상주소 이동
		return "redirect:/faqList.ad";
	}

	// ------------------ 매출 조회 ---------------------
	@RequestMapping(value = "/chartList.ad", method = RequestMethod.GET)
	public String chartList(Model model) {
		ArrayList<ProductBean> allList = productService.getProductAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/chartList";
	}

	// ------------------ 매출 차트(메인화면) ---------------------
	@RequestMapping(value = "/chart.ad", method = RequestMethod.GET)
	public String chart() {
		// 차트 아직 구현 안됨 (이동 확인용)
		return "/AdminLTE-master/pages/chart";
	}

	// ------------------ 공지사항 등록 ---------------------
	@RequestMapping(value = "/noticeWrite.ad", method = RequestMethod.GET)
	public String noticeWrite() {
		return "/AdminLTE-master/pages/noticeWrite";
	}

	@RequestMapping(value = "/noticeWritePro.ad", method = RequestMethod.POST)
	public String noticeWritePro(NoticeBean noticeBean) {
//		System.out.println(noticeBean.getNotice_name().toString());
//		System.out.println(noticeBean.getNotice_subject().toString());
//		System.out.println(noticeBean.getNotice_content().toString());

		adminService.insertNotice(noticeBean);
		return "redirect:/noticeList.ad";
	}
	// pages/noticeWrite.jsp -> input 태그 hidden 속성으로 notice_name = "관리자" 들어가 있습니다.

	// ------------------ 공지사항 목록 출력 ---------------------
	@RequestMapping(value = "/noticeList.ad", method = RequestMethod.GET)
	public String NoticeList(HttpSession session, Model model) {

		List<NoticeBean> nb = adminService.getNoticeList();
		model.addAttribute("NoticeList", nb);
		return "/AdminLTE-master/pages/noticeList";
	}

	// ------------------ 공지사항 삭제 ---------------------
	@RequestMapping(value = "/deleteNoticePro.ad", method = RequestMethod.GET)
	public String deleteNoticePro(HttpServletRequest request) {
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		adminService.deleteNotice(notice_idx);
		return "redirect:/noticeList.ad";
	}

	// ------------------ 공지사항 상세 조회 및 수정(미완성) ---------------------
	@RequestMapping(value = "/noticeInfo.ad", method = RequestMethod.GET)
	public String noticeInfo(Model model, HttpServletRequest request) {

		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		NoticeBean nb = adminService.getNotice(notice_idx);
		model.addAttribute("nb", nb);
		// System.out.println(notice_idx);
		return "/AdminLTE-master/pages/noticeInfo";
	}

	@RequestMapping(value = "/noticeUpdate.ad", method = RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request) {
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		NoticeBean nb = adminService.getNotice(notice_idx); // idx로 기존 정보 가져오기

		nb.setNotice_subject(request.getParameter("notice_subject")); // 수정된 제목
		nb.setNotice_content(request.getParameter("notice_content")); // 수정된 내용
//	      System.out.println(nb.getNotice_subject());
//	      System.out.println(nb.getNotice_content());

		adminService.noticeUpdate(nb);
		return "redirect:/noticeList.ad";
	}

	// ------------------ 리뷰 목록 출력 ---------------------
	@RequestMapping(value = "/reviewList.ad", method = RequestMethod.GET)
	public String reviewList(HttpSession session, Model model) {
		List<ReviewBean> review = adminService.getReviewList();
		model.addAttribute("review", review);
		return "/AdminLTE-master/pages/reviewList";
	}

	// ------------------ 리뷰 삭제 ------------------------
		@RequestMapping(value = "/deleteReview.ad", method = RequestMethod.GET)
		public String deleteReview(HttpServletRequest request) {
			int review_idx = Integer.parseInt(request.getParameter("review_idx"));
//			System.out.println(review_idx);
			adminService.deleteReview(review_idx);
			return "redirect:/reviewList.ad";
		}

	// ------------------ 쿠폰 목록 ------------------------
	@RequestMapping(value = "/couponList.ad", method = RequestMethod.GET)
	public String couponList(HttpServletRequest request, Model model) {
		List<CouponBean> coupon = adminService.getCouponList();
		model.addAttribute("coupon", coupon);
		return "/AdminLTE-master/pages/couponList";
	}

	// ------------------ 쿠폰 만료, 재활성화 ------------------------
	@RequestMapping(value = "/expireCoupon.ad", method = RequestMethod.GET)
	public String expireCoupon(HttpServletRequest request) {
		int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
//		System.out.println(coupon_idx);
		adminService.expireCoupon(coupon_idx); // coupon_idx 추출 테스트
		return "redirect:/couponList.ad";
	}

	@RequestMapping(value = "/unexpireCoupon.ad", method = RequestMethod.GET)
	public String unexpireCoupon(HttpServletRequest request) {
		int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
//		System.out.println(coupon_idx);
		adminService.unexpireCoupon(coupon_idx); // coupon_idx 추출 테스트
		return "redirect:/couponList.ad";
	}

	// ------------------ 쿠폰 등록 ---------------------
	@RequestMapping(value = "/couponAdd.ad", method = RequestMethod.GET)
	public String couponAdd() {
		return "/AdminLTE-master/pages/couponAdd";
	}

	@RequestMapping(value = "/couponAddPro.ad", method = RequestMethod.POST)
	public String couponAddPro(CouponBean couponBean) {

		adminService.couponAddPro(couponBean);
		return "redirect:/couponList.ad";
	}
}






