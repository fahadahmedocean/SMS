
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
                Item Form
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
            <div class="col-md-9">
                <form:form id="itemForm" commandName="item" method="post">
                    <form:hidden path="id"/>
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title"></h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- text input -->
                            <div class="form-group">
                                <label>Name</label>
                                <form:input path="name" class="form-control" placeholder="Enter Name..."/>
                            </div>
                            <div class="form-group">
                                <label>Item Code</label>
                                <form:input path="code" class="form-control" placeholder="Enter Code..."/>
                            </div>
                            <div class="form-group">
                                <label>Item Description</label>
                                <form:input path="description" class="form-control" placeholder="Enter Description..."/>
                            </div>
                            <div class="form-group">
                                <label>Service Charge</label>
                                <form:input path="charge" class="form-control" placeholder="Enter Service Charge..."/>
                            </div>

                            <div class="form-group">
                                <label>Discount</label>
                                <form:select path="discount" class="form-control">
                                    <option value="5">5%</option>
                                    <option value="7">7%</option>
                                    <option value="10">10%</option>
                                    <option value="15">15%</option>
                                    <option value="20">20%</option>
                                    <option value="30">30%</option>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label>Service Time neede</label>
                                <form:input path="serviceTime" class="form-control" placeholder="Enter Approximate Service time to complete"/>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="col-md-3"></div>
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
    $(document).ready(function(){
    });


</script>
</body>
</html>