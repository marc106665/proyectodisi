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
  </head>
  <body class="  ">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <%@ include file="components/menuAdmin.jsp" %>

		<div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp; Actualizar datos monitor</h3>
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
                    <h5>Campos a editar</h5>

                    <!-- .toolbar -->
                    <div class="toolbar">
                      
                    </div><!-- /.toolbar -->
                  </header>
                  <div id="div-1" class="body">
                  
                  
                    <form:form enctype="multipart/form-data" modelAttribute="monitor" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin1234/editaMonitorSubmit.html">

					  <div class="form-group">
					  <form:input style="display:none" path="usuario"/>
	                        
	                  </div>
		              
					<div class="form-group">
	                    	<form:label path="nombre" for="nombre" class="control-label col-lg-3">Nombre</form:label>
		                    <div class="col-lg-7">
		                    	<form:input path="nombre" tabindex="1" type="text" id="nombre" placeholder="nombre" class="form-control"/>
		                    </div>
	                </div><!-- /.form-group -->
					
					<div class="form-group">
	                    	<form:label path="email" for="email" class="control-label col-lg-3">Email</form:label>
		                    <div class="col-lg-7">
		                    	<form:input path="email" tabindex="2" type="email" id="email" placeholder="email@email..." class="form-control"/>
		                    </div>
	                    </div><!-- /.form-group -->

                      <hr>
                      <div class="form-actions no-margin-bottom">
                          <form:button type="submit" value="Guardar" class="btn btn-primary">Guardar</form:button>
                      </div>
                    </form:form>
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

    <script>
    $(document).ready(function(){
    	
        Metis.formWysiwyg();

    	
    });
    
    </script>

  </body>