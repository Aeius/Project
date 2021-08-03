<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 포맷 설정 -->
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="../inc/head.jsp" />
  
  <body class="skin-blue">
  
      <!--   admin 구분 :  로그인이 되어있지 않으면 로그인 페이지로 이동, 일반회원이면 홈페이지로 이동 -->
  <c:choose>
  	<c:when test="${empty sessionScope }">
  		<c:redirect url="/login.ad"></c:redirect>
  	</c:when>
  	<c:when test="${ sessionScope.member_email ne 'admin'  }">
  		<c:redirect url="/main.sh"></c:redirect>
  	</c:when>
  </c:choose>
  
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
          <h1>매출 현황</h1>
        </section>
        

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">

              <div class="box">
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      	<th>상품번호</th>
                        <th>상품명</th>
                        <th>판매수량</th>
                        <th>판매액</th>
                      </tr>
                    </thead>
                    <!-- 상품 목록 나열 -->
                    <tbody>
                    <c:forEach var="list" items="${allList }" varStatus="status">
                      <tr>
                      	<td>${list.product_idx }</td>
                        <td><img src='<c:url value="/resources/upload/${list.product_main_image }"/>' width="30px" >&nbsp;&nbsp;
              				${list.product_name }</td>
                        <td>${list.product_sellcount }개</td>
                        <td><fmt:formatNumber value="${list.product_sellcount * list.product_price}" pattern="#,###,###,###,###"/>원</td>
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