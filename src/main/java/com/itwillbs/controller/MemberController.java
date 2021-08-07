package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.WishListService;

@Controller
public class MemberController {
	// 부모인터페이스 변수 => 멤버변수 정의 => 객체생성 자동
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;

	@Inject
	private WishListService wishListService;

//	가상주소  http://localhost:8080/myweb2/member/insert
	//---------------------------------------------------------------  메인 페이지 ------------------------------------------------------------
	@RequestMapping(value = "/main.sh", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		
		// 각 상품에 따른 좋아요 여부 체크
		ArrayList<WishListBean> checkHeart = null;
		if(session.getAttribute("member_email") != null){
			String member_email = (String)session.getAttribute("member_email");
			checkHeart = wishListService.checkHeart(member_email);
		}
		
		model.addAttribute("checkHeart" ,checkHeart);
		
		ArrayList<ProductBean> bestList = productService.getProductBestList();
		//Model mb.mb 데이터 담아 가기
		model.addAttribute("bestList" , bestList);
		return "/dailyShop/member/index";
	}
		
	//---------------------------------------------------------------  로그인 ------------------------------------------------------------
	@RequestMapping(value = "/login.sh", method = RequestMethod.GET)
	public String login() {
		return "/dailyShop/member/login";
	}
	
	@RequestMapping(value = "/loginPro.sh", method = RequestMethod.POST)
	public String loginPro(MemberBean mb, HttpSession session, Model model) {
		
		MemberBean mb2=memberService.userCheck(mb);
		if(mb2!=null) {
			session.setAttribute("member_email", mb.getMember_email());
		}else {
			model.addAttribute("msg","Email이나 비밀번호가 일치하지 않습니다.");

			return "/dailyShop/member/msg";

		}
		return "redirect:/";
	}
	
	//--------------------------------------------------------------- 내 정보 확인 전 비밀번호 입력 ------------------------------------------------------------
	@RequestMapping(value = "/userCheck.sh", method = RequestMethod.GET)
	public String passwordCheck() {
		return "/dailyShop/member/passwordCheck";
	}
	
