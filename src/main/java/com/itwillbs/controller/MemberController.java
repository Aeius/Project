package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
	// 부모인터페이스 변수 => 멤버변수 정의 => 객체생성 자동
	@Inject
	private MemberService memberService;

//	가상주소  http://localhost:8080/myweb2/member/insert
		
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		//  /WEB-INF/views/member/insertForm.jsp 이동
		return "/member/insertForm";
	}
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberBean mb) {
		// 의존관계 주입(DI) :스프링에서 객체생성 방식
		// root-context.xml에서 MemberServiceImpl을 객체생성 
		// 필요로 하는 MemberController에 set메서드 통해서 
		// MemberService memberService 부모인터페이스 멤버변수 전달(주입)
		
//		MemberService memberService=new MemberServiceImpl();
		// 회원가입 메서드 호출
		memberService.insertMember(mb);
		//  /member/login 가상주소 이동
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		//  /WEB-INF/views/member/loginForm.jsp 이동
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberBean mb, HttpSession session, Model model) {
		
		// 로그인 메서드 호출
		MemberBean mb2=memberService.userCheck(mb);
		if(mb2!=null) {
			//아이디 비밀번호 일치 세션값 생성
			session.setAttribute("id", mb.getId());
		}else {
			// 불일치 메시지 뒤로이동
			model.addAttribute("msg","입력하신 정보는 틀립니다.");
		//  /WEB-INF/views/member/msg.jsp 이동
			return "/member/msg";
		}
		//  /member/main 가상주소 이동
		return "redirect:/member/main";
	}
	
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		//  /WEB-INF/views/member/main.jsp 이동
		return "/member/main";
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		//  /WEB-INF/views/member/main.jsp 이동
		session.invalidate();
		
		return "redirect:/member/main";
	}
	
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
		// 세션 값가져오기
		String id = (String)session.getAttribute("id");
		// 세션값에 해당하는 member정보를 조회
		MemberBean mb = memberService.getMember(id);
		
		//Model mb.mb 데이터 담아 가기
		model.addAttribute("mb" , mb);
		
		//  /WEB-INF/views/member/info.jsp 이동
		
		return "/member/info";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		//  /WEB-INF/views/member/insertForm.jsp 이동
		return "/dailyShop/member/index";
	}
	
}
