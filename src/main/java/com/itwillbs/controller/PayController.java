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
			HttpURLConnection connectionServer = (HttpURLConnection)url.openConnection();
			connectionServer.setRequestMethod("POST");
			connectionServer.setRequestProperty("Authorization", "KakaoAK fd61f8ddd34ee2b8cbf8dc344f47beea");
			connectionServer.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connectionServer.setDoInput(true);
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream dataSetter = connectionServer.getOutputStream();
			DataOutputStream setData = new DataOutputStream(dataSetter);
			setData.writeBytes(parameter);
			setData.flush();
			setData.close();
			
			int resultCode = connectionServer.getResponseCode();
			InputStream getter;
			if(resultCode == 200) {
				getter = connectionServer.getInputStream();
			} else {
				getter = connectionServer.getErrorStream();
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
