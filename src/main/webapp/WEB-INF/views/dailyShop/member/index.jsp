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
 
  <!------------------------------------------------------- Start slider--------------------------------------------------------- -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/1.jpg'/>" alt="Men slide img" />
              </div>
              <div class="seq-title">
               <span data-seq>Save Up to 75% Off</span>                
                <h2 data-seq>Men Collection</h2>                
                <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
                <a data-seq href="../product_board/product.jsp" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/2.jpg'/>" alt="Wristwatch slide img" />
              </div>
              <div class="seq-title">
                <span data-seq>Save Up to 40% Off</span>                
                <h2 data-seq>Wristwatch Collection</h2>                
                <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
                <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/3.jpg'/>" alt="Women Jeans slide img" />
              </div>
              <div class="seq-title">
                <span data-seq>Save Up to 75% Off</span>                
                <h2 data-seq>Jeans Collection</h2>                
                <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
                <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            <!-- single slide item -->           
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/4.jpg'/>" alt="Shoes slide img" />
              </div>
              <div class="seq-title">
                <span data-seq>Save Up to 75% Off</span>                
                <h2 data-seq>Exclusive Shoes</h2>                
                <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
                <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            <!-- single slide item -->  
             <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/5.jpg'/>" alt="Male Female slide img" />
              </div>
              <div class="seq-title">
                <span data-seq>Save Up to 50% Off</span>                
                <h2 data-seq>Best Collection</h2>                
                <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
                <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>                   
          </ul>
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
  <!-- / slider -->
  <!----------------------------------------------------------- Start Promo section--------------------------------------- -->
  <!--  삭제! -->
  <!-- / Promo section -->
  <!---------------------------------------------------------------- Products section --------------------------------->
  <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#men" data-toggle="tab">베스트 상품</a></li>
<!--                     <li><a href="#women" data-toggle="tab">sdsd</a></li> -->
<!--                     <li><a href="#sports" data-toggle="tab">wewe</a></li> -->
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- Start men product category -->
                    <div class="tab-pane fade in active" id="all">
                      <ul class="aa-product-catg">
                        <!---------------------------------------------------  start single product item--------------------------------------------->
                        <c:forEach var="bestList" items="${bestList}">
                        <li>
                          <figure>
                            <a class="aa-product-img"  href="productDetail.sh?product_idx=${bestList.product_idx }"><img src="<c:url value='/resources/upload/${bestList.product_main_image }' />" width="250" height="300" alt="polo shirt img"></a>
<!--                             <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> <!-- 장바구니 담기 버튼 활성화 -->
                              <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${bestList.product_idx }">${bestList.product_name }</a></h4>
                              <span class="aa-product-price">$
                              ${bestList.product_price }</span><span class="aa-product-price">
                              </span>
                         	  </figcaption>
                          </figure>                        
                          <div class="aa-product-hvr-content">
                         <a class="aa-add-to-cart-btn" id="wishlistbtn" > <span id="wish${bestList.product_idx }">좋아요 수♡ ${bestList.product_likecount }</span></a>
<%--                       		 <a href="pushWishList.sh?product_idx=${bestList.product_idx }" data-toggle="tooltip" data-placement="top" title="좋아요 ${bestList.product_likecount }"><span class="fa fa-heart-o"></span></a>  <!-- 찜하기 버튼 --> --%>
<!--                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>   비교하기 버튼
<!--                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>  <!--퀵뷰                      -->
                          </div>
                          
<!--                       ---- product badge- -->
<!--                           <span class="aa-badge aa-sale" href="#">SALE!</span> 세일중 표시 -->
							<c:if test="${bestList.product_stock eq 0 }">
                    	 	<span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    		</c:if>
<!--                      <span class="aa-badge aa-hot" href="#">HOT!</span> 인기 표시 -->
                        </li>
						</c:forEach>
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

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

  <!-- Login Modal -->  

  

  </body>
</html>