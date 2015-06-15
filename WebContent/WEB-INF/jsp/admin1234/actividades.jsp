<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/dataTables.bootstrap.css">
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
              <i class="fa fa-dashboard"></i>&nbsp; Actividades</h3>
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
                    <h5>Actividades</h5>
                  </header>
                  <div class="body" id="trigo" style="height: 250px;"></div>
                </div>
              </div>
            </div>
            <hr>



            <!--Begin Datatables-->
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <div class="icons">
                      <i class="fa fa-table"></i>
                    </div>
                    <h5>Actividades</h5>
                    <!-- .toolbar -->
                    <div class="toolbar">
                      <nav style="padding: 8px;">
                        <a href="nuevaActividad.html" class="btn btn-success btn-xs">
                          <i class="fa fa-plus"></i>
                        </a> 
                      </nav>
                    </div><!-- /.toolbar -->
                  </header>
                  <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                      <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Min/Max Participantes</th>
                            <th>Oferta</th>
                            <th>Novedad</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${listaActividades}" var="listaActividades">
                        <tr id="${listaActividades.idActividad}">
                            <td>${listaActividades.nombre}</td>
                            <td>${listaActividades.minParticipantes}/${listaActividades.maxParticipantes}</td>
                            
                            <c:if test="${listaActividades.oferta == 'oferta' || listaActividades.oferta == '1'}">
						       <td><li class="fa fa-check"></li></td>
						    </c:if>
						    <c:if test="${empty listaActividades.oferta || listaActividades.oferta == 'nooferta' || listaActividades.oferta == '0'}">
						       <td><li class="fa fa-close"></li></td>
						    </c:if>
						    <c:if test="${listaActividades.nuevo == 0}">
						       <td><li class="fa fa-close"></li></td>
						    </c:if>
						    <c:if test="${listaActividades.nuevo == 1}">
						       <td><li class="fa fa-check"></li></td>
						    </c:if>
                            <td>
                            <a href="editaActividad/${listaActividades.idActividad}.html" class="btn btn-info" ><i class="fa fa-pencil-square-o"></i>&nbsp;Editar</a>
                            <a onclick="confirmarBorrado('borrarActividad/${listaActividades.idActividad}.html', '${listaActividades.idActividad}')" class="btn btn-danger" ><i class="fa fa-trash-o"></i>&nbsp;Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                        
                       </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div><!-- /.row -->
            
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
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">FAQ - Ayuda</h4>
          </div>
          <div class="modal-body">
            
            <%@ include file="components/ayuda.jsp" %>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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

    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.tablesorter.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.ui.touch-punch.min.js"></script>

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



        $(document).ready(function(){

    	  var contexto = "${pageContext.request.contextPath}";
		
		
          Metis.dashboard();
          //Metis.MetisChart();
          Metis.MetisTable();
          Metis.metisSortable();
          
          console.log("arrancado");
        });
		
        function confirmarBorrado(urlBorrado, id) {
            var txt;
            var r = confirm("¿Borrar?");
            if (r == true) {
                //txt = "url:"+urlBorrado+", id:"+id;
                
                	//console.log("ejecutando...");
                    $.ajax({
                    	url: urlBorrado, 
                    	success: function(result){
                      //  	console.log("Borrado con exito");
                        	$("#"+id).hide(500);
                    }});
                
            } else {
            	//ev.p
                //txt = "You pressed Cancel!";
            }
            //console.log(txt);
        }
    </script>
	
  </body>