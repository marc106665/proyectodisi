<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>

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

		<style type="text/css" media="print">
			@page{
			   margin: 0;
			}
			#titulo{
				display: none;
			}
			#info-contacto{
				display: none;
			}
			#boton-imprimir{
				display: none;
			}
		</style>
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
								<div class="site-name"><a href="#banner">Adventure</a></div>
								<div class="site-slogan">Disfruta y vive la <a>aventura</a></div>
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


		<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="titulo">Reserva realizada con éxito</h1>
					<div class="space"></div>
					<div class="row">
						<div id="info-contacto" class="col-sm-5">
							<p class="large">Nuestros empleados comprobarán tu reserva lo antes posible y le enviaremos un correo con más información.</p>
							<p><i class="fa fa-info-circle"></i>Si tiene alguna duda sobre la reserva, no dude en ponerse en contacto en:</p>
								<ul class="list-icons">
									<li><i class="fa fa-phone pr-10"></i><a href="tel:+34 1234567890">+34 1234567890</a></li>
									<li><i class="fa fa-envelope-o pr-10"></i><a href="mailto:naturadventure@email.com"> naturadventure@email.com</a></li>
								</ul>
						</div>
						<div class="col-sm-7">
							
								
							
					        <div class="well">
					            <div class="row">
					                <div class="col-xs-6 col-sm-6 col-md-6">
					                    <address>
					                        <strong>NaturAdventure S.A</strong>
					                        <br>
					                        C/ falsa 123
					                        <br>
					                        Huesca, Españaa 90026
					                        <br>
					                    </address>
					                </div>
					                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
					                    <p>
					                        <em>Fecha reserva: ${reserva.fechaReserva}</em>
					                    </p>
					                    <p>
					                        <em>Fecha actividad: ${reserva.fechaActividad}</em>
					                    </p>
					                    <p>
					                        <em>Recibo nº #${reserva.idReserva}</em>
					                    </p>
					                </div>
					            </div>
					            <div class="row">
					                <div class="text-center">
					                    <h1>Recibo</h1>
					                </div>
					                
					                <table class="table table-hover">
					                    <thead>
					                        <tr>
					                            <th>Reserva</th>
					                            <th>Aventureros</th>
					                            <th class="text-center">Precio</th>
					                            <th class="text-center">Total</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        <tr>
					                        <c:set var="niveluppercase" value="${reserva.nivel}"/>
											<c:set var="nivellowercase" value="${fn:toLowerCase(niveluppercase)}" />
											<c:set var="horasluppercase" value="${reserva.horaInicio}"/>
											<c:set var="horasllowercase" value="${fn:toLowerCase(horasluppercase)}" />
					                            <td class="col-md-9"><em>${actividad.nombre} de ${horasllowercase} </br> nivel ${nivellowercase}</em></h4></td>
					                            <td class="col-md-1" style="text-align: center"> ${reserva.numParticipantes} </td>
					                            <td class="col-md-1 text-center">${nivel.precioPorPersona} &euro;</td>
					                            <c:set var="precio" value="${reserva.numParticipantes * nivel.precioPorPersona}" />
					                            <td class="col-md-1 text-center">${precio} &euro;</td>
					                        </tr>
					                        <tr>
					                            <td>   </td>
					                            <td>   </td>
					                            <td class="text-right">
					                            <p>
					                                <strong>Subtotal: </strong>
					                            </p>
					                            <p>
					                                <strong>IVA: </strong>
					                            </p></td>
					                            <td class="text-center">
					                            <p>
					                                <strong>${precio} &euro;</strong>
					                            </p>
					                            <p>
					                                <strong>21%</strong>
					                            </p></td>
					                        </tr>
					                        <tr>
					                            <td>   </td>
					                            <td>   </td>
					                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
					                            <td class="text-center text-danger"><h4><strong>${precioiva} &euro;</strong></h4></td>
					                        </tr>
					                    </tbody>
					                </table>

					                <span id="boton-imprimir" onclick="window.print(); return false;" class="label label-default"><a href="">Imprimir</a></span>
					            </div>


							
						</div>
					</div>
				</div>
			</div>
		</div>
			<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- section start -->
			<!-- ================ -->
			<div class="default-bg space">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<p class="text-center">Copyright Â© 2015 by AGG - Team.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->

		</footer>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

	</body>
</html>
