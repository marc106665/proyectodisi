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

	<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="${pageContext.request.contextPath}/index.html">NaturAdventure</a></div>
								<div class="site-slogan">Disfruta la <a>naturaleza</a>. Vive la <a>aventura</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Navegación</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="${pageContext.request.contextPath}/index.html#inicio">Inicio</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#aventuras">Aventuras</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#quienes_somos">Quiénes somos</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#contacta">Contacta</a></li>
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->


		<!--<div class="section">
			<div class="container">
				<div class="separator"></div>
			</div>
		</div>-->

		<br><br><br><br>

		<!-- section start -->
		<!-- ================ -->
		<div class="section clearfix object-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="title text-center"><span>${tipoactividad.tipo} </span></h1>
						<div class="space"></div>
						<div class="row">
							<div class="col-md-6" id="links">
							<a href="${pageContext.request.contextPath}/resources/images/${tipoactividad.foto}" title="${tipoactividad.tipo}" data-gallery>
						        <img src="${pageContext.request.contextPath}/resources/images/${tipoactividad.foto}" alt="${tipoactividad.tipo}">
						    
							    <c:if test="${not empty mapaListaActividadesPorNiveles}">
							    	
							    	<c:forEach var="map" items="${mapaListaActividadesPorNiveles}">
							    	<c:set var="listaActividades" value="${mapaListaActividadesPorNiveles[map.key]}" />
									<c:forEach var="actividad" items="${listaActividades}">
										<c:if test="${id != actividad.idActividad}">
											<c:if test="${not empty actividad.foto}">		 	
							    				<a href="${pageContext.request.contextPath}/resources/images/${actividad.foto}" title="${actividad.nombre}" data-gallery></a>
							    			</c:if>
							    		<c:set var="id" value="${actividad.idActividad}" />
							    		</c:if>
							    	</c:forEach>
							    	</c:forEach>
							    </c:if>
						    
						    </a>
								<div class="space"></div>
							</div>
							<div class="col-md-6">
								<p>${tipoactividad.descripcion}</p>
						
								<h5>Requistos:</h5>
								<ul class="list-unstyled">
								<c:choose>
								    <c:when test="${not empty tipoactividad.requisitos}">
								        	<li><i class="fa fa-caret-right pr-10 text-colored"></i> ${tipoactividad.requisitos}</li>
								    </c:when>
								    <c:otherwise>
								        	<li><i class="fa fa-caret-right pr-10 text-colored"></i> Sin requisitos previos</li>
								    </c:otherwise>
								</c:choose>
								
								</ul>
							</div>
						</div>
		<c:if test="${not empty mapaListaActividadesPorNiveles}">	
						<div class="row">
							<div class="col-md-12">
								<h2><i class="fa fa-info-circle"></i> Niveles por actividades</h2>
								
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<c:set var="sum" value="0" />
								<c:forEach var="map" items="${mapaListaActividadesPorNiveles}">
								
									<c:choose>
    									<c:when test="${sum == 0}">
    									
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="heading${map.key}">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapse${map.key}" aria-expanded="true" aria-controls="collapse${map.key}">
												NIVEL ${map.key} 
												</a>
											</h4>
										</div>
										<div id="collapse${map.key}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${map.key}">
											<div class="panel-body">
												<ul class="list-unstyled">
												<c:set var="listaActividades" value="${mapaListaActividadesPorNiveles[map.key]}" />
												
												<c:forEach var="actividad" items="${listaActividades}">
												
													<li><i class="fa fa-caret-right pr-10 text-colored"></i> ${actividad.nombre} 
														<ul class="list-unstyled">
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> ${actividad.descripcion} - Duración de ${actividad.duracionHoras} horas <a href="">¿Donde está?</a></li>
														</ul>
													</li>
												</c:forEach>	
												
												</ul>
											</div>
										</div>
									</div> 
										</c:when>
    									<c:otherwise>
    									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="heading${map.key}">
											<h4 class="panel-title">
												<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${map.key}" aria-expanded="false" aria-controls="collapse${map.key}">
													NIVEL ${map.key} 
												</a>
											</h4>
										</div>
										<div id="collapse${map.key}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${map.key}">
											<div class="panel-body">
												<ul class="list-unstyled">
												<c:set var="listaActividades" value="${mapaListaActividadesPorNiveles[map.key]}" />
												
												<c:forEach var="actividad" items="${listaActividades}">

													<li><i class="fa fa-caret-right pr-10 text-colored"></i>  ${actividad.nombre} 
														<ul class="list-unstyled">
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i>  ${actividad.descripcion} - Duración de ${actividad.duracionHoras} horas <a href="">¿Donde está?</a></li>
														</ul>
													</li>
													</c:forEach>
							
												</ul>
											</div>
										</div>
									</div>		
										</c:otherwise>
										</c:choose>										
												
													
											
   								
								<c:set var="sum" value="${sum + 1}" />
								</c:forEach>
														
								</div>

							</div>
						</div>
					</c:if>	
						<div class="space"></div>
						<div class="row">
							<c:if test="${not empty mapaListaActividadesPorNiveles}">		
							<div class="col-md-12">
							<h2><i class="fa fa-info-circle"></i> Tabla de precios</h2>
								<div class="table-responsive">
							      <table class="table">
							        <thead>
							          <tr>
							            <th>Actividad</th>
							            <th>Precio por persona</th>
							            <th></th>
							          </tr>
							        </thead>
							        <c:forEach var="map" items="${mapaListaActividadesPorNiveles}">
							        <tbody>
							        	<thead>
								        	<th class="info">&nbsp;&nbsp;&nbsp;&nbsp;NIVEL ${map.key}</th>
								        	<th class="info"></th>
								        	<th class="info"></th>
							        	</thead>
							        		<c:set var="listaActividades" value="${mapaListaActividadesPorNiveles[map.key]}" />
											<c:forEach var="actividad" items="${listaActividades}">
										<tbody>
							 				<tr>
									          	<td>${actividad.nombre}</td>
									          	<c:set var="precio" value="${precioPoridActividad[map.key][actividad.idActividad]}" /> 
									            <td>${precio} &euro;</td>
									            <td><a class="btn btn-sm btn-success" href="reserva/${actividad.idActividad}/${map.key}.html">¡Reservalo ya!</a></td>
								          	</tr>
								          	</c:forEach>										
								        </tbody>
								    </c:forEach>    
							          	
							        </tbody>
							      </table>
							    </div>
							</div>
							</c:if>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

			<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- section start -->
			<!-- ================ -->
			<div class="default-bg space">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<p class="text-center">Copyright © 2015 by AGG - Team.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->

		</footer>

		<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">&laquo</a>
    <a class="next">&raquo;</a>
    <a class="close">Cerrar</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
		<!-- footer end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript">
		
			var contexto = "${pageContext.request.contextPath}";
		
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/customPago.js"></script>
<!--<script src="${pageContext.request.contextPath}/resources/js/bootstrap-image-gallery.js"></script>-->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.blueimp-gallery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	</body>
</html>
