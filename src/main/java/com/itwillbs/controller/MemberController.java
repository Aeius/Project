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
	// 부모인터페이스 변수를 멤버변수로 정의 해당 변수에 set메서드를 통해 객체 저장 예정(root-contex.xml 에서 생성된 객체가 전달되는 변수)
	@Inject
	private MemberService memberService;
	
	//가상 주소 http://localhost:8080/myweb2/member/insert 로 설정 시 매핑
	//--------------------------------------------------------------- insert ----------------------------------------------------------------------- 
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		// 실제 경로 /WEB-INF/views/member/insertForm.jsp 로 이동
		// servlet-context.xml 에서 접미사부분 WEB-INF-view/ 으로 접미사부분은 .jsp 로 설정 해두었기때문에 사이 부분만 적어주면 ok 
		return "/member/insertForm";
	}
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberBean mb) {
		
		memberService.insertMember(mb);
		
		return "redirect:/member/login";
	}
	
	//--------------------------------------------------------------- login & logout -----------------------------------------------------------------------
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberBean mb, HttpSession session, Model model) {
		
		MemberBean mb2 = memberService.userCheck(mb);
		if(mb2 != null) {
			//아이디 비밀번호 일치 시 세션값 생성
			session.setAttribute("id", mb.getId());
			return "redirect:/member/main";
		} else {
			//불일치일 경우 메세지 출력 후 뒤로 이동
			model.addAttribute("msg","입력하신 정보는 틀립니다.");
			return "/member/msg";  // msg.jsp 만들어서 스크립트 태그 열어서 alert(${msg}); 로 메시지 출력
		}
		
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/main";
	}
	
	//--------------------------------------------------------------- main -----------------------------------------------------------------------
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		
		return "/member/main";
	}
	
	//--------------------------------------------------------------- info -----------------------------------------------------------------------
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberBean mb = memberService.getMember(id);
		model.addAttribute("mb", mb);
		return "/member/info";
	}
}
