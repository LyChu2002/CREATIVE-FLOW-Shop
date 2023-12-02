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
							<i class="align-middle" data-feather="database"></i> <span class="align-middle">Category Mangement</span>
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
                    <div class="col-12">
                        <div class="row">
                                    <div class="col-7 align-self-center">
                                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">List Role</h2>
                                    </div>
                                </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                               	<div class="row">
                       		 		<div class="col-md-6">
										<div class="form-group mb-4">
	                                        <a href="${classpath }/admin/role-add" role="button" class="btn btn-primary">Add New Role</a>
                                      	</div>
                                   	</div>
									
                                    
                                </div>
                                
                                    <table id="zero_config" class="table-color table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Role name</th>
                                                
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Status</th> 
                                                <th scope="col">Description</th>    
                                                <th scope="col">Action</th>                                           
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="role" items="${roles }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${role.id }</td>
		                                        	<td>${role.name }</td>
		                                        	
		                                        	<td>${role.userCreateRole.username }</td>
		                                        	<td>${role.userUpdateRole.username }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<span id="_role_status_${role.id }">
	                                                		<c:choose>
	                                                			<c:when test="${role.status }">
	                                                				<span>Active</span>
	                                                			</c:when>
	                                                			<c:otherwise>
	                                                				<span>Inactive</span>
	                                                			</c:otherwise>
	                                                		</c:choose>
	                                                	</span>
		                                        	</td>
		                                        	<td>${role.description }</td>
	                                        		<td>
	                                        			<a href="${classpath }/admin/role-edit/${role.id }" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${classpath }/admin/role-delete/${role.id }" role="button" 
	                                                							class="btn btn-danger">Delete</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                       
                                    </table>
                                    
                                   
	                            </div>
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