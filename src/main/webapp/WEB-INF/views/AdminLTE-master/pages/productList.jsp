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
          <h1>상품 목록</h1>
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
                        <th>용량(ml)</th>
                        <th>가격(원)</th>
                        <th>재고(개)</th>
                        <th>좋아요(♥)</th>
                        <th>판매상태</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <!-- 상품 목록 나열 -->
                    <tbody>
                      <c:forEach var="list" items="${allList }" varStatus="status">
	                      <tr>
	                        <td>${list.product_idx }</td>
	                        <td>
	                        <!-- 미니 이미지 -->
	                        <img src='<c:url value="/resources/upload/${list.product_main_image }"/>' width="30px" >&nbsp;&nbsp;
	                        ${list.product_name }</td>
	                        <td>${list.product_size }</td>
	                        <td>${list.product_price }</td>
	                        <td>${list.product_stock }</td>
	                        <td>${list.product_likecount }</td>
	                        <td>
		                        <c:choose>
		                        	<c:when test="${list.product_status eq true }">판매중</c:when>
		                        	<c:otherwise>중단</c:otherwise>
		                        </c:choose>
	                        </td>
	                        <td>
	                        <input type="button" value="수정" onclick="location.href='<c:url value="/productUpdate.ad?product_idx=${list.product_idx}"/>'">
	                        	<c:choose>
	                        		<c:when test="${list.product_status eq true }">
	                        			<input type="button" value="판매중단" onclick="location.href='<c:url value="/productDiscontinuePro.ad?product_idx=${list.product_idx}"/>'">
                        			</c:when>
		                        	<c:otherwise>
		                        		<input type="button" value="판매시작" onclick="location.href='<c:url value="/productReleasePro.ad?product_idx=${list.product_idx}"/>'">
		                        	</c:otherwise>
	                        	</c:choose>
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
        	"aaSorting" : [[0,'desc']],
        	// 정렬 순서 지정 -> 테이블 열 순서
        	"aoColumns": [   // 내림차순, 오름차순 순서로 정렬됨
       		  { "asSorting": [ "desc", "asc" ] }, // 0열
       	      { "asSorting": [ "desc", "asc" ] }, // 1열
       	   	  { "asSorting": [ "desc", "asc" ] }, // 2열
       	   	  { "asSorting": [ "desc", "asc" ] },
       	      { "asSorting": [ "desc", "asc" ] },
      	 	  { "asSorting": [ "desc", "asc" ] },
      	      { "asSorting": [ "asc", "desc" ] },
    	      null
       	    ]
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