package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
	// 부모인터페이스 변수 => 멤버변수 정의 => 객체생성 자동
	@Inject
	private MemberService memberService;

//	가상주소  http://localhost:8080/myweb2/member/insert
		
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
			model.addAttribute("msg","입력하신 정보는 틀립니다.");
			return "dailyShop/member/msg";
		}
		return "redirect:/";
	}
	
	//---------------------------------------------------------------  내 정보 & 수정 ------------------------------------------------------------
	@RequestMapping(value = "/update.sh", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String member_email = (String)session.getAttribute("member_email");
		MemberBean memberBean = memberService.getMember(member_email);
		model.addAttribute("member", memberBean);
		return "/dailyShop/member/updateForm";
	}
	
	@RequestMapping(value = "/updatePro.sh", method = RequestMethod.POST)
	public String updatePro(MemberBean memberBean, Model model) {
		MemberBean memberBean2 = memberService.userCheck(memberBean);
		if(memberBean2 != null) {
			System.out.println("memberController - updateMember");
			memberService.updateMember(memberBean);
		}else {
			model.addAttribute("msg","입력하신 정보가 일치하지 않습니다.");
			return "dailyShop/member/msg";
		}
		return "redirect:/update.sh";
	}
	
	//---------------------------------------------------------------  회원가입 ------------------------------------------------------------
	@RequestMapping(value = "/account.sh", method = RequestMethod.GET)
	public String account() {
		//  /WEB-INF/views/member/insertForm.jsp 이동
		return "/dailyShop/member/account";
	}
	
	@RequestMapping(value = "/memberJoinPro.sh", method = RequestMethod.POST)
	public String memberJoinPro(MemberBean mb) {
		// 의존관계 주입(DI) :스프링에서 객체생성 방식
		// root-context.xml에서 MemberServiceImpl을 객체생성 
		// 필요로 하는 MemberController에 set메서드 통해서 
		// MemberService memberService 부모인터페이스 멤버변수 전달(주입)
		
//		MemberService memberService=new MemberServiceImpl();
		// 회원가입 메서드 호출
		memberService.insertMember(mb);
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
			System.out.println("memberController - deleteMember");
			memberService.deleteMember(memberBean);
			
			// 회원 탈퇴 후 세션값 초기화
			session.invalidate();
			return "redirect:/index.sh";
		}else {
	
			model.addAttribute("msg","입력하신 정보는 틀립니다.");
	
			return "dailyShop/member/msg";
		}
		
	}

	
	//---------------------------------------------------------------  쿠폰내역 ------------------------------------------------------------
	@RequestMapping(value = "/coupon.sh", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		String member_email = (String)session.getAttribute("member_email");
		ArrayList<CouponBean> couponInfoList = memberService.getCouponList(member_email);
		model.addAttribute("couponInfoList", couponInfoList);
		return "/dailyShop/member/myCoupon";
	}
	
	//----------------------------------------------계정찾기 페이지로 이동--------------------------------------------------
	
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
	
	

	
	
	//----------------------------------------------메인 페이지로 이동--------------------------------------------------
	
	@RequestMapping(value = "/main.sh", method = RequestMethod.GET)
	public String main() {
		//  /WEB-INF/views/member/main.jsp 이동
		return "/dailyShop/member/index";
	}
	
	
	//-------------------------------------------------- 로그아웃-------------------------------------------------------
	
	
	@RequestMapping(value = "/logout.sh", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main.sh";
		
	}

}
