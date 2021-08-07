<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
    

  		<script type="text/javascript">
  	//-------------------------------------------------------------- 리뷰작성 window창 생성 --------------------------------------------------------
		function review(product_idx,order_idx){
			
			
				window.name="parentForm"
				document.open("<c:url value='/reviewForm.sh?product_idx="+product_idx+"&order_idx="+order_idx+"'/>","replyForm","width=720, height=800");
				}
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
   <!-- product category -->
  <section id="cart-view">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-catg-content">
          <br><br>
            <div class="aa-product-catg-body">
            <form method="post" name="orderListForm" enctype="multipart/form-data">
                  <h2>주문내역</h2>
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>주문번호</th>
                        <th>주문상품</th>
                        <th>배송상태</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <!-- 상품 목록 나열 -->
                    <tbody>
                     <c:forEach var="orderList" items="${orderList}">
                      <tr>
                        <td>${orderList.order_idx}</td>
                        <td>${orderList.product_name}</td>
                        <td>${orderList.order_status}</td>
                        <td>
<%--         				<input type="button" value="${orderList.review_idx}" > --%>
        				
                       <c:set var="order_status" value="${orderList.order_status}" />
                       <c:set var="product_idx" value="${orderList.product_idx}" />
                       <c:set var="review_idx" value="${orderList.review_idx}" />
                        <c:set var="order_detail_return_check" value="${orderList.order_detail_return_check}" />
                       
                       <c:if test="${review_idx >0 and order_status eq '배송완료'}">
                        <input type="button" value="리뷰작성완료" >
                       </c:if>
                      
                       <c:if test="${order_status eq '배송완료' and review_idx == 0}">
                        <input type="button" value="리뷰쓰기" onclick="review( ${orderList.product_idx},${orderList.order_idx} )">
                       </c:if>

						 <c:if test="${empty order_detail_return_check and order_detail_return_check ne '반품신청'}">
                        <input type="button" value="반품신청" onclick="location.href='<c:url value='/orderReturn.sh?order_idx=${orderList.order_idx}&product_idx=${orderList.product_idx}'/>'">
                       </c:if>
                       
                       <c:if test="${order_detail_return_check eq '반품신청'}">
                        <input type="button" value="반품신청완료" >
                       </c:if>
                        </td>
                      </tr>
                      	
                      </c:forEach>
                        
                    </tbody>
                  </table>
                  </form>
                  <!-- 페이징 처리 -->
        		       <div class="aa-blog-archive-pagination" align="center">
                      <nav>
                        <ul class="pagination">
                          <li>
                          <c:if test="${pb.startPage > pb.pageBlock }">
                            <a href='<c:url value="/orderList.sh?pageNum=${pb.startPage-pb.pageBlock }" />' aria-label="Previous">
                              <span aria-hidden="true">«</span>
                            </a>
                            </c:if>
                                                       
                          </li>
                          
                          <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
                          	<li><a href='<c:url value="/orderList.sh?pageNum=${i }" />'>${i }</a></li>
    					  </c:forEach>
					
                          <li>
                          <c:if test="${pb.endPage < pb.pageCount }">
                           <a href='<c:url value="/orderList.sh?pageNum=${pb.startPage+pb.pageBlock }" />' aria-label="Next">
                              <span aria-hidden="true">»</span>
                            </a>
                          </c:if>
                          </li> 
                        </ul>
                      </nav>
                    </div> 
            </div>
          </div>
        </div>
        </div>
        </div>
  </section>
  <!-- / product category -->

 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>