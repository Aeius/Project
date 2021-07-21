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
      <div class="box box-warning">
                <div class="box-header">
                  <h1 class="box-title">쿠폰 생성하기</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form">
                    <!-- text input -->
                    <div class="form-group">
                      <label>쿠폰 코드 입력</label>
                      <input type="text" class="form-control" placeholder="쿠폰 코드를 입력하세요"/>
                    </div>

                    <!-- radio -->
                    <div class="form-group">
                      <label>할인 금액 선택</label>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosP" id="optionsRadiosP1" value="option1">
                          1천원
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosP" id="optionsRadiosP2" value="option2">
                          2천원
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosP" id="optionsRadiosP3" value="option3">
                          3천원
                        </label>
                      </div>
                    </div>
                    
                    <!-- radio -->
                    <div class="form-group">
                      <label>유효 기간 선택</label>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosW" id="optionsRadiosW1" value="option1">
                          1주일
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosW" id="optionsRadiosW2" value="option2">
                          2주일
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosW" id="optionsRadiosW3" value="option3">
                          3주일
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadiosW" id="optionsRadiosW4" value="option4">
                          4주일
                        </label>
                      </div>
                    </div>
					<div class="box-footer">
                    <button type="submit" class="btn btn-primary">쿠폰생성</button>
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