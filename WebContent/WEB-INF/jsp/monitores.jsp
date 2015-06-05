<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="es" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="es">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>NaturAdventure</title>
		<meta name="description" content="web AGG project">
		<meta name="author" content="AGG team">

<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">

		<!-- Web Fonts -->
		<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel='stylesheet' type='text/css'>
		<link href="${pageContext.request.contextPath}/resources/css/fonts2.css" rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="${pageContext.request.contextPath}/resources/css/animations.css" rel="stylesheet">

		<!-- Worthy core CSS file -->
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="${pageContext.request.contextPath}/resources/css/customPago.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/blueimp-gallery.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-image-gallery.min.css">
	</head>
	
	
    <body>
        <!-- #wrap -->
        <div id="wrap">
            <!-- #top -->
            <div id="top">
                <!-- .navbar -->
                <div class="navbar navbar-inverse navbar-static-top">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </a>
                            <a class="brand" href="index.html">NaturAdventure</a>
                            <!-- .topnav -->
                            <div class="btn-toolbar topnav">
                                <div class="btn-group">
                                    <a id="changeSidebarPos" class="btn btn-success" rel="tooltip"
                                       data-original-title="Show / Hide Sidebar" data-placement="bottom">
                                        <i class="icon-resize-horizontal"></i>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-inverse" rel="tooltip" data-original-title="E-mail" data-placement="bottom">
                                        <i class="icon-envelope"></i>
                                        <span class="label label-warning">5</span>
                                    </a>
                                    <a class="btn btn-inverse" rel="tooltip" href="#" data-original-title="Messages"
                                       data-placement="bottom">
                                        <i class="icon-comments"></i>
                                        <span class="label label-important">4</span>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-inverse" rel="tooltip" href="#" data-original-title="Document"
                                       data-placement="bottom">
                                        <i class="icon-file"></i>
                                    </a>
                                    <a href="#helpModal" class="btn btn-inverse" rel="tooltip" data-placement="bottom"
                                       data-original-title="Help" data-toggle="modal">
                                        <i class="icon-question-sign"></i>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-inverse" data-placement="bottom" data-original-title="Logout" rel="tooltip"
                                       href="login.html"><i class="icon-off"></i></a></div>
                            </div>
                            <!-- /.topnav -->
                            <div class="nav-collapse collapse">
                                <!-- .nav -->
                                <ul class="nav">
                                    <li><a href="BEindex.html">Reservas</a></li>
                                    <li><a href="BEactividades.html">Actividades</a></li>
                                    <li class="active"><a href="BEmonitores.html">Monitores</a></li>
                                </ul>
                                <!-- /.nav -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.navbar -->
            </div>
            <!-- /#top -->
            <!-- .head -->
            <header class="head">
                <div class="search-bar">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="search-bar-inner">
                                <a id="menu-toggle" href="#menu" data-toggle="collapse"
                                   class="accordion-toggle btn btn-inverse visible-phone"
                                   rel="tooltip" data-placement="bottom" data-original-title="Show/Hide Menu">
                                    <i class="icon-sort"></i>
                                </a>

                                <form class="main-search">
                                    <input class="input-block-level" type="text" placeholder="Live search...">
                                    <button id="searchBtn" type="submit" class="btn btn-inverse"><i class="icon-search"></i>
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- ."main-bar -->
                <div class="main-bar">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span12">
                                <h3><i class="icon-table"></i> Monitores</h3>
                            </div>
                        </div>
                        <!-- /.row-fluid -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.main-bar -->
            </header>
            <!-- /.head -->

            

            <!-- #content -->
            <div id="content">
                <!-- .outer -->
                <div class="container-fluid outer">
                    <div class="row-fluid">
                        <!-- .inner -->
                        <div class="span12 inner">
                        
                            
                            
                            <!-- .row-fluid -->
                            <div class="row-fluid">
                                <!-- .span12 -->
                                <div class="span12">
                                    <div class="box">
                                        <header>
                                            <h5>Listado de monitores</h5>
                                            <div class="toolbar" >
                                            </div>
                                        </header>
                                        <div id="collapse4" class="body">
                                            <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#ID</th>
                                                        <th>Nombre</th>
                                                        <th>Email</th>
                                                        <th>Tipo de actividad</th>
														<td><!-- Botones --></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${monitores}" var="monitor">
                                                    	<tr>
                                                    		<td>${monitor.id}</td>
                                                    		<td>${monitor.nombre}</td>
                                                    		<td>${monitor.email}</td>
                                                    		<td>${monitor.actividades}</td>
                                                    		<td>
                                                        		<button class="btn edit"><i class="icon-edit"></i></button>
                                                            	<button class="btn btn-danger remove" data-toggle="confirmation" href="editMonitor.html"><i class="icon-remove"></i></button>
                                                        	</td>
                                                    	</tr>
                                                    </c:forEach>
                                                </tbody>
                                                <a href = "nuevoMonitor.html">Nuevo</a>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.span12 -->
                            </div>
                            <!-- /.row-fluid -->

                            

                            <!-- .row-fluid -->
                            <div class="row-fluid">
                                <!-- .span12 -->
                                <div class="span12">
                                    <div class="box">
                                        <header>
                                            
                                            <h5>Reservas Asignadas</h5>
                                            <div class="toolbar">
                                                <a href="#sortableTable" data-toggle="collapse" class="accordion-toggle minimize-box">
                                                    <i class="icon-chevron-up"></i>
                                                </a>
                                            </div>
                                        </header>
                                        <div class="body collapse in" id="sortableTable">
                                            <table class="table table-bordered sortableTable responsive">
                                                <thead>
                                                    <tr>
                                                        <th>#Id
                                                            <i class="icon-sort"></i><i class="icon-sort-down"></i> <i class="icon-sort-up"></i>
                                                        </th>
                                                        <th>Cliente
                                                            <i class="icon-sort"></i><i class="icon-sort-down"></i> <i class="icon-sort-up"></i>
                                                        </th>
                                                        <th>Actividad
                                                            <i class="icon-sort"></i><i class="icon-sort-down"></i> <i class="icon-sort-up"></i>
                                                        </th>
                                                        <th>Personas
                                                            <i class="icon-sort"></i><i class="icon-sort-down"></i> <i class="icon-sort-up"></i>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach items="${reservas}" var="reserva">
                                                    	<tr>
                                                    		<td>${reserva.id}</td>
                                                    		<td>${reserva.cliente}</td>
                                                    		<td>${reserva.actividad}</td>
                                                    		<td>${reserva.personas}</td>
                                                    	</tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.span12 -->
                            </div>
                            <!-- /.row-fluid -->
                        </div>
                        <!-- /.inner -->
                    </div>
                    <!-- /.row-fluid -->
                </div>
                <!-- /.outer -->
            </div>
            <!-- /#content -->
            <!-- #push do not remove -->
            <div id="push"></div>
            <!-- /#push -->
        </div>
        <!-- /#wrap -->
        <div id="footer">
            <p>2013 © NaturAdvenure</p>
        </div>
        
        
        <!-- #NewModal -->
        <div id="newModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="newModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="newModalLabel"><i class="icon-new"></i> Nuevo monitor</h3>
            </div>
            <div class="modal-body">
                <div class="control-group">
                    <label for="fName" class="control-label">Nombre</label>
                    <div class="controls">
                        <input type="text" id="fName" name="fName">
                    </div>
                </div>
                <div class="control-group">
                    <label for="lName" class="control-label">Email</label>
                    <div class="controls">
                        <input type="text" id="lName" name="lName">
                    </div>
                </div>
                <div class="control-group">
                    <label for="uName" class="control-label">Usuario</label>
                    <div class="controls">
                        <input type="text" id="uName" name="uName">
                    </div>
                </div>
                <div class="form-actions">
                    <button id="sbmtBtn" type="submit" class="btn btn-primary" data-dismiss="modal" >Crear</button>
                </div>
            </div>
            <div class="modal-footer">

                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
        <!-- /#newModal -->

        <!-- #editModal -->
        <div id="editModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="editModalLabel"><i class="icon-edit"></i> Edit Table</h3>
            </div>
            <div class="modal-body">
                <div class="control-group">
                    <label for="fName" class="control-label">First Name</label>
                    <div class="controls">
                        <input type="text" id="fName" name="fName">
                    </div>
                </div>
                <div class="control-group">
                    <label for="lName" class="control-label">Last Name</label>
                    <div class="controls">
                        <input type="text" id="lName" name="lName">
                    </div>
                </div>
                <div class="control-group">
                    <label for="uName" class="control-label">Username</label>
                    <div class="controls">
                        <input type="text" id="uName" name="uName">
                    </div>
                </div>
                <div class="form-actions">
                    <button id="sbmtBtn" type="submit" class="btn btn-primary" data-dismiss="modal" >Submit</button>
                </div>
            </div>
            <div class="modal-footer">

                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
        <!-- /#editModal -->

        <!-- #helpModal -->
        <div id="helpModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="helpModalLabel"><i class="icon-external-link"></i> Help</h3>
            </div>
            <div class="modal-body">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                    ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                    nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.
                </p>
            </div>
            <div class="modal-footer">

                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
        <!-- /#helpModal -->



        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-1.10.1.min.js"><\/script>')</script>

        <!--
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>window.jQuery.ui || document.write('<script src="assets/js/vendor/jquery-ui-1.10.0.custom.min.js"><\/script>')</script>
        -->

        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script type="text/javascript" src="assets/js/lib/jquery.tablesorter.min.js"></script>
        <script type="text/javascript" src="assets/js/lib/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="assets/js/lib/DT_bootstrap.js"></script>
        <script src="assets/js/lib/responsive-tables.js"></script>
        <script type="text/javascript">
            $(function() {
                metisTable();
            });
        </script>
        <script type="text/javascript" src="assets/js/main.js"></script>
        
        
       
    </body>
</html>