<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
</head>

<body>
	<div class="wrapper">
	<form action="${classpath }/index" method="get">
		<!-- Header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<div class="banner-brand">
			<div class="banner-brand-item">
				<img src="${classpath }/frontend/images/banner_06.png" alt=""
					width="100%" height="580px">
			</div>

			<div class="banner-brand-item">
				<img src="${classpath }/frontend/images/banner_02.png" alt=""
					width="100%" height="580px">
			</div>

			<div class="banner-brand-item">
				<img src="${classpath }/frontend/images/banner_03.png" alt=""
					width="100%" height="580px">
			</div>

		</div>

		<main class="main">
			
				<div class="main-products">
					<div class="content">
						<h1 class="product-list-title">NEW ARRIVAL</h1>
					</div>
					<div class="main-product-content">
						<div class="row product-list-slick">
							<c:forEach items="${newProducts }" var="product">
								<div class="col-12 col-xl-3 col-lg-4 col-md-6">
									<div class="product-item">
										<div class="product-img">
											<a href="${classpath }/product-detail/${product.id}"><img
												src="${classpath }/FileUpload/${product.avatar}" alt=""
												width="100%"></a>
										</div>

										<div class="product-detail">
											<a href="${classpath }/product-detail/${product.id}" class="product-name">${product.name }</a>
											<p class="product-price">
												<ins
													style="text-decoration: none; font-size: 18px; color: red;">
													<fmt:formatNumber value="${product.price }"
														minFractionDigits="0"></fmt:formatNumber>
												</ins>
												&nbsp;
												<del style="font-size: 14px;">
													<fmt:formatNumber value="${product.oldPrice }"
														minFractionDigits="0"></fmt:formatNumber>
												</del>
											</p>

											<div class="icon-row">
												<div class="product-icon">
													<a
														onclick="addToCart(${product.id }, 1, '${product.name }')"><i
														class="fa-solid fa-cart-shopping"></i></a>
												</div>

												<div class="product-icon">
													<a href=""><i class="fa-regular fa-heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			
			<div class="main-products">
				<div class="content">
					<h1 class="product-list-title">BEST SELLER</h1>
				</div>
				<div class="main-product-content">
					<div class="row">
						<c:forEach items="${products }" var="product">
							<div class="col-12 col-xl-3 col-lg-4 col-md-6">
								<div class="product-item">
									<div class="product-img">
										<a href="${classpath }/product-detail/${product.id}"><img
											src="${classpath }/FileUpload/${product.avatar}" alt=""
											width="100%"></a>
									</div>

									<div class="product-detail">
										<a href="${classpath }/product-detail/${product.id}"
											class="product-name">${product.name }</a>
										<p class="product-price">
											<ins
												style="text-decoration: none; font-size: 18px; color: red;">
												<fmt:formatNumber value="${product.price }"
													minFractionDigits="0"></fmt:formatNumber>
											</ins>
											&nbsp;
											<del style="font-size: 14px;">
												<fmt:formatNumber value="${product.oldPrice }"
													minFractionDigits="0"></fmt:formatNumber>
											</del>
										</p>
										<div class="icon-row">
											<div class="product-icon">
												<a
													onclick="addToCart(${product.id }, 1, '${product.name }')"><i
													class="fa-solid fa-cart-shopping"></i></a>
											</div>

											<div class="product-icon">
												<a href=""><i class="fa-regular fa-heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group mb-4">
						<input type="hidden" name="page" id="page" value="${productSearch.currentPage }"/>
					</div>
				</div>
				<div class="col-md-6">
					<div class="pagination float-right">
						<div id="paging"></div>
					</div>
				</div>
			</div>
			

			<div class="banner-content">
				<img src="${classpath }/frontend/images/banner_05.png" alt=""
					width="100%" height="600px">
			</div>

			<div class="main-products">
				<div class="content">
					<h1 class="product-list-title">GALLERY</h1>
				</div>
				<div class="main-product-content">
					<div class="row product-list-slick">
					<c:forEach var="product" items="${gallery }" varStatus="loop">
						<div class="col-12 col-xl-3 col-lg-4 col-md-6">
							<div class="product-item">
								<div class="product-img">
									<a href="${classpath }/product-detail/${product.id}"><img
										src="${classpath }/FileUpload/${product.avatar}"
										alt="" width="100%"></a>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</main>
		</form>
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<!-- JS -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

		<!-- Add to cart -->
		<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
	
	<!-- Pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#keyword").val("${productSearch.keyword}");
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click'); //Kích hoạt nút search
				},
			});
		});
	</script>
	</div>
</body>
</html>