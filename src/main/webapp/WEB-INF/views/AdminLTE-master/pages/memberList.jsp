<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
          <h1>회원 목록</h1>
        </section>
1        

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">

              <div class="box">
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>회원번호</th>
                        <th>이메일</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>우편번호</th>
                        <th>주소</th>
                        <th>상세주소1</th>
                        <th>싱세주소2</th>
                        <th>가입날짜</th>
                        <th>쿠폰</th>
                        <th>좋아요</th>
                        <th>구독자</th>
                        <th>포인트</th>
                      </tr>
                    </thead>
                    <!-- 회원 목록 나열 -->
                    <tbody>
                      <c:forEach var="memberBean" items="${memberBeanList }">
						<tr><td>${memberBean.member_idx }</td>
			    	      <td>${memberBean.member_email }</td>
			    	      <td>${memberBean.member_name }</td>
			              <td>${memberBean.member_phone }</td>
			              <td>${memberBean.member_post }</td>
			              <td>${memberBean.member_address }</td>
			              <td>${memberBeanb.member_extraAddress }</td>
			              <td>${memberBean.member_extraAddress2 }</td>
			              <td>${memberBean.member_date }</td>
			              <td>${memberBean.member_coupon }</td>
			              <td>${memberBean.member_like }</td>
			              <td>${memberBean.member_subscribe }</td>
			              <td>${memberBean.member_point }</td></tr>
					</c:forEach> 
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->
    
	<jsp:include page="../inc/scriptTable.jsp" />
    <!-- page script -->
    <script type="text/javascript">
      $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script>

  </body>
</html>