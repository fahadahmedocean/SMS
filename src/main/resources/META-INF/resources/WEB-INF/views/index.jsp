<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
            <h1> My Dashboard
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                        <c:if test="${not empty serviceList}">


                            <div class="box-header">
                                My Pending Service Request
                            </div>
                        <table id="serviceListTable" class="table">
                            <thead>
                            <tr>
                                <th>Sl#</th>
                                <th>Service Name</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Service Charge</th>
                                <th>Time</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${serviceList}" var="service" varStatus="status">
                                <tr>
                                    <td>${status.index+1}</td>
                                    <td>${service.item.name}</td>
                                    <td>${service.item.description}</td>
                                    <td>${service.status}</td>
                                    <td>${service.item.charge}</td>
                                    <td>${service.requestTime}</td>
                                    <td>
                                        <a class="btn btn-success"
                                           href="./changeServiceStatus?serviceId=${service.id}&status=APPROVED">Approved</a>
                                        <a class="btn btn-danger"
                                           href="./changeServiceStatus?serviceId=${service.id}&status=DENIED">Deny</a>
                                        <a class="btn btn-primary"
                                           href="./changeServiceStatus?serviceId=${service.id}&status=COMPLETE">Complete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        </c:if>
                            <div class="row">
                                <div id="barChart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                <div id="speedoMeter" style="min-width: 310px; max-width: 400px; height: 300px; margin:
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
    $(document).ready(function(){
        var speed = +'${barber.workingSpeed}';
        renderMonthlyIncomeChart();

        if(speed > 0){
            renderSpedometer(speed);
        }

        function renderMonthlyIncomeChart(){
            Highcharts.chart('barChart', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'My Last Completed Services'
                },
                subtitle: {
                    text: 'Source: SAMS'
                },
                xAxis: {
                    categories: [
                        '01-01-2018',
                        '02-01-2018',
                        '03-01-2018',
                        '04-01-2018'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Rainfall (mm)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">Date: {point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">Income </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} Taka</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: 'Md. Topu ',
                    data: [500, 400, 1000, 3000]

                }]
            });
        }
        function renderSpedometer(speed){
            Highcharts.chart('speedoMeter', {

                    chart: {
                        type: 'gauge',
                        plotBackgroundColor: null,
                        plotBackgroundImage: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },

                    title: {
                        text: 'Speedometer'
                    },

                    pane: {
                        startAngle: -150,
                        endAngle: 150,
                        background: [{
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#FFF'],
                                    [1, '#333']
                                ]
                            },
                            borderWidth: 0,
                            outerRadius: '109%'
                        }, {
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#333'],
                                    [1, '#FFF']
                                ]
                            },
                            borderWidth: 1,
                            outerRadius: '107%'
                        }, {
                            // default background
                        }, {
                            backgroundColor: '#DDD',
                            borderWidth: 0,
                            outerRadius: '105%',
                            innerRadius: '103%'
                        }]
                    },

                    // the value axis
                    yAxis: {
                        min: 0,
                        max: 200,

                        minorTickInterval: 'auto',
                        minorTickWidth: 1,
                        minorTickLength: 10,
                        minorTickPosition: 'inside',
                        minorTickColor: '#666',

                        tickPixelInterval: 30,
                        tickWidth: 2,
                        tickPosition: 'inside',
                        tickLength: 10,
                        tickColor: '#666',
                        labels: {
                            step: 2,
                            rotation: 'auto'
                        },
                        title: {
                            text: 'km/h'
                        },
                        plotBands: [{
                            from: 0,
                            to: 120,
                            color: '#55BF3B' // green
                        }, {
                            from: 120,
                            to: 160,
                            color: '#DDDF0D' // yellow
                        }, {
                            from: 160,
                            to: 200,
                            color: '#DF5353' // red
                        }]
                    },

                    series: [{
                        name: 'Speed',
                        data: [speed],
                        tooltip: {
                            valueSuffix: ' W/h'
                        }
                    }]

                },
// Add some life
                function (chart) {
                    if (!chart.renderer.forExport) {
                        setInterval(function () {
                            var point = chart.series[0].points[0],
                                newVal,
                                inc = Math.round((Math.random() - 0.5) * 20);

                            newVal = point.y + inc;
                            if (newVal < 0 || newVal > 200) {
                                newVal = point.y - inc;
                            }

                            point.update(newVal);

                        }, 3000);
                    }
                });
        }
    })

</script>
</body>
</html>