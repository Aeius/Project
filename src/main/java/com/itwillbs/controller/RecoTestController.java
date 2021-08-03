package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.CategoryService;


//import com.itwillbs.service.RecoTestService;

@Controller
public class RecoTestController {

//	@Inject
//	private RecoTestService recoTestService;
	
	@Inject
	private CategoryService categoryService;
	

	//------------------------------------------------------------추천 테스트 확인용매핑 ------------------------------------------------------------
	
	@RequestMapping(value = "/recoTest.sh", method = RequestMethod.GET)
	public String recoTestStart(HttpSession session, Model model) {
	//Recommend Test 시작 페이지입니다. get 방식 사용
		
		return "/dailyShop/recoTest/recoTestStart";
	}
	
	
	@RequestMapping(value = "/recoTestQ1.sh", method = RequestMethod.GET)
	public String recoTestQ1(HttpSession session, Model model) {
	//Recommend Test 첫 번째 보기 페이지 입니다. get 방식 사용	

	
	return "/dailyShop/recoTest/recoTest_Q1";
	}
	
	
	
	//Recommend Test 두 번째 문항(성별) 페이지 입니다--------------------------------
	@RequestMapping(value = "/recoTestQ2.sh", method = RequestMethod.GET)
	public String recoTestQ2(HttpServletRequest request, HttpSession session, Model model) {


		return "/dailyShop/recoTest/recoTest_Q2";
	}
	
	
	
	//Recommend Test 세 번째(계절) 페이지 입니다-----------------------------------
	@RequestMapping(value = "/recoTestQ3.sh", method = RequestMethod.GET)
	public String recoTestQ3(HttpServletRequest request, HttpSession session, Model model) {
	
		
		//이전 문항(성별)의 값 가지고 오기
		//해당 문항에서는 man, woman, both 를 사용하며 
		//이들은 전체 문항 중 단 한번만 새로운 값이 부여됩니다.
		
		
		String q2 = request.getParameter("q2");
		switch(q2) {
		case "1": // 2번 문제에서 1번보기 (남성)을 선택한 경우
			//int man = Integer.parseInt(request.getParameter("man"));
			//이 경우, man = 1을 가지고 왔으므로 int man에는 1을 저장
			int result_man = 1;
			int result_woman = 0;
			int result_both=0;
			
			session.setAttribute("result_man", result_man);
			System.out.println("남성 선택 : " + result_man);
			
			session.setAttribute("result_both", result_both);
			session.setAttribute("result_woman", result_woman);
			
			break;
			
		case "2":
			
			//int woman = Integer.parseInt(request.getParameter("woman"));
			result_man = 0;
			result_woman=1;
			result_both=0;
			session.setAttribute("result_woman", result_woman);
			System.out.println("여성 선택 : " + result_woman);
			
			session.setAttribute("result_man", result_man);
			session.setAttribute("result_both", result_both);
			break;
			
		case "3":
			//int both = Integer.parseInt(request.getParameter("both"));
			result_man = 0;
			result_woman=0;
			result_both=1;
			
			
			session.setAttribute("result_man", result_man);
			session.setAttribute("result_woman", result_woman);
			session.setAttribute("result_both", result_both);
			break;	
		}

		
	return "/dailyShop/recoTest/recoTest_Q3";
	}
	

	
	//-----------------(추가 문항) 잔향을 묻는 문항입니다 ---------------
	@RequestMapping(value = "/recoTestQ4_1.sh", method = RequestMethod.GET)
	public String recoTestQ4_1(HttpServletRequest request, HttpSession session, Model model) {


		//이전 문항(계절)의 값 가지고 오기
		String q3 = request.getParameter("q3");
		
		switch(q3) {
		case "1": 
//			int sweet = Integer.parseInt(request.getParameter("sweet"));
//			int natural = Integer.parseInt(request.getParameter("natural"));
//			int relax = Integer.parseInt(request.getParameter("relax"));
			
			//이번 문항은 속성치가 최초 부여되는 문항이므로
			int result_sweet=4;
			int result_natural=3;
			int result_relax=1;
			int result_modern=0;

			session.setAttribute("result_sweet", result_sweet);
			session.setAttribute("result_natural", result_natural);
			session.setAttribute("result_relax", result_relax);
			session.setAttribute("result_modern", result_modern);
			
			break;
		case "2":
			
			result_modern=1;
			result_natural=4;
			result_relax=3;
			result_sweet=0;
			
			session.setAttribute("result_modern", result_modern);
			session.setAttribute("result_natural", result_natural);
			session.setAttribute("result_relax", result_relax); 
			session.setAttribute("result_sweet", result_sweet);
			
			break;
		case "3":
			
			result_modern=1;
			result_natural=2;
			result_sweet=0;
			result_relax=4;
			
			
			session.setAttribute("result_modern", result_modern);
			session.setAttribute("result_natural", result_natural);
			session.setAttribute("result_sweet", result_sweet);
			session.setAttribute("result_relax", result_relax);
			
			
			break;
		case "4":
			
			result_modern=1;
			result_relax=3;
			result_sweet =2;
			result_natural=0;
			
			session.setAttribute("result_modern", result_modern);
			session.setAttribute("result_relax", result_relax);
			session.setAttribute("result_sweet", result_sweet);
			session.setAttribute("result_natural", result_natural);
			
			System.out.println("result_sweet  : " + result_sweet +", result_relax  : "+result_relax);
			break;	
		
		}
		
		
		return "/dailyShop/recoTest/recoTest_Q4_a";
		
		
		

	}
	
	
	

	
	//Recommend Test 네 번째 보기(분위기) 페이지 입니다---------------------
	@RequestMapping(value = "/recoTestQ4.sh", method = RequestMethod.GET)
	public String recoTestQ4(HttpServletRequest request, HttpSession session, Model model) {
	
	
		//이전 문항(성별)의 값 가지고 오기
		String q4_1 = request.getParameter("q4_1");
		
		switch(q4_1) {
		case "1":
			
			int result_modern = (int)session.getAttribute("result_modern");
			result_modern ++;
			result_modern ++;
			session.setAttribute("result_modern", result_modern);
			
			
			int result_sweet = (int)session.getAttribute("result_sweet");
			result_sweet ++;
			session.setAttribute("result_sweet", result_sweet);

			break;
			
		case "2":
			int result_natural = (int)session.getAttribute("result_natural");
			result_natural ++;
			session.setAttribute("result_natural", result_natural);
			
			
			int result_relax = (int)session.getAttribute("result_relax");
			result_relax ++;
			session.setAttribute("result_relax", result_relax);
			break;
			
		
		}
		
		
		
		
		return "/dailyShop/recoTest/recoTest_Q4";

		
	}
	
