<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 왼쪽 메뉴 시작 -->
      <!-- Left side column. contains the sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="<c:url value='/resources/AdminLTE-master/dist/img/user2-160x160.jpg'/>" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>관리자 아이디</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
<!--           <form action="#" method="get" class="sidebar-form"> -->
<!--             <div class="input-group"> -->
<!--               <input type="text" name="q" class="form-control" placeholder="Search..."/> -->
<!--               <span class="input-group-btn"> -->
<!--                 <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button> -->
<!--               </span> -->
<!--             </div> -->
<!--           </form> -->
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">관리자 메뉴</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-gift"></i>
                <span>상품관리</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="productList.ad"><i class="fa fa-circle-o"></i> 상품목록</a></li>
                <li><a href="productAdd.ad"><i class="fa fa-circle-o"></i> 상품등록</a></li>
              </ul>
            </li>
            <li>
              <a href="orderList.ad">
                <i class="fa fa-shopping-cart"></i> 
                <span>주문관리</span>
              </a>
            </li>    
            <li>
              <a href="reviewList.ad">
                <i class="fa fa-thumbs-up"></i> 
                <span>리뷰관리</span>
              </a>
            </li>   
            <li class="treeview">
              <a href="memberList.ad">
                <i class="fa fa-user"></i>
                <span>회원관리</span>
              </a>
              <ul class="treeview-menu">
                <li><a href='<c:url value="/memberList.ad" />'><i class="fa fa-circle-o"></i> 전체 회원</a></li>
                <li><a href='<c:url value="/subscribeList.ad" />'><i class="fa fa-circle-o"></i> 구독자</a></li>
              </ul>
            </li>   
            <li class="treeview">
              <a href="couponList.ad">
                <i class="fa fa-ticket"></i>
                <span>쿠폰관리</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="couponAdd.ad"><i class="fa fa-circle-o"></i> 쿠폰생성</a></li>
                <li><a href="couponList.ad"><i class="fa fa-circle-o"></i> 쿠폰목록</a></li>
              </ul>
            </li>    
            <li class="treeview">
              <a href="chart.ad">
                <i class="fa fa-pie-chart"></i> 
                <span>매출관리</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="chart.ad"><i class="fa fa-circle-o"></i> 차트</a></li>
                <li><a href="chartList.ad"><i class="fa fa-circle-o"></i> 리스트</a></li>
              </ul>
            </li> 
            <li class="treeview">
              <a href="noticeList.ad">
                <i class="fa fa-user"></i>
                <span>공지관리</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="noticeWrite.ad"><i class="fa fa-circle-o"></i> 공지사항 등록</a></li>
                <li><a href="noticeList.ad"><i class="fa fa-circle-o"></i> 공지사항 목록</a></li>
                <li><a href="faqWrite.ad" ><i class="fa fa-circle-o"></i> FAQ 등록</a></li>
                <li><a href="faqList.ad"><i class="fa fa-circle-o"></i> FAQ 목록</a></li>
              </ul>
            </li> 
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
      <!-- 왼쪽 메뉴 끝 -->