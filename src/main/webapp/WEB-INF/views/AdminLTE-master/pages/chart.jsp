<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="../inc/head.jsp" />
  <head>
  <!-- Morris charts 추가 -->
    <link href="<c:url value='/resources/AdminLTE-master/plugins/morris/morris.css'/>" rel="stylesheet" type="text/css" />
  </head>
  
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
          <h1>
            매출 관리
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-6">
              <!-- AREA CHART -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">향수 MBTI 추천 TOP5 (데이터 미적용 / 테스트)</h3>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="revenue-chart" style="height: 300px;"></div>
                </div>
              </div>
			  <!-- BAR CHART -->
<!--                   <div class="chart" id="recommend-chart" style="height: 300px;"></div> -->
<!--                 </div>/.box-body -->
<!--               </div>/.box -->

              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header">
                  <h3 class="box-title">카테고리별 상품 수</h3>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="sales-chart" style="height: 300px; position: relative;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (LEFT) -->
            <div class="col-md-6">
              <!-- LINE CHART -->
              <div class="box box-info">
                <div class="box-header">
                  <h3 class="box-title">매출액 (최근 일주일)</h3> 
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="line-chart" style="height: 300px;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- BAR CHART -->
              <div class="box box-success">
                <div class="box-header">
                  <h3 class="box-title">판매 TOP5</h3>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="bar-chart" style="height: 300px;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (RIGHT) -->
          </div><!-- /.row -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->
    
    <jsp:include page="../inc/scriptTable.jsp" />
    <!-- Morris.js charts -->
    <script src="<c:url value='http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js'/>"></script>
    <script src="<c:url value='/resources/AdminLTE-master/plugins/morris/morris.min.js'/>" type="text/javascript"></script>
    
    <!-- page script -->
    <script type="text/javascript">
      $(function () {
        "use strict";

        // LINE CHART
        var line = new Morris.Line({
          element: 'line-chart',
          resize: true,
          data: [ // 나타낼 데이터 
        	 <c:forEach var="line" items="${lineList }"> 
              	{x: '${line.order_date }', amount: ${line.order_amount } } ,
             </c:forEach>
          ],
          xkey: 'x',
          ykeys: ['amount'],
          labels: ['매출액'],
          lineColors: ['#3c8dbc'],
          hideHover: 'auto'
        });

        //DONUT CHART
        var donut = new Morris.Donut({
          element: 'sales-chart',
          resize: true,
          colors: ["#39403B", "#DE3333", "#F97419", "#2471A3", "#641E16", "#FFF00C", "#179D49", "#7D3C98"],
          data: [ // 카테고리별 상품 갯수 -> DB 카테고리 테이블 생성 (차트 표시만을 위한 별도의 테이블)
        	  // -> 상품 등록/수정 시 카테고리별 숫자 증감
        	<c:forEach var="donut" items="${donutList }"> 
              {label: "${donut.category_name }", value: ${donut.category_count } },
            </c:forEach>
          ],
          hideHover: 'auto'
        });
        
        //BAR CHART
        var bar = new Morris.Bar({
          element: 'bar-chart',
          resize: true,
          data: [ // 나타낼 데이터
       	  	<c:forEach var="bar" items="${barList }"> 
       	  	  // 상품명 + 판매 수 + 좋아요 수 => 판매량 순으로 5개 
              {idx: "${bar.product_name }", sell: ${bar.product_sellcount }, like: ${bar.product_likecount } },
            </c:forEach>
          ],
          barColors: ['#179D49', '#F02456'], // 색 지정
          xkey: 'idx', 
          ykeys: ['sell', 'like'], // 막대기로 나타낼 데이터
          labels: ['판매량', '좋아요 수'], // 막대기 이름 표시
          hideHover: 'auto'
        });
        
        // recommend-chart => 향수 추천 결과 받아오기
        var bar2 = new Morris.Bar({
            element: 'revenue-chart',
            resize: true,
            data: [ // 나타낼 데이터
         	  	<c:forEach var="bar2" items="${barList }"> 
                {idx: "${bar2.product_name }", m: ${bar2.product_sellcount }, fm: ${bar2.product_likecount }, none: 400 },
              </c:forEach>
            ],
            barColors: ['#179D49', '#F02456', '#39403B'], // 색 지정
            xkey: 'idx', 
            ykeys: ['m', 'fm', 'none'], // 막대기로 나타낼 데이터
            labels: ['남', '여', '무관'], // 막대기 이름 표시
            hideHover: 'auto'
          });
        
      });
    </script>

  </body>
</html>
