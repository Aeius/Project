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
                  <h1 class="box-title">상품 등록하기</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form" action='<c:url value="/productAddPro.ad" />' method="post" enctype="multipart/form-data">
					<!-- text input -->
                    <div class="form-group">
                      <label>상품 이름 입력</label>
                      <input type="text" id="product_name" name="product_name" class="form-control" placeholder="상품 이름을 입력하세요"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 용량 입력</label>
                      <input type="text" id="product_size" name="product_size" class="form-control" placeholder="상품 용량을 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 가격 입력</label> 
                      <input type="text" id="product_price" name="product_price" class="form-control" placeholder="상품 가격을 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 재고 입력</label>
                      <input type="text" id="product_stock" name="product_stock" class="form-control" placeholder="상품 재고를 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- file -->
                    <div class="form-group">
                      <label for="exampleInputFile">상품 메인 사진</label>
                      <input multiple="multiple" type="file" id="product_main_image" name="file">
                    </div>
                    <!-- 다중 파일 업로드시 multiple="multiple" 추가 / name="file" 이어야함 -->
                    <div class="form-group">
                      <label for="exampleInputFile">상품 상세 사진</label>
                      <input multiple="multiple" type="file" id="product_detail_image" name="file">
                    </div>
                    
                    <!-- textarea -->
                    <div class="form-group">
                      <label>상품 상세 내용 입력</label>
                      <textarea class="form-control" id="product_detail" name="product_detail" rows="5" placeholder="상품 상세 내용을 입력하세요"></textarea>
                    </div>
                    
                    <!-- checkbox -->
                    <div class="form-group">
                      <label>상품 카테고리 선택</label>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="파우더리"/>파우더리</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="플로럴"/>플로럴</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="우디"/>우디</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="아쿠아"/>아쿠아</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="프루티"/>프루티</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="시트러스"/>시트러스</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="스파이시"/>스파이시</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="모던"/>모던</label></div>
                    </div>
                    
					<div class="box-footer">
                    <button type="submit" class="btn btn-primary">상품등록</button>
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