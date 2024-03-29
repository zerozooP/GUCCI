<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/index">GUCCI</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
			<div class="collapse navbar-collapse" id="myNavbar">
			    <div style="text-align: right; float: right;">
			       <ul class="nav navbar-nav navbar-right">
			        	<li><a href="/ppt">ppt</a></li>
					</ul>
				</div>
		  </div>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<form id="logout" onsubmit="return kakaologout();">
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li>
						<c:set value="${phone}" var="phone"/>
						<c:if test="${phone!=null}">
							<a class="dropdown-item" href="/update">password</a>
						</c:if>
					</li>
					<li>
						<c:if test="${uid!=null}">
							<a class="dropdown-item" href="/mypage/bbs_list/1">마이페이지</a>
						</c:if>
					</li>
					<li><hr class="dropdown-divider" /></li>
					<li>						
					</li>
					<c:set value="${uid}" var="uid"/>
					<c:choose>
						<c:when test="${uid==null}">
						  <li><a href="/kakao/logout" class="dropdown-item">Login</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="https://kauth.kakao.com/oauth/logout?client_id=060b47c024d4f2421c7875dd3681f916&logout_redirect_uri=http://localhost:8080/kakao/logout" class="dropdown-item">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</li>
		</ul>
		</form>
	</nav>
