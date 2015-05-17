<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="es" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="es">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>NaturAventure</title>
		<meta name="description" content="web GAGA project">
		<meta name="author" content="GAGA team">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">

		<!-- Web Fonts -->
		<link href='${pageContext.request.contextPath}/resources/css/fonts.css' rel='stylesheet' type='text/css'>
		<link href='${pageContext.request.contextPath}/resources/css/fonts2.css' rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href='${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css' rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="${pageContext.request.contextPath}/resources/css/animations.css" rel="stylesheet">

		<!-- Worthy core CSS file -->
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

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
								<a href="index.html"><img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="index.html">NaturAdventure</a></div>
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
												<li class="active"><a href="#inicio">Inicio</a></li>
												<li><a href="#aventuras">Aventuras</a></li>
												<li><a href="#quienes_somos">Quiénes somos</a></li>
												<li><a href="#contacta">Contacta</a></li>
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

		<!-- banner start -->
		<!-- ================ -->
		<div class="banner" id="inicio">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
							<p><h1 class="text-center"><span style="color:rgb(63, 120, 38);">N</span><span style="color: #fff;">atur</span></p><p><span style="color:rgb(125, 179, 56)">A</span><span style="color: #fff;">dventure</span></h1></p>
							<p class="lead text-center">Disfruta la <b><i style="color:rgb(140, 215, 248);">naturaleza</i></b>. Vive la <b><i style="color:rgb(140, 215, 248);">aventura</i></b></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="default-bg space blue">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section">
			<div class="container">
				<h1 class="text-center title" id="aventuras">Aventuras disponibles</h1>	
				<div class="row object-non-visible" data-animation-effect="fadeIn">
					<div class="col-md-12">

						<!-- isotope filters start -->
						<div class="filters text-center">
							<ul class="nav nav-pills">
								<li class="active"><a href="#" data-filter="*">Todas</a></li>
								<li><a href="#" data-filter=".novedades">Novedades</a></li>
								<li><a href="#" data-filter=".ofertas">Ofertas</a></li>
							</ul>
						</div>
						<!-- isotope filters end -->

						<!-- portfolio items start -->
						<div class="isotope-container row grid-space-20">
				
				  <c:forEach items="${tiposdeactividades}" var="tactividad"> 
							<div class="col-sm-6 col-md-3 isotope-item novedades">
								<div class="well well-sm">
									<div class="overlay-container">
										<img src="${pageContext.request.contextPath}${tactividad.foto}" alt="">
										<a class="overlay" data-toggle="modal" data-target="#${tactividad.tipo}">
											<span class="btn btn-info">Más información</span>
										</a>
									</div>
									<div class="overlay-container">
										<h5>${tactividad.tipo} <span class="label label-info pull-right">Nuevo!</span></h5>
										<a class="btn btn-success btn-block" href="actividad/${tactividad.tipo}.html">¡Reservalo ya!</a>
									</div>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="${tactividad.tipo}" tabindex="-1" role="dialog" aria-labelledby="${tactividad.tipo}-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
												<h4 class="modal-title" id="${tactividad.tipo}-label">${tactividad.tipo}</h4>
											</div>
											<div class="modal-body">
												<%-- <h3>${tactividad.tipo}</h3> --%>
												<div class="row">
													<div class="col-md-6">
														<p>${tactividad.descripcion}</p>
														
													</div>
													<div class="col-md-6">
														<img src="${pageContext.request.contextPath}${tactividad.foto}" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<a type="button" class="btn btn-sm btn-success" href="actividad/${tactividad.tipo}.html">Reservar ahora!</a>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
 			</c:forEach>
							
							
														
							
							
							


						</div>
						<!-- portfolio items end -->
					
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-1 blue">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="quienes_somos"  class="text-center title">Quiénes somos</h1>
				<div class="space"></div>
				<div class="row">
					<div class="col-sm-12">
						<div class="media">
							<div class="media-body text-left">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
								consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
								cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
								consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
								cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
								consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
								cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

		<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contacta">Contacto</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">¿Tiene dudas?, ¿preguntas?, no dude en enviarnos un mensaje. ¡Le contestaremos lo antes posible!.</p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i> C/ falsa, 123 Valencia España</li>
									<li><i class="fa fa-phone pr-10"></i> +34 1234567890</li>
									<li><i class="fa fa-fax pr-10"></i> +34 1234567891 </li>
									<li><i class="fa fa-envelope-o pr-10"></i> naturadventure@email.com</li>
								</ul>
								<i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;También puedes ponerte en contacto a través de redes sociales
								<ul class="social-links">
									<li class="facebook"><a target="_blank" href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
									<li class="twitter"><a target="_blank" href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
									<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
									<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
									<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
									<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
									<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
									<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Nombre</label>
										<input type="text" class="form-control" id="name2" placeholder="Nombre" name="nombre" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2">Correo electronico</label>
										<input type="email" class="form-control" id="email2" placeholder="Correo electronico" name="email" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2">Mensaje</label>
										<textarea class="form-control" rows="8" id="message2" placeholder="Mensaje, pregunta..." name="mensaje" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="submit" value="¡Enviar!" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .footer end -->

		<%@ include file="components/pie.jsp" %>

		</footer>
		<!-- footer end -->
			
		<script type="text/javascript">
		
			var contexto = "${pageContext.request.contextPath}";
		
		</script>
		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
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

	</body>
</html>
