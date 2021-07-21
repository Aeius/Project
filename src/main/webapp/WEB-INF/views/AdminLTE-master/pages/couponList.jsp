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
          <h1>쿠폰 목록</h1>
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
                        <th>쿠폰코드</th>
                        <th>할인액</th>
                        <th>발급일</th>
                        <th>만료일</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <!-- 쿠폰 목록 나열 -->
                    <tbody>
                      <tr>
                        <td>WELCOME</td>
                        <td>3000원</td>
                        <td>2021.07.13</td>
                        <td>2021.07.20</td>
                        <td>
                        <input type="button" value="만료">
                        </td>
                      </tr>
                      <tr>
                        <td>SUMMERSUMMER</td>
                        <td>2000원</td>
                        <td>2021.07.15</td>
                        <td>2021.08.05</td>
                        <td>
                        <input type="button" value="만료">
                        </td>
                      </tr>
                      <tr>
                        <td>LOVEPURFUME</td>
                        <td>1000원</td>
                        <td>2021.07.10</td>
                        <td>2021.07.31</td>
                        <td>
                        <input type="button" value="만료">
                        </td>
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
