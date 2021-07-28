<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <h2>검색 결과</h2>
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
                    <li class="active"><a href="#all" data-toggle="tab">검색 결과</a></li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!--------------------------------------------- Start all product category -------------------------------------------------->
                    <div class="tab-pane fade in active" id="all">
                      <ul class="aa-product-catg">
                        <!---------------------------------------------------  start single product item--------------------------------------------->
                        <c:forEach var="search" items="${search }">
                        <li>
                          <figure>
                            <a class="aa-product-img"  href="productDetail.sh?product_idx=${search.product_idx }"><img src="<c:url value='/resources/upload/${search.product_main_image }' />" width="250" height="300" alt="polo shirt img"></a>
<!--                             <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> <!-- 장바구니 담기 버튼 활성화 -->
                              <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${search.product_idx }">${search.product_name }</a></h4>
                              <span class="aa-product-price">$ ${allList.product_price }</span><span class="aa-product-price"><del>${search.product_price }</del></span>
                            </figcaption>
                          </figure>                        
                          <div class="aa-product-hvr-content">
                       	 <a class="aa-add-to-cart-btn" id="wishlistbtn" > <span id="wish${search.product_idx }">좋아요 수♡ ${search.product_likecount }</span></a>
<%--                        <a href="pushWishList.sh?product_idx=${allList.product_idx }" data-toggle="tooltip" data-placement="top" title="좋아요 ${allList.product_likecount }"><span class="fa fa-heart-o"></span></a>  <!-- 찜하기 버튼 --> --%>
<!--                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>   비교하기 버튼
<!--                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>  <!--퀵뷰                      -->
                          </div>
                          
<!--                       ---- product badge- -->
<!--                           <span class="aa-badge aa-sale" href="#">SALE!</span> 세일중 표시 -->
						<c:if test="${search.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
<!--                      <span class="aa-badge aa-hot" href="#">HOT!</span> 인기 표시 -->
                        </li>
						</c:forEach>
					<!------------------------------------  검색 결과가 적을 경우 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------  검색 결과가 적을 경우 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                    </div>
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