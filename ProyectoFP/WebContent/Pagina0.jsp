<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">      
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
	  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
<title>¿A quién le toca hoy?</title>
<link rel="stylesheet" type="text/css" href="CSS/Pagina0.css">

<style>
body {
background-image: url(IMG/Pagina0.jpg);
background-attachment: fixed;/*para que sea estático*/
background-position: bottom center;/*arriba a la derecha*/
background-repeat: no-repeat;/*que no se repita el fondo*/
}
</style>
</head>
<body onload="mostrarError()">

<script>
if (${error == 'true'}) {
	  alert("Usuario o contraseña incorrectos");
}

if (${noErrorEmail == 'true'}) {
	  alert("Se ha enviado un email con la nueva contraseña");
}
</script>

<script>

	

	if (${esnulo == 'true'}) {
		  alert("No has introducido identificador");
	} 
	
	</script>
	
	<h4 style="text-align: center;">¿A quién le toca hoy?</h4>
	<h5 style="background-color: #8d6e63;" align="center">La función de este programa es mediante la anotación de cuántas veces ha ido como conductor o pasajero un determinado grupo de personas, mostrar la prioridad de quién debería ir como conductor o pasajero, por ejemplo si alguien ha ido muchas veces como pasajero y nunca como conductor se pondrá primero en la tabla </h5>
	<div class="contenedor">
	
	<legend><h5>Registrarse</h5></legend>
	<a href="MainServlet?action=signup"><button class="button"><span>Pulse aquí para registrarse</span></button></a>
	<br/>
	<br/>
	
		<form class="col s12" action="MainServlet?action=login" method="post">
		<div class="row">
		<legend><h5>Iniciar sesión</h5></legend>

	       <div class="input-field col l3 m6 s12">
			<input type="text" name="identificador" placeholder="Pon aquí el identificador del administrador" required>
			<label for="Identificador">Nombre del administrador</label>
			</div>
			
			<div class="input-field col l3 m6 s12">
			<input type="password" name="clave" placeholder="Pon aquí la clave del administrador" required>
			<label for="clave" min-length="6">Clave del administrador</label>
			</div>
		</div>
		
		<input class="button" type="submit" value="Iniciar sesión">
	</form>
	<p><a href="Pagina7.jsp">¿Has olvidado tu contraseña?</a></p>
	
	<br>
	
	<form class="col s12" action="MainServlet" >
		<div class="row">
		<legend><h5>Mostrar usuarios de un determinado administrador</h5></legend>
	       <div class="input-field col l3 m6 s12">
	       
	   	    <input type="hidden" name="action" value="collectdata">
	   		<input type="hidden" name="format" value="html">
	       	<input type="text" name="identificador" placeholder="Pon aquí el identificador del administrador" required>
	       
			<label for="identificador">Id del administrador</label>
			</div>
			
			</div>
			<h5><b>${msg2}</b></h5><br/>
		<input class="button" type="submit" value="Mostrar usuarios"><br/>
		
	</form>
	</div>
	
	
</body>
</html>