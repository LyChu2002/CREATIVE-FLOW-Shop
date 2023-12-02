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

					<li class="sidebar-item active"><a class="sidebar-link"
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

					<li class="sidebar-item"><a class="sidebar-link"
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
									class="page-title text-truncate text-dark font-weight-medium mb-1">List
									Product</h2>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<form action="${classpath }/admin/product-list" method="get">
									<div class="table-responsive">

										<div class="row">
											<div class="col-md-4">
												<div class="form-group mb-4">
													<a href="${classpath }/admin/product-add" role="button"
														class="btn btn-primary">Add New Product</a>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group mb-4">
													<h3 style="font-weight: bold">Total products: &nbsp; ${productSearch.totalItems }</h3>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group mb-4">
													
													<input type="hidden" id="page" name="page" class="form-control" value="${productSearch.currentPage }"/>
												</div>
											</div>
										</div>
										
										<!-- Tìm kiếm -->
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-4">

                                                    <select class="form-control" id="status" name="status">
                                                        <option value="2">All</option>
                                                        <option value="1">Active</option>
                                                        <option value="0">Inactive</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-4">
                                                    <select class="form-control" id="categoryId" name="categoryId" style="margin-right: 10px;">
													<option value="0">Select category</option>
													<c:forEach items="${categories}" var="category">
														<option value="${category.id }">${category.name }</option>
 													</c:forEach>
												</select>
                                                </div>
												
											</div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-4">
                                                    <select class="form-control" id="statusQuantity" name="statusQuantity">
                                                        <option value="2">Quantity</option>
                                                        <option value="1">Còn hàng</option>
                                                        <option value="0">Hết hàng</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <input class="form-control" type="text" id="keyword" name="keyword" placeholder="Search keyword"/>
                                            </div>

                                            <div class="col-md-1">
                                                <button type="submit" id="btnSearch" name="bthSearch" class="btn btn-primary">Search</button>
                                            </div>
                                        </div>

										<table id="zero_config"
											class="table table-striped table-bordered no-wrap">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">Id</th>
													<th scope="col">Category</th>
													<th scope="col">Code</th>
													<th scope="col">Name</th>
													<th scope="col">Avatar</th>
													<th scope="col">Price</th>
													<th scope="col">Quantity</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Description</th>
													
													<th scope="col">Status</th>
													<th scope="col">Is New</th>
													<th scope="col">Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="product" items="${products }"
													varStatus="loop">
													<tr>
														<td>${loop.index + 1 }</td>
														<td>${product.id }</td>
														<td>${product.category.name }</td>
														<td>${product.code }</td>
														<td>${product.name }</td>
														<td><img width="60px" height="60px"
															src="${classpath }/FileUpload/${product.avatar }"
															class="light-logo" /></td>
														<td align="right"><fmt:formatNumber
																value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
														</td>
														<td>${product.warehouseQuantity }</td>
														<td>${product.userCreateProduct.username }</td>
														<td>${product.userUpdateProduct.username }</td>

														<td><fmt:formatDate value="${product.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${product.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td>${product.shortDescription }</td>
													
														<td>
															<c:choose>
																<c:when test="${product.status }">
																	<span>Active</span>
																</c:when>
																<c:otherwise>
																	<span>Inactive</span>
																</c:otherwise>
															</c:choose></td>

														<td><c:choose>
																<c:when test="${product.isNew }">
																	<span>Yes</span>
																</c:when>
																<c:otherwise>
																	<span>No</span>
																</c:otherwise>
															</c:choose></td>

														<td><a
															href="${classpath }/admin/product-detail/${product.id }"
															role="button" class="btn btn-success">Detail</a> <a
															href="${classpath }/admin/product-edit/${product.id }"
															role="button" class="btn btn-primary">Edit</a> <a
															href="${classpath }/admin/product-delete/${product.id }"
															role="button" class="btn btn-danger">Delete</a></td>
													</tr>

												</c:forEach>
											</tbody>

										</table>
										<div class="row">
										
											<div class="col-md-6">
												<div class="form-group mb-4">
													
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging"></div>
												</div>
											</div>
										</div>

									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</main>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

	<!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			$("#categoryId").val(${productSearch.categoryId});
			$("#statusQuantity").val(${productSearch.statusQuantity});
			$("#keyword").val("${productSearch.keyword}");
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>