	//----------------------- 5번 문항 페이지 -------------------------
	//Recommend Test 5_1보기 페이지 입니다.
	@RequestMapping(value = "/recoTestQ5_1.sh", method = RequestMethod.GET)
	public String recoTestQ5(HttpSession session, HttpServletRequest request, Model model) {

	//이전 문항(분위기)의 값 가지고 오기
	//String q4 = request.getParameter("q4");	

	//4번 문항에서 보기 1번을 골랐으므로 modern+1	
	//int modern = Integer.parseInt(request.getParameter("modern")); // 1일듯
	//System.out.println(session.getAttribute("modern"));	 ==> null 나옴

		
	int result_modern = (int)session.getAttribute("result_modern");
	result_modern ++;
	System.out.println("현재 모던 총점 : " + result_modern);
	
	session.setAttribute("result_modern", result_modern);
	
//	int result_modern = before_modern + modern;
//	
//	session.setAttribute("result_modern", result_modern);
//	System.out.println("현재 result_modern : " + result_modern);

	return "/dailyShop/recoTest/recoTest_Q5_1";
	
	}
	
	
	//Recommend Test 5_2보기-------------------------
	@RequestMapping(value = "/recoTestQ5_2.sh", method = RequestMethod.GET)
	public String recoTestQ5_2(HttpSession session,  HttpServletRequest request,  Model model) {
	
		
	int result_sweet = (int)session.getAttribute("result_sweet");
	result_sweet ++;
	System.out.println("합쳐진 스윗 총점 : " + result_sweet);	

	session.setAttribute("result_sweet", result_sweet);
	
	
	return "/dailyShop/recoTest/recoTest_Q5_2";
	
	}
	
	
	//Recommend Test 5_3보기------------------------
	@RequestMapping(value = "/recoTestQ5_3.sh", method = RequestMethod.GET)
	public String recoTestQ5_3(HttpSession session, HttpServletRequest request, Model model) {
	
	
	int result_relax = (int)session.getAttribute("result_relax");
	int result_natural = (int)session.getAttribute("result_natural");
	
	result_natural ++;
	result_relax ++;

	session.setAttribute("result_natural", result_natural);
	session.setAttribute("result_relax", result_relax);
		
	return "/dailyShop/recoTest/recoTest_Q5_3";
	}
	
	

