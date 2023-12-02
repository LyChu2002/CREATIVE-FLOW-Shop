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
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>


</head>
<body>
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<main class="main">
			<div class="breadcrumb">
				<span><a href="${classpath }/index">Trang chủ</a></span> <span><a
					href="${classpath }/category">Danh mục sản phẩm</a></span> <span><a href="">Sản
						phẩm</a></span>
			</div>
			<div class="main-content">
				<form action="${classpath }/product-detail" method="get">

					<div class="product-detail-infor">
						<div class="product-detail-img">
							<div class="img-item">
								<img width="100%" src="${classpath }/FileUpload/${product.avatar}" alt="">
							</div>
							<c:forEach items="${productImages }" var="productImage">
								<div class="img-item">
									<img width="100%"
										src="${classpath }/FileUpload/${productImage.path}" alt="">
								</div>
							</c:forEach>
						</div>

						<div class="product-detail-img-slide">
							<c:forEach items="${productImages }" var="productImage">
								<div class="img-item">
									<img width="100%"
										src="${classpath }/FileUpload/${productImage.path}" alt="">
								</div>
							</c:forEach>
						</div>

						<div class="product-information" style="width: 46%;">
							<h3 class="product-detail-name">${product.name }</h3>
							<ul class="review">
								<li class="first-item">Đánh giá <i
									class="fa-regular fa-star"></i> <i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i> <i
									class="fa-regular fa-star"></i> <i class="fa-regular fa-star"></i>

									</a></li>

								<li class="last-item">Chia sẻ <a href=""><i
										class="fa-brands fa-facebook-f"></i></a> <a href=""><i
										class="fa-brands fa-twitter"></i></a> <a href=""><i
										class="fa-brands fa-google-plus-g"></i></a> <a href=""><i
										class="fa-brands fa-pinterest-p"></i></a> <a href=""><i
										class="fa-brands fa-instagram"></i></a> <a href=""><i
										class="fa-regular fa-envelope"></i></a>
								</li>
							</ul>

							<div class="product-detail-price">
								<span style="text-decoration-line: line-through;"> <!-- <i class="fa-solid fa-sterling-sign"></i> -->
									<fmt:formatNumber value="${product.oldPrice }"
										minFractionDigits="0"></fmt:formatNumber>
								</span> <span> <!-- <i class="fa-solid fa-sterling-sign"></i> -->
									<fmt:formatNumber value="${product.price }"
										minFractionDigits="0"></fmt:formatNumber>
								</span>
							</div>

							<div class="product-desc">
								<p class="title-infor">
									Tình trạng:
									<c:choose>
										<c:when test="${product.warehouseQuantity > 0 }">
											<span>Còn hàng</span>
										</c:when>
										<c:otherwise>
											<span>Hết hàng</span>
										</c:otherwise>
									</c:choose>

								</p>
								<p class="title-infor">
									Mã sản phẩm: <span>${product.code }</span>
								</p>
								<p class="title-infor">
									TAGS: <span class="product-type">Classic, Casual,
										V-neck, Loose</span>
								</p>
								<p class="main-desc">${product.detailDescription }</p>

							</div>

							<div class="product-selection">
								<div class="select-item">
									<label for="">Màu sắc</label> </br> <select class="select-box"
										name="" id="">
										<option value="" selected>Chọn màu</option>
										<option value="">Đen</option>
										<option value="">Trắng</option>
										<option value="">Nâu socola</option>
									</select>

								</div>

								<div class="select-item">
									<label for="">Kích cỡ</label> </br> <select class="select-box"
										name="" id="">
										<option value="" selected>Select Size</option>
										<option value="">S</option>
										<option value="">M</option>
										<option value="">L</option>
									</select>

								</div>
								

								<div class="select-item">
									<label for="">Số lượng</label> </br> <input type="number"
										class="select-box" name="quantity" id="quantity" />

								</div>
							</div>
							<div class="add-cart">
								<button type="button" class="btn-add btn-add-cart"
									onclick="addToCart(${product.id })" >
									<i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
								</button>

								<button class="btn-add btn-buy-product">
									<i class="fa-regular fa-heart"></i> Bộ sưu tập
								</button>
							</div>

						</div>
					</div>
				</form>
				<div class="sub-content-description">
					<ul class="content-menu">
						<li><a href="">Chi tiết sản phẩm</a></li>
						<li><a href="">Thông tin thanh toán</a></li>
						<li><a href="">Hướng dẫn mua hàng</a></li>

					</ul>

					<h5>NUNC EGESTAS POSUERE ENIM, EU MAXIMUS ERAT POSUERE EGET</h5>
					<p>Sed ut mi mollis, consequat nulla lacinia, hendrerit turpis.
						Nulla sapien magna, interdum quis pretium nec, pharetra at felis.
						Curabitur dictum sapien est, eget ultricies turpis porta vel. Nam
						suscipit nec lacus sed imperdiet. Vestibulum a purus risus. Nulla
						et dictum augue, nec efficitur mi. Nam sit amet pretium elit.
						Aliquam congue, ligula id vehicula vestibulum, orci ex vulputate
						lacus, ac malesuada elit dolor eget ex. Sed quis aliquet risus, ut
						cursus lectus. In eget lorem tellus.</p>
					<p>Quisque eleifend varius nisi nec sagittis. Nulla ullamcorper
						imperdiet justo, ut venenatis purus lobortis ut. Nunc sagittis
						urna et hendrerit sodales. Nunc molestie risus nec fringilla
						lacinia. Nulla facilisi. Etiam neque velit, tristique eget
						sollicitudin eget, placerat at metus. Proin dictum lobortis velit,
						id suscipit orci faucibus ut. Aliquam erat volutpat. Vivamus
						feugiat justo in diam placerat, id dignissim elit auctor.
						Vestibulum scelerisque sem et lobortis ultricies. Morbi suscipit
						nulla urna. Suspendisse potenti. Nullam varius quam sed nisl
						dignissim, vel faucibus ipsum blandit. Vivamus at suscipit augue.
						Nam finibus gravida lorem eu viverra. Praesent rhoncus imperdiet
						ultric- ies. Nullam pretium cursus augue auctor vulputate. Quisque
						a convallis diam commodo eget diam id, eleifend dictum libero.
						Etiam varius, nisi vel dignissim sodales, enim dui posuere mauris,
						in aliquet lorem eros eget neque.</p>
				</div>

				<div class="main-products">
					<div class="content">
						<h1 class="product-list-title">SẢN PHẨM TƯƠNG TỰ</h1>
					</div>
					<div class="main-product-content">
						<div class="row product-list-slick">
						<c:forEach var="product" items="${productInCategory }" varStatus = "loop">
							<div class="col-12 col-xl-3 col-lg-4 col-md-6">
								<div class="product-item">
									<div class="product-img">
										<a href="${classpath }/product-detail/${product.id}"><img src="${classpath }/FileUpload/${product.avatar}" alt=""
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
												<a href=""><i class="fa-solid fa-cart-shopping"></i></a>
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

			</div>


		</main>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<!-- JS -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

		<!-- Add to cart -->
		<script type="text/javascript">
		addToCart = function(_productId) {		
			//alert("Thêm "  +jQuery("#quantity").val() + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: jQuery("#quantity").val(),
				
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
	</div>
</body>
</html>