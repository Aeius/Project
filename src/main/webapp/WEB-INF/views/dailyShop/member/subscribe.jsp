<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Shop | Home</title>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


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
	<section id="aa-catg-head-banner">
		<img src="../img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>결제 완료</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->

	<!-- Cart view section -->
	<section id="aa-myaccount">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-myaccount-area">
						<div class="row">
							<div class="col-md-6">
								<div class="aa-myaccount-login">
									<h2>구독 서비스</h2>
									<div class="about-page">
										<div class="container">
											<div class="row">
												<div class="col-md-12">
													<div class="section-heading">
														<div class="line-dec"></div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="right-content">
														<p>혜택내용들 글로 작성
														</p>
														<br>
														<p>제품 30퍼센트 파격 할인!</p>
														<br>
														<p>구독자 한정 사은품 제공!</p>
														<br>
														<p>
															구독자의 경우 
															구독 만료 기간 : 2021.12.31
															출력
														</p>

													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label>구독 하기</label>
										<div class="radio">
											<label> <input type="radio" name="optionsRadiosW"
												id="optionsRadiosW1" value="option1"> 1개월
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="optionsRadiosW"
												id="optionsRadiosW2" value="option2"> 3개월
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="optionsRadiosW"
												id="optionsRadiosW3" value="option3"> 6개월
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="optionsRadiosW"
												id="optionsRadiosW4" value="option4"> 1년
											</label>
										</div>
									</div>
									<div class="box-footer">
										<button type="submit" class="btn btn-primary">구독하기</button>
									</div>
								</div>
							</div>
						</div>
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