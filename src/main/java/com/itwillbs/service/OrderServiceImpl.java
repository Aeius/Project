package com.itwillbs.service;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderBean;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	@Autowired
	private JavaMailSender mailSender; // 메일 API
	
	@Override
	public ArrayList<OrderBean> getOrderAllList() {
		return (ArrayList)orderDAO.getOrderAllList();
	}

	@Override
	public OrderBean getOrderInfo(int order_idx) {
		return orderDAO.getOrderInfo(order_idx);
	}

	@Override
	public void updateOrderStatus(OrderBean orderBean) {
		orderDAO.updateOrderStatus(orderBean);
	}

	@Override
	public void sendEmail(OrderBean orderBean) {
		
		String setfrom = "javateamproject2021@gmail.com"; // 보내는 사람
		String tomail = orderBean.getOrder_member_email(); // 받는 사람
		String title = "주문 취소 확인 메일입니다"; // 제목
		// 내용 : 주문번호 / 결제가격 / 결제수단 / 결제일 / 홈페이지로 이동버튼
		String content = "<div align=\"center\" style=\"text-align: center;\">\r\n"
				+ "<span style=\"font-size: 24pt; font-family: arial, sans-serif;\">\r\n"
				+ "<b>주문 취소 되셨습니다.</b>\r\n"
				+ "</span></div>\r\n"
				+ "<div align=\"center\" style=\"text-align: center;\">\r\n"
				+ "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">\r\n"
				+ "<span style=\"font-size: 10pt; font-family: arial, sans-serif;\">주문번호 : " + orderBean.getOrder_idx() + "</span></p>\r\n"
				+ "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">\r\n"
				+ "<span style=\"font-size: 10pt; font-family: arial, sans-serif;\">결제가격 : " + orderBean.getOrder_amount() + "</span></p>\r\n"
				+ "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">\r\n"
				+ "<span style=\"font-size: 10pt; font-family: arial, sans-serif;\">결제수단 : " + orderBean.getOrder_payment() + "</span></p>\r\n"
				+ "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">\r\n"
				+ "<span style=\"font-size: 10pt; font-family: arial, sans-serif;\">결제날짜 : " + orderBean.getOrder_date() + "</span></p>\r\n"
				+ "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">\r\n"
				+ "<span style=\"font-size: 10pt; font-family: arial, sans-serif;\">환불은 취소일로부터 3~5일 소요됩니다. </span></p>\r\n"
				+ "</div>\r\n"
				+ "<div align=\"center\" style=\"text-align: center;\"><br></div><div align=\"center\" style=\"text-align: center;\">\r\n"
				+ "<form action=\"http://localhost:8080/myweb2/main.sh\" method=\"get\">\r\n"
				+ "<input type=\"submit\" value=\"확인하러 가기\" style=\"border:1px solid #f4f4f4; padding: 7px 15px; border-radius:8px; background-color: rgb(81, 143, 187);color:white; cursor: pointer;\">\r\n"
				+ "</form>\r\n"
				+ "</div>";
		
		try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
	        messageHelper.setFrom(setfrom);
	        messageHelper.setTo(tomail); 
	        messageHelper.setSubject(title); 
	        messageHelper.setText(content, true);
	
	        mailSender.send(message);
	     } catch (Exception e) {
	        System.out.println("메일 발송 실패 - " + e.getMessage());
	     }
	
	}
	

}