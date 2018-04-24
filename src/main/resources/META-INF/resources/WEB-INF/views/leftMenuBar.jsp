<%@ page import="com.mbstu.ict.Utils" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Hi <%=Utils.getLoggedUserName()%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span>Administration</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <li><a href="/upsertBarber"><i class="fa fa-fw fa-cut"></i> New Barber</a></li>
                        <li><a href="/barberList"><i class="fa fa-fw fa-th-list"></i>Barber Info.</a></li>
                        <li><a href="/upsertUser"><i class="fa fa-fw fa-user"></i> New User</a></li>
                        <li><a href="/userList"><i class="fa fa-fw fa-th-list"></i>User Info.</a></li>
                        <li><a href="/upsertItem"><i class="fa fa-fw fa-hand-scissors-o"></i> New Item</a></li>
                        <li><a href="/itemList"><i class="fa fa-fw fa-th-list"></i>Item Info.</a></li>
                    </security:authorize>
                        <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                            <li><a href="/upsertService"><i class="fa fa-fw fa-hand-scissors-o"></i> New Service</a></li>
                            <li><a href="/serviceList"><i class="fa fa-fw fa-th-list"></i>Service Info.</a></li>
                        </security:authorize>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Charts</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                    <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                    <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                    <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>