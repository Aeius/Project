<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Home</title>
    
    
     <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  <!--   다음 주소 검색 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript">
  function execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              var roadAddr = data.roadAddress;
              document.getElementById('postcode').value = data.zonecode;
              document.getElementById('roadAddress').value = roadAddr;
              var guideTextBox = document.getElementById("guide");
              document.getElementById('detailAddress').focus();
          }
      }).open();
  }
  </script>


  </head>
  <body> 
  
  <script>
  IMP.init("imp35099883"); 
  
    function requestPay() {
      // IMP.request_pay(param, callback) 호출
      IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'kakaopay',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : document.getElementById('product_name').innerText, //결제창에서 보여질 이름
		    amount : document.getElementById('totalAmount').innerText, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		    //m_redirect_url : 'http://localhost:8080/myweb2/kakaoPaymove.sh'
      }, function (rsp) { // callback
    	  alert('결제 진행됨 데이터 전달');
    	  console.log(rsp);
		    if ( rsp.success ) {
		    	
// 		        document.getElementId('buyer_email').value = rsp.buyer_email;
// 		        document.getElementId('buyer_tel').value = rsp.buyer_tel;
		        
// 		        var amount += ''+ rsp.paid_amount;
		        document.getElementById('amount').value = rsp.paid_amount;
		        
		        
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    
		    alert(msg);
		    payFinish.submit();
		});
	}
</script>
  
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->


    <!-- header -->
<jsp:include page="../inc/header.jsp"></jsp:include>
  <!-- / menu -->
 
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="../img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>결제하기</h2>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <form action="checkout_finish.sh" method="post" name="payFinish">
 <input type="hidden" id="buyer_email" name="buyer_email" value="0">
 <input type="hidden" id="buyer_tel" name="buyer_tel" value="0">
 <input type="hidden" id="amount" name="amount" value="0">
<%--  <input type="hidden" id="member_email" value="${sessionScope.member_email }"> --%>
<%--  <input type="hidden" id="member_email" value="${sessionScope.member_email }"> --%>
<%--  <input type="hidden" id="member_email" value="${sessionScope.member_email }"> --%>
<%--  <input type="hidden" id="member_email" value="${sessionScope.member_email }"> --%>
</form>
 <section id="checkout">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="checkout-area">
          <form action="./naverPay.jsp">
            <div class="row">
              <div class="col-md-8">
                <div class="checkout-left">
                  <div class="panel-group" id="accordion">
                    <!-- Billing Details -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                            주문자 정보
                          </a>
                        </h4>
                      </div>
                      <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="이름">
                              </div>   
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="연락처">
                              </div>                          
                            </div>                            
                          </div>  
                        </div>
                      </div>
                    </div>
                    <!-- Shipping Address -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                            받는 사람 정보
                          </a>
                        </h4>
                      </div>
                      <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-md-12">
                              <input type="checkbox" id="rememberme"> 주문자와 동일<br><br>
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="이름">
                              </div>
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="연락처">
                              </div>                              
                            </div>                            
                          </div>  
                          <div class="row">
                            <div class="col-md-12">
                            	<!-- 한줄에 두 박스 -->
	                            <div class="row">
		                            <div class="col-md-6"> <!-- 첫번째 -->
		                              <div class="aa-checkout-single-bill">
		                                <input type="text" name="postcode" id="postcode" class="postcode" placeholder="우편번호" readonly>
		                              </div>                             
		                            </div>
		                            <div class="col-md-6"> <!-- 두번째 -->
		                              <div class="aa-checkout-single-bill">
		                                <input type="button" class="dup" onclick="execDaumPostcode()" value="우편번호 찾기">
		                              </div>
		                            </div>
	                            </div> 
	                          	<!-- 한줄 끝 -->
	                          <!-- 한줄에 한 박스 -->
                              <div class="aa-checkout-single-bill">
                                <input type="text" name="roadAddress" id="roadAddress" class="address" placeholder="도로명주소" readonly>
                              </div>  
                              <!-- 한줄 끝 -->    
                              <div class="aa-checkout-single-bill">
                                <input type="text" name="detailAddress" id="detailAddress" class="address" placeholder="상세주소">
                              </div>                             
                            </div>                           
                          </div>   
                        </div>
                      </div>
                    </div>
                    <!-- Coupon section -->
                    <div class="panel panel-default aa-checkout-coupon">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            쿠폰 사용하기
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
<!--                           <input type="text" placeholder="쿠폰 선택하기 (텍스트->셀렉트박스)" class="aa-coupon-code"> -->
                          <select name="coupon"  class="aa-coupon-code">
                            	<option value="">쿠폰 선택</option>
                            	<option value="">3000원 할인 쿠폰</option>
                            	<option value="">1000원 할인 쿠폰</option>
                            </select>
                          <input type="submit" value="쿠폰 적용" class="aa-browse-btn">
                        </div>
                      </div>
                    </div>
                    <!-- Point section -->
                    <div class="panel panel-default aa-checkout-coupon">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            포인트 사용하기
                          </a>
                        </h4>
                      </div>
                      <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                          <input type="text" placeholder="사용할 포인트 입력" class="aa-coupon-code">
                          <input type="submit" value="포인트 적용" class="aa-browse-btn">
                          &nbsp;&nbsp;&nbsp;&nbsp;(현재 보유 포인트 : 0 P)
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="checkout-right">
                  <h4>주문 정보</h4>
                  <div class="aa-order-summary-area">
                    <table class="table table-responsive">
                      <thead>
                        <tr>
                          <th>제품</th>
                          <th>가격</th>
                        </tr>
                      </thead>
                      <tbody>
<%--                       <c:forEach var="product" items="${product }"> --%>
                        <tr>
                          <td id="product_name">향수1<strong> x  수량</strong></td>
                          <td>가격1</td>
                        </tr>
<%--                       </c:forEach> --%>
                        <tr>
                          <td>향수2 <strong> x  수량</strong></td>
                          <td>가격2</td>
                        </tr>
                        <tr>
                          <td>향수3 <strong> x  수량</strong></td>
                          <td>가격3</td>
                        </tr>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th>합계</th>
                          <td>원 금액</td>
                        </tr>
                         <tr>
                          <th>쿠폰 할인</th>
                          <td>- 할인액</td>
                        </tr>
                        <tr>
                          <th>포인트 할인</th>
                          <td>- 할인액</td>
                        </tr>
                         <tr>
                          <th>총 가격</th>
                          <td id="totalAmount">200</td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <h4>결제 방법 선택</h4>
                  <div class="aa-payment-method">                    
                    <label for="cashdelivery"><input type="radio" id="cashdelivery" name="optionsRadios"> 무통장 입금 </label>
                    <label for="paypal"><input type="radio" id="paypal" name="optionsRadios" checked> 카드 결제 </label>
                    <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" border="0" alt="PayPal Acceptance Mark">    
                    <input type="button" value="결제하기" class="aa-browse-btn" onclick="requestPay()">                
                  </div>
                </div>
              </div>
            </div>
          </form>
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->


    
  </body>
</html>