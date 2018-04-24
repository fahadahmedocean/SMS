<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
                Service's Information
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">

                        </div>
                        <div class="box-body">
                            <div class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <table id="serviceListTable" class="table">
                                            <thead>
                                            <tr>
                                                <th>Sl#</th>
                                                <th>Service Item</th>
                                                <th>Barber's Name</th>
                                                <th>Service Charge</th>
                                                <th>Time</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${serviceList}" var="service" varStatus="status">
                                                <tr>
                                                    <td>${status.index+1}</td>
                                                    <td>${service.item.code}-${service.item.name}</td>
                                                    <td>${service.barber.name}</td>
                                                    <td>${service.serviceCharger}</td>
                                                    <td>${service.requestTime}</td>
                                                    <td>${service.status}</td>
                                                    <td>
                                                        <a class="btn btn-danger"
                                                           href="./cancelService?serviceId=${service.id}">Cancel</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-warning"
                                                           href="./upsertService?serviceId=${service.id}">Edit</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger"
                                                           href="./deleteService?serviceId=${service.id}">Delete</a>
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
<script>
    $("#serviceListTable").dataTable();
</script>
</body>
</html>