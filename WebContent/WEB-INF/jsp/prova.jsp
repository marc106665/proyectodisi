<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=latin1" %>
<html> 
<head>
  <title>EI1027 - Disseny i Implementació de Sistemes d’Informació</title> 
</head>
<body> 
	${message}
	
	<c:forEach var="listValue" items="${listaPaises}">
				<li>${listValue.nom}, capital ${listValue.capital}</li>
	</c:forEach>
	<c:forEach var="listValue" items="${listaActividades}">
				<li>${listValue.idActividad}, capital ${listValue.nombre}</li>
	</c:forEach>
</body> 
</html>