package com.itwillbs.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.BasketService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.WishListService;


@RestController
public class AjaxController {
	
	 @Autowired
	 private JavaMailSender mailSender;
	
	@Inject
	private WishListService wishListService;
	
	@Inject
	private BasketService basketService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;
	
	//-------------------------------------------------------------- 찜(좋아요) 버튼 눌렀을 때 --------------------------------------------------------
	@RequestMapping(value = "/pushWishList.sh", method = RequestMethod.GET)
	public ResponseEntity<String> pushWishList(HttpServletRequest request, HttpSession session, @RequestParam("product_idx") int product_idx) {
		System.out.println("WishListController - pushWishList()");
		String result = "";
		ResponseEntity<String> entity = null;
		int request_product_idx = Integer.parseInt(request.getParameter("product_idx")); 
		String request_member_email = request.getParameter("member_email");
		
		try {
//			request.getParameter("")
			// SQL구문 만능문자에 가져갈 데이터를 Bean에 담아서 전달하는 과정 
			WishListBean wishListBean = new WishListBean();
			wishListBean.setProduct_idx(request_product_idx);  // 현재 접근한 상세페이지의 상품번호 (product_idx) 파라미터 가져오기
			wishListBean.setWishList_member_email(request_member_email); // 세션에있는(로그인되어있는) 회원이메일정보 불러오기 
			
			WishListBean checkWishList =  wishListService.checkWishList(wishListBean);
//			System.out.println("WishListController - chekcWishList() 리턴 값 : " + checkWishList);
			int wishListCount = Integer.parseInt(checkWishList.getWishlistcount());  
			//SQL구문 결과 값 
			//(SELECT COUNT(*) as wishListCount FROM wishlist WHERE wishlist_member_email=member_email AND wishlist_product_idx=product_idx) 
			// |---------------|
			// | wishListCount |
			// |---------------|
			// |             1 |
			// |---------------|
			//가져와 저장하려면 리턴할 Bean에 멤버변수로 컬럼앨리어스로 지정한 wishListCount와 동일한 이름의 변수가 있어야 
			//SQL 구문 결과값을 자동으로 해당 Bean에 저장함
			//최종적으로 SQL 구문결과값을 저장한 Bean이 리턴이 됨 그래서 해당 Bean에서 데이터 꺼내서 정수형으로 변환 후
			//판별하여 좋아요 숫자 증가 혹은 삭제 구문 실행.
			
			if(wishListCount > 0) {
//				System.out.println("checkWishList > 0 true 일때");
				wishListService.deleteWishList(wishListBean);
				result = "offHeart";
			} else {
//				System.out.println("checkWishList > 0 false 일때");
				wishListService.insertWishList(wishListBean);
				result = "onHeart";
			}
			
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
		
		//-------------------------------------------------------------- wishListCount 체크-------------------------------------------------------------------------
		@RequestMapping(value = "/checkWishCount.sh", method = RequestMethod.GET)
		public ResponseEntity<String> checkWishCount(HttpServletRequest request, HttpSession session) {
			System.out.println("WishListController - checkWishCount()");
			ResponseEntity<String> entity = null;
			System.out.println(request.getParameter("product_idx"));
			int product_idx = Integer.parseInt(request.getParameter("product_idx")); 
			try {
				
				ProductBean checkWishCount =  wishListService.checkWishCount(product_idx);
				System.out.println("checkWishCount실행됨");
//			System.out.println("WishListController - chekcWishList() 리턴 값 : " + checkWishList);
				String wishCount = checkWishCount.getProduct_likecount()+"";  
//				SQL 구문 : SELECT product_likecount from product where product_idx = #{product_idx}
				
				System.out.println(wishCount);
				entity = new ResponseEntity<String>(wishCount, HttpStatus.OK);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			
//			return "redirect:/productDetail.sh?product_idx="+product_idx; // ajax 미구현으로 인한 새로고침
		return entity;
	}
	

	//------------------------------------------------------------------------ 장바구니 담기 ------------------------------------------------------
	@RequestMapping(value = "/intoBasket.sh", method = RequestMethod.GET)
	public ResponseEntity<String> intoBasket(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null; // 저장한 문자열을 담아서 전달하기 위한 객체
		
		try {
			// BasketBean 객체에 저장할 값 불러오기
			String member_email = request.getParameter("member_email");
			int product_idx = Integer.parseInt(request.getParameter("product_idx"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(member_email + product_idx + quantity);
			
			// BasketBean 객체 생성해서 바로 저장
			BasketBean basketBean = new BasketBean(member_email, product_idx, quantity);
			
			// basketService에서 처리 후 결과 리턴
			boolean isIntoBasket = basketService.intoBasket(basketBean);
			
			// 리턴 결과에 따라 in/out 리턴
			if(isIntoBasket) {
				result = "in";
			} else {
				result = "out";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//-------------------------------------------------------------- 로그인 확인 --------------------------------------------------------
	@RequestMapping(value = "/checkSession.sh", method = RequestMethod.GET)
	public ResponseEntity<String> checkSession(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null;

		try {
			String member_email = request.getParameter("member_email");
			// member_email == null 은 안되고 문자열 비교하니까 작동
			if(member_email == "") {
				result = "empty";
			} else {
				result = "notEmpty";
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//-------------------------------------------------------------- 장바구니 삭제 --------------------------------------------------------
	@RequestMapping(value = "/deleteBasket.sh", method = RequestMethod.GET)
	public ResponseEntity<String> deleteBasket(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null;

		try {
			String member_email = request.getParameter("member_email");
			String product_idx = request.getParameter("product_idx");
			
			int deleteCount = basketService.deleteBasket(member_email, product_idx);
			
			if(deleteCount != 0) {
				result = "deletedSuccess";
			} else {
				result = "deleteFail";
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//------------------------------------------------------------------------ 장바구니 수량 변경 ------------------------------------------------------
	@RequestMapping(value = "/updateBasketQuantity.sh", method = RequestMethod.GET)
	public ResponseEntity<String> updateBasketQuantity(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null; // 저장한 문자열을 담아서 전달하기 위한 객체
		
		try {
			// BasketBean 객체에 저장할 값 불러오기
			String member_email = request.getParameter("member_email");
			int product_idx = Integer.parseInt(request.getParameter("product_idx"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			// BasketBean 객체 생성해서 바로 저장
			BasketBean basketBean = new BasketBean(member_email, product_idx, quantity);
			
			// basketService에서 처리 후 결과 리턴
			boolean isIntoBasket = basketService.updateBasketQuantity(basketBean);
			
			// 리턴 결과에 따라 in/out 리턴
			if(isIntoBasket) {
				result = "in";
			} else {
				result = "out";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	 //-------------------------------------------------------------- 아이디 중복 확인 --------------------------------------------------------
    @RequestMapping(value = "/checkId.sh", method = RequestMethod.GET)
    public ResponseEntity<String> idcheck(HttpServletRequest request){
       String result="";
       ResponseEntity<String> entity=null;
       try {
          String member_email = request.getParameter("member_email");
          System.out.println(member_email);
          
          MemberBean memberBean = memberService.getMember(member_email);
          if(memberBean!=null) {
             //아이디 중복
             result="emailDup";
          }else {
             //아이디 사용가능
             result="emailOk";
          }
          entity=new ResponseEntity<String>(result,HttpStatus.OK);
       } catch (Exception e) {
          System.out.println("오류 발생 -" + e.getMessage());
          entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
          
       }
       return entity;
    }
    
 //-------------------------------------------------------------- 이메일 본인 확인 메일 전송 --------------------------------------------------------
    @RequestMapping(value = "/sendCheckMail.sh", method = RequestMethod.GET)
    public ResponseEntity<String> checkMail(HttpServletRequest request){
       String result="";
       ResponseEntity<String> entity=null;
       
       String member_email = request.getParameter("member_email");
       System.out.println(member_email);
       int checkNum = 0;
       Random random = new Random();
       checkNum = random.nextInt(88888)+11111;
       StringBuffer buffer = new StringBuffer();
       String confirmNum = buffer.append(checkNum).toString(); // int값인 checkNum을 String 값으로 저장
       System.out.println(confirmNum);
       
       String setfrom = "javateamproject2021@gmail.com";
       String tomail = member_email; // 받는 사람 이메일
       String title = member_email + "님 이메일 인증번호 전송 메일입니다."; // 제목
       String content = "홈페이지를 방문해주셔서 감사합니다."+
             "<br><br>"+
             "인증번호는 " + checkNum +"입니다." + 
             "<br>" + 
             "해당 인증번호를 인증번호 확인란에 입력해 주세요";
       
       try {
           MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

             messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
             messageHelper.setTo(tomail); // 받는사람 이메일
             messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
             messageHelper.setText(content, true); // 메일 내용

             mailSender.send(message);
          
             result = confirmNum;
           entity=new ResponseEntity<String>(result,HttpStatus.OK);
       } catch (Exception e) {
          System.out.println("오류 발생 -" + e.getMessage());
          System.out.println("메일 발송 실패 - " + e.getMessage());
          entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
       }
       return entity;
    }
    
    //-------------------------------------------------------------- 이메일 인증 번호 확인 --------------------------------------------------------
          @RequestMapping(value = "/mailCheckNumConfirm.sh", method = RequestMethod.GET)
          public ResponseEntity<String> mailCheckNumConfirm(HttpServletRequest request){
             String result="";
             ResponseEntity<String> entity=null;
             try {
                
                int user_authNum = Integer.parseInt(request.getParameter("user_authNum")); // 사용자가 입력한 번호
                int authNum = Integer.parseInt(request.getParameter("authNum")); // 이메일에 전달 했던 번호
                System.out.println(user_authNum + " " + authNum);
                
                     // 인증번호 비교
                     if (authNum == user_authNum) {
                    
                        result = "checkOk";
                     } else {
                       result = "checkFail";
                     }

                entity=new ResponseEntity<String>(result,HttpStatus.OK);
             } catch (Exception e) {
                System.out.println("오류 발생 -" + e.getMessage());
                entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
             }
             return entity;
          }

	//---------------------------------- 상품 이름 중복 확인 (관리자) --------------------------------------------------------
	@RequestMapping(value = "/checkProductName.ad", method = RequestMethod.GET)
	public ResponseEntity<String> checkProductName(HttpServletRequest request){
		String result="";
		ResponseEntity<String> entity=null;
		try {
			String product_full_name = request.getParameter("product_name");
			// 공백 제거 -> Product테이블 공백제거된 상품이름과 비교
			// 동일 이름의 띄어쓰기 다른 제품만 찾아냄
			String product_name = product_full_name.replaceAll(" ", ""); 
			Integer productCount = productService.getProductName(product_name);
			if(productCount > 0) { //상품이름 중복
//							System.out.println(productCount + "개 상품이름 중복 - " + product_name);
				result="nameDup";
			}else {
				result="nameOk";
			}
			entity=new ResponseEntity<String>(result,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
