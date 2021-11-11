<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="client/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="client/js/jquery.js"></script>
<script src="client/js/custom/home.js"></script>
<title>Quản lý tài khoản</title>
</head>
<body>
	
	<!-- Header -->
	<div class="header">
		<jsp:include page="./static/first-line.html"></jsp:include>
		<div class="second-line">
			<div class="container flex bg-white">
				<ul class="menu">
					<li class="category">Danh mục</li>
					<!-- Hien thi category -->
					<c:forEach items="${categories}" var="category">
						<li><a href="category?id=${category.id}&page=1">${category.name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
                <div class="sidebar">
                    <div class="logo-details">
                        <p>Xin chào, ${login_user}</p>
                    </div> 
                </div>
                <form id="UserForm" method="post">
                    <div class="form">
                  <h2> Cap nhat thong tin </h2>
                  <ul>
                    <li>
                      <input
                        type="text"
                        id="first_name"
                        name="first_name"
                        placeholder="First Name" />
                    </li>
                    <li>
                        <input
                        type="text"
                        id="last_name"
                        name="last_name"
                        placeholder="Last Name" />
                    </li>
                    <li>
                  <input
                      type="text"
                      id="nohome"
                      name="nohome"
                      placeholder="Home Number" />
                    </li>
                    <li>
                  <input
                      type="text"
                      id="city"
                      name="city"
                      placeholder="City" />
                    </li>
                    <li>
                      <input
                        type="text"
                        id="street"
                        name="street"
                        placeholder="Street" />
                    </li>
                    <li>
                      <input
                        type="text"
                        id="district"
                        name="district"
                        placeholder="District" />
                    </li>
                    <li>
                      <input id="submit" type="submit" name="submit" value="Save" />
                  </li>
                </ul>
                </div>
                </form>
                <a href="logout"><button class="btn btn-yes">Đăng xuất</button></a>
	
             
             <!-- Footer -->
	<jsp:include page="./static/footer.html"></jsp:include>
	
</body>
</html>