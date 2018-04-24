
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
                Barber Form
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
            <div class="col-md-9">
                <form:form id="barberForm" commandName="barber" method="post">
                    <form:hidden path="id"/>
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">General Elements</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- text input -->
                            <div class="form-group">
                                <label>Name</label>
                                <form:input path="name" class="form-control" placeholder="Enter Name..."/>
                            </div>
                            <div class="form-group">
                                <label>Father's Name</label>
                                <form:input path="fatherName" class="form-control" placeholder="Enter Father's Name..."/>
                            </div>

                            <div class="form-group">
                                <label>Mother's Name</label>
                                <form:input path="motherName" class="form-control" placeholder="Enter Mother's Name..."/>
                            </div>
                            <div class="form-group">
                                <label>gender</label>
                                <form:select path="gender" class="form-control">
                                    <option value="Male">Male</option>
                                    <option value="Fe-Male">Fe-Male</option>
                                    <option value="Others">Others</option>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label>Age</label>
                                <form:input path="age" class="form-control" placeholder="Enter Age"/>
                            </div>
                            <div class="form-group">
                                <label>E-mail Address</label>
                                <form:input path="email" class="form-control" placeholder="Enter valid E-mail Address"/>
                            </div>
                            <div class="form-group">
                                <label>Cell No</label>
                                <form:input path="mobile" class="form-control" placeholder="Enter Cell No"/>
                            </div>
                            <div class="form-group">
                                <label>National Id</label>
                                <form:input path="nid" class="form-control" placeholder="Enter National Id No" />
                            </div>
                            <div class="form-group">
                                <label>Working Speed Id</label>
                                <form:input path="workingSpeed" class="form-control" placeholder="Enter Speed" />
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

        $("#name").keydown(function(){
            console.log("SMNLOG :: pressed.....");

            var name = $(this).val();

            $(this).closest("div.form-group").removeClass("has-error").removeClass("has-success");

            if(name.length <=4){
                 $(this).closest("div.form-group").addClass("has-error");
            }else{
                $(this).closest("div.form-group").addClass("has-success");
            }
        })
    });


</script>
</body>
</html>