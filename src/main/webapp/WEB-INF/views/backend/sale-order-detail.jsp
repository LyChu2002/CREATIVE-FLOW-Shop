<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
<link rel="shortcut icon" href="${classpath }/backend/img/icons/icon-48x48.png" />
<title>${title }</title>
<link rel="preconnect" href="https://fonts.gstatic.com">

<title>${title }</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <span
					class="align-middle">${title }</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">SYSTEM ADMINISTRATION</li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath }/admin/home"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath}/admin/category-list"> <i
							class="align-middle" data-feather="database"></i> <span
							class="align-middle">Category Management</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath }/admin/product-list"> <i
							class="align-middle" data-feather="list"></i> <span
							class="align-middle">Product Management</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath }/admin/user-list"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">User
								Management</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${classpath }/admin/role-list"> <i class="align-middle"
							data-feather="user-check"></i> <span class="align-middle">Role
								Management</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="${classpath }/admin/order-list"> <i class="align-middle"
							data-feather="shopping-bag"></i> <span class="align-middle">Order
								Management</span>
					</a></li>

					<li class="sidebar-header">AUTHENTICATION</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-up.html"> <i class="align-middle"
							data-feather="mail"></i> <span class="align-middle">Register</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-up.html"> <i class="align-middle"
							data-feather="log-out"></i> <span class="align-middle">Log
								out</span>
					</a></li>


				</ul>
			</div>
		</nav>

		<div class="main">
			<!-- nav -->
			<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>

			<main class="content">
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-7 align-self-center">
								<h2
									class="page-title text-truncate text-dark font-weight-medium mb-1">Sale
									Order Details</h2>
							</div>
						</div>
						<div class="card">
							<div class="card-body">

								<div class="table-responsive">

									<div class="row" style="padding: 4px; font-size: 18px;">
										<div class="col-md-2"></div>
										<div class="col-md-5">
											<label><span style="color: #1c2d41">Code: </span> ${saleOrder.code }</label>
										</div>
										<div class="col-md-5">
											<label><span style="color: #1c2d41">Customer name:</span> ${saleOrder.customerName }</label>
										</div>
										<div class="col-md-2"></div>
									</div>
									
									<div class="row" style="padding: 4px; font-size: 18px;">
										<div class="col-md-2"></div>
										<div class="col-md-5">
											<label><span style="color: #1c2d41">Customer Mobile:</span> ${saleOrder.customerMobile }</label>
										</div>
										<div class="col-md-5">
											<label><span style="color: #1c2d41">Customer Address:</span> ${saleOrder.customerAddress }</label>
										</div>
										<div class="col-md-2"></div>
									</div>

						
									<div class="row"
										style="padding: 4px; text-align: center; color: #1c2d41; font-size: 19px; margin-bottom: 20px; font-weight: 500;">
										<div>LIST PRODUCTS</div>

									</div>

									<table id="zero_config"
										class="table table-striped table-bordered no-wrap">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Product Id</th>
												<th scope="col">Product Code</th>
												<th scope="col">Product Name</th>												
												<th scope="col">Product Avatar</th>
												<th scope="col">Product Price</th>
												<th scope="col">Quantity</th>
												<th scope="col">Total</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="productOrder" items="${listProducts }"
												varStatus="loop">
												<tr>
													<td>${loop.index + 1 }</td>
													<td>${productOrder.id }</td>
													<td>${productOrder.product.code }</td>
													<td>${productOrder.product.name }</td>													
													<td align="center"><img width="80px" height="80px"
														src="${classpath }/FileUpload/${productOrder.product.avatar }"
														class="light-logo" /></td>
													<td><fmt:formatNumber
															value="${productOrder.product.price }"
															minFractionDigits="0"></fmt:formatNumber></td>
													<td>${productOrder.quantity }</td>
													<td><fmt:formatNumber
															value="${productOrder.product.price * productOrder.quantity}"
															minFractionDigits="0"></fmt:formatNumber></td>
												</tr>

											</c:forEach>
										</tbody>

									</table>
									<div class="row" style="padding: 4px; font-size: 18px;">
										<label>Total: <fmt:formatNumber
												value="${saleOrder.total }" minFractionDigits="0"></fmt:formatNumber>

										</label>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/order-list" role="button"
													class="btn btn-primary">Back to list</a>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</main>

			<!-- Footer -->
			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

</body>

</html>