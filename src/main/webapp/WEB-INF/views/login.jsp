<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords"
		content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="${classpath }/backend/img/icons/icon-48x48.png" />
	<link rel="canonical" href="https://demo-basic.adminkit.io/upgrade-to-pro.html" />
	<!-- variables -->
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<title>${title }</title>
	<link href="${classpath }/backend/css/app.css" rel="stylesheet">
	<link href="${classpath }/backend/css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Welcome back</h1>
							<p class="lead">
								Sign in to your account to continue
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">

									<form method="POST" action="${classpath }/login_processing_url">
										<c:if test="${not empty param.login_error }">
											<div class="alert alert-danger" role="alert">
												Đăng nhập thất bại, hãy thử lại!!!</div>
										</c:if>
										<div class="mb-3">
											<label class="form-label" for="username">Username</label>
											<input class="form-control" type="text" name="username" id="username"
												placeholder="Enter your username" />
										</div>
										<div class="mb-3">
											<label class="form-label" for="password">Password</label>
											<input class="form-control" type="password" name="password" id="password"
												placeholder="Enter your password" />
											<small>
												<a href="#">Forgot password?</a>
											</small>
										</div>
										<div>
											<label class="form-check">
												<input class="form-check-input" type="checkbox"
													id="remember-me" name="remember-me">
												<span class="form-check-label">
													Remember me next time
												</span>
											</label>
										</div>
										<div class="row" style="margin-top: 12px">
											<div class="col md-5"></div>
											<div class="col md-2">
												<button type="submit" class="btn btn-primary">Sign in</button>
											</div>
											<div class="col md-2">
												<a href="${classpath }/signup" class="btn btn-primary">Sign up</a>
												<!-- <button type="submit" class="btn btn-lg btn-primary">Sign in</button> -->
											</div>
											<div class="col md-5"></div>
										</div>
										
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="${classpath }/backend/js/app.js"></script>

</body>

</html>