<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <%@ include file="../components/menuAdmin.jsp" %>

		<div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp;${accion} Reserva</h3>
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
                  
                  
                    <form:form modelAttribute="reserva"  class="form-horizontal" method="POST" >


					  <input  type="hidden"  name="accion" value="${accion}"/>

                      <div class="form-group">
	                        <form:label for="idReserva" class="control-label col-lg-3" path="idReserva">Código reserva</form:label>  
	                        <div class="col-lg-7">
		                 		<form:input tabindex="1" type="number" id="idReserva" class="form-control" path="idReserva" readonly="true"/> 
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <form:label for="estado" class="control-label col-lg-3" path="estado">Estado de la reserva</form:label>  
	                        <div class="col-lg-7">
		                 		<form:input tabindex="2" type="text" id="estado" class="form-control" path="estado" readonly="true"/> 
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <form:label for="fechaReserva" class="control-label col-lg-3" path="fechaReserva">Fecha de la reserva</form:label>  
	                        <div class="col-lg-7">
	                        	  <c:set var="fReserva" value="${reserva.fechaReserva}" />
	                        	<c:choose>
	                           	<c:when test="${browser == 'Chrome'}"><fmt:formatDate pattern="yyyy-MM-dd" value="${fReserva}" var="fechaPegaReserva"/></c:when>
						  		<c:otherwise><fmt:formatDate pattern="dd/MM/yyyy" value="${fReserva}" var="fechaPegaReserva"/></c:otherwise>
						  		</c:choose>
	                        	  
					             <input tabindex="3" type="date" id="fechaReservaPego" class="form-control" name="fechaReservaPego"  value="${fechaPegaReserva}" readonly/>
		                 		<input name="fechaReserva" type="hidden" id="fechaReserva" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${fReserva}" />"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <form:label for="idActividad" class="control-label col-lg-3" path="idActividad">Actividad</form:label>  
	                        <div class="col-lg-7">
	                        	 
	                        	  <form:input  type="hidden"  class="form-control" path="idActividad" />
					             <input tabindex="4" type="text" id="idActividad"  class="form-control" name="nomnbreActividad"  value="${nombreActividad}" readonly/>
		                 		
	                        </div>
	                    </div>
	                   
	                    <div class="form-group">
	                        <label for="precio" class="control-label col-lg-3" >Precio actividad</label>  
	                        <div class="col-lg-2 col-sm-2 ">
                        <div class="panel panel-success" >
						  <div class="panel-heading">
						    &nbsp;&nbsp;&nbsp;Precio por persona
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="porPersona""><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${precioPersona}" /> &nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>

                    <div class="col-lg-2 col-sm-2" >
                        <div class="panel panel-warning" >
						  <div class="panel-heading">
						    &nbsp;&nbsp;&nbsp;Precio sin iva
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="sinIva"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${precioSinIva}" /> &nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>

					<div class="col-lg-2 col-sm-2">
                        <div class="panel panel-info" >
						  <div class="panel-heading">
						    &nbsp;&nbsp;&nbsp;Precio con iva
						  </div>
						  <div class="panel-body">
							  	<p class="text text-center"><b id="conIva"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${precioIva}" />&nbsp;&euro;</b></p>
						  </div>
						</div>
					</div>
	                    </div>
	                    <div class="form-group">
	                        <form:label for="nombreCliente" class="control-label col-lg-3" path="nombreCliente">Nombre del cliente</form:label>  
	                        <div class="col-lg-7">
	                      <c:choose>
                          <c:when test="${accion == 'ver'}">
                        		<form:input tabindex="2" type="text" id="nombreClient" class="form-control" path="nombreCliente"  readonly="true" />
						  </c:when>
						  <c:otherwise>
						  	<form:input tabindex="5" type="text" id="nombreClient" class="form-control" path="nombreCliente"  />
						  </c:otherwise>
						  </c:choose>
		                 		 
	                        </div>
	                    </div>
	                     <div class="form-group">
	                        <form:label for="telefonoCliente" class="control-label col-lg-3" path="telefonoCliente">Número telefono cliente</form:label>  
	                        <div class="col-lg-7">
	                      <c:choose>
                          <c:when test="${accion == 'ver'}">
                        		<form:input tabindex="6" type="number" id="telefonoCliente" class="form-control" path="telefonoCliente" readonly="true" />
						  </c:when>
						  <c:otherwise>
						  	<form:input tabindex="6" type="number" id="telefonoCliente" class="form-control" path="telefonoCliente" min="100000000" max="999999999"/>
						  </c:otherwise>
						  </c:choose>
		                 		 
	                        </div>
	                    </div>
	                    <div class="form-group">
	                    	<form:label path="emailCliente" for="emailCliente" class="control-label col-lg-3">Email cliente</form:label>
		                    <div class="col-lg-7">
		                          <c:choose>
                          <c:when test="${accion == 'ver'}">
                        		<form:input path="emailCliente" tabindex="7" type="email" id="emailCliente" class="form-control" readonly="true" />
						  </c:when>
						  <c:otherwise>
						  	<form:input path="emailCliente" tabindex="7" type="email" id="emailCliente" class="form-control"/>
						  </c:otherwise>
						  </c:choose>
		                  		 
		                    </div>
	                    </div>
	                     <div class="form-group">
	                        <form:label for="nivel" class="control-label col-lg-3" path="nivel">Nivel actividad</form:label>  
	                        <div class="col-lg-7">
	                              <c:choose>
                          <c:when test="${accion == 'ver'}">
                        		<form:select  tabindex="8" path="nivel" id="nivel" class="form-control chzn-select" readonly="true" >
                        			<form:options items="${listaNiveles}" itemLabel="nivel" itemValue="nivel" />
								</form:select>
						  </c:when>
						  <c:otherwise>
						  		<form:select  tabindex="8" path="nivel" id="nivel" class="form-control chzn-select">
						  			<form:options items="${listaNiveles}" itemLabel="nivel" itemValue="nivel" />
								</form:select>
						  </c:otherwise>
						  </c:choose>
	                        	 
							     
	                        </div>
	                    </div>
	                     <div class="form-group">
	                        <form:label for="numParticipantes" class="control-label col-lg-3" path="numParticipantes">Número de participantes</form:label>  
	                        <div class="col-lg-7">
	                        <c:choose>
	                           <c:when test="${accion == 'ver'}">
                        		<form:select path="numParticipantes" tabindex="9" data-placeholder="Tipo de actividad" name="numParticipantes" id="numParticipantes" class="form-control chzn-select" readonly="true">
							    	<form:options items="${listadoDeParticipantes}"  />
								</form:select>
						  </c:when>
						  <c:otherwise>
						  	<form:select path="numParticipantes" tabindex="9" data-placeholder="Tipo de actividad" name="numParticipantes" id="numParticipantes" class="form-control chzn-select">
							    	<form:options items="${listadoDeParticipantes}"  />
								</form:select>
						  </c:otherwise>
						  </c:choose>
		                 		  
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                   		<form:label path="horaInicio" for="horaInicio" class="control-label col-lg-3">Horario inicio de la actividad</form:label>
		                    <div class="col-lg-7">
		                      <c:choose>
	                           <c:when test="${accion == 'ver'}">
                        			<form:select path="horaInicio" tabindex="10" data-placeholder="Tipo de actividad" id="horaInicio" class="form-control chzn-select" readonly="true">
							    	<form:options items="${listadoDeHoras}" itemLabel="horaInicio" itemValue="horaInicio" />
								</form:select>
						  </c:when>
						  <c:otherwise>
						  		<form:select path="horaInicio" tabindex="10" data-placeholder="Tipo de actividad" id="horaInicio" class="form-control chzn-select">
							    	<form:options items="${listadoDeHoras}" itemLabel="horaInicio" itemValue="horaInicio" />
								</form:select>
						  </c:otherwise>
						  </c:choose>
		                 	
		                 	 
		                    	
		                    </div>
	                    </div>
						<div class="form-group">
	                        <form:label for="fechaActividad" class="control-label col-lg-3" path="fechaActividad">Fecha de la Actividad</form:label>  
	                        <div class="col-lg-7">
	                        	  <c:set var="fActividad" value="${reserva.fechaActividad}" />
	                      <c:choose>
	                      <c:when test="${accion == 'ver'}">
	                      		<c:choose>
	                           	<c:when test="${browser == 'Chrome'}"><fmt:formatDate pattern="yyyy-MM-dd" value="${fActividad}" var="date"/>" /></c:when>
						  		<c:otherwise><fmt:formatDate pattern="dd/MM/yyyy" value="${fActividad}" var="date" /></c:otherwise>
						  		</c:choose>
                        		<input tabindex="11" type="date" id="fechadePega" class="form-control" placeholder="dd/mm/aaaa" name="fechadePega"  value="${date}" readonly/>
						  		  																																 
						  																																																																				
						  
						  </c:when>
						  <c:otherwise>
						  		<c:choose>
	                           	<c:when test="${browser == 'Chrome'}"><fmt:formatDate pattern="yyyy-MM-dd" value="${fActividad}" var="date"/> </c:when>
						  		<c:otherwise><fmt:formatDate pattern="dd/MM/yyyy" value="${fActividad}" var="date" /></c:otherwise>
						  		</c:choose>	
						  		<input tabindex="11" type="date" id="fechadePega" class="form-control" placeholder="dd/mm/aaaa" name="fechadePega"  value="${date}" />
						  </c:otherwise>
						  </c:choose>  
					             
		                 		<input name="fechaActividad" type="hidden" id="fechaActividad" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${fActividad}" />"/>
	                        </div>
	                    </div>
					
					<input type="hidden" id="tipo" name="tipo"  value="${tipoActividad}" />
					<div class="form-group">
                        <label class="control-label col-lg-3 col-sm-3">Monitor</label>
                        <div class="col-lg-5 col-sm-5">
                              	<c:choose>
	                           <c:when test="${accion == 'ver'}">
                        	<select tabindex="12"  id="monitor" class="form-control chzn-select" readonly>
						  </c:when>
						  <c:otherwise>
						  		<select tabindex="12"  id="monitor" class="form-control chzn-select">
						  </c:otherwise>
						  </c:choose>
                          
                          <c:choose>
                          <c:when test="${not empty listaMonitores}">
                          <c:forEach var="monitor" items="${listaMonitores}">
  							
  							<option value="${monitor.usuario}">${monitor.nombre}</option>
    						
  							
						  </c:forEach>
						  </c:when>
						  <c:otherwise>
						  	<option value="null">No hay monitores disponibles</option>
						  </c:otherwise>
						  </c:choose>
                            
                          </select>
                        </div>
                        
                        <div class="col-lg-2 col-sm-2">
                        	<a tabindex="13" class="btn btn-success" id="confirmarMonitor" <c:if test="${ empty listaMonitores || accion == 'ver'}"> disabled</c:if> >Asignar un monitor</a>
                        </div>
                        
                      </div>

							

                <div class="form-group">		
                    <div class="col-lg-7 col-lg-offset-3 col-sm-7 col-sm-offset-3">
                        <div class="panel panel-success" id="panelMonitor">
						  <div class="panel-heading">
						    Monitor responsable de la actividad
						  </div>
						  <div class="panel-body">
						  <c:choose>
                          <c:when test="${not empty reserva.monitor}">
                          
  							
  							<p class="text text-center"><b id="mostrarMonitor">${nombreMonitorAsignado}</b></p>
    						
  							
						  
						  </c:when>
						  <c:otherwise>
						  	<p class="text text-center"><b id="mostrarMonitor">---</b></p>
						  </c:otherwise>
						  </c:choose>
							  	
						  </div>
						</div>
					</div>
					  <c:choose>
                          <c:when test="${not empty reserva.monitor}">
                    <input type="hidden" style="display:none;" id="usuario" name="monitor" value="${reserva.monitor}">	  
						  </c:when>
						  <c:otherwise>
					<input type="hidden" style="display:none;" id="usuario" name="monitor" value="null">
						  </c:otherwise>
						  </c:choose>
		            
				 </div>



					  


                      <hr>
                      <div class="form-actions no-margin-bottom">
                                   	<c:choose>
	                           <c:when test="${accion == 'ver'}">
                        	       <form:button type="submit" value="Aceptar" id="guardar" class="btn btn-primary" >Aceptar</form:button>
						  </c:when>
						  <c:otherwise>
						  		        <form:button type="submit" value="Modificar" class="btn btn-primary">Modificar</form:button>
						  		       <a tabindex="15" class="btn btn-primary" href="${pageContext.request.contextPath}/admin1234/reservas/listadoReservas.html">&nbsp;&nbsp;Volver&nbsp;&nbsp;</a>
						  </c:otherwise>
						  </c:choose>
              
              
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
    <c:set var="i" value="0" />
	var preciopersona = ${precioPersona};
	var iva = ${Iva};
	var nivelPrecio = {<c:forEach var="niveles" items="${listaNiveles}"> <c:if test="${ i != 0 }">,</c:if> ${niveles.nivel}:{precio:${niveles.precioPorPersona}} <c:set var="i" value="${ i+1 }" /></c:forEach>};
        $(document).ready(function(){
        	
        	$(document).ready(function(){
            	$('#fechadePega').change(function(event) {
            		var fechaFormato=$(this).val();
            		var formatoAmericano = fechaFormato.indexOf("-");
            		var formatoEuropeo = fechaFormato.indexOf("/");
            		if(formatoAmericano>formatoEuropeo){
            			var date = fechaFormato.split('-');
            			fechaFormato= date[2]+"/"+date[1]+"/"+date[0];
            		}
    				$('#fechaActividad').val(fechaFormato);	        	
    								        	
            	});
            });
        	
        	var ua = navigator.userAgent.toLowerCase();
        	
			$('#nivel').change(function(event) {
        		calculaprecios();
        	});
        	$('#numParticipantes').change(function(event) {
        		calculaprecios();
        	});
        	
        	function calculaprecios () {
        		var numeroparticipantes=$('#numParticipantes').val();
        		var nivel = $('#nivel').val();
        		preciopersona=nivelPrecio[nivel].precio;
        		var precioSinIva= preciopersona* numeroparticipantes;
        		var precioConIva= precioSinIva +(preciopersona* iva);
        		$('#porPersona').html(preciopersona.toFixed(2) + " &euro;");
        		$('#sinIva').html(precioSinIva.toFixed(2) + " &euro;");
        		$('#conIva').html(precioConIva.toFixed(2) + " &euro;");
        		
        	}
        	
        	$('#fechaActividad').change(function(event) {
        		
        		enviapeticion ();
        		event.preventDefault();
        	});
        	$('#horaInicio').change(function(event) {
        		enviapeticion ();
        		event.preventDefault();
        	});
        	function enviapeticion () {
        		  $('#usuario').val("null");
        		  $('#mostrarMonitor').empty();
        		  $('#mostrarMonitor').text("---");
        		  var b = $("#confirmarMonitor");
        		  var s = $("#monitor");
        		  s.prop('disabled', true);
        		  b.attr('disabled', true);
        	      var horainicio = $('#horaInicio').val();
        	      var fechaactividad = $('#fechaActividad').val();
        	      
        	      var tipo = $('#tipo').val();
        	      var json = { horainicio : horainicio, fechaactividad : fechaactividad, tipo: tipo};
        	      var posting = $.post( "${pageContext.request.contextPath}/admin1234/reservas/ajaxMonitor.html", json);
        	      posting.done(function( data ) {
        	    	  
        	    	  str = jQuery.parseJSON(data);
        	    	  s.empty();
        	    	  var monitores = str.monitores;
        	    	  if (monitores.length > 0) {
        	    	  	for (var i = 0; i < monitores.length; i++) {
        	    		 
        	    		  $("<option />", {value: monitores[i].usuario, text: monitores[i].nombre}).appendTo(s);
        	    	  	}
        	    	  }else {
        	    		  $("<option />", {value: "null", text: "No hay monitores disponibles"}).appendTo(s);
        	    	  }
        	    	  s.prop('disabled', false);
        	    	  b.attr('disabled', false);
        	    	});
        	      posting.always(function() {
        	    	    
        	      });        	    
        	  }

        	
        	
        	
        	
        	
        	var selectMonitor = $('#monitor');
        	var usuarioElegido = $("option:selected", selectMonitor).val();
        	var monitorElegido = $("option:selected", selectMonitor).text();
        	$("#panelMonitor").css("box-shadow","none");
        	selectMonitor.on('change', function() {
	        	usuarioElegido = $("option:selected", this).val();
	        	monitorElegido = $("option:selected", this).text();
	        	
	        	$("#panelMonitor").css("box-shadow","0 0 5px rgb(55, 50, 50)");		    	
			});

	        $("#confirmarMonitor").click(function(){
	        	confirma();
			});

			$("#confirmarMonitor").keypress(function(e) {
			    if(e.which == 13) {
			        confirma();
			    }
			});

			function confirma () {
				$( "#mostrarMonitor" ).text(monitorElegido);
				$( "#usuario" ).val(usuarioElegido);
			}
			
			
			
	        Metis.formWysiwyg();
        
        });

    </script>

  </body>