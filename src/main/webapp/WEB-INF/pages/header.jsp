<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>NIIT Student Online Portal</title>
<!-- For user Profile Page -->
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- core CSS -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/prettyPhoto.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
<link href="resources/css/Freebar.min.css" rel="stylesheet">

 
 
 
<!-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"/></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.isotope.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.0.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
<script src='<c:url value="${pageContext.request.contextPath}/resources/js/controllers.js"/>'></script>
<script src='<c:url value="${pageContext.request.contextPath}/resources/js/scripts.js" />'></script>
	
<script>
	function formSubmit() {
	document.getElementById("logout").submit();
	}
</script>
</head>
<!--/head-->
<body>	
<img src="resources/images/logo.png" align="left" />

	<header id="header">
		<div class="top-bar ">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-xs-4">
						<div class="top-number">
							
						</div>
					</div>
					<div class="col-sm-6 col-xs-8">
						<div class="navbar-right">
							<ul class="nav navbar-nav navbar-right">
								<c:if test="${pageContext.request.userPrincipal.name != null}">
									<li>Welcome :${pageContext.request.userPrincipal.name}</li>
									<security:authentication var="user"
										property="principal.authorities" />
									<security:authorize var="loggedIn" access="isAuthenticated()">
										<security:authorize access="hasRole('ROLE_ADMIN')">
											<li>Admin</li>
										</security:authorize>
										<security:authorize access="hasRole('ROLE_USER')">
											<li>Student</li>
										</security:authorize>
									</security:authorize>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.top-bar-->
		<nav class="navbar navbar-inverse" role="banner" id="check">
			<div class="container" id="myCheck">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>
				<c:url value="/perform_logout" var="logout" />
				<form action="${logout}" method="post" id="logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<div class="collapse navbar-collapse navbar">
					<ul class="nav navbar-nav">
					<!--  when no body is login -->
						<c:if test="${pageContext.request.userPrincipal.name==null}">
						<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
				
	<li><a href="${pageContext.request.contextPath}/AngularLogin">Angular Login</a></li> 
						<li><a href="${pageContext.request.contextPath}/aboutPage">About NIIT</a></li>
						
						 <li><a href="${pageContext.request.contextPath}/AngularContactPage">Contact Us</a></li>
						</c:if>
						
						
						
						<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
						<li><a href="${pageContext.request.contextPath}/allUsers">AllUser</a>
						<li><a href="${pageContext.request.contextPath}/allcontactdetails">All Contact Details</a></li>
						<li><a href="${pageContext.request.contextPath}/AngularContactPage">All Angular Contact Details</a></li>
						<li><a href="${pageContext.request.contextPath}/angularpostsearch">angular post search</a></li>
						<li><a href="<c:url value="/userProfile"/>">Admin</a></li>
				
						</c:if>
							<c:if test="${pageContext.request.userPrincipal.name != null }">
							<c:if test="${pageContext.request.userPrincipal.name != 'admin' }">
							<!-- <li><a href="${pageContext.request.contextPath}/AngularLogin">Angular Login</a></li> -->
							<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
							<!-- <li><a href="${pageContext.request.contextPath}/AngularContactPage">Angular Contact </a></li> -->
								 <li><a href="${pageContext.request.contextPath}/services">Services</a></li>
							<li><a href="${pageContext.request.contextPath}/userProfile">My Profile </a></li>
						    </c:if>						    
						</c:if>	
					  </ul>

					<ul class="nav navbar-nav navbar-right">

						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li>
							<li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
								src="<c:url value='/resources/images/${pageContext.request.userPrincipal.name}.png' />"
								height="20" width="40" class="img-circle img-responsive " /></a>
                            <ul class="dropdown-menu">
                                <li><a href="userProfile">My Profile</a></li>
                                <li><a href="editUser">Edit</a></li>
                                <li><a href="Chat">Chat</a></li>
                                <li><a href="javascript:formSubmit()">Logout</a></li>
                            </ul>
                        </li>
							<c:if test="${pageContext.request.userPrincipal.name != null }">
							 <li><a href="javascript:formSubmit()">Logout</a></li>
							</c:if>		
							

						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name==null}">
							<li><a href="${pageContext.request.contextPath}/login"><span
									class="glyphicon glyphicon-log-in"></span>Login</a></li>
										<!--  <li><a href="${pageContext.request.contextPath}/AngularLogin"><span
									class="glyphicon glyphicon-log-in"></span>AngularLogin</a></li>-->
							<li><a href="${pageContext.request.contextPath}/signUp"><span
									class="glyphicon glyphicon-user"></span>Sign Up</a></li>
						</c:if>

					</ul>
				</div>
			</div>
			<!--/.container-->
		</nav>
		<!--/nav-->

	</header>