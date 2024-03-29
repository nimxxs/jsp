<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 자바코드를 마치 태그처럼 사용하기 위해 jstl를 씀 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="../summernote/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="../css/layout.css" />

<script src="../js/jquery-3.7.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../summernote/summernote-lite.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<header
			class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
				nimxxs </a>
			<ul class="nav nav-pills gnb">
			
				<%-- <c:if test="${loggedMember == null}"> --%>
				
				<c:choose>
					<c:when test="${loggedMember eq null}">
						<li class="nav-item"><a href="../member/login" class="nav-link">login</a></li>
						<li class="nav-item"><a href="../member/join" class="nav-link">join</a></li>
					<!-- 	<li class="nav-item"><a href="../board/list" class="nav-link">게시판</a></li> -->
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="../member/logout" class="nav-link">logout</a></li>
						<li class="nav-item">
							<a href="../member/info?userId=${loggedMember.id }" class="nav-link">
								<c:choose>
									<c:when test="${loggedMember.realProfile eq null}">
										<div class="profileBox">
											<img 
											src="${pageContext.request.contextPath}/upload/account.jpg"
											class="profile">
								 			${loggedMember.name}
								 		</div>
									</c:when>
									<c:otherwise>
										<div class="profileBox">
											<img 
											src="${pageContext.request.contextPath}/upload/${loggedMember.realProfile}"
											class="profile">
								 			${loggedMember.name}
										</div>
									</c:otherwise>
								</c:choose>
							</a>
						</li>
 						<li class="nav-item"><a href="../board/list" class="nav-link">게시판</a></li>
 					</c:otherwise>
				</c:choose>
				<%-- <c:if test="${empty loggedMember}">
					<li class="nav-item"><a href="login-form.jsp" class="nav-link">login</a></li>
					<li class="nav-item"><a href="join-form.jsp" class="nav-link">join</a></li>
				</c:if>
				<c:if test="${not empty loggedMember}">
					<li class="nav-item"><a href="logout.jsp" class="nav-link">logout</a></li>
					<li class="nav-item"><a href="info.jsp" class="nav-link">${loggedMemberName }</a></li>
				</c:if> --%>
			</ul>
		</header>
	</div>