<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
  
    <link rel='stylesheet' type='text/css' media='screen' href='${classpath }/frontend/css/registration.css'>
   	 <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
   	 <!-- variables -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div class="wrapper">
       <!-- Header -->
       <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

       <main class="main">
            <div class="registration-form">
                <div class="row">
                    <div class="col-12 col-lg-6 form-left">
                        <form action="${classpath }/register" method="post" class="form" id="form-1">
                            <h3>ĐĂNG KÍ</h3>
                            <div class="form-group">
                                <label for="" class="form-label">Tên <span class="required">*</span></label>
                                <input type="text" id="fullname" name="username" placeholder="Cẩm Ly" class="form-control"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="" class="form-label">Mật khẩu <span class="required">*</span></label>
                                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" class="form-control"/>
                                <span class="show-hide"><i class="fas fa-eye"></i></span>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="" class="form-label">Nhập lại mật khẩu <span class="required">*</span></label>
                                <input type="password" id="password_confirmation" name="" placeholder="Nhập lại mật khẩu" class="form-control"/>
                                <span class="show-hide-two"><i class="fas fa-eye fa-eye-2"></i></span>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="" class="form-label">Email </label>
                                <input type="text" id="email" name="email" placeholder="camly@gmail.com" class="form-control"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="" class="form-label">Số điện thoại </label>
                                <input type="text" id="mobile" name="mobile" placeholder="098773452" class="form-control"/>
                                <span class="form-message"></span>
                            </div>
                            <button type="submit" class="btn btn-register">Đăng ký</button>
                        </form>
                    </div>
                    <div class="col-12 col-lg-6">
                        <h3>ĐÃ có tài khoản</h3>
                       <!--   <button type="submit" class="btn btn-login">Đăng nhập</button>-->
                       <a href="${classpath }/login">
                       		<button class="btn btn-login">Đăng nhập</button>
                       </a>
                    </div> 
                </div>
            </div>
       </main>

        
       <!-- Footer -->
       <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

       <!-- JS -->
       <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
		<script src="${classpath }/frontend/js/validator.js"></script>
		 
        <script>
            Validator({
              form: '#form-1',
              formGroupSelector: '.form-group',
              errorSelector: '.form-message',
              rules: [
                Validator.isRequired('#fullname', "Vui lòng nhập tên"),
                Validator.isRequired('#password', "Vui lòng nhập mật khẩu"),
                Validator.isRequired('#password_confirmation', "Vui lòng xác nhận mật khẩu"),
                Validator.isConfirmed('#password_confirmation', function () {
                  return document.querySelector('#form-1 #password').value;
                }, 'Mật khẩu nhập lại không chính xác')
              ]
              
            });
       </script>

        <script>
            const pass_field = document.querySelector('#password');
            const show_btn = document.querySelector('.fa-eye')
            show_btn.addEventListener("click", function () {
              if (pass_field.type === "password") {
                pass_field.type = "text";
                show_btn.classList.add("hide");
              } else {
                pass_field.type = "password";
                show_btn.classList.remove("hide");
              }
            });
        </script>

        <script>
            const pass_field2 = document.querySelector('#password_confirmation');
            const show_btn2 = document.querySelector('.fa-eye-2')
            show_btn2.addEventListener("click", function () {
              if (pass_field2.type === "password") {
                pass_field2.type = "text";
                show_btn2.classList.add("hide");
              } else {
                pass_field2.type = "password";
                show_btn2.classList.remove("hide");
              }
            });
        </script>
</div>
</body>

</html>