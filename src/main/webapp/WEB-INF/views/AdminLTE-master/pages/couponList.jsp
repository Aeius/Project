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
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>쿠폰 목록</h1>
        </section>
        계정명 변경확인

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">

              <div class="box">
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>쿠폰 idx</th>
                        <th>쿠폰코드</th>
                        <th>할인액</th>
                        <th>발급일</th>
                        <th>만료일</th>
                        <th>상태</th>
                        <th>관리 &nbsp; <input type="button" value="자동 관리버튼" onclick="location.href='<c:url value="/couponAutoManage.ad"/>'"></th>
                      </tr>
                    </thead>
                    <!-- 쿠폰 목록 나열 -->
                    <tbody>
                      <c:forEach var="coupon" items="${coupon}">
                      <tr>
                        <td>${coupon.coupon_idx}</td>
                        <td>${coupon.coupon_name}</td>
                        <td>${coupon.coupon_price}</td>
                        <td>${coupon.coupon_date}</td>
                        <td>${coupon.coupon_expire}</td>
                        <td>${coupon.coupon_status}</td>
                        <td>
                        <input type="button" value="쿠폰 활성화" onclick="location.href='<c:url value="/unexpireCoupon.ad?coupon_idx=${coupon.coupon_idx}"/>'">
                        &nbsp;
                        <input type="button" value="쿠폰 비활성화" onclick="location.href='<c:url value="/expireCoupon.ad?coupon_idx=${coupon.coupon_idx}"/>'">
                        </td>
                      </tr>
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
        $("#example1").dataTable({
	      "aaSorting" : [[0,'desc']]
        });
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
