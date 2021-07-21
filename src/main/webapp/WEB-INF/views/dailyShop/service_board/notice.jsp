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
								<ul class="nav nav-tabs aa-products-tab">
									<li class="active"><a href="#all" data-toggle="tab">공지사항</a></li>
									<li><a href="#sitrus" data-toggle="tab">FAQ</a></li>
									<li><a href="#aqua" data-toggle="tab">1:1문의</a></li>
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
					                        <th>작성자</th>
					                        <th>작성일</th>
					                      </tr>
					                    </thead>
					                    <!-- 상품 목록 나열 -->
					                    <tbody>
					                      <tr>
					                        <td>1</td>
					                        <td>공지사항1</td>
					                        <td>관리자</td>
					                        <td>2021.07.17</td>
					                      </tr>
					                      <tr>
					                        <td>2</td>
					                        <td>공지사항2</td>
					                        <td>관리자</td>
					                        <td>2021.07.18</td>
					                      </tr>
					                      <tr>
					                        <td>3</td>
					                        <td>공지사항3</td>
					                        <td>관리자</td>
					                        <td>2021.07.19</td>
					                      </tr>
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
									<div class="tab-pane fade" id="sitrus">
										<ul class="aa-product-catg">
											<!-- ---------------------------------------------start single product item --------------------------------------------------------->
											<section class="content">
												<jsp:include page="FAQ.jsp"></jsp:include>
											</section>
											<!-- /.content -->
										</ul>
									</div>
									<!-- / women product category -->
									<!--------------------------------------------- Start product category -------------------------------------------------->
									<div class="tab-pane fade" id="aqua">
										<ul class="aa-product-catg">
											<!-- ---------------------------------------------start single product item --------------------------------------------------------->
											<section id="aa-contact">
												<jsp:include page="contact.jsp"></jsp:include>
											</section>
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