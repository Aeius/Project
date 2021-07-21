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
          <h1>회원 목록</h1>
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
                        <th>아이디</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>주소</th>
                        <th>상세주소</th>
                        <th>SMS수신</th>
                        <th>카톡수신</th>
                        <th>메일수신</th>
                        <th>구독자</th>
                      </tr>
                    </thead>
                    <!-- 회원 목록 나열 -->
                    <tbody>
                      <tr>
                        <td>hongildon@naver.com</td>
                        <td>홍길동</td>
                        <td>010-0000-1111</td>
                        <td>서울특별시 뒷산 변방</td>
                        <td>2층</td>
                        <td>X</td>
                        <td>O</td>
                        <td>X</td>
                        <td>O</td>
                      </tr>
                      <tr>
                         <td>hongildon@naver.com</td>
                        <td>홍길동</td>
                        <td>110-0000-1111</td>
                        <td>서울특별시 뒷산 변방</td>
                        <td>3층</td>
                        <td>X</td>
                        <td>X</td>
                        <td>X</td>
                        <td>X</td>
                      </tr>
                      <tr>
                        <td>hongildon@naver.com</td>
                        <td>홍길동</td>
                        <td>210-0000-1111</td>
                        <td>서울특별시 뒷산 변방</td>
                        <td>4층</td>
                        <td>O</td>
                        <td>X</td>
                        <td>O</td>
                        <td>X</td>
                      </tr>
                      <tr>
                        <td>hongildon@naver.com</td>
                        <td>홍길동</td>
                        <td>310-0000-1111</td>
                        <td>서울특별시 뒷산 변방</td>
                        <td>5층</td>
                        <td>X</td>
                        <td>O</td>
                        <td>X</td>
                        <td>O</td>
                      </tr>
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