	@RequestMapping(value = "/recoTestQ5_4.sh", method = RequestMethod.GET)
	public String recoTestQ5_4(HttpSession session, HttpServletRequest request, Model model) {
	//Recommend Test 5_4보기 페이지 입니다. get 방식 사용	
	
	
	int result_natural = (int)session.getAttribute("result_natural");	
	int result_sweet = (int)session.getAttribute("result_sweet");
	
	result_natural ++;
	result_sweet ++;
	
	session.setAttribute("result_natural", result_natural);
	session.setAttribute("result_sweet", result_sweet);
		
	return "/dailyShop/recoTest/recoTest_Q5_4";
	}
	
	//---------------------- 결과 계산 로딩 페이지--------------------
	
	
	@RequestMapping(value = "/recoTestResult.sh", method = RequestMethod.GET)
	public String recoTestResult(HttpSession session, HttpServletRequest request, Model model) {

	String q5 = request.getParameter("q5");
	
	
	int result_man = (int)(session.getAttribute("result_man"));
	int result_woman = (int)(session.getAttribute("result_woman"));
	int result_both = (int)(session.getAttribute("result_both"));
	
	int result_relax= (int)session.getAttribute("result_relax");
	int result_modern = (int)session.getAttribute("result_modern");
	int result_natural = (int)session.getAttribute("result_natural");	
	int result_sweet = (int)session.getAttribute("result_sweet");
	
	
	switch(q5) {
	
	case "1":
		result_modern ++;
		session.setAttribute("result_modern", result_modern);
		
		System.out.println(result_man);
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);
		break;

		
	case "2":
		result_natural ++;
		session.setAttribute("result_natural", result_natural);
		result_relax++;
		result_relax++;
		result_relax++;
		session.setAttribute("result_relax", result_relax);
		
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);
		
		
		break;	
		
		
	case "3":
		result_sweet ++;
		result_sweet ++;
		session.setAttribute("result_sweet", result_sweet);
		
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);

		break;	
	
	
	case "4":
		result_modern ++;
		result_modern ++;
		session.setAttribute("result_modern", result_modern);
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);

		
		break;
		
	case "5":
		result_natural ++;
		session.setAttribute("result_natural", result_natural);
		result_sweet ++;
		result_sweet ++;
		session.setAttribute("result_sweet", result_sweet);

		
		System.out.println("네츄럴 총점: " + result_natural);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점: " + result_sweet);
		System.out.println("릴렉스 총점: " + result_relax);
		
		break;	
		
	case "6":
		result_natural ++;
		session.setAttribute("result_natural", result_natural);
		result_relax++;
		session.setAttribute("result_relax", result_relax);
		
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);
		
		
		break;		
		
		
	case "7":
		result_natural ++;
		session.setAttribute("result_natural", result_natural);
		result_modern ++;
		result_modern ++;
		session.setAttribute("result_modern", result_modern);
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);
		
		break;	
		
	case "8":
		result_natural ++;
		session.setAttribute("result_natural", result_natural);
		result_relax++;
		result_relax++;
		session.setAttribute("result_relax", result_relax);
		
		System.out.println("릴렉스 총점: "+ result_relax);
		System.out.println("모던 총점: " + result_modern);
		System.out.println("스윗 총점 : " + result_sweet);
		System.out.println("네츄럴 총점: " + result_natural);
		
		
		
		break;	
		
		
	
	}
	
	System.out.printf("남:%d 여:%d 무:%d\n", result_man, result_woman, result_both);
	System.out.printf("모던:%d 내츄럴:%d 스위트:%d 릴렉스:%d\n", result_modern, result_natural, result_sweet, result_relax);
	
		if(result_man>=1   //남자 modern이 가장 높은 경우
				&& result_modern > result_sweet
				&& result_modern > result_relax
				&& result_modern > result_natural
				) {	
			categoryService.addManCount("modern"); // (차트) 남자 modern 카운트 +1
			return "/dailyShop/recoTest/recoTestResult1"; //1번결과
		}
	
	if(result_man>=1   //남자 natural이 가장 높은 경우
			&& result_natural > result_sweet
			&& result_natural > result_relax
			&& result_natural > result_modern
			) {	
		categoryService.addManCount("natural"); // (차트) 남자 natural 카운트 +1
		return "/dailyShop/recoTest/recoTestResult2"; //2번결과
	}
	
	
	if(result_man>=1   //남자 sweet이 가장 높은 경우
			&& result_sweet > result_modern
			&& result_sweet > result_relax
			&& result_sweet > result_natural
			) {	
		categoryService.addManCount("sweet"); // (차트) 남자 sweet 카운트 +1
		return "/dailyShop/recoTest/recoTestResult3"; //3번결과
	}
	
	
	if(result_man>=1   //남자 relax이 가장 높은 경우
			&& result_relax > result_modern
			&& result_relax > result_sweet
			&& result_relax > result_natural
			) {	
		categoryService.addManCount("relax"); // (차트) 남자 relax 카운트 +1
		return "/dailyShop/recoTest/recoTestResult4"; //4번결과
	}
	
	
	
	
	//------------여성 결과---------------------------------------
	
		
	if(result_woman>=1   //여자 modern이 가장 높은 경우
			&& result_modern > result_sweet
			&& result_modern > result_relax
			&& result_modern > result_natural
			) {	
		categoryService.addWomanCount("modern"); // (차트) 여자 modern 카운트 +1
		return "/dailyShop/recoTest/recoTestResult5"; //5번결과
	}
	
	
	
	if(result_woman>=1   //여자 natural이 가장 높은 경우
			&& result_natural > result_sweet
			&& result_natural > result_relax
			&& result_natural > result_modern
			) {	
		categoryService.addWomanCount("natural"); // (차트) 여자 natural 카운트 +1
		return "/dailyShop/recoTest/recoTestResult6"; //6번결과
	}
	
	
	if(result_woman>=1   //여자 sweet이 가장 높은 경우
			&& result_sweet > result_modern
			&& result_sweet > result_relax
			&& result_sweet > result_natural
			) {	
		categoryService.addWomanCount("sweet"); // (차트) 여자 sweet 카운트 +1
		return "/dailyShop/recoTest/recoTestResult7"; //7번결과
	}
	
	
	if(result_woman>=1   //여자 relax이 가장 높은 경우
			&& result_relax > result_modern
			&& result_relax > result_sweet
			&& result_relax > result_natural
			) {	
		categoryService.addWomanCount("relax"); // (차트) 여자 relax 카운트 +1
		return "/dailyShop/recoTest/recoTestResult8"; //8번결과
	}

	
	//--------------성별무관 결과 ------------------------
	
	if(result_both>=1   //성별무관 modern이 가장 높은 경우
			&& result_modern > result_sweet
			&& result_modern > result_relax
			&& result_modern > result_natural
			) {	
		categoryService.addNonCount("modern"); // (차트) 무관 modern 카운트 +1
		return "/dailyShop/recoTest/recoTestResult9"; //9번결과
	}
		

	if(result_both>=1   //성별무관 natural이 가장 높은 경우
			&& result_natural > result_sweet
			&& result_natural > result_relax
			&& result_natural > result_modern
			) {	
		categoryService.addNonCount("natural"); // (차트) 무관 natural 카운트 +1
		return "/dailyShop/recoTest/recoTestResult10"; //10번결과
	}
	
	
	if(result_both>=1   //성별무관 sweet이 가장 높은 경우
			&& result_sweet > result_modern
			&& result_sweet > result_relax
			&& result_sweet > result_natural
			) {	
		categoryService.addNonCount("sweet"); // (차트) 무관 sweet 카운트 +1
		return "/dailyShop/recoTest/recoTestResult11"; //11번결과
	}
	
	
	if(result_both>=1   //성별무관 relax이 가장 높은 경우
			&& result_relax > result_modern
			&& result_relax > result_sweet
			&& result_relax > result_natural
			) {	
		categoryService.addNonCount("relax"); // (차트) 무관 relax 카운트 +1
		return "/dailyShop/recoTest/recoTestResult12"; //12번결과
	}
	
	
	
	return "/dailyShop/recoTest/recoTest";
	}
	

	
	

	
	
	
	
	
}
