<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!doctype html>
<html class="no-js">
  <head>
    <meta charset="UTF-8">
    <title>Panel administración</title>

    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/font-awesome.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/main.min.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style-switcher.css">
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/admin/less/theme.less">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath}/resources/admin/js/html5shiv/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/resources/admin/js/respond.js"></script>
      <![endif]-->

    <!--For Development Only. Not required -->
    <script>
      less = {
        env: "development",
        relativeUrls: false,
        rootpath: "../assets/"
      };
    </script>

    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/admin/less/theme.less">
    <script src="${pageContext.request.contextPath}/resources/admin/js/less.min.js"></script>

    <!--Modernizr-->
    <script src="${pageContext.request.contextPath}/resources/admin/js/modernizr.min.js"></script>
  </head>
  <body class="  ">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <%@ include file="components/menuAdmin.jsp" %>

		<div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp; Inicio</h3>
          </div><!-- /.main-bar -->
        </header><!-- /.head -->
      </div><!-- /#top -->
      
      <div id="content">
        <div class="outer">
          <div class="inner bg-light lter">
            
            
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <h5>Reservas</h5>
                  </header>
                  <div class="body" id="trigo" style="height: 250px;"></div>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="box">
                  <div class="body">
                  <div class="table-responsive">
                  <table class="table table-condensed table-hovered sortableTable"><!-- table-bordered table-condensed table-hover table-striped -->
                    <thead>
                        <tr>
                            <th>Nombre Cliente<i class="fa fa-caret-down"></i></th>
                            <th>Estado</th>
                            <th>Precio reserva<i class="fa fa-caret-down"></i></th>
                            <th>Fecha de actividad<i class="fa fa-caret-down"></i></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<c:forEach items="${reservas}" var="reservaTest">
                          <tr>
                              <td>${reservaTest.name}</td>
                              <td><span class="label label-info">${reservaTest.id}</span></td>
                              <td>${reservaTest.name}</td>
                              <td>${reservaTest.id}</td>
                              <td>
                                <a href="#" class="btn btn-info" ><i class="fa fa-pencil-square-o"></i>&nbsp;Editar</a>
                              <a href="#" class="btn btn-danger" ><i class="fa fa-trash-o"></i>&nbsp;Eliminar</a>
                              </td>
                          </tr>
                        </c:forEach>
                        <tr>
                            <td>Pepe perez</td>
                            <td><span class="label label-info">Pendiente</span></td>
                            <td>214€</td>
                            <td>12/05/2015</td>
                            <td>
                              <a href="#" class="btn btn-info" ><i class="fa fa-pencil-square-o"></i>&nbsp;Editar</a>
                              <a href="#" class="btn btn-danger" ><i class="fa fa-trash-o"></i>&nbsp;Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Miru Garcia</td>
                            <td><span class="label label-info">Pendiente</span></td>
                            <td>435€</td>
                            <td>22/05/2015</td>
                            <td>
                              <a href="#" class="btn btn-info" ><i class="fa fa-pencil-square-o"></i>&nbsp;Editar</a>
                              <a href="#" class="btn btn-danger" ><i class="fa fa-trash-o"></i>&nbsp;Eliminar</a>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <hr>
            
          </div><!-- /.inner -->
        </div><!-- /.outer -->
      </div><!-- /#content -->

      <!-- Menu lateral derecho (descomentar boton en el menu)
      <div id="right" class="bg-light lter">
        <div class="alert alert-danger">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Warning!</strong>  Best check yo self, you're not looking too good.
        </div>
      </div> /#right -->

    </div><!-- /#wrap -->
    <footer class="Footer bg-dark dker">
      <p>2015 &copy; Project GAGA team</p>
    </footer><!-- /#footer -->

    <!-- #helpModal -->
    <div id="helpModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Modal title</h4>
          </div>
          <div class="modal-body">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
              in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#helpModal -->

    <!--jQuery -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.tablesorter.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.selection.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.resize.min.js"></script>

    <!--Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

    <!-- MetisMenu -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/metisMenu.min.js"></script>

    <!-- Screenfull -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/screenfull.min.js"></script>

    <!-- Metis core scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core.min.js"></script>

    <!-- Metis demo scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/app.js"></script>
    <script>

      (function($) {
        $(document).ready(function(){

          Metis.dashboard();
          //Metis.MetisChart();
          
          [ 
            { label: "Bar", data: [ [11, 13], [19, 11], [30, -7] ] }
          ]
          console.log("arrancado");
        });
      })(jQuery);
    </script>

  </body>