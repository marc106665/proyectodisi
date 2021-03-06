 <!-- .navbar -->
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container-fluid">

            <!-- Brand and toggle get grouped for better mobile display -->
            <header class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span> 
              </button>
              <a href="${pageContext.request.contextPath}/admin1234/inicio.html" class="navbar-brand">
                <img src="${pageContext.request.contextPath}/resources/admin/img/logo_nombre.png" alt="logo naturAdventure">
              </a> 
            </header>
            <div class="topnav">
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip" class="btn btn-default btn-sm" id="toggleFullScreen">
                  <i class="glyphicon glyphicon-fullscreen"></i>
                </a> 
              </div>
              
              <div class="btn-group">
                <a data-toggle="modal" data-original-title="Help" data-placement="bottom" class="btn btn-default btn-sm" href="#helpModal">
                  <i class="fa fa-question"></i>
                </a> 
                <a href="${pageContext.request.contextPath}/admin1234/logout.html" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                  <i class="fa fa-power-off"></i>
                </a> 
              </div>
              
              <!-- menu lateral
              <div class="btn-group">
                <a data-placement="bottom" data-original-title="Show / Hide Left" data-toggle="tooltip" class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                  <i class="fa fa-bars"></i>
                </a> 
                <a data-placement="bottom" data-original-title="Show / Hide Right" data-toggle="tooltip" class="btn btn-default btn-sm toggle-right"> <span class="glyphicon glyphicon-comment"></span>  </a> 
              </div>-->
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">

              <!-- .nav -->
              <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/admin1234/reservas/listadoReservas.html">Reservas</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/actividades.html">Actividades</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/tiposActividades.html">Tipos Actividades</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/monitores.html">Monitores</a></li>
                  <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/admin1234/reservas/listadoReservas.html">Reservas</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/actividades.html">Actividades</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/tiposActividades.html">Tipos Actividades</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin1234/monitores.html">Monitores</a></li>
                  </ul>
                </li>
              </ul><!-- /.nav -->
            </div>
          </div><!-- /.container-fluid -->
        </nav><!-- /.navbar -->
        <header class="head">
          <!--<div class="search-bar">
            <form class="main-search" action="">
              <div class="input-group">
                 <input type="text" class="form-control" placeholder="Buscar..."> 
                <span class="input-group-btn">
            <button class="btn btn-primary btn-sm text-muted" type="button">
                <i class="fa fa-search"></i>
            </button>
        </span> 
              </div>
            </form><!-- /.main-search -->
          <!--</div> /.search-bar -->
          
