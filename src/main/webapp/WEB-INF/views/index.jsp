<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="en">

<%@ include file="header.jsp"%>

<body id="page-top">

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span class="d-block d-lg-none">Management System</span> <span
			class="d-none d-lg-block"> <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="static/img/profile.jpg" alt="">
		</span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">Welcome</a></li>

				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#profile">Profile</a></li>

				<sec:authorize access="hasRole('HR')">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#hrManagement">HR Management</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#trainingManagement">Training management</a></li>
				</sec:authorize>


				<sec:authorize access="hasRole('ADMIN')">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#configurationMnagement">Configuration management</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#eventManagement">Event management</a></li>
				</sec:authorize>
				<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
					<form name="logoutForm" action="${logoutUrl}" method="post">
						<sec:csrfInput />
					</form> <a class="nav-link js-scroll-trigger" href="#" onclick="document.forms['logoutForm'].submit(); return false;">Logout</a></li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid p-0">

		<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
			<div class="my-auto">
				<h1 class="mb-0">
					Welcome <span class="text-primary">${userName}</span>
				</h1>
				<div class="subheading mb-5">
					São Paulo, Brasil (00)-0000-0000 <a href="mailto:" + ${email}>${email}</a>
				</div>

			</div>
		</section>

		<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="profile">
			<div class="my-auto">
				<h2 class="mb-5">Profile</h2>

				<div class="resume-item d-flex flex-column flex-md-row mb-5">
					<div class="resume-content mr-auto">
						<h3 class="mb-0"></h3>
						<div class="subheading mb-3">Innovative Solutions</div>
						<p>.</p>
					</div>
					<div class="resume-date text-md-right">
						<span class="text-primary">March 2013 - Present</span>
					</div>
				</div>
			</div>
		</section>
		<sec:authorize access="hasRole('HR')">
			<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="hrManagement">
				<div class="my-auto">
					<h2 class="mb-5">HR Management</h2>

					<div class="resume-item d-flex flex-column flex-md-row mb-5">
						<div class="resume-content mr-auto">
							<h3 class="mb-0">HR Plan</h3>
							<div class="subheading mb-3">Strategy</div>
							<div>Leadership</div>
							<p>Technical/Functional</p>
						</div>
						<div class="resume-date text-md-right">
							<span class="text-primary">HR Trend</span>
						</div>
					</div>
				</div>
			</section>

			<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="trainingManagement">
				<div class="my-auto">
					<h2 class="mb-5">Training Management</h2>

					<div class="subheading mb-3">Trainings</div>
					<ul class="list-inline list-icons">
						<li class="list-inline-item"><i class="devicons devicons-html5"></i></li>
						<li class="list-inline-item"><i class="devicons devicons-css3"></i></li>
						<li class="list-inline-item"><i class="devicons devicons-javascript"></i></li>
						<li class="list-inline-item"><i class="devicons devicons-jquery"></i></li>
						<li class="list-inline-item"><i class="devicons devicons-bootstrap"></i></li>
						<li class="list-inline-item"><i class="devicons devicons-npm"></i></li>
					</ul>
				</div>
			</section>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
			<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="configurationMnagement">
				<div class="my-auto">
					<h2 class="mb-5">Configuration Management</h2>
					<p>Configuration management (CM) is a systems engineering process for establishing and maintaining consistency of a product's performance,
						functional, and physical attributes with its requirements, design, and operational information throughout its life</p>
				</div>
			</section>

			<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="eventManagement">
				<div class="my-auto">
					<h2 class="mb-5">Pre-Event</h2>
					<ul class="fa-ul mb-0">
						<li><i class="fa-li fa fa-trophy text-warning"></i> Pre event planning tips</li>
						<li><i class="fa-li fa fa-trophy text-warning"></i> Event listing</li>
						<li><i class="fa-li fa fa-trophy text-warning"></i> Event marketing</li>
					</ul>
				</div>
			</section>
		</sec:authorize>
	</div>

	<%@ include file="footer.jsp"%>

</body>

</html>
