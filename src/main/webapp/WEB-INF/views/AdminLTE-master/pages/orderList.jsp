<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <h1>주문 목록</h1>
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
                        <th>주문번호</th>
                        <th>주문자</th>
                        <th>배송상황</th>
                        <th>송장번호</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <!-- 상품 목록 나열 -->
                    <tbody>
<!--                       <tr> -->
<!--                         <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">6</td> -->
<!--                         <td>회원아이디6</td> -->
<!--                         <td>배송완료</td> -->
<!--                         <td>송장번호</td> -->
<!--                         <td> -->
<!--                         <select name="status" > -->
<!-- 						    <option value="">선택하세요</option> -->
<!-- 						    <option value="배송준비">배송준비</option> -->
<!-- 						    <option value="배송중">배송중</option> -->
<!-- 						    <option value="배송완료">배송완료</option> -->
<!-- 						    <option value="반품준비">반품준비</option> -->
<!-- 						    <option value="반품완료">반품완료</option> -->
<!-- 						    <option value="주문취소">주문취소</option> -->
<!-- 						</select> -->
<!--                         <input type="button" value="확정"> -->
<!--                         <input type="button" value="취소"> -->
<!--                         </td> -->
<!--                       </tr> -->
                      
                      <c:forEach var="allList" items="${allList }">
                      	<tr>
                      		<td>${allList.order_idx }</td>
                      		<td>${allList.order_member_email }</td>
                      		<td>${allList.order_status }</td>
                      		<td>${allList.order_tracking_num }</td>
                      		<td><input type="button" value="상태변경"></td>
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
