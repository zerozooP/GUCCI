<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<main>
					<div class="container">
						<br>
						<br>
						<h1 class="text-center">[����������]</h1>
						<br>
						<br>
							<div class="form-group">
	                            <label>���̵�</label>
	                            <input type="text" class="form-control " value="${uid}" disabled/>
	                        </div>
	                        <div class="form-group">
	                            <label>�̸���</label>
	                            <input type="text" class="form-control" value="${email}" disabled/>
	                        </div>
						
						<c:set value="${phone}" var="phone"/>
						<c:if test="${phone!=null}">
							<div class="pwd">
								<a style="text-align:right;" href="/update">��й�ȣ ����</a>
							</div>
						</c:if>
					</div>
						
						<nav class="nav nav-tabs" id="navtab">
						  <a class="nav-link" aria-current="page" href="/mypage/bbs_list/1">�ۼ���</a>
						  <a class="nav-link" href="/mypage/bbs_cmt/1">�ۼ����</a>
						  <a class="nav-link" href="/mypage/bbs_reply/1">��۴� ��</a>
						  <a class="nav-link" href="/mypage/bbs_like/1">���ƿ� ��</a>
						  <a class="nav-link" href="/mypage/bbs_delete/1">������ ��</a>
						</nav>
					
				</main>