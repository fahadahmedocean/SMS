
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
                Service Form
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
            <div class="col-md-7">
                <form:form id="serviceForm" commandName="service" method="post">
                    <form:hidden path="id"/>
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title"></h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- text input -->
                            <div class="form-group">
                                <label>Barber</label>
                                <form:select path="barber.id" class="form-control barberSelect">
                                    <c:forEach items="${barberList}" var="barber">
                                        <option value="${barber.id}">${barber.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label>Item</label>
                                <form:select path="item.id" class="form-control itemClass">
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.id}">${item.code} - ${item.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label>Service Charge</label>
                                <form:input path="serviceCharger" class="form-control" placeholder="Enter Service Charge..."/>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="col-md-5 detailsMainDiv">
                <div class="box box-warning">
                    <div class="box-header with-border">
                        <h3 class="box-title"> Barber's Details</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body barberDetailsInfo">

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
    $(document).ready(function(){
        $(".detailsMainDiv").hide();

        $(".itemClass").change(function(){
            var itemId = $(this).val();

            $.get("/getItemById?itemId="+itemId, function(item){
                console.log("SMNLOG item::"+JSON.stringify(item));
                $("#serviceCharger").val(item);
            })
        });

        $(".barberSelect").change(function(){
            $(".detailsMainDiv").hide();
            var barberId = $(this).val();

            $.get("/getBarberDetails?barberId="+barberId, function(barber){
                console.log("SMNLOG barberId::"+JSON.stringify(barber));
                var html = "<table>";
                html += "<tbody>";

                html += "<tr>";
                html += "<td>Name :";
                html += "</td>";
                html += "<td><b>"+barber.name+"</b>";
                html += "</td>";
                html += "</tr>";

                html += "<tr>";
                html += "<td>E-mail :";
                html += "</td>";
                html += "<td><b>"+barber.email+"</b>";
                html += "</td>";
                html += "</tr>";

                html += "<tr>";
                html += "<td>Cell No :";
                html += "</td>";
                html += "<td><b>"+barber.mobile+"</b>";
                html += "</td>";
                html += "</tr>";

                html += "</tbody>";
                html += "</table>";

                $(".barberDetailsInfo").html(html)
                $(".detailsMainDiv").show(500);
            })
        });


    });


</script>
</body>
</html>