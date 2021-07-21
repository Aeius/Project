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
                        <th>용량</th>
                        <th>가격</th>
                        <th>재고</th>
                        <th>관리</th>
                        <!-- 좋아요 수 추가 -->
                      </tr>
                    </thead>
                    <!-- 상품 목록 나열 -->
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>페이지 개수 셀렉트박스랑</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>검색 박스랑 </td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>이전/다음 버튼이</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>js에 포함된 기능같은데</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>알아서 적용이 되네요</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>9</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                  	  <tr>
                        <td>10</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>11</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>12</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
                        </td>
                      </tr>
                      <tr>
                        <td>13</td>
                        <td>향수이름</td>
                        <td>30ml</td>
                        <td>50000</td>
                        <td>100</td>
                        <td>
                        <input type="button" value="수정">
                        <input type="button" value="삭제">
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
