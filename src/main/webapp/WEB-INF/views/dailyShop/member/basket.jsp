<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PerfumeShip</title>

<!-- Font awesome -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- SmartMenus jQuery Bootstrap Addon CSS -->
<link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
<!-- Product view slider -->
<link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">
<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="css/slick.css">
<!-- price picker slider -->
<link rel="stylesheet" type="text/css" href="css/nouislider.css">
<!-- Theme color -->
<link id="switcher" href="css/theme-color/default-theme.css"
	rel="stylesheet">
<!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
<!-- Top Slider CSS -->
<link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet"
	media="all">

<!-- Main style sheet -->
<link href="css/style.css" rel="stylesheet">

<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- ajax -->
<script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var coupon_idx = $("#nonSelectedCoupon").val();
		$('#selectedCoupon_idx').val(coupon_idx);
		
// -------------------------------- 장바구니 삭제 --------------------------------
		$('.remove').click(function() {
// 			var check = $(this).attr("name");
// 			alert(check);
			if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					url: 'deleteBasket.sh',
					data: {product_idx : $(this).attr("name"),
						   member_email : $('#member_email').val()},
					success:function(data){
						if(data == "deletedSuccess") {
							history.go(0);
						}
					}
				}); // end ajax
			}
		});
		
// -------------------------------- 수량 변경 -> 가격 변경 --------------------------------
		$('.aa-cart-quantity').on('change', function() {
			// 수량 value 가져오기
			var quantity = $(this).val();
			// 부모 tr 찾기
			var tr = $(this).closest('tr');
			// tr 안에 price 클래스 찾기
		    var price = $(tr).find('.product_price').val().replace(/,/g, "");
// 			alert(price);
			
			// 수량 바꿀 때마다 DB 저장
		    $.ajax({
				url: 'updateBasketQuantity.sh',
				data: {product_idx : $(tr).find('.remove').attr("name"),
						quantity : $(this).val(),
					   member_email : $('#member_email').val()},
				success:function(data){
				}
			});
		    
			// 제품별 총 금액 출력
			var eachTotalPrice = quantity * price;
		    $(tr).find('.eachTotalPrice').html(priceToString(eachTotalPrice));
		    
			// 쿠폰 적용 전 총 금액 계산할 변수 선언
			var sum = 0;
			
			// 제품별 총 금액을 더해 총 쿠폰 적용 전 금액 합계 계산
		    $('.eachTotalPrice').each(function(){
		    	var eachTotalPrice = parseInt($(this).text().replace(/,/g, ""));
				sum += eachTotalPrice;
				$('#beforeDiscountTotal').html(priceToString(sum));
			});
			
			// 선택된 쿠폰 value 가져오기
			var coupon_value = $("#coupon option:selected").val();
			// 쿠폰 가격을 제외한 최종 금액 계산
			var total = sum - coupon_value;
			// 출력
			$('#total').html(priceToString(total));
		    		
		});
		
// -------------------------------- 쿠폰 적용 --------------------------------
		// selectBox 선택시
		$('select').on('change', function() {
			// 쿠폰 할인 금액 가져오기
			var coupon_value = $(this).val();
			// 쿠폰 정보 가져오기
			var coupon_idx = parseInt($("#coupon option:selected").attr("id"));
			// 할인 전 금액 가져오기(숫자 콤마 제거하고 가져오기)
			var sum = parseInt($('#beforeDiscountTotal').text().replace(/,/g, ""));
			// 할인 전 금액 - 쿠폰 = 총 결제 금액 구하기
			var total = sum - coupon_value;
			// 쿠폰 금액 칸, 총 결제 금액 칸에 값 출력
			$('#discount').html(priceToString(-coupon_value));
			$('#total').html(priceToString(total));
			$('#selectedCoupon_idx').val(coupon_idx);
// 			alert(coupon_idx);
		});	

// -------------------------------- 숫자 콤마 --------------------------------		
		function priceToString(price) {
		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		
	});
</script>

</head>
<body>
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
	<jsp:include page="../inc/mypageNav.jsp"></jsp:include>
	<!-- / catg header banner section -->

	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<!-- 장바구니 비어있을 때 -->
						<c:choose>
							<c:when test="${empty basketList}">
								<div class="cart-view-table">
									<div class="table-responsive">
										<h2>장바구니</h2>
										<div style="text-align: center;" class="aa-prod-view-bottom">
											<br> <br> <br>
											<p style="font-size: 50px; color: red;">!</p>
											<h4>장바구니에 담긴 상품이 없습니다.</h4>
											<a href="<c:url value='/productList.sh'/>"
												class="aa-add-to-cart-btn">쇼핑하러 가기</a> <br> <br> <br>
											<br> <br>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="cart-view-table" style="background-color: white;">
									<div class="table-responsive">
										<form action="<c:url value='/checkout.sh'/>" id="basketProduct" method="post">
										<input type="hidden" value="${sessionScope.member_email}" id="member_email">
											<h2>장바구니</h2>
											<table class="table" style="border: none;">
												<thead>
													<tr style="border: none;">
<!-- 														<th></th> -->
														<th colspan="2" style="border: none;">제품 정보</th>
														<th style="border: none;">제품 금액</th>
														<th style="border: none;">수량</th>
														<th style="border: none;">총 금액</th>
														<th style="border: none;"></th>
													</tr>
												</thead>
												<tbody>
													<!-- 총 가격 계산할 변수 선언 -->
													<c:set var = "total" value = "0" />
													<c:forEach var="basketList" items="${basketList}" varStatus="status">
														<tr style="border: none;">
															<!-- 이미지 -->
<!-- 															<td><a href="#"><img src="#" alt="img"></a></td> -->
															<td style="border: none;"><a href="#"><img src="<c:url value='/resources/upload/${basketList.product_main_image}'/>" alt="img"></a></td> <!-- 이미지 -->

															<!-- 제품 정보(이름, 용량), 제품 번호 -->
															<td style="border: none;"><input type="hidden" name="product_idx" class="product_idx" value="${basketList.product_idx}">
																<input type="hidden" name="product_name" class="product_idx" value="${basketList.product_name}">
																<a class="aa-cart-title" href="<c:url value='/productDetail.sh?product_idx=${basketList.product_idx}'/>">${basketList.product_name} - ${basketList.product_size}ml</a></td>

															<!-- 제품 가격 -->
															<td class="price" style="border: none;"><input type="hidden" class="product_price" name="product_price" value="${basketList.product_price}"> <fmt:formatNumber value="${basketList.product_price}" type="number"/></td>
															
															<!-- 가격 계산 -->
															<!-- jstl에서 + 기호는 숫자 연산만 가능. 문자열은 += 나 + 기호 없이 그냥 결합 가능 -->
															<c:set var= "total" value="${total + (basketList.basket_quantity * basketList.product_price)}"/>
															
															<!-- 수량 -->
															<td style="border: none;"><input class="aa-cart-quantity" name="basket_quantity" type="number" value="${basketList.basket_quantity}" min="1"></td>
															<td class="eachTotalPrice" style="border: none;"><fmt:formatNumber value="${basketList.basket_quantity * basketList.product_price}" type="number"/></td>

															<!-- 삭제버튼 -->
															<td style="border: none;"><a class="remove" href="#" name="${basketList.product_idx}" id="${basketList.product_idx}"><fa class="fa fa-close"></fa></a></td>
														</tr>
													</c:forEach>
													<tr>
														<td colspan="6" class="aa-cart-view-bottom" style="border: none; padding: 50px 25%;">
															<!-- 용량 컬럼을 추가해보려고 했는데 colspan="7" 으로 변경하면 밑 부분 표가 깨집니다 -->
															<!-- _responsice.scss에 관련 스타일이 있는데 다른 태그들이랑 묶여 있어서 손대기 어려울듯.. -->
															<div class="aa-cart-coupon">
																<!--                             <input class="aa-coupon-code" type="text" placeholder="쿠폰(텍스트->셀렉트)"> 셀렉트 박스로 바꿈 -->
																<select name="coupon" class="aa-coupon-code" id="coupon">
																	<option value="0" id="nonSelectedCoupon">쿠폰 선택</option>
																	<c:if test="${! empty couponList}">
																	<c:forEach var="couponList" items="${couponList}">
																	<option value="${couponList.coupon_price}" id="${couponList.coupon_idx}">${couponList.coupon_name} - <fmt:formatNumber value="${couponList.coupon_price}" type="number" />원 할인</option>
																	</c:forEach>
																	</c:if>
																</select> <input class="aa-cart-view-btn" type="submit" value="쿠폰 적용">
															</div><!--  <input class="aa-cart-view-btn" type="submit" value="업데이트"> 수량 바꾸고 적용하는 버튼 -->
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
									<!-- Cart Total view -->
									<div class="cart-view-total" style="width: 650px;">
										<table class="aa-totals-table" style="border: none;">
											<tbody>
												<tr style="border: none;">
													<th style="border: none;">상품 금액</th>
													<th style="border: none;">+</th>
													<th style="border: none;">할인 금액</th>
													<th style="border: none;">=</th>
													<th style="border: none;">주문 합계</th>
												
												</tr>
												<tr style="border: none;">
													<td id="beforeDiscountTotal" style="border: none; font-size: 25px;"><fmt:formatNumber value="${total}" type="number"/></td>
													<td style="border: none; font-size: 25px;">+</td>
													<td id="discount" style="border: none; font-size: 25px;">0</td>
													<td style="border: none; font-size: 25px;">=</td>
													<td id="total" style="border: none; font-size: 30px; font-weight: bold;"><fmt:formatNumber value="${total}" type="number"/></td>
												</tr>
											</tbody>
										</table>
										<br>* 포인트 사용은 결제 페이지에서 가능합니다.<br><br>
										<input type="submit" form="basketProduct" value="결제하기" class="aa-cart-view-btn" style="float: none;">
									</div>
								</div>
							</c:otherwise>
						</c:choose>
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