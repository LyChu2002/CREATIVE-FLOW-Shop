<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
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
				<a class="sidebar-brand" href="index.html">
					<span class="align-middle">${title }</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						SYSTEM ADMINISTRATION
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath }/admin/home">
							<i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath}/admin/category-list">
							<i class="align-middle" data-feather="database"></i> <span class="align-middle">Category Management</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath }/admin/product-list">
							<i class="align-middle" data-feather="list"></i> <span class="align-middle">Product Management</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath }/admin/user-list">
							<i class="align-middle" data-feather="user"></i> <span class="align-middle">User Management</span>
						</a>
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="${classpath }/admin/role-list">
							<i class="align-middle" data-feather="user-check"></i> <span class="align-middle">Role Management</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${classpath }/admin/order-list">
							<i class="align-middle" data-feather="shopping-bag"></i> <span class="align-middle">Order Management</span>
						</a>
					</li>

					<li class="sidebar-header">
						AUTHENTICATION
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-sign-up.html">
							<i class="align-middle" data-feather="mail"></i> <span class="align-middle">Register</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-sign-up.html">
							<i class="align-middle" data-feather="log-out"></i> <span class="align-middle">Log out</span>
						</a>
					</li>

					
				</ul>
			</div>
		</nav>

        <div class="main">
        	<!-- nav -->
            <jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>

            <main class="content">
             <div class="row">
                    <div class="col-7 align-self-center">
                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">Add New Role</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${classpath }/admin/role-edit-save" method="post" modelAttribute="role" enctype="multipart/form-data">
	                        		 <div class="form-body">
	                        		 
	                        		 	<sf:hidden path="id"/> <!-- id > 0 => update -->
	                        		 
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Role name</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="role name"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Active</label>			                                       
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="role">Create by</label>
			                                        <sf:select path="userCreateRole.id" class="form-control" id="userCreateRole">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="role">Update by</label>
			                                        <sf:select path="userUpdateRole.id" class="form-control" id="userUpdateRole">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Create date</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate">Update date</label>
			                                       
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate" ></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Description</label>
			                                        <sf:textarea path="description" id="description" name="description"
																class="form-control" rows="3" placeholder="desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4"> 
			                                        <a href="${classpath }/admin/role-list" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Save role</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		</div>
	                        	</sf:form>
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

</body>

</html>