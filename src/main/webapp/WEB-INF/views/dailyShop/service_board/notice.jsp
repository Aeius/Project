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
<!-- 					                        <th>내용</th> -->
					                        <th>작성자</th>
					                        <th>작성일</th>
					                      </tr>
					                    </thead>
					                    <!-- 상품 목록 나열 -->
					                    <tbody>
					                    <c:forEach var="nb" items="${nbList}">
					                      <tr>
					                        <td>${nb.notice_idx}</td>
					                         <td><a href='<c:url value=
					                         "/board/contentView.sh?notice_idx=${nb.notice_idx}" />'>${nb.notice_subject }</a></td>
<%-- 					                        <td>${nb.notice_content}</td> --%>
					                        <td>${nb.notice_name}</td>
					                        <td><fmt:formatDate value="${nb.notice_date}" type="both" pattern="yyyy.MM.dd"/></td>
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
                           <c:if test="${pb.startPage > pb.pageBlock }">
                            <a href='<c:url value="/board/noticelist.sh?pageNum=${pb.startPage-pb.pageBlock }" />' aria-label="Previous">
                              <span aria-hidden="true">«</span>
                            </a>
                            </c:if>
                                                       
                          </li>
                          
                          <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
                             <li><a href='<c:url value="/board/noticelist.sh?pageNum=${i }" />'>${i }</a></li>
                     </c:forEach>
               
                          <li>
                          <c:if test="${pb.endPage < pb.pageCount }">
                           <a href='<c:url value="/board/noticelist.sh?pageNum=${pb.startPage+pb.pageBlock }" />' aria-label="Next">
                              <span aria-hidden="true">»</span>
                            </a>
                          </c:if>
                          </li>
                        </ul>
                      </nav>
                    </div>   
<!-- 				                              <SPAN ARIA-HIDDEN="TRUE">»</SPAN> -->
<!-- 				                            </A> -->
<!-- 				                          </LI> -->
<!-- 				                        </UL> -->
<!-- 				                      </NAV> -->
<!-- 				                    </DIV>  -->
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
					<div class="aa-contact-address">
						<div class="row">
							<div class="col-md-8">
								<div class="aa-contact-address-left">
									<form class="comments-form contact-form" action="mailsend.sh" method="GET">
										<div class="row">
								
											<div class="col-md-6">
												<div class="form-group">
													<input type="email" placeholder="Email" id="email" name="setfrom"
														class="form-control" value="${member.getMember_email()}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" placeholder="subject"
														class="form-control" id="title" name="title">
												</div>
											</div>
										</div>

										<div class="form-group">
											<textarea class="form-control" rows="20"
												placeholder="Message" id="content" name="content"></textarea>
										</div>

									<input type="submit" value="메일 보내기" class="aa-secondary-btn">

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