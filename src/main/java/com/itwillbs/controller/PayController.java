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
			map.put("approval_url", "TC0ONETIME"); // 결제 성공시 url
			map.put("cancel_url", "TC0ONETIME"); // 취소
			map.put("fail_url", "TC0ONETIME"); // 실패
			
			OutputStream dataSetter = conn.getOutputStream();
			DataOutputStream setData = new DataOutputStream(dataSetter);
//			setData.writeBytes();
			setData.flush();
			setData.close();
			
			int resultCode = conn.getResponseCode();
			InputStream getter;
			if(resultCode == 200) {
				getter = conn.getInputStream();
			} else {
				getter = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(getter);
			BufferedReader buffer = new BufferedReader(reader);
			return buffer.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "/dailyShop/member/naverPay";
	}
}
