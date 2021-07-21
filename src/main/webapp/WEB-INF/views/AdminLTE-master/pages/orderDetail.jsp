<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            주문 상세 정보
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- 박스 시작 -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">주문 상품 정보</h3> <!-- 박스타이틀 -->
            </div>
            <!-- 한 줄 내용 -->
            <div class="box-body">
              1) 상품명 / 용량 / 수량 / 가격
            </div>
            <!-- 한 줄 끝 -->
            <div class="box-body">
              2) 상품명 / 용량 / 수량 / 가격
            </div><!-- /.box-body -->
          </div><!-- 박스끝 -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">결제 정보</h3>
            </div>
            <div class="box-body">
              사용한 쿠폰 : 
            </div>
            <div class="box-body">
              사용한 포인트 : 
            </div>
            <div class="box-body">
              총 결제 금액 : 
            </div>
            <div class="box-body">
              결제 수단 : 
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">주문자 정보</h3>
            </div>
            <div class="box-body">
              아이디 : 
            </div>
            <div class="box-body">
              이름 : 
            </div>
            <div class="box-body">
              연락처 : 
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">받는 사람 정보</h3>
            </div>
            <div class="box-body">
              이름 :
            </div>
            <div class="box-body">
              연락처 :
            </div>
            <div class="box-body">
              주소 :
            </div><!-- /.box-body -->
          </div><!-- /.box -->
          
          <input type="button" value="목록으로 돌아가기"  onClick="location.href='orderList.jsp'">

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      
      
      
      <!-- ==========본문 끝========== -->

      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->

    <jsp:include page="../inc/script.jsp" />
    
  </body>
</html>