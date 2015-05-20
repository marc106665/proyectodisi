<!DOCTYPE html>
<!--[if IE 9]> <html lang="es" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="es">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>Título</title>
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
												<li class="active"><a href="index.html">Inicio</a></li>
												<li><a href="#portfolio">Aventuras</a></li>
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


		<!--<div class="section">
			<div class="container">
				<div class="separator"></div>
			</div>
		</div>-->


		<!-- section start -->
		<!-- ================ -->
		<br><br><br><br>

		<div class="footer section">
				<div class="container">
				<div class="col-xs-12">
					<h1 class="title text-center" id="contact">¡Ya casi lo tienes!</h1>
					
					
						<div class="stepwizard">
						    <div class="stepwizard-row setup-panel">
						        <div class="stepwizard-step">
						            <a href="#step-1" type="button" class="btn btn-primary btn-circle" style="min-width: 30px;">1</a>
						            <p>Configurar aventura</p>
						        </div>
						        <div class="stepwizard-step">
						            <a href="#step-2" type="button" class="btn btn-default btn-circle" style="min-width: 30px;" disabled="disabled">2</a>
						            <p>Información de contacto</p>
						        </div>
						        <div class="stepwizard-step">
						            <a href="#step-3" type="button" class="btn btn-default btn-circle" style="min-width: 30px;" disabled="disabled">3</a>
						            <p>Información de pago</p>
						        </div>
						    </div>
						</div>
					
					<form role="form">
					    <div class="row setup-content" id="step-1">
					        <div class="col-xs-12">
					            <div class="col-md-12">
					                <h3>Descenso Gorgas negras - Nivel 1 - <span id="precio">10</span> €</h3>

					                <div class="form-group">
								        <label for="date-picker" class="control-label">¿Qué fecha? <span class="glyphicon glyphicon-calendar"> </span>

								        </label>
								        <div class="controls">
								            <input  required="required" type="date" class="date-picker form-control" />
								        </div>
								    </div>

					                <div class="form-group">
					                	<label class="control-label">¿Cuando?</label>
					                	<select class="form-control">
										  <option>Mañana</option>
										  <option>Medio día</option>
										  <option>Tarde</option>
										</select>
					                </div>

									<div class="form-group">
					                	<label class="control-label">¿Cuantos soys?</label>
					                	<select id="participantes" class="form-control">
										  <option>2</option>
										  <option>3</option>
										  <option>4</option>
										  <option>5</option>
										  <option>6</option>
										  <option>7</option>
										  <option>8</option>
										  <option>9</option>
										</select>
					                </div>

					                
									<div class="table-responsive">
										<table class="table">
									  		<thead>
									    	    <tr>
										          	<th>Precio</th>
										            <th>Total</th>
									            </tr>
									        </thead>
									        	<tbody>
									        		<tr>
											          	<td id="calculo">----</td>
											            <td id="total">--</td>
											        </tr>
										        </tbody>
									      </table>
									</div>

					                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
					            </div>
					        </div>
					    </div>
					    <div class="row setup-content" id="step-2">
					        <div class="col-xs-12">
					            <div class="col-md-12">
					                <h3> Información de contacto </h3>
					                <div class="form-group">
					                    <label class="control-label">Nombre</label>
					                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Nombre" />
					                </div>
					                <div class="form-group">
					                    <label class="control-label">Teléfono</label>
					                    <input maxlength="15" type="tel" required="required" class="form-control" placeholder="Teléfono de contacto"  />
					                </div>
					                <div class="form-group">
					                    <label class="control-label">Email</label>
					                    <input maxlength="200" type="email" required="required" class="form-control" placeholder="Email de contacto"  />
					                </div>
					                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
					            </div>
					        </div>
					    </div>
					    <div class="row setup-content" id="step-3">
					        <div class="col-xs-12">
					            <div class="col-md-12">
					                <h3> Información de pago</h3>


								        <div class="col-xs-12 col-md-6 col-md-offset-3">
								            <div class="panel panel-default">
								                <div class="panel-heading">
								                    <h2 class="panel-title"><img class="pull-right" src="${pageContext.request.contextPath}/resources/images/targetas.png">Detalles de pago</h2>
								                </div>
								                <div class="panel-body">
								                    <form role="form" id="payment-form">
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <div class="form-group">
								                                    <label for="cardNumber">NÚMERO TARJETA</label>
								                                    <div class="input-group">
								                                        <input type="text" class="form-control" name="cardNumber" placeholder="Número targeta valido" required autofocus data-stripe="number" />
								                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
								                                    </div>
								                                </div>                            
								                            </div>
								                        </div>
								                        <div class="row">
								                            <div class="col-xs-7 col-md-7">
								                                <div class="form-group">
								                                    <label for="expMonth">FECHA EXPIRACIÓN</label>
								                                    <div class="col-xs-6 col-lg-6 pl-ziro">
								                                        <input type="text" class="form-control" name="expMonth" placeholder="MM" required data-stripe="exp_month" />
								                                    </div>
								                                    <div class="col-xs-6 col-lg-6 pl-ziro">
								                                        <input type="text" class="form-control" name="expYear" placeholder="YY" required data-stripe="exp_year" />
								                                    </div>
								                                </div>
								                            </div>
								                            <div class="col-xs-5 col-md-5 pull-right">
								                                <div class="form-group">
								                                    <label for="cvCode">CÓDIGO CV</label>
								                                    <input type="password" class="form-control" name="cvCode" placeholder="CV" required data-stripe="cvc" />
								                                </div>
								                            </div>
								                        </div>
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <a href="pedido.html" class="btn btn-success btn-lg btn-block" type="submit">Pagar y confirmar reserva</a>
								                            </div>
								                        </div>
								                        <div class="row" style="display:none;">
								                            <div class="col-xs-12">
								                                <p class="payment-errors"></p>
								                            </div>
								                        </div>
								                    </form>
								                </div>
								            </div>
								        </div>



					                <!--<button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>-->
					            </div>
					        </div>
					    </div>
					</form>

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
							<p class="text-center">Copyright © 2015 by AGG - Team.</p>
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

		<script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>
		

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/customPago.js"></script>

	</body>
</html>

