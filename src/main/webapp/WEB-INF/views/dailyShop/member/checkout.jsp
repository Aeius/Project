<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                document.getElementById("member_address").value = roadAddr;
                document.getElementById("member_extraAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("member_extraAddress2").value = extraRoadAddr;
                } else {
                    document.getElementById("member_extraAddress2").value = '';
                }
                
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
		    amount : document.getElementById('amount').innerText, //실제 결제되는 가격
		    buyer_email : document.getElementById('buyer_email').value,
		    buyer_name : document.getElementById('buyer_name').value,
		    buyer_tel :  document.getElementById('buyer_tel').value,
		    buyer_addr : document.getElementById('member_address').value + document.getElementById('member_extraAddress').value + document.getElementById('member_extraAddress2').value,
		    buyer_postcode : document.getElementById('member_post').value
		    //m_redirect_url : 'http://localhost:8080/myweb2/kakaoPaymove.sh'
      }, function (rsp) { // callback
    	  alert('결제 진행됨 데이터 전달');
    	  console.log(rsp);
		    if ( rsp.success ) {
		    	 
		        document.getElementById('order_idx').value = new Date().getTime();
		        
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
			    payFinish.submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    
		    alert(msg);
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
<!--  <form action="checkout_finish.sh" method="post" name="payFinish"> -->
<!--  <input type="hidden" id="order_idx" name="order_idx" value=""> -->
<!--  <input type="hidden" id="buyer_email" name="buyer_email" value=""> -->
<!--  <input type="hidden" id="buyer_name" name="buyer_name" value=""> -->
<!--  <input type="hidden" id="buyer_tel" name="buyer_tel" value=""> -->
<!--  <input type="hidden" id="buyer_postcode" name="buyer_postcode" value=""> -->
<!--  <input type="hidden" id="buyer_addr" name="buyer_addr" value=""> -->
<!--  <input type="hidden" id="buyer_extraAddr" name="buyer_extraAddr" value=""> -->
<!--  <input type="hidden" id="buyer_extraAddr2" name="buyer_extraAddr2" value=""> -->
<!--  <input type="hidden" id="coupon" name="coupon" value=""> -->
<!--  <input type="hidden" id="point" name="point" value=""> -->
<!--  <input type="hidden" id="amount" name="amount" value=""> -->
<!-- </form> -->
 <section id="checkout">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="checkout-area">
          <form action="checkout_finish.sh" method="post" name="payFinish">
          <input type="hidden" id="order_idx" name="order_idx" value="">
          <input type="hidden" id="buyer_email" name="buyer_email" value="${member.member_email }">
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
                                <input type="text" placeholder="이름" id="buyer_name" name="buyer_name" value="${member.member_name }">
                              </div>   
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="연락처" id="buyer_tel" name="buyer_tel" value="${member.member_phone }">
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
                              <input type="checkbox" id="rememberme" checked> 주문자와 동일<br><br>
                              <div class="aa-checkout-single-bill">
                                <input type="text" id="buyer_name" name="buyer_name" placeholder="이름" value="${member.member_name }">
                              </div>
                              <div class="aa-checkout-single-bill">
                                <input type="text" id="buyer_tel" name="buyer_tel" placeholder="연락처" value="${member.member_phone }">
                              </div>                              
                            </div>                            
                          </div>  
                          <div class="row">
                            <div class="col-md-12">
                            	<!-- 한줄에 두 박스 -->
	                            <div class="row">
		                            <div class="col-md-6"> <!-- 첫번째 -->
		                              <div class="aa-checkout-single-bill">
		                                <input type="text" name="member_post" id="member_post" class="member_post" value="${member.member_post }" placeholder="우편번호" readonly ">
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
                                <input type="text" name="member_address" id="member_address" class="member_address" value="${member.member_address }" placeholder="도로명주소" readonly>
                              </div>  
                              <!-- 한줄 끝 -->    
                              <div class="aa-checkout-single-bill">
                                <input type="text" name="member_extraAddress" id="member_extraAddress" class="member_extraAddress" value="${member.member_extraAddress }" placeholder="지번주소">
                              </div>                             
                              <div class="aa-checkout-single-bill">
                                <input type="text" name="member_extraAddress2" id="member_extraAddress2" class="member_extraAddress2" value="${member.member_extraAddress2 }" placeholder="상세주소">
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
                          <select name="coupon"  class="aa-coupon-code" id="coupon">
                            	<option value="">쿠폰 선택</option>
                            	<c:forEach items="${fn:split(member.member_coupon, '/') }" var="coupons">
                            	<option value="${coupons }">${coupons }</option>
                            	</c:forEach>
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
                          <input type="text" placeholder="사용할 포인트 입력" class="aa-coupon-code" id="point" max="${member.member_point }">
                          <input type="submit" value="포인트 적용" class="aa-browse-btn">
                          &nbsp;&nbsp;&nbsp;&nbsp;(현재 보유 포인트 : ${member.member_point } P)
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
                      <c:forEach var="productList" items="${productList }">
                        <tr>
                          <td id="product_name">${productList.product_name }</td>
                          <td>${productList.product_price }</td>
                        </tr>
                          <input type="hidden" name="quantity" id="quantityList" value="${productList.product_quantity }">
                          <input type="hidden" name="product_idx" id="product_idx" value="${productList.product_idx }">
                       </c:forEach>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th>합계</th>
                          <td>원 금액</td>
                        </tr>
                         <tr>
                          <th>쿠폰 할인</th>
                          <td id="coupon">- 할인액</td>
                        </tr>
                        <tr>
                          <th>포인트 할인</th>
                          <td id="point">- 할인액</td>
                        </tr>
                         <tr>
                          <th>총 가격</th>
                          <td id="amount">${amount }</td>
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