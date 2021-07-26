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
                  <h1 class="box-title">공지사항 수정하기</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form" action="<c:url value='/noticeUpdate.ad'/>" method="POST">
                 	 <input type="hidden" name="notice_name" id="notice_name" value="관리자">
                    <!-- text input -->
                    <div class="form-group">
                      <label>제목 입력</label>
                      <input type="hidden" value="${nb.notice_idx}" class="form-control" name="notice_idx" id="notice_idx"/>
                      <input type="text" value="${nb.notice_subject}" class="form-control" name="notice_subject" id="notice_subject"/>
                    </div>
                    <!-- textarea -->
                    <div class="form-group">
                      <label>내용 입력</label>
                      <textarea class="form-control" rows="15" name="notice_content" id="notice_content">${nb.notice_content}</textarea>
                    </div>
					<div class="box-footer">
                    <button type="submit" class="btn btn-primary">수정완료</button>
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