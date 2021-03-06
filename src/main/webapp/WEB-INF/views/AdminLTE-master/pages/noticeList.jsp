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
          <h1>공지사항 목록</h1>
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
                        <th>글번호</th>
                        <th>제목</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <!-- 공지사항 목록 나열 -->
                    <tbody>
                    <c:forEach var="nb" items="${NoticeList}">
                      <tr>
                        <td>${nb.notice_idx}</td>
                        <td>${nb.notice_subject}</td>
                        <td>
                        <input type="button" value="보기 및 수정" onclick="location.href='<c:url value="/noticeInfo.ad?notice_idx=${nb.notice_idx}"/>'">
					 	<input type="button" value="삭제" onclick="location.href='<c:url value="/deleteNoticePro.ad?notice_idx=${nb.notice_idx}"/>'">					
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
