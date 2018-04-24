<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="/WEB-INF/views/head.jsp" %>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form:form action="/login" method="post">
            <div class="form-group has-feedback">
                <input id="username" type="text" class="form-control" name="username" placeholder="User Name"/>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="password" type="password" class="form-control" name="password" placeholder="Password"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> Remember Me
                        </label>
                    </div>
                </div>
                <c:if test="${param.error ne null}">
                    <div class="alert-danger">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
                </c:if>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div>
                <!-- /.col -->
            </div>
        </form:form>

        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in
                using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in
                using
                Google+</a>
        </div>
        <!-- /.social-auth-links -->

        <a href="#">I forgot my password</a><br>
        <a href="register.html" class="text-center">Register a new membership</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>


<%--
<div style="margin-left: 500px;margin-top: 200px;">
	<form:form action="/login" method="post">
        <div class="login-wrapper-div">
            <div class="login-div">
                <div id="product">MB<span style="color: #E17A01">ST</span>U<sup style="font-size:28px;">&trade;</sup></div>
			<div>
                <label class="input-label">User Name</label>
				<input id="username" type="text" class="style-4" name="username" placeholder="User Name" style="margin-top: 0px;"/>
			</div>
			<div>
                <label class="input-label">Password</label>
				<input id="password" type="password" class="style-4" name="password" placeholder="Password" style="margin-top: 0px;"/>
            </div>
			<div>
				<input type="submit" value="Sign In" class="button btn btn-primary"/>
			</div>
			<div id="forgot">
				<a href="/forgotPassword">Forgot your password?</a>
			</div>
			<c:if test="${param.error ne null}">
				<div class="alert-danger">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
			</c:if>

		</div>
		</div>
	</form:form>
        </div>
--%>
