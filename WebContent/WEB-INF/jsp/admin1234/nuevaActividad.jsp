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
              <i class="fa fa-dashboard"></i>&nbsp; Nueva actividad</h3>
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
                    <h5></h5>

                    <!-- .toolbar -->
                    <div class="toolbar">
                      
                    </div><!-- /.toolbar -->
                  </header>
                  <div id="div-1" class="body">
                    <form class="form-horizontal" method="POST" action="#">


						<div class="form-group">
	                        <label class="control-label col-lg-3 col-lg-offset-0 col-sm-2"><p class="text-right">Tipo de actividad</p></label>
	                        <div class="col-lg-4 col-sm-2">
	                          <select tabindex="1" data-placeholder="Tipo de actividad" class="form-control chzn-select">
	                            <option value="Rafting">Rafting</option>
	                            <option value="Puenting">Puenting</option>
	                            <option value="Escalada">Escalada</option>
	                          </select>
	                        </div>
	                        <div class="col-lg-2 col-lg-offset-1 col-sm-2 col-sm-offset-5">
	                        	<a class="btn btn-success" href="#">Nuevo tipo de actividad</a>
	                        </div>
                        
                      	</div>              

                      
	                    <div class="form-group">
	                        <label for="nombre" class="control-label col-lg-3">Nombre</label>
	                        <div class="col-lg-7">
	                          <input tabindex="2" type="text" id="nombre" placeholder="Nombre" class="form-control">
	                        </div>
	                    </div>
	                    <div class="form-group">
		                    <label for="horas" class="control-label col-lg-3">Duración en horas</label>
		                    <div class="col-lg-7">
		                    <input tabindex="3" type="number" id="horas" placeholder="Duración en horas" class="form-control">
		                    </div>
	                    </div><!-- /.form-group -->
	                    <div class="form-group">
		                    <label for="lugar" class="control-label col-lg-3">Link al sitio G.Maps</label>
		                    <div class="col-lg-7">
		                    <div class="input-group">
		                        <div class="input-group-addon"><a href="http://maps.google.es/" target="_blanck"><li class="glyphicon glyphicon-map-marker"></li></a></div>
		                    	<input tabindex="4" type="text" id="lugar" placeholder="Link de Google maps" class="form-control">
		                    	</div>
		                    </div>
	                    </div><!-- /.form-group -->

	                    <div class="form-group">
		                    <label for="franjahoraria" class="control-label col-lg-3">Franjas horarias</label>
		                    <div class="col-lg-9">
		                    	<div class="checkbox">
	                            	<label>
	                              		<input tabindex="5" class="uniform" type="checkbox" value="manyana"> Mañana
	                            	</label>
	                          	</div>
	                          	<div class="checkbox">
	                            	<label>
	                              		<input tabindex="6" class="uniform" type="checkbox" value="tarde"> Tarde
	                            	</label>
	                          	</div>
	                          	<div class="checkbox">
	                            	<label>
	                              		<input tabindex="7" class="uniform" type="checkbox" value="noche"> Noche
	                            	</label>
	                          	</div>	
		                    </div>
	                    </div><!-- /.form-group -->

					  <div class="form-group">
		                  <label for="descripcion" class="control-label col-lg-3">Descripción</label>
		                  <div id="descripcion" class="col-lg-7">
		                    
		                      <textarea tabindex="8" id="wysihtml5" class="form-control" rows="5"></textarea>
		                      
		                    
		                  </div>
		                  <div class="col-lg-2"></div>
		              </div>

					<div class="form-group">
                        <label class="control-label col-lg-3 col-sm-3">Precio por persona y nivel</label>
                        <div class="col-lg-2 col-sm-2">
                          <select tabindex="9" data-placeholder="Nivel" id="nivel" class="form-control chzn-select">
                            <option value="mostrarPrecio1">Nivel 1</option>
                            <option value="mostrarPrecio2">Nivel 2</option>
                            <option value="mostrarPrecio3">Nivel 3</option>
                          </select>
                        </div>
                        <div class="col-lg-2 col-sm-2">
                        	<div class="input-group">
		                    	<div class="input-group-addon"><li class="glyphicon glyphicon-euro"></li></div>
	                          	<input tabindex="10" type="number" id="valorPrecio" placeholder="Precio..." class="form-control">
	                    	</div>
	                    </div>
                        <div class="col-lg-2 col-sm-2">
                        	<a tabindex="11" class="btn btn-success" id="confirmarPrecio">Añadir precio a nivel</a>
                        </div>
                        
                      </div>

                <div class="form-group">		
                    <div class="col-lg-2 col-lg-offset-3 col-sm-2 col-sm-offset-3">
                        <div class="panel panel-success" id="mostrarPrecio1mostrarPrecio1">
						  <div class="panel-heading">
						    Nivel 1
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="mostrarPrecio1">--- &nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>

                    <div class="col-lg-2 col-sm-2" >
                        <div class="panel panel-warning" id="mostrarPrecio2mostrarPrecio2">
						  <div class="panel-heading">
						    Nivel 2
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="mostrarPrecio2">--- &nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>

					<div class="col-lg-2 col-sm-2">
                        <div class="panel panel-info" id="mostrarPrecio3mostrarPrecio3">
						  <div class="panel-heading">
						    Nivel 3
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="mostrarPrecio3">--- &nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>
						
					<div class="col-lg-3"></div>
					<div class="form-group">
					      <input type="number" style="display:none;" id="precio1" class="form-control">
		            <input type="number" style="display:none;" id="precio2" class="form-control">
		            <input type="number" style="display:none;" id="precio3" class="form-control">
				  	</div>

				</div>


					  <div class="form-group">

					  	<label for="nombre" class="control-label col-lg-3 col-sm-3">nº mínimo de participantes</label>
                        <div class="col-lg-1 col-sm-2">
                          <input tabindex="12" type="number" id="minpar" placeholder="4..." class="form-control">
                        </div>

	                     <label for="nombre" class="control-label col-lg-4 col-lg-offset-1 col-sm-4">nº máximo de participantes</label>
	                    <div class="col-lg-1 col-sm-2">
	                      <input tabindex="13" type="number" id="maxpar" placeholder="20..." class="form-control">
	                    </div>
	                    <div class="col-lg-5"></div>
					  </div>

					  
					  <div class="form-group">
                        <label class="control-label col-lg-3 col-sm-3">Imagen de la actividad</label>
                        <div class="col-lg-2 col-sm-2">
                          <input type="file">
                        </div>

                        <div class="col-lg-3 col-lg-offset-2 col-sm-3 col-sm-offset-4">
                        <div class="panel panel-primary">
						  <div class="panel-heading">
						    Opciones de promoción
						  </div>
						  <div class="panel-body">

							  	<div class="checkbox">
                    <label>
                      <input tabindex="14" class="uniform" type="checkbox" value="nuevo"> Nuevo
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input tabindex="15" class="uniform" type="checkbox" value="rebajado"> Rebajado
                    </label>
                  </div>
						      </div>
						</div>
						<div class="col-lg-5"></div>
						</div>
                      </div>

                      <div class="col-lg-3 col-lg-offset-9 col-sm-2 col-sm-offset-10">
                      	<a href="#" type="submit" class="btn btn-success" ><i class="fa fa-pencil-square-o"></i>&nbsp;Guardar</a>
                      </div>-->
                      <hr>
                      <div class="form-actions no-margin-bottom">
                        <input type="submit" value="Guardar" class="btn btn-primary">
                      </div>
                    </form>
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

    <script>



        $(document).ready(function(){

        	var nivelElegido = "mostrarPrecio1";
        	var precio = 0;
        	$("#mostrarPrecio1mostrarPrecio1").css("box-shadow","0 0 5px rgb(55, 50, 50)");

	        $('#nivel').on('change', function() {
		    	nivelElegido = $(this).val();

		    	if (nivelElegido+nivelElegido == "mostrarPrecio1mostrarPrecio1") {
		    		$("#mostrarPrecio1mostrarPrecio1").css("box-shadow","0 0 5px rgb(55, 50, 50)");
		    		$("#mostrarPrecio2mostrarPrecio2").css("box-shadow","none");
		    		$("#mostrarPrecio3mostrarPrecio3").css("box-shadow","none");
		    		//$("#confirmarPrecio").css("background-color","#fcf8e3");
		    	}
		    	if (nivelElegido+nivelElegido == "mostrarPrecio2mostrarPrecio2") {
		    		$("#mostrarPrecio1mostrarPrecio1").css("box-shadow","none");
		    		$("#mostrarPrecio2mostrarPrecio2").css("box-shadow","0 0 5px rgb(55, 50, 50)");
		    		$("#mostrarPrecio3mostrarPrecio3").css("box-shadow","none");
		    	}
		    	if (nivelElegido+nivelElegido == "mostrarPrecio3mostrarPrecio3") {
		    		$("#mostrarPrecio1mostrarPrecio1").css("box-shadow","none");
		    		$("#mostrarPrecio2mostrarPrecio2").css("box-shadow","none");
		    		$("#mostrarPrecio3mostrarPrecio3").css("box-shadow","0 0 5px rgb(55, 50, 50)");
		    	}
		    	
		    	//console.log(nivelElegido);
			});

	        $("#confirmarPrecio").click(function(){
	        	confirma();
			});

			$("#confirmarPrecio").keypress(function(e) {
			    if(e.which == 13) {
			        confirma();
			    }
			});

			$("#valorPrecio").keypress(function(e) {
			    if(e.which == 13) {
			        e.preventDefault();
			        confirma();
			    }
			});

			function confirma () {
				var valor = $( "#valorPrecio" ).val();
	        	if(valor == null || valor == "" || valor == undefined){
	        		anyadeValor(null);
	        	}else{
	        		anyadeValor(valor);
	        	}
			}

	        function anyadeValor (valor) {
	        	
	        	if(valor === null){
	        		$('#'+nivelElegido).text('--- &euro;');
	        	}else{
	        		$("#"+nivelElegido).text(valor + " &euro;");
	        		
	        		console.log("#"+nivelElegido+nivelElegido);
	        	}
			    //console.log($( "#valorPrecio" ).val());
	    	}


	        Metis.formWysiwyg();
        	console.log("arrancado");
        });

    </script>

  </body>