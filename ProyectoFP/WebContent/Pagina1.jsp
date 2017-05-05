<%@ page language="java" import="java.util.Random" contentType="text/html; charset=UTF-8"
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
<title>Registrarse</title>
<link rel="stylesheet" type="text/css" href="CSS/Pagina1.css">

</head>
<body bgcolor="#000000" background="IMG/Pagina1.jpeg">
	<script>
	if (${error == 'true'}) {
		  alert("El nombre de administrador o email introducidos ya existen");
	}
	</script>
	
	<%!
	String getCadenaAlfanumAleatoria (int longitud){
		String cadenaAleatoria = "";
		long milis = new java.util.GregorianCalendar().getTimeInMillis();
		Random r = new Random(milis);
		int i = 0;
		while ( i < longitud){
		char c = (char)r.nextInt(255);
		if ( (c >= '0' && c <='9') || (c >='A' && c <='Z') ){
		cadenaAleatoria += c;
		i ++;
		}
		}
		return cadenaAleatoria;
		}
	%>
	
	<%
	String codAdmin = getCadenaAlfanumAleatoria(10);
	%>
	
	<h4 style="text-align: center;">¿A quién le toca hoy?</h4>
	<p></p>
		<div class="row">
		<form class="col s12" action="MainServlet?action=signed" method="post">
		<div class="row">
		<legend><h5 text-color="blue">Registrarse</h5></legend>
	   
	 
			<div class="input-field col l4 m6 s12">
			<input type="text" name="identificador" placeholder="Elija el nombre del administrador" required>
			<label for="identificador">Nombre del administrador</label>
			</div>
			
			<div class="input-field col l4 m6 s12">
			<input type="password" name="clave" placeholder="Elige la contraseña" required>
			<label for="clave">Contraseña</label>
			</div>
			
			<div class="input-field col l4 m6 s12">
			<input type="email" name="email" placeholder="Escriba su email" required>
			<label for="email">Email</label>
			</div>
			
		</div>
		<input type="hidden" name="codAdmin" value="<%= codAdmin %>">
		<input class="button" type="submit" value="Registrarse"><br/>
		</form>
		
</body>
</html>