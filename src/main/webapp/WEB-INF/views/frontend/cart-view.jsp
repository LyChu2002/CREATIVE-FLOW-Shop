<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>${title }</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- CSS -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<main class="main">
			<div class="breadcrumb">
				<span><a href="${classpath }/index">Trang chủ</a></span> <span><a
					href="">Giỏ hàng</a></span>
			</div>
			<div class="main-content">
				<h2>Giỏ hàng của bạn</h2>
				<c:choose>
					<c:when test="${totalCartProducts >0 }">
						<form action="${classpath }/cart-view" method="get">
							<div class="auth-container">
								<div class="list-cart-product">
									<table>
										<thead>
											<tr>
												<th>Tên sản phẩm</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Tổng tiền</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="item" items="${cart.cartProducts }"
												varStatus="loop">
												<tr class="row-product">
													<td>
														<div class="product-detail-cart">
															<div class="product-img-cart">
																<img src="${classpath }/FileUpload/${item.avatar}"
																	alt="">
															</div>

															<div class="product-info-cart">
																<p class="product-name-cart">
																	<a
																		href="${classpath }/product-detail/${item.productId}">${item.productName }</a>
																</p>
																
															</div>

														</div>
													</td>
													<td>
														<div class="product-price-cart">
															<fmt:formatNumber value="${item.price }"
																minFractionDigits="0"></fmt:formatNumber>
														</div>
													</td>
													<td>
														<div class="product-quantity-cart">
															<button class="btn-qty btn-subtract"
																onclick="updateProductQuantity(${item.productId }, -1)"
																value="-">-</button>

															<input id="productQuantity_${item.productId }"
																name="productQuantity" class="input-quantity"
																type="number" value="${item.quantity }" onchange="changeProductQuantity(${item.productId })">
															<button class="btn-qty btn-plus"
																onclick="updateProductQuantity(${item.productId }, 1)"
																value="+">+</button>


														</div>

													</td>
													<td>
														<div class="total-price">
															<fmt:formatNumber value="${item.price * item.quantity }"
																minFractionDigits="0"></fmt:formatNumber>
														</div>

													</td>
													<td>
														<div class="remove-product">

															<a
																href="${classpath }/product-cart-delete/${item.productId }"
																role="button" class="btn-delete"> <i
																class="fa-solid fa-trash-can"></i>
															</a>

														</div>

													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<div class="product-bill">
									<p>Tổng tiền giỏ hàng</p>
									<div class="product-summary">
										<p>Tổng sản phẩm</p>
										<p class="quantity-summary">${totalCartProducts }</p>
									</div>
									<div class="product-summary">
										<p>Tổng tiền hàng</p>
										<p class="total-not-discount">
											<fmt:formatNumber value="${totalCartPrice }"
												minFractionDigits=""></fmt:formatNumber>
											đ
										</p>
									</div>
									<div class="product-summary">
										<p>Thành tiền</p>
										<p class="order-price-total">
											<fmt:formatNumber value="${totalCartPrice }"
												minFractionDigits=""></fmt:formatNumber>
											đ
										</p>
									</div>
									<div class="product-summary">
										<p>Tạm tính</p>
										<p class="order-price-total">
											<fmt:formatNumber value="${totalCartPrice }"
												minFractionDigits=""></fmt:formatNumber>
											đ
										</p>
									</div>
									<button class="btn-order" onclick="_placeOrder()">ĐẶT HÀNG</button>
								</div>
							</div>
						</form>
						<!-- Thông tin khách hàng -->
						<div class="place-order-infor">
							<h3>THÔNG TIN KHÁCH HÀNG</h3>
							<form action="${classpath }/cart-view" method="get">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body">
												<div class="form-body">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Họ tên <span>*</span></label></br> 
																<input type="text" name="txtName" id="txtName" placeholder="VD: Cẩm Ly" value="${user.username }"/>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Số điện thoại <span>*</span></label></br> 
																<input type="text" name="txtMobile" id="txtMobile" placeholder="VD: 098765432" value="${user.mobile }"/>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Email</label></br> 
																<input type="text" name="txtEmail" id="txtEmail" placeholder="VD: camly@gmail.com" value="${user.email }"/>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<label>Địa chỉ <span>*</span></label></br> 
																<input type="text" name="txtAddress" id="txtAddress" placeholder="VD: Hà Nội" value="${user.address }"/>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>

							</form>
						</div>
						<div class="back-to-shopping">
							<a href="${classpath }/index"> <i class="fa-solid fa-arrow-left"></i>
								Tiếp tục mua sắm
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-12">
								<c:choose>
									<c:when test="${checkout }">
										<h3 align="center"
											class="page-title text-truncate text-dark font-weight-medium mb-1">
											<span id="placeOrderSuccess">Bạn đã đặt hàng thành
												công</span>
										</h3>
									</c:when>
									<c:otherwise>
										<h3 align="center"
											class="page-title text-truncate text-dark font-weight-medium mb-1">
											<span>${errorMessage }</span>
										</h3>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
						<div class="row">
							<div class="col-md-12" align="center">
								<div class="form-group mb-4">
									<div class="back-to-shopping">
										<a href="${classpath }/index"> <i
											class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</main>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

		<script type="text/javascript">
			updateProductQuantity = function(_productId, _quantity) {
				let data = {
					productId : _productId, //lay theo id
					quantity : _quantity,
				};

				//$ === jQuery
				jQuery.ajax({
					url : "/update-product-quantity",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json", 
	
					success : function(jsonResult) {
						let totalProducts = jsonResult.totalCartProducts; 
						$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
					},
	
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
				});
			}
		</script>
		<script type="text/javascript">
			changeProductQuantity = function(_productId) {
				let data = {
					productId : _productId, //lay theo id
					quantity : jQuery("#productQuantity_" + _productId).val(),
				};

				//$ === jQuery
				jQuery.ajax({
					url : "/change-product-quantity",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json", 
	
					success : function(jsonResult) {
						
						let totalProducts = jsonResult.totalCartProducts; 
						$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
					},
	
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
				});
			}
		</script>
		<script type="text/javascript">
			function _placeOrder() {
				//javascript object
				let data = {				
					txtName : jQuery("#txtName").val(),
					txtEmail : jQuery("#txtEmail").val(), //Get by Id
					txtMobile : jQuery("#txtMobile").val(),
					txtAddress : jQuery("#txtAddress").val(),
				};
				
				//$ === jQuery
				jQuery.ajax({
					url : "/place-order",
					type : "POST",
					contentType: "application/json",
					data : JSON.stringify(data),
					dataType : "json", //Kieu du lieu tra ve tu controller la json
					
					success : function(jsonResult) {
						alert(jsonResult.code + ": " + jsonResult.message);
						$("#placeOrderSuccess").html(jsonResult.message);
					},
					
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
				});
			}
		</script>

	</div>
</body>

</html>