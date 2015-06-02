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
              <i class="fa fa-dashboard"></i>&nbsp; Actualizar actividad</h3>
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
                  
                  
                    <form:form modelAttribute="actividad" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin1234/editaActividad.html">


						<div class="form-group">
	                        <label class="control-label col-lg-3 col-lg-offset-0 col-sm-2"><p class="text-right">Tipo de actividad</p></label>
	                        <div class="col-lg-4 col-sm-2">
	                      
	                        <form:select path="tipo" tabindex="1" data-placeholder="Tipo de actividad" class="form-control chzn-select">
							    <form:options items="${listaTipoActividad}" itemLabel="tipo" itemValue="tipo" />
							</form:select> 
							
							
	                        </div>
	                        <div class="col-lg-2 col-lg-offset-1 col-sm-2 col-sm-offset-5">
	                        	<a class="btn btn-success" href="tiposActividades.html">Nuevo tipo de actividad</a>
	                        </div>
                        
                      	</div>              

                      
	                    <div class="form-group">
	                    <form:input path="idActividad"/>
	                        <form:label for="nombre" class="control-label col-lg-3" path="nombre">Nombre de la actividad</form:label>
	                        <div class="col-lg-7">
		                        <form:input tabindex="2" type="text" id="nombre" placeholder="Nombre" class="form-control" path="nombre"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                    	<form:label path="duracionHoras" for="horas" class="control-label col-lg-3">Duración en horas</form:label>
		                    <div class="col-lg-7">
		                    	<form:input path="duracionHoras" tabindex="3" type="number" id="horas" placeholder="Duración en horas" class="form-control"/>
		                    </div>
	                    </div><!-- /.form-group -->
	                    <div class="form-group">
	                    	<form:label path="localizacion" for="localizacion" class="control-label col-lg-3">Link al sitio G.Maps</form:label>
		                    <div class="col-lg-7">
		                    <div class="input-group">
		                        <div class="input-group-addon"><a href="http://maps.google.es/" target="_blanck"><li class="glyphicon glyphicon-map-marker"></li></a></div>
		                        <form:input path="localizacion" tabindex="4" type="text" id="localizacion" placeholder="Link de Google maps" class="form-control"/>
		                    	</div>
		                    </div>
	                    </div><!-- /.form-group -->

						<div class="form-group">
								
							
								
								<%-- 
								
								<form:checkbox modelAttribute="objhorasinicio"  path="horasinicio.horaInicio" value="MANYANA"/>Mañana 
 								
 							<c:forEach items="${horasinicio}" var="horasinicio">
 									
 									<form:checkbox path="horasinicio.horaInicio" value="MANYANA"/>Mañana 
 								
 								</c:forEach> --%>
							  
							    
						</div>

	                    <div class="form-group">
		                    <label for="franjahoraria" class="control-label col-lg-3">Franjas horarias</label>
		                    <div class="col-lg-9">
		                    	<div class="checkbox">
		                    		
	                            	<label>
	                              		<label>
	                              			<input name="manyana" tabindex="5" class="uniform" type="checkbox" value="MANYANA"> Mañana
	                            		</label>
	                            	</label>
	                          	</div>
	                          	<div class="checkbox">
	                            	<label>
	                              		<input name="tarde" tabindex="6" class="uniform" type="checkbox" value="TARDE"> Tarde
	                            	</label>
	                          	</div>
	                          	<div class="checkbox">
	                            	<label>
	                              		<input name="noche" tabindex="7" class="uniform" type="checkbox" value="NOCHE"> Noche
	                            	</label>
	                          	</div>	
		                    </div>
	                    </div><!-- /.form-group -->

					  <div class="form-group">
		                  <label for="descripcion" class="control-label col-lg-3">Descripción</label>
		                  <div id="descripcion" class="col-lg-7">
		                  		
		                	  <form:textarea path="descripcion" tabindex="8" id="wysihtml5" class="form-control" rows="5"/>
		                      
		                      
		                    
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
					
					
					<input type="number" value="0" style="display:none;" id="precio1" name="precio1" class="form-control">
		            <input type="number" value="0" style="display:none;" id="precio2" name="precio2" class="form-control">
		            <input type="number" value="0" style="display:none;" id="precio3" name="precio3" class="form-control">
				  	</div>

				</div>


					  <div class="form-group">

							<form:label path="minParticipantes" for="minParticipantes" class="control-label col-lg-3 col-sm-3">nº mínimo de participantes</form:label>
						  	
	                        <div class="col-lg-1 col-sm-2">
	                        	<form:input path="minParticipantes" tabindex="12" type="number" id="minParticipantes" placeholder="4..." class="form-control"/>
	                        </div>
	
							<form:label path="maxParticipantes" for="maxParticipantes" class="control-label col-lg-4 col-lg-offset-1 col-sm-4">nº máximo de participantes</form:label>
		                     
		                    <div class="col-lg-1 col-sm-2">
		                    	<form:input path="maxParticipantes" tabindex="13" type="number" id="maxParticipantes" placeholder="20..." class="form-control"/>
		                     
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
                    	<input type="checkbox" tabindex="14" class="uniform" name="nuevo" value="1"> Nuevo
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                    	<input type="checkbox" name="oferta" tabindex="15" class="uniform" value="1"/> Rebajado
                    </label>
                  </div>
						      </div>
						</div>
						<div class="col-lg-5"></div>
						</div>
                      </div>

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
	        		$('#'+nivelElegido).html("--- <li class='glyphicon glyphicon-euro'></li>");
	        	}else{
	        		$("#"+nivelElegido).html(valor + " <li class='glyphicon glyphicon-euro'></li>");
	        		if(nivelElegido == "mostrarPrecio1"){
	        			$("#precio1").val(valor);
	        		}
					if(nivelElegido == "mostrarPrecio2"){
						$("#precio2").val(valor); 			
					}
					if(nivelElegido == "mostrarPrecio3"){
						$("#precio3").val(valor);
					}
	        		console.log("#"+nivelElegido+nivelElegido);
	        	}
			    //console.log($( "#valorPrecio" ).val());
	    	}


	        Metis.formWysiwyg();
        	console.log("arrancado");
        });

    </script>

  </body>