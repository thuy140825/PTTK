<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem sản phẩm - ${product.name}</title>
<meta property="fb:app_id" content="210865283197643"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="client/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="client/js/jquery.js"></script>
<script src="client/js/custom/product.js"></script>
<script src="https://kit.fontawesome.com/8bc099c2d2.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- Header -->
	<div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="./" id="logo"><i class="fa-solid fa-shop"></i> SHOP </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                 <a class="nav-link active" aria-current="page" href="./">Trang chủ</a>
                            </li>
                             <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach items="${categories}" var="category">
                                        <li><a class="dropdown-item text-black" href="category?id=${category.id}&page=1">${category.name }</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="invoices">Lịch sử giao dịch</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cart">Giỏ hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="account">Tài khoản</a>
                            </li>
                        </ul>
                        <form class="d-flex bg-dark" action="search" method="get">
                            <input class="form-control-md me-2" type="text" placeholder="Tìm kiếm..." aria-label="Search" name="keyword">
                            <button class="btn-md btn-outline-success" type="submit">Search</button>
                        </form>>
                    </div>
                </div>
            </nav>
	</div>
	<div class="main">
		<div class="container">
			<div class="breadcumb">
				<a href="./">Trang chủ</a> > <a href="category?id=${product.category.id}">${product.category.name}</a> > ${product.name}
			</div>
			<div class="box-wrap flex flex-start">
				<div class="image-info">
					<img src="client/images/${product.img}" class="image-info-img">
				</div>
				<div class="detail-info flex flex-column">
					<div class="name-info">${product.name}</div>
					<div class="price-info"><fmt:formatNumber type="number" pattern="###,###" value="${product.price}"></fmt:formatNumber> VNĐ</div>
					<div class="number-info">
						Số lượng <input type="number" value="1" min="1" class="input-sweet input-number">
					</div>
					<div class="empty-box">
						<form action="add-to-cart" method="GET">
							<input type="hidden" name="id" value="${product.id}">
							<input type="hidden" name="quantity" value="1" id="product-quantity">
							<input type="submit" value="Thêm vào giỏ hàng" class="check-out"/>
						</form>
					</div>
				</div>
			</div>

			<div class="box-wrap flex flex-start">
				<div class="title-sweet">Thông tin chi tiết sản phẩm</div>
				<p class="detail-info-product">
					${product.details}
				</p>
			</div>

			<div class="box-wrap flex flex-start">
				<div class="title-sweet">Đánh giá</div>
				
				<div id="dnd-comment" class="fb-comments" data-href="http://blogvatly97.blogspot.com/id/${product.id }" data-width="1160" data-numposts="3"></div>
				
			</div>
		</div>
	</div>
	<!-- Footer -->
	<div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h2><strong>Thông tin liên hệ</strong></h2>
                        <div class="row info mt-lg-3">
                            <span><i class="fa-solid fa-envelope"></i> Email: </span>
                            <a href="mailto:mail@ptit.edu.vn">mail@shop.vn</a>
                        </div>
                        <div class="row info mt-lg-3">
                            <span><i class="fa-solid fa-phone"></i> Số điện thoại: </span>
                            <span><a href="callto:0123456789">0123456789</a></span>
                        </div>
                        <div class="row info mt-lg-3">
                            <span><i class="fa-solid fa-location-dot"></i> Địa chỉ: </span>
                            <span>  30 Trần Phú, P. Mộ Lao, Hà Đông, Hà Nội</span>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h2><strong>Liên kết xã hội</strong></h2>
                        <span class="container pt-lg-5">
                            <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook-square"></i></a> &nbsp; &nbsp; &nbsp;
                            <a href="https://www.youtube.com/"><i class="fa-brands fa-youtube"></i></a> &nbsp; &nbsp; &nbsp;
                            <a href="https://www.twitter.com/"><i class="fa-brands fa-twitter"></i></a>
                        </span>
                    </div>
                </div>
                <div class="row mt-lg-5 text-center">
                    <p>PTTK PTIT &copy; 2021 Nhóm 14</p>
                </div>
            </div>
        </div>
	
</body>
</html>