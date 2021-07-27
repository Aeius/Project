package com.itwillbs.myweb2;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private ProductService productService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		
		ArrayList<ProductBean> bestList = productService.getProductBestList();
		//Model mb.mb 데이터 담아 가기
		model.addAttribute("bestList" , bestList);
		//  /WEB-INF/views/member/insertForm.jsp 이동
		return "/dailyShop/member/index";
	}
	
}
