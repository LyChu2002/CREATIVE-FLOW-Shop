<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <div class="menu">
        <nav>
            <ul class="main-menu">
                <li><a href="${classpath }/index">Trang chủ</a></li>
                <li>
                    <a href="${classpath }/category">Thời trang nữ</a>
                    <div class="sub-menu">
                        <div class="catalog-lists">
                            <ul class="list-item">
                                <h4>ÁO</h4>
                                <li><a href="">Áo sơ mi</a></li>
                                <li><a href="">Áo thun</a></li>
                                <li><a href="">Áo vest</a></li>
                                <li><a href="">Áo len</a></li>
                            </ul>
                            <ul class="list-item">
                                <h4>ĐẦM</h4>
                                <li><a href="">Đầm</a></li>
                                <li><a href="">Đầm maxi/voan</a></li>
                                <li><a href="">Đầm dạ hội</a></li>
                            </ul>
                            <ul class="list-item">
                                <h4>PHỤ KIỆN THỜI TRANG</h4>
                                <li><a href="">Túi/ví</a></li>
                                <li><a href="">Giày/dép & Sandals</a></li>

                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="${classpath }/category">
                        Thời trang trẻ em</a>
                    <div class="sub-menu">
                        <div class="catalog-lists">
                            <ul class="list-item">
                                <h4>BÉ GÁI</h4>
                                <li><a href="">Áo bé gái</a></li>
                                <li><a href="">Quần bé gái</a></li>
                                <li><a href="">Váy bé gái</a></li>
                                <li><a href="">Phụ kiện bé gái</a></li>
                            </ul>

                            <ul class="list-item">
                                <h4>BÉ TRAI</h4>
                                <li><a href="">Áo bé trai</a></li>
                                <li><a href="">Quần bé trai</a></li>
                                <li><a href="">Phụ kiện bé trai</a></li>
                            </ul>
                        </div>
                    </div>

                </li>
                <li>
                    <a href="">Tin tức</a>
                    <div class="sub-menu" style="min-width: 300px">
                        <ul>
                            <li><a href="">Xu hướng thời trang</a></li>
                            <li><a href="">Hoạt động cộng đồng</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="">Liên hệ</a></li>
            </ul>
        </nav>

        <div class="logo-brand">
            <img src="${classpath }/frontend/images/logo.png">
        </div>

        <div class="search">
          <!--  <form action="${classpath }/index" class="form-search" method="GET">-->
          <div class="form-search">
                <input type="text" placeholder="Tìm kiếm sản phẩm" name="keyword" id="keyword">
                <button type="submit" id="btnSearch" name="btnSearch">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>    
            <!--  </form>-->
        </div>

        <div class="user-cart">
        <c:choose>
        	<c:when test="${isLogined }">
        		 <a href="${classpath }/logout" style="color: white">Hello, ${loginedUser.username }</i></a>
        	</c:when>
        	<c:otherwise>
        		 <a href="${classpath }/signup"><i class="fa-solid fa-user"></i></a>
        	</c:otherwise>
        	
        </c:choose>
           
            <a class="cart-icon" href="${classpath }/cart-view">
                <i class="fa-solid fa-cart-shopping"></i>
                <span id="totalCartProductsId" class="cart-status">${totalCartProducts  }</span>
            </a>
        </div>

    </div>
</header>