	//---------------------------------------------------------------  비밀번호 확인 ------------------------------------------------------------
	@RequestMapping(value = "/passwordCheck.sh", method = RequestMethod.POST)
	public String passwordCheck(MemberBean memberBean, HttpSession session, Model model) {
		
		// 이메일 정보 가져오기
		String member_email = (String)session.getAttribute("member_email");
		memberBean.setMember_email(member_email);
		
		// user Check
		MemberBean memberBean2 = memberService.userCheck(memberBean);
		
		// 비밀번호 일치하지 않을 때
		if(memberBean2 == null) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			return "/dailyShop/member/msg";
		} else {
			boolean passwordCheck = true;
			session.setAttribute("passwordCheck", passwordCheck);
		}
		return "redirect:/myPage.sh";
	}	
	
	//---------------------------------------------------------------  내 정보 & 수정 ------------------------------------------------------------
	@RequestMapping(value = "/myPage.sh", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		
		// 비밀번호 확인 안했을 때 비밀번호 확인 페이지로 이동
		if(session.getAttribute("passwordCheck") == null) {
			return "redirect:/userCheck.sh";
		} else {
			// 세션값 삭제
			session.removeAttribute("passwordCheck");
		}
		System.out.println(session.getAttribute("passwordCheck"));
		
		String member_email = (String)session.getAttribute("member_email");
		MemberBean memberBean = memberService.getMember(member_email);
		model.addAttribute("member", memberBean);
		return "/dailyShop/member/updateForm";
	}
	
	@RequestMapping(value = "/updatePro.sh", method = RequestMethod.POST)
	public String updatePro(MemberBean memberBean, Model model) {
		memberService.updateMember(memberBean);
		return "redirect:/myPage.sh";
	}
	
	//---------------------------------------------------------------  회원가입 ------------------------------------------------------------
	@RequestMapping(value = "/account.sh", method = RequestMethod.GET)
	public String account() {
		//  /WEB-INF/views/member/insertForm.jsp 이동
		return "/dailyShop/member/account";
	}
	
	@RequestMapping(value = "/memberJoinPro.sh", method = RequestMethod.POST)
	public String memberJoinPro(MemberBean memberBean, HttpServletResponse response) {
		// 의존관계 주입(DI) :스프링에서 객체생성 방식
		// root-context.xml에서 MemberServiceImpl을 객체생성 
		// 필요로 하는 MemberController에 set메서드 통해서 
		// MemberService memberService 부모인터페이스 멤버변수 전달(주입)
		
//		MemberService memberService=new MemberServiceImpl();
		// 회원가입 메서드 호출
		String mailAddress = memberBean.getMember_email();
		String domain = memberBean.getMember_email2();
		
//		System.out.println(memberBean.getMember_email());
//		System.out.println(memberBean.getMember_email2());
		String member_email = mailAddress + domain;
//		System.out.println(member_email);
		
		memberBean.setMember_email(member_email);
		boolean isRegisted = memberService.insertMember(memberBean);
		if(isRegisted) {
			return "redirect:/welcomeMail.sh/" + memberBean.getMember_email();
		}
		//  /member/login 가상주소 이동
		return "redirect:/login.sh";
	}

	//-----------------------------------------------------------------  회원삭제 ----------------------------------------------------
	@RequestMapping(value = "/delete.sh", method = RequestMethod.GET)
	public String delete() {
		return "/dailyShop/member/deleteForm";
	}
	
	@RequestMapping(value = "/deletePro.sh", method = RequestMethod.POST)
	public String deletePro(MemberBean memberBean, HttpSession session, Model model) {
	
		MemberBean memberBean2 = memberService.userCheck(memberBean);
		
		if(memberBean2!=null) {
//			System.out.println("memberController - deleteMember");
			memberService.deleteMember(memberBean);
			
			// 회원 탈퇴 후 세션값 초기화
			session.invalidate();
			return "redirect:/index.sh";
		}else {
	
			model.addAttribute("msg","입력하신 정보가 일치하지 않습니다.");
	
			return "dailyShop/member/msg";
		}
		
	}

	//----------------------------------------------계정/비밀번호 찾기 페이지로 이동--------------------------------------------------
	
	@RequestMapping(value = "/find.sh", method = RequestMethod.GET)
	public String find() {
		//  /WEB-INF/views/member/find.jsp 이동
		return "/dailyShop/member/find";
	}
	
	//----------------------------------------------아이디(이메일) 찾기-------------------------------------------------
	
	@RequestMapping(value = "/findEmail.sh", method = RequestMethod.POST)
	public String findEmail(MemberBean mb, HttpSession session, Model model) {
		String email= memberService.emailCheck(mb);
		System.out.println("memberController - findEmail");
		
		if(email != null) {
		//	session.setAttribute("member_email", mb.getMember_email());
			System.out.println("memberController - email: " + email);
			session.setAttribute("email", email);
			
		}else {
			model.addAttribute("msg","입력하신 정보와 일치하는 계정이 없습니다.");
			return "/dailyShop/member/msg";
		}
		return "/dailyShop/member/findEmailResult";
	}
	
	//----------------------------------------------비밀번호 찾기---------------------------------------------------------
	
	
	@RequestMapping(value = "/findPassword.sh", method = RequestMethod.POST)
	public String findPassword(MemberBean mb, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		//아이디, 이름, 연락처가 일치하는 비번이 있는지 체크하고 옴
		String password= memberService.passwordCheck(mb);
		System.out.println("memberController - 비번찾기 맵핑findPassword");
		 
		
		if(password != null) {
			//정보가 일치하는 계정이 있어서 이메일을 보낼 수 있음
			//System.out.println("쿼리구문 입력 확인 - 비번찾기");
			String member_email = request.getParameter("member_email");
			mb = memberService.getMemberByemail(member_email);
			//System.out.println("mb ---- " + mb);
			
			//----------비밀번호 찾기 이메일로 임시비번 발송 -----------
			// 임시 비밀번호 생성
			String tempPassword = "";
			for (int i = 0; i < 10; i++) {
				tempPassword += (char) ((Math.random() * 26) + 97);
				}
			System.out.println(tempPassword);
			//임시 비번을 MemberBean에 setter로 넣어줌.
		
			mb.setMember_password(tempPassword);
			System.out.println("member_password 삽입 성공");
			
			//임시 비밀번호를 새로운 비밀번호로 update시킴
			memberService.updateTempPassword(mb);
			
			//업데이트된 임시 비밀번호를 이메일로 발송함
			memberService.sendTempPassword(mb);
			
			model.addAttribute("msg","임시비밀번호를 이메일로 발급했습니다.");
			return "/dailyShop/member/msg";

		}else {
			model.addAttribute("msg","입력하신 정보와 일치하는 계정이 없습니다.");
			return "/dailyShop/member/msg";
		}
		
	}
	
	//-------------------------------------------------- 로그아웃-------------------------------------------------------
	
	@RequestMapping(value = "/logout.sh", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃 체크 ");
		session.invalidate();
		return "redirect:/main.sh";

	}

	//---------------------------------------------------------------  쿠폰 목록 조회 ------------------------------------------------------------
	@RequestMapping(value = "/coupon.sh", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		String member_email = (String)session.getAttribute("member_email");
		MemberBean memberBean = memberService.getMember(member_email);
		model.addAttribute("member", memberBean);
		ArrayList<CouponBean> couponInfoList = memberService.getMemberCouponList(member_email);
		model.addAttribute("couponInfoList", couponInfoList);
		return "/dailyShop/member/myCoupon";
	}
	
	//---------------------------------------------------------------  쿠폰 등록 ------------------------------------------------------------
	@RequestMapping(value = "/couponPro.sh", method = RequestMethod.POST)
	public String couponPro(HttpSession session, HttpServletRequest request, Model model) {
		// 입력 코드 가져오기 
		String inputCouponCode = request.getParameter("inputCouponCode");
		// 입력한 고객 email 가져오기 
		String member_email = (String)session.getAttribute("member_email");
		// registMemberCoupon() 메서드 호출
		boolean isRegisted = memberService.registMemberCoupon(inputCouponCode, member_email);
		// 리턴되는 결과에 따라 등록, 등록실패 판별 후 메세지 출력
		if(!isRegisted) {
			model.addAttribute("msg","쿠폰 등록 실패.");
			return "/dailyShop/member/msg";
		}
		return "redirect:/coupon.sh";
	}
	
	
	
	//---------------------------------------------------------------  가입 축하 메일 ------------------------------------------------------------
	@RequestMapping(value = "/welcomeMail.sh/{member_email}", method = RequestMethod.GET)
	public String welcomeMail(@PathVariable String member_email) {
		MemberBean memberBean = memberService.getMember(member_email);
		memberService.sendWelcomeMail(memberBean);
		return "redirect:/main.sh";
	}
	
	//---------------------------------------------------------------  비밀번호 변경 ------------------------------------------------------------
	@RequestMapping(value = "/changePassword.sh", method = RequestMethod.GET)
	public String changePassword() {
		
		return "/dailyShop/member/changePassword";
	}
	
	@RequestMapping(value = "/changePasswordPro.sh", method = RequestMethod.POST)
	public String changePasswordPro(HttpSession session, HttpServletRequest request, MemberBean memberBean, Model model) {
		// 입력한 고객 email 가져오기 
		String member_email = (String)session.getAttribute("member_email");
		memberBean.setMember_email(member_email);
		
		MemberBean memberBean2 = memberService.userCheck(memberBean);
		
		// 비밀번호 일치하지 않을 때
		if(memberBean2 == null) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			return "/dailyShop/member/msg";
		} else {
			String member_password_new = request.getParameter("member_password_new");
			memberBean.setMember_password(member_password_new);
			
			memberService.updatePassword(memberBean);
			
			model.addAttribute("msg","비밀번호가 변경되었습니다.");
			return "/dailyShop/member/msg";
		}
		
	}

}
