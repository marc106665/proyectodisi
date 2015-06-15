<style type="text/css">

.md-macbook-pro {
  display: block;
  width: 55.3125em;
  height: 31.875em;
  font-size: 13px;
  margin: 0 auto;

  @media (max-width:1199px){
    font-size: 11px;
  }
  @media (max-width:1024px){
    font-size: 10px;
  }

  @media (max-width:767px){
    font-size: 7px;
  }

  @media (max-width:320px){
    font-size: 5px;
  }

}
.md-macbook-pro .md-lid {
  width: 45em;
  height: 30.625em;
  overflow: hidden;
  margin: 0 auto;
  position: relative;
  border-radius: 1.875em;
  border: solid 0.1875em #cdced1;
  background: #131313;
}
.md-macbook-pro .md-camera {
  width: 0.375em;
  height: 0.375em;
  margin: 0 auto;
  position: relative;
  top: 1.0625em;
  background: #000;
  border-radius: 100%;
  box-shadow: inset 0 -1px 0 rgba(255, 255, 255, 0.25);
}
.md-macbook-pro .md-camera:after {
  content: "";
  display: block;
  width: 0.125em;
  height: 0.125em;
  position: absolute;
  left: 0.125em;
  top: 0.0625em;
  background: #353542;
  border-radius: 100%;
}
.md-macbook-pro .md-screen {
  width: 42.25em;
  height: 26.375em;
  margin: 0 auto;
  position: relative;
  top: 2.0625em;
  // background: #1d1d1d;
  background: #fff;
  overflow: hidden;
}
.md-macbook-pro .md-screen img {
  width: 100%;
}
.md-macbook-pro .md-base {
  width: 100%;
  height: 0.9375em;
  position: relative;
  top: -0.75em;
  background: #c6c7ca;
}
.md-macbook-pro .md-base:after {
  content: "";
  display: block;
  width: 100%;
  height: 0.5em;
  margin: 0 auto;
  position: relative;
  bottom: -0.1875em;
  background: #b9babe;
  border-radius: 0 0 1.25em 1.25em;
}
.md-macbook-pro .md-base:before {
  content: "";
  display: block;
  width: 7.6875em;
  height: 0.625em;
  margin: 0 auto;
  position: relative;
  background: #a6a8ad;
  border-radius: 0 0 0.625em 0.625em;
}
.md-macbook-pro.md-glare .md-lid:after {
  content: "";
  display: block;
  width: 50%;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  border-radius: 0 1.25em 0 0;
  background: -webkit-linear-gradient(37deg, rgba(255, 255, 255, 0) 50%, rgba(247, 248, 240, 0.025) 50%, rgba(250, 245, 252, 0.08));
  background: -moz-linear-gradient(37deg, rgba(255, 255, 255, 0) 50%, rgba(247, 248, 240, 0.025) 50%, rgba(250, 245, 252, 0.08));
  background: -o-linear-gradient(37deg, rgba(255, 255, 255, 0) 50%, rgba(247, 248, 240, 0.025) 50%, rgba(250, 245, 252, 0.08));
  background: linear-gradient(53deg, rgba(255, 255, 255, 0) 50%, rgba(247, 248, 240, 0.025) 50%, rgba(250, 245, 252, 0.08));
}
</style>
	<div class="container-fluid">
                
        <div class="col-md-12">
            <!-- begin macbook pro mockup -->
            <div class="md-macbook-pro md-glare">
                <div class="md-lid">
                    <div class="md-camera"></div>
                    <div class="md-screen">
                    <!-- content goes here -->                
                        <div class="tab-featured-image">
                            <div class="tab-content">
                                <div class="tab-pane  in active" id="tab1">
                                        <img src="${pageContext.request.contextPath}/resources/admin/images/ayuda_tab1.png" alt="tab1" class="img img-responsive">
                                </div>
                                <div class="tab-pane " id="tab2">
                                    
                                        <img src="${pageContext.request.contextPath}/resources/admin/images/ayuda_tab2.png">
                                    
                                </div>
                                <div class="tab-pane fade" id="tab3">
                            
                                    
                                        <img src="${pageContext.request.contextPath}/resources/admin/images/ayuda_tab3.png" alt="tab1" class="img img-responsive">
                                </div>
                                
                                <div class="tab-pane fade" id="tab4">
                            
                                    
                                        <img src="${pageContext.request.contextPath}/resources/admin/images/ayuda_tab4.png" alt="tab1" class="img img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="md-base"></div>
            </div> <!-- end macbook pro mockup -->

		

        </div> <!-- / .col-md-8 -->
        
        <div class="col-md-12">
            <!-- begin panel group -->
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                
                <!-- panel 1 -->
                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab1" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="head1"data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
                            <h4 class="panel-title">¿Cómo inserto la información?</h4>
                        </div>
                    </span>
                    
                    <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="head1">
                        <div class="panel-body">
                        <!-- Tab content goes here -->
                        <p>Comienza añadiendo monitores desde la pestaña de monitores en el menú superior, el mismo proceso para tipos de actividades y finalmente el mismo proceso para actividades</p>
                        </div>
                    </div>
                </div> 
                <!-- / panel 1 -->
                
                <!-- panel 2 -->
                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab2" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="head2" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
                            <h4 class="panel-title collapsed">¿Cómo gestiono los tipos de actividades?</h4>
                        </div>
                    </span>

                    <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="head2">
                        <div class="panel-body">
                        <!-- Tab content goes here -->
                        <p>Desde la pestaña Tipos de actividades tendrás la opción si tienes tipos de añadir 
                        desde el boton verde de '+' o desde el boton de editar para editar la información de un tipo (ojo, no puedes modificar el nombre!). Editar no creará nuevas copias y eliminar te pedira confirmación.</p>
                        </div>
                    </div>
                </div>
                <!-- / panel 2 -->
                
                <!--  panel 3 -->
                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab3" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="head3"  class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
                            <h4 class="panel-title">¿Cómo gestiono mis actividades? </h4>
                        </div>
                    </span>

                        <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="head3">
                          <div class="panel-body">
                          <!-- tab content goes here -->
                           <p>Desde la pestaña de Actividades podrás acceder a la información básica. Si pulsas sobre el boton '+' podrás añadir una nueva actividad. 
                           Desde el boton editar podrás retocar toda la información de una actividad sin crear copias y borrar eliminara una actividad con toda la información que cualgue de la misma.</p>
                          </div>
                        </div>
                </div>
                <!-- / panel 3 -->
                
                <!--  panel 4 -->
                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab4" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="head44"  class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse44" aria-expanded="false" aria-controls="collapse44">
                            <h4 class="panel-title">¿Cómo gestiono mis reservas? </h4>
                        </div>
                    </span>

                        <div id="collapse44" class="panel-collapse collapse" role="tabpanel" aria-labelledby="head44">
                          <div class="panel-body">
                          <!-- tab content goes here -->
                           <p>Desde la pestaña de Inicio se te mostrarán únicamente las reservas que estén sin asignar a un monitor, es decir en estado de 'PENDIENTE'.
                           Desde la pestaña de Reservas podrás ver la información de una reserva y así como asignar la reserva a un monitor, el cual quedará 'marcado' automaticamente en su calendario.</p>
                          </div>
                        </div>
                </div>
                <!-- / panel 4-->
            </div> <!-- / panel-group -->
             
        </div> <!-- /col-md-6 -->
      
</div>