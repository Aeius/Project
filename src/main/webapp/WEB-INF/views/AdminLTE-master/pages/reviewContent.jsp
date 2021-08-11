<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
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
                  <h1 class="box-title">리뷰 내용 확인페이지</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form">
                    <!-- text input -->
                    <div class="form-group">
                      <label>리뷰 제목</label>
                      <input type="text" value="${review.review_subject}" class="form-control" name="review_subject" id="review_subject" readonly="readonly"/>
                    </div>
                    <!-- textarea -->
                     <div class="form-group">
                      <label>리뷰 사진</label><br>
                      <div>
                      	<table>
                      		<tr>
                      			<td>
	                      <c:if test="${not empty review.review_image }">
		                      <img src='<c:url value="/resources/upload/${review.review_image }"/>' height="200px" >
	                      </c:if>
                      			</td>
                      			<td>
	                      <c:if test="${not empty review.review_image2 }">
		                      <img src='<c:url value="/resources/upload/${review.review_image2 }"/>'  height="200px">
	                      </c:if>
                      			</td>
                      		</tr>
                      	</table>
                      </div>
                     </div>
                    <div class="form-group">
                      <label>리뷰 내용</label>
                      <textarea class="form-control" rows="15" name="review_content" id="review_content" readonly="readonly">${review.review_content}</textarea>
                    </div>
					<div class="box-footer">
                  </div>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
      </div><!-- /.content-wrapper -->
      
      
      
      
      <!-- ==========본문 끝========== -->

      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->

    <jsp:include page="../inc/script.jsp" />
  </body>
</html>