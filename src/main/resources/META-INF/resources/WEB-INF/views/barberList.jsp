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
                Barber's Information
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
                                        <table id="barberListTable" class="table">
                                            <thead>
                                            <tr>
                                                <th>Sl#</th>
                                                <th>Name</th>
                                                <th>Father's Name</th>
                                                <th>Mother's Name</th>
                                                <th>Age</th>
                                                <th>Gender</th>
                                                <th>Email Address</th>
                                                <th>Cell No</th>
                                                <th>National Id No</th>
                                                <th>Joining Date</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${barberList}" var="barber" varStatus="status">
                                                <tr>
                                                    <td>${status.index+1}</td>
                                                    <td>${barber.name}</td>
                                                    <td>${barber.fatherName}</td>
                                                    <td>${barber.motherName}</td>
                                                    <td>${barber.age}</td>
                                                    <td>${barber.gender}</td>
                                                    <td>${barber.email}</td>
                                                    <td>${barber.mobile}</td>
                                                    <td>${barber.nid}</td>
                                                    <td>${barber.joiningDate}</td>
                                                    <td>
                                                        <a class="btn btn-warning"
                                                           href="./upsertBarber?barberId=${barber.id}">Edit</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger"
                                                           href="./deleteBarber?barberId=${barber.id}">Delete</a>
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
    $("#barberListTable").dataTable();
</script>
</body>
</html>