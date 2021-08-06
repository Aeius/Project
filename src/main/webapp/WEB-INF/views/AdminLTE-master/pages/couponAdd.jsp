<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">

	function couponNullCheck() {

		var coupon_name = document.getElementById('coupon_name');
		var coupon_date = document.getElementById('coupon_date');
		var coupon_expire = document.getElementById('coupon_expire');

		var blank_pattern = /^\s+|\s+$/g;

		if (coupon_name.value.replace(blank_pattern, '') == "") {
			alert('쿠폰 코드를 입력하세요.');
			$(coupon_name).focus();
			return false;
		}
		if (coupon_date.value.replace(blank_pattern, '') == "") {
			alert('쿠폰 유효기간 시작일을 선택하세요.');
			$(coupon_date).focus();

			return false;
		}
		if (coupon_expire.value.replace(blank_pattern, '') == "") {
			alert('쿠폰 만료일을 선택하세요.');
			$(coupon_expire).focus();

			return false;
		}
		if (coupon_expire.value <= coupon_date.value){
			alert('쿠폰 만료일을 다시 한번 확인하세요.');
			$(coupon_expire).focus();

			return false;
		}
	}
</script>
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
			<div class="box box-warning">
				<div class="box-header">
					<h1 class="box-title">쿠폰 생성하기</h1>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<form role="form" action="<c:url value='/couponAddPro.ad'/>"
						method="post" onsubmit="return couponNullCheck()">
						<!-- text input -->
						<div class="form-group">
							<label>쿠폰 코드 입력</label> <input type="text" autofocus="autofocus" name="coupon_name"
								id="coupon_name" class="form-control" maxlength="10"
								placeholder="쿠폰 코드를 입력하세요. (10 문자)" />
						</div>

						<!-- radio -->
						<div class="form-group">
							<label>할인 금액 선택</label>
							<div class="radio">
								<label> <input type="radio" name="coupon_price"
									id="coupon_price" value="1000" checked="checked"> 1천원
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="coupon_price"
									id="coupon_price" value="2000"> 2천원
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="coupon_price"
									id="coupon_price" value="3000"> 3천원
								</label>
							</div>
						</div>

						<!-- radio -->
						<div class="form-group">
							<label>유효 기간 선택</label><br> <label> <input
								type="date" name="coupon_date" id="coupon_date">
							</label> &nbsp; ~ &nbsp; <label> <input type="date"
								name="coupon_expire" id="coupon_expire">
							</label>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">쿠폰생성</button>
						</div>
					</form>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.content-wrapper -->

		<!-- ==========본문 끝========== -->
		<jsp:include page="../inc/footer.jsp" />
	</div>
	<!-- ./wrapper -->

	<jsp:include page="../inc/script.jsp" />

</body>
</html>