<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.itwillbs.dao.NoticeDAOImpl"%>
<%@page import="com.itwillbs.dao.NoticeDAO"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

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
		<img src="<c:url value='/resources/img/fashion/fashion-header-bg-8.jpg'/>" alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>Service</h2>
					<!--         <ol class="breadcrumb"> -->
					<!--           <li><a href="index.html">Home</a></li>          -->
					<!--           <li class="active">Women</li> -->
					<!--         </ol> -->
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->

	<section id="aa-product">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="aa-product-area">
							<div class="aa-product-inner">
								<!-- start prduct navigation -->
								<h3><a href="notice">공지사항</a></h3>
								<h3><a href="FAQ">FAQ</a></h3>
								<h3><a href="QNA">1:1문의</a></h3>
								<ul class="nav nav-tabs aa-products-tab">
									<li class="active"><a href="#all" data-toggle="tab">공지사항</a></li>
									<li><a href="#FAQ" data-toggle="tab">FAQ</a></li>
									<li><a href="#QNA" data-toggle="tab">1:1문의</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<!--------------------------------------------- Start all product category -------------------------------------------------->
									<div class="tab-pane fade in active" id="all">
											<!---------------------------------------------------  start single product item--------------------------------------------->
											  <section id="cart-view">
					    <div class="container">
					      <div class="row">
					        <div class="col-md-12">
					          <div class="aa-product-catg-content">
					          <br><br>
					            <div class="aa-product-catg-body">
					                  <table id="example1" class="table table-bordered table-striped">
					                    <thead>
					                      <tr>
					                        <th>글번호</th>
					                        <th>제목</th>
					                        <th>내용</th>
					                        <th>작성자</th>
					                        <th>작성일</th>
					                      </tr>
					                    </thead>
					                    <!-- 상품 목록 나열 -->
					                    <tbody>
					                    <c:forEach var="nb" items="${NoticeList}">
					                      <tr>
					                        <td>${nb.notice_idx}</td>
					                        <td>${nb.notice_subject}</td>
					                        <td>${nb.notice_content}</td>
					                        <td>${nb.notice_name}</td>
					                        <td>${nb.notice_date}</td>
					                      </tr>
					                    </c:forEach>
					                    </tbody>
					                  </table>
					            </div>
					          </div>
					        </div>
					        </div>
					        </div>
					        		<div class="aa-blog-archive-pagination" align="center">
				                      <nav>
				                        <ul class="pagination">
				                          <li>
				                            <a href="#" aria-label="Previous">
				                              <span aria-hidden="true">«</span>
				                            </a>
				                          </li>
				                          <li><a href="#">1</a></li>
				                          <li><a href="#">2</a></li>
				                          <li><a href="#">3</a></li>
				                          <li><a href="#">4</a></li>
				                          <li><a href="#">5</a></li>
				                          <li>
				                            <a href="#" aria-label="Next">
				                              <span aria-hidden="true">»</span>
				                            </a>
				                          </li>
				                        </ul>
				                      </nav>
				                    </div> 
					  </section>
					  
  
											<!-- /.content -->
											<!-- ------------------------------------------------------------------------------------------------------------------------------------ -->
									</div>

									<!------------------------------------------- start sitrus product category--------------------------------------------------------------->
									<div class="tab-pane fade" id="FAQ">
										<ul class="aa-product-catg">
											<!-- ---------------------------------------------start single product item --------------------------------------------------------->
											<section id="checkout">

		<div class="container">
			<div class="row">
				<!--        <div class="col-md-12"> -->
				<div class="checkout-area">
					<div class="row">
						<!--               <div class="col-md-8"> -->
						<!-- 가로 길이 조절 -->
						<div class="checkout-left">

								<div class="panel-group" id="accordion">
									<c:forEach var="fbb" items="${faqList}">
									<div class="panel panel-default aa-checkout-billaddress">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne${fbb.faq_idx}"> <!-- href = collapse### 이랑 아래에 -->
													Q. 질문 ${fbb.faq_idx} ${fbb.faq_question}

												</a>
											</h4>
										</div>
										<div id="collapseOne${fbb.faq_idx}" class="panel-collapse collapse">
											<!-- id = collapse### 에서 ###을 맞춰줘야 해당 답변 펼쳐짐 (아무 단어나 넣어도 되는듯)-->

											<div class="panel-body">
												<div class="row">
													<div class="col-md-12">A. 답변 내용 ${fbb.faq_answer}
														</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
											<!-- /.content -->
										</ul>
									</div>
									<!-- / women product category -->
									<!--------------------------------------------- Start product category -------------------------------------------------->
									<div class="tab-pane fade" id="QNA">
										<ul class="aa-product-catg">
											<!-- ---------------------------------------------start single product item --------------------------------------------------------->
											<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="aa-contact-area">
					<div class="aa-contact-top">

						<h2>1:1 문의</h2>
						<p>- 아래 사항을 입력하시어 문의해주시면 확인 후 메일로 답변드립니다.</p>
					</div>
					<!-- contact map -->
					<!-- 					<div class="aa-contact-map"> -->
					<!-- 						<iframe -->
					<!-- 							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.3714257064535!2d-86.7550931378034!3d34.66757706940219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8862656f8475892d%3A0xf3b1aee5313c9d4d!2sHuntsville%2C+AL+35813%2C+USA!5e0!3m2!1sen!2sbd!4v1445253385137" -->
					<!-- 							width="100%" height="450" frameborder="0" style="border: 0" -->
					<!-- 							allowfullscreen></iframe> -->
					<!-- 					</div> -->
					<!-- Contact address -->
					<div class="aa-contact-address">
						<div class="row">
							<div class="col-md-8">
								<div class="aa-contact-address-left">
									<form class="comments-form contact-form" action="">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" placeholder="Your Name"
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="email" placeholder="Email"
														class="form-control">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" placeholder="Subject"
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" placeholder="Company"
														class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<textarea class="form-control" rows="20"
												placeholder="Message"></textarea>
										</div>
										<button class="aa-secondary-btn">Send</button>
									</form>
								</div>
							</div>
							<div class="col-md-4">
								<div class="aa-contact-address-right">
									<address>
										<h4>DailyShop</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Rerum modi dolor facilis! Nihil error, eius.</p>
										<p>
											<span class="fa fa-home"></span>Huntsville, AL 35813, USA
										</p>
										<p>
											<span class="fa fa-phone"></span>+ 021.343.7575
										</p>
										<p>
											<span class="fa fa-envelope"></span>Email:
											support@dailyshop.com
										</p>
									</address>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
											<!-- /.content -->
										</ul>
									</div>
									<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / product category -->

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- / footer -->



</body>
</html>