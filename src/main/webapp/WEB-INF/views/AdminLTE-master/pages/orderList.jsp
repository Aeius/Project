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
                      <tr>
                        <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">1</td>
                        <td>주문번호 칸</td>
                        <td>배송준비</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">2</td>
                        <td>클릭시</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                      	<td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">3</td>
                        <td>주문상세페이지로</td>
                        <td>배송완료</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">4</td>
                        <td>이동함</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">5</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td onClick="location.href='orderDetail.jsp'" style="cursor:pointer;">6</td>
                        <td>회원아이디6</td>
                        <td>배송완료</td>
                        <td>송장번호</td>
                        <td>
                        <select name="status" >
						    <option value="">선택하세요</option>
						    <option value="korean">배송준비</option>
						    <option value="english">배송중</option>
						    <option value="chinese">배송완료</option>
						    <option value="spanish">반품준비</option>
						    <option value="spanish">반품완료</option>
						    <option value="spanish">주문취소</option>
						</select>
                        <input type="button" value="확정">
                        <input type="button" value="취소">
                        </td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>9</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>10</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>11</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>12</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>13</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
                      </tr>
                      <tr>
                        <td>14</td>
                        <td>회원아이디5</td>
                        <td>배송중</td>
                        <td>송장번호</td>
                        <td><input type="button" value="상태변경"></td>
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
