<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>NaturAdventure login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin//css/login.css">
    
    
</head>
<body>
<h1>${user.usuario}</h1>>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="login">
               		    <img class="profile-img" src="${pageContext.request.contextPath}/resources/admin/images/logo.png"
                    alt="">
                    
<form:form method="post" modelAttribute="user"
        action="${pageContext.request.contextPath}/admin1234/login.html">
        <p>
            
            <form:input path="usuario" />
            <form:errors path="usuario" cssClass="error" />
        </p>
        <p>
            
            <form:password path="contrasenya" />
            <form:errors path="contrasenya" cssClass="error" />
        </p>        
        <input type="submit" value="Accedir" />
    </form:form>	
               			<div id="tabs" data-tabs="tabs"><p class="text-center">
               				<a href="#seleccionar_cuenta" data-toggle="tab">Seleccionar cuenta</a></p>
               				<p class="text-center"><a href="#recordar_contrasena" data-toggle="tab">¿Recordar contaseña?</a></p>
              				</div>
						</div>
						
							<div id="tabs" data-tabs="tabs">
               			<p class="text-center"><a href="#login" data-toggle="tab">Have an Account?</a></p>
              			</div>
						</div>
						
						
						<div class="tab-pane" id="seleccionar_cuenta">
							<div id="tabs" data-tabs="tabs">
								<div class="media account-select">
									<a href="#user1" data-toggle="tab">
										<div class="pull-left">		
											<img class="select-img" src="${pageContext.request.contextPath}/resources/admin/images/logo.png"
                    alt="">
										</div>	 
										<div class="media-body">
											<h4 class="select-name">Gerente número 1</h4>
										</div>
									</a>
								</div>
                                <hr />
								<div class="media account-select">
									<a href="#user2" data-toggle="tab">
										<div class="pull-left">		
											<img class="select-img" src="${pageContext.request.contextPath}/resources/admin/images/logo.png"
                    alt="">
										</div>	 
										<div class="media-body">
											<h4 class="select-name">Gerente número 2</h4>
										</div>
									</a>
								</div>
                                <hr />
               			<p class="text-center"><a href="#login" data-toggle="tab">Back to Login</a></p>
              			</div>
						</div>
						<div class="tab-pane" id="user1">
							<img class="profile-img" src="${pageContext.request.contextPath}/resources/admin/images/logo.png"
                    alt="">
							<h3 class="text-center">User Name 1</h3>
							<form class="form-signin" action="" method="">
								<input type="hidden" class="form-control" value="User Name">
								<input type="password" class="form-control" placeholder="Password" autofocus required>
								<input type="submit" class="btn btn-lg btn-default btn-block" value="Sign In" />
							</form>
							<p class="text-center"><a href="#login" data-toggle="tab">Back to Login</a></p>
               		<p class="text-center"><a href="#select" data-toggle="tab">Select another Account</a></p>
						</div>
						<div class="tab-pane" id="user2">
							<img class="profile-img" src="${pageContext.request.contextPath}/resources/admin/images/logo.png"
                    alt="">
							<h3 class="text-center">User Name 2</h3>
							<form class="form-signin" action="" method="">
								<input type="hidden" class="form-control" value="User Name">
								<input type="password" class="form-control" placeholder="Password" autofocus required>
								<input type="submit" class="btn btn-lg btn-default btn-block" value="Sign In" />
							</form>
							<p class="text-center"><a href="#login" data-toggle="tab">Back to Login</a></p>
               		<p class="text-center"><a href="#select" data-toggle="tab">Select another Account</a></p>
						</div>
					</div>
            </div>
        </div>
    </div>
</div>

</body>
		<script type="text/javascript">
				
			var contexto = "${pageContext.request.contextPath}";
		
		</script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
</html>
