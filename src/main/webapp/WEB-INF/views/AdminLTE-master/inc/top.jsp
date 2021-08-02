<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header class="main-header">
  
        <a href='<c:url value="/chart.ad" />' class="logo"><b>관리자 모드</b></a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
<!--           <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> -->
<!--             <span class="sr-only">Toggle navigation</span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--           </a> -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown user user-menu">
				<a href='<c:url value="/logout.ad" />'>로그아웃</a>
              </li>
              <li class="dropdown user user-menu">
				<a href='<c:url value="/main.sh" />'>쇼핑몰로 이동</a>
              </li>
            </ul>
          </div>
        </nav>
</header>