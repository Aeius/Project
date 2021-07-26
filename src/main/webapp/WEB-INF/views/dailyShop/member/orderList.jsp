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
						
						function review(product_idx){
							
							// 댓글 번호를 새로운 윈도우 창으로 가져가 댓글 번호 정보 비교
								window.name="parentForm"
								document.open("<c:url value='/reviewForm.sh?product_idx="+product_idx+"'/>","replyForm","width=720, height=800");
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
                        <td><input type="button" value="${orderList.order_status}">
                        <input type="button" value="리뷰쓰기" onclick="review(${product.product_idx})">
                        <input type="button" value="리뷰쓰기" onclick="review( ${orderList.product_idx} )">
                        <input type="button" value="반품신청">
                       
                        </td>
               
                        
                      </tr>
                      </c:forEach>
                      
                	<c:forEach var="" items="">
                	  <tr>
                	    <td>
                	
                        <script type="text/javascript">
// 						replyNum 값을 이벤트 처리시 전달 받아 값을 처리
						
						function reply(${product.product_idx}) {
							// 답변 기능
							// 댓글 번호를 새로운 윈도우 창으로 가져가 댓글 번호 정보 비교
								window.name="parentForm";
								document.open("/reviewForm?product_idx="+${product.product_idx}+"replyForm","width=750, height=200");
	  					}
						</script>
						
                        </td>
                       </tr>
                      </c:forEach>
                        
                    </tbody>
                  </table>
                  </form>
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