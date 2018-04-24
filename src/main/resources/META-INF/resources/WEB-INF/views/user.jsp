<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

<head>
    <%@ include file="/WEB-INF/views/head.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- This is Top menu bar  -->
    <%@ include file="/WEB-INF/views/topMenuBar.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="/WEB-INF/views/leftMenuBar.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                User Form
            </h1>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">

                        </div>
                        <div class="box-body">
                            <form:form id="userForm" commandName="user" method="post">
                                <form:hidden path="id"/>
                                <form:hidden path="barber.id"/>
                                <div class="box box-success">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"></h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <form:input path="username" cssClass="form-control" placeholder="Enter Name..."/>
                                        </div>
                                        <div class="form-group">
                                            <label>Password </label>
                                            <form:password path="password" cssClass="form-control" placeholder="Enter Password..."/>
                                        </div>

                                        <div class="form-group">
                                            <label>E-mail Address</label>
                                            <form:input path="email" cssClass="form-control" placeholder="Enter E-mail Address..."/>
                                        </div>
                                        <div class="form-group">
                                            <label>Enabled</label>
                                            <form:checkbox path="enabled"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Role</label>
                                            <form:select path="role" cssClass="form-control">
                                                <option value="ROLE_ADMIN">ADMIN</option>
                                                <option value="ROLE_EMPLOYEE">EMPLOYEE</option>
                                                <option value="ROLE_USER">USER</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <!-- thisis footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <!-- Control Sidebar -->
    <%@ include file="/WEB-INF/views/settings.jsp" %>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->
</body>
</html>