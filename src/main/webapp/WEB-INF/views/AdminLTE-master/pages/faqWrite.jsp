<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <h1 class="box-title">FAQ 등록하기</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form" action='<c:url value="/pages/faqWritePro" />' method="post">
                    <!-- textarea -->
                    <div class="form-group">
                      <label>질문 입력</label>
                      <textarea name="faq_question" class="form-control" rows="5" placeholder="내용을 입력하세요"></textarea>
                    </div>
                    
                    <!-- textarea -->
                    <div class="form-group">
                      <label>답변 입력</label>
                      <textarea name="faq_answer" class="form-control" rows="5" placeholder="내용을 입력하세요"></textarea>
                    </div>
					  
					<div class="box-footer">
                    <button type="submit" class="btn btn-primary">FAQ 등록</button>
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