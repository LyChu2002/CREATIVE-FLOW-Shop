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
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
</head>

<body>
	<div class="wrapper">
		<form action="${classpath }/category" method="get">
			<!-- Header -->
			<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

			<main class="main">
				<div class="breadcrumb">
					<span><a href="${classpath }/index">Trang chủ</a> </span> <span><a
						href="">Danh mục sản phẩm</a></span>
				</div>
				<div class="main-category-content">
					<!--  	<form action="${classpath }/category" method="get">-->
					<div class="row">
						<div class="col-12 col-lg-4 col-md-6">
							<div class="catalog-list">
								<div class="catalog-menu">
									<div class="catalog-name">Danh mục sản phẩm</div>
									<ul>
										<!--  <li><input type="radio" name="categoryId" id="category_0"
											value="0"> <label for="category_0">Tất cả</label></li>-->
										<c:forEach var="category" items="${categories }" varStatus="">
											<li><input type="radio" name="categoryId"
												id="category_${category.id }" value="${category.id }">
												<label for="category_${category.id }">${category.name }</label>
											</li>
										</c:forEach>

									</ul>
								</div>

								<div class="catalog-filter">
									<div class="catalog-name">Lọc theo giá</div>
									<ul>
										<!--  <li><input type="radio" name="price" id="price_0"
											value="0"> <label for="price_0">Tất cả</label></li>-->
										<li><input type="radio" name="price" id="price_1"
											value="1"> <label for="price_1">0 - 200.000đ</label></li>
										<li><input type="radio" name="price" id="price_2"
											value="2"> <label for="price_2">200.000đ -
												400.000đ</label></li>
										<li><input type="radio" name="price" id="price_3"
											value="3"> <label for="price_3">400.000đ -
												800.000đ</label></li>
										<li><input type="radio" name="price" id="price_4"
											value="4"> <label for="price_4">800.000đ -
												1.000.000đ</label></li>
										<li><input type="radio" name="price" id="price_5"
											value="5"> <label for="price_5">Trên
												1.000.000đ</label></li>
									</ul>
								</div>


							</div>
							<div class="row">
								<div class="col-2">
									
								</div>
								<div class="col-4">
									<button type="submit" id="btnFilter" name="btnFilter" class="btn-filter">Lọc</button>
								</div>
								
								<div class="col-4">
									<button type="submit" id="btnRemoveFilter" name="btnRemoveFilter" onclick="removeFilter()"
								class="btn-remove-filter">Bỏ Lọc</button>
								</div>
								<div class="col-2">
									
								</div>
							</div>

						</div>
						<div class="col-12 col-lg-8 col-md-6">
							<div class="product-list-container">
								
								<div class="product-list-container-header" style="margin-bottom: 20px">
									<div class="row">
										<div class="col-6">
											<h3 class="product-list-name">${category.name }</h3>
										</div>
										<div class="col-2"></div>
										<div class="col-4">
											<select class="form-filter" id="priceSort" name="priceSort">
												<option value="2">Sắp xếp theo</option>
												<option value="1">Từ cao đến thấp</option>
												<option value="0">Từ thấp đến cao</option>
											</select>
										</div>
									</div>

								</div>

								<div class="main-product-content">
									<div class="row">
										<c:forEach var="product" items="${products }" varStatus="loop">
											<div class="col-12 col-lg-4 col-md-6">
												<div class="product-item">
													<div class="product-img">
														<a href="${classpath }/product-detail/${product.id}"><img
															src="${classpath }/FileUpload/${product.avatar}" alt=""
															width="100%" height="200px"></a>
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
																	onclick="addToCart(${product.id}, 1, '${product.name }')"><i
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
										<input type="hidden" name="page" id="page"
											value="${productSearch.currentPage }" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="pagination float-right">
										<div id="paging"></div>
									</div>
								</div>
							</div>
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
			$("#priceSort").val(${productSearch.priceSort});
			$("#price_" + ${productSearch.price}).prop("checked", true);
			$("#category_" + ${productSearch.categoryId}).prop("checked", true);
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click'); //Kích hoạt nút search
					$('#btnFilter').trigger('click');
				},
			});
		});
	</script>
	<script type="text/javascript">
		removeFilter = function() {		
			$("#priceSort").val(2);
			$("#price_" + ${productSearch.price}).prop("checked", false);
			$("#category_" + ${productSearch.categoryId}).prop("checked", false);
			$('#btnRemoveFilter').trigger('click');
		}
	</script>
	
	</div>
</body>

</html>