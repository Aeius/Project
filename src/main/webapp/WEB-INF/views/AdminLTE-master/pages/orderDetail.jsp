<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="../inc/head.jsp" />
  
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      <!-- 상단바 -->
      <jsp:include page="../inc/top.jsp" />
      <!-- 사이드메뉴 -->
      <jsp:include page="../inc/side.jsp" />
      
	  <!-- ==========본문 시작========== -->
	  
      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>주문 상세 정보</h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- 박스 시작 -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">주문 상품 정보</h3> <!-- 박스타이틀 -->
            </div>
            <!-- 리스트로 가져오기 (한 주문번호에 여러 상품 주문)-->
            <c:forEach var="orderProductList" items="${orderProductList }" varStatus="status"> 
            <!-- forEach문에서 변수 두개(orderProductList,orderProductInfo)를 사용할 경우 -->
            <!-- varStatus="status" → 변수2[status.index] 사용 -->
            	<div class="box-body">
            	<img src='<c:url value="/resources/upload/${orderProductInfo[status.index].product_main_image }"/>' width="30px" >&nbsp;&nbsp;
              		${orderProductInfo[status.index].product_name } /
              		${orderProductInfo[status.index].product_size }ml /
              		정가 ${orderProductInfo[status.index].product_price }원 /
              		${orderProductList.order_detail_product_quantity }개
            	</div>
            </c:forEach>
          </div><!-- 박스끝 -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">결제 정보</h3>
            </div>
            <div class="box-body">
              사용한 쿠폰 : ${couponBean.coupon_name } - ${couponBean.coupon_price }원 할인
            </div>
            <div class="box-body">
              사용한 포인트 : ${orderBean.order_point }
            </div>
            <div class="box-body">
              총 결제 금액 : ${orderBean.order_amount }
            </div>
            <div class="box-body">
              결제 수단 : ${orderBean.order_payment }
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">주문자 정보</h3>
            </div>
            <div class="box-body">
              아이디 : ${orderBean.order_member_email }
            </div>
          </div><!-- /.box -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">받는 사람 정보</h3>
            </div>
            <div class="box-body">
              이름 : ${orderBean.order_receiver_name }
            </div>
            <div class="box-body">
              연락처 : ${orderBean.order_receiver_phone }
            </div>
            <div class="box-body">
              주소<br>
              우)${orderBean.order_receiver_post }<br>
              ${orderBean.order_receiver_address }<br>
              ${orderBean.order_receiver_extraAddress } ${orderBean.order_receiver_extraAddress2 }
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
          <input type="button" value="목록으로 돌아가기"  onClick="location.href='orderList.ad'">

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      
      
      
      <!-- ==========본문 끝========== -->

      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->

    <jsp:include page="../inc/script.jsp" />
    
  </body>
</html>