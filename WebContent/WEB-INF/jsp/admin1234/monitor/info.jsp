<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/bootstrap3-wysihtml5.min.css">

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
    		<style type="text/css" media="print">
			@page{
			   margin: 0;
			}
			
			#titulo{
				display: none;
			}
			
			#localizacion{
				display: none;
			}
			
			#boton-imprimir{
				display: none;
			}
		</style>
  </head>
  <body class="  ">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <%@ include file="../components/menuMonitor.jsp" %>

		<div class="main-bar" id="titulo">
            <h3>
              <i class="fa fa-book"></i> Ver detalles</h3>
          </div><!-- /.main-bar -->
        </header><!-- /.head -->
      </div><!-- /#top -->


      <div id="content">
        

      	<div class="outer">
          <div class="inner bg-light lter">

            <!--BEGIN INPUT TEXT FIELDS-->
            <div class="row">
              <div class="col-lg-12">
                <div class="box dark">
                  <header>
                    <div class="icons">
                      <i class="fa fa-edit"></i>
                    </div>
                    <h5>&nbsp; Ficha actividad nº #${idReserva}</h5>

                    <!-- .toolbar -->
                    <div class="toolbar">
                      
                    </div><!-- /.toolbar -->
                  </header>
                  <div id="div-1" class="body">
                  
                  		<table class="table table-striped table-bordered">
                  			<thead>
                  			<tr>
                  				<i>Datos de la actividad a realizar</i>
                  			</tr>
                  			</thead>
                  			<tr>
                  				<td>Nombre de la actividad</td>
                  				<td>${datos.nombreActividad}</td>
                  			</tr>
                  			<tr>
                  				<td>Tipo de actividad</td>
                  				<td>${datos.tipo}</td>
                  			</tr>
                  			<tr>
                  				<td>Descripcion</td>
                  				<td>${datos.descripcion}</td>
                  			</tr>
                  			<tr>
                  				<td>Duración en horas</td>
                  				<td>${datos.duracionHoras} h</td>
                  			</tr>
                  			<tr>
                  				<td>Fecha a realizar la actividad</td>
                  				<td>${datos.fechaActividad}</td>
                  			</tr>
                  			<tr>
                  				<td>Monitor responsable</td>
                  				<td>${datos.monitor}</td>
                  			</tr>
                  			<tr>
                  				<td>Nivel de la actividad</td>
                  				<td>${datos.nivel}</td>
                  			</tr>
                  			<tr>
                  				<td>Nombre del contacto</td>
                  				<td>${datos.nombreCliente}</td>
                  			</tr>
                  			<tr>
                  				<td>Número de participantes</td>
                  				<td>${datos.numParticipantes}</td>
                  			</tr>
                  			<c:if test="${not empty datos.localizacion}">
	                  			<tr id="localizacion">
	                  				<td>Punto de reunion</td>
	                  				<td><a class="btn" target="_blanck">${datos.localizacion}</a></td>
	                  			</tr>
                  			</c:if>
                  		</table>
						<span id="boton-imprimir" onclick="window.print(); return false;" class="label label-sucsess"><a href="">Imprimir ficha monitor</a></span>
                  </div>
                </div>
              </div>
            </div>
            </div>
            </div>


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


    <!--Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

    <!-- MetisMenu -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/metisMenu.min.js"></script>

    <!-- Screenfull -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/screenfull.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/screenfull.js/2.0.0/screenfull.min.js"></script>


    <!-- Metis core scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Metis demo scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/app.js"></script>

  </body>