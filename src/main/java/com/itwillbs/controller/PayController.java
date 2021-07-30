package com.itwillbs.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class PayController {
	
	@RequestMapping(value = "/kakaoPaymove.sh", method = RequestMethod.GET)
	public String movekakao() {
		return "/dailyShop/member/kakaoPay";
	}

	@RequestMapping(value = "/kakaoPay.sh")
	@ResponseBody
	public String kakaoPay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK fd61f8ddd34ee2b8cbf8dc344f47beea");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			Map<String, String> map = new HashMap<String, String>(); 
			map.put("cid", "TC0ONETIME");
			map.put("partner_order_id", "주문번호");
			map.put("partner_user_id", "회원ID");
			map.put("item_name", "상품명");
			map.put("quantity", "1"); // 수량
			map.put("total_amount", "100"); // 총가격
			map.put("tax_free_amount", "100"); // 비과세 금액
			map.put("approval_url", "http://localhost:8080/myweb2/daliyShop/member/checkout_finish.jsp"); // 결제 성공시 url
			map.put("cancel_url", "http://localhost:8080/myweb2/daliyShop/404.jsp"); // 취소
			map.put("fail_url", "http://localhost:8080/myweb2/daliyShop/member/checkout.jsp"); // 실패
			
			// map을 바디에 전달한 값의 형태에 맞게
			// key=value&key=value 로 바꿔준다
			String param = new String();
			for(Map.Entry<String, String> element : map.entrySet()) {
				param += (element.getKey() + "=" + element.getValue() + "&");
			}
			System.out.println(param);
			
			// 담은 정보를 연결한 url(kakao)로 request
			conn.getOutputStream().write(param.getBytes());
			// 응답 받기
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			System.out.println(in.readLine());
			
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "/dailyShop/member/naverPay";
	}
}
