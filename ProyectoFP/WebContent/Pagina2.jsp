<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="es.ingenia.proyectofp.Usuario"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mostrar tabla</title>
<link rel="stylesheet" type="text/css" href="CSS/Pagina2.css">
<style>
body {
	background-image: url(IMG/Pagina2.jpg);
	background-attachment: fixed; /*para que sea estático*/
	background-position: top right; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}
</style>

</head>
<body>

	<%
		Usuario[] datosUsuario = (Usuario[]) request.getAttribute("datosUsuario");
	%>
	<p id="demo"></p>

	<%
		int z = 0;
		int i = 0;
		int y = 0;
	%>
	<script>
		var i, myObj, x = "";
		myObj = [
	<%for (y = 0; y < datosUsuario.length; y++) {

				out.print("{\"nombre\":");
				out.print("\"" + datosUsuario[y].getNombre() + "\",");

				out.print("\"apellidos\":");
				out.print("\"" + datosUsuario[y].getApellidos() + "\",");

				out.print("\"dni\":");
				out.print("\"" + datosUsuario[y].getDni() + "\",");

				out.print("\"pasajero\":");
				out.print("\"" + datosUsuario[y].getPasajero() + "\",");

				out.print("\"conductor\":");
				out.print("\"" + datosUsuario[y].getConductor() + "\",");

				out.print("\"fecha\":");
				out.print("\"" + datosUsuario[y].getFecha() + "\",");

				out.print("\"hora\":");
				out.print("\"" + datosUsuario[y].getHora() + "\"},");
			}%>
		]

		for (i in myObj.datos) {
			x += myObj.datos[i].dni + " " + myObj.datos[i].nombre + " "
					+ myObj.datos[i].apellidos + " " + myObj.datos[i].pasajero
					+ " " + myObj.datos[i].conductor + " "
					+ myObj.datos[i].fecha + " " + myObj.datos[i].hora +
			" </br>";
		}

		document.getElementById("demo").innerHTML = x;
	</script>

	<h4 style="text-align: center;">¿A quién le toca hoy?</h4>

	<div class="container">
		<div class="row">
			<div class="col l12 m12 s12">
				<table style="margin: 0 auto;" class="striped" bgcolor="#dbdbdb">
					<thead>
						<tr>
							<th>Orden</th>
							<th></th>
							<th>DNI</th>
							<th cosplan=\"3\">Nombre y Apellidos</th>
							<th>Pasajero</th>
							<th>Conductor</th>
							<th>Última fecha y hora</th>
						<tr>
					</thead>
					<%
						for (i = 0; i < datosUsuario.length; i++) {

							if (datosUsuario[i].getFecha() == null) {
								datosUsuario[i].setFecha("-----------------------------");
								datosUsuario[i].setHora("");
							}
							out.print("<tr><td>" + (i + 1) + "<td><td>" + datosUsuario[i].getDni() + "</td><td>"
									+ datosUsuario[i].getNombre() + " " + datosUsuario[i].getApellidos() + "</td><td>"
									+ datosUsuario[i].getPasajero() + "</td><td>" + datosUsuario[i].getConductor() + "</td><td>"
									+ datosUsuario[i].getFecha() + " " + datosUsuario[i].getHora() + "</td></tr>");

						}
					%>
				</table>
			</div>
		</div>
	</div>

	<div class="contenedor">
		<form class="col s12" action="MainServlet?action=login" method="post">
			<div class="row">
				<legend>
					<h5>Iniciar sesión</h5>
				</legend>
				<div class="input-field col l3 m6 s12">
					<input type="text" name="identificador"
						placeholder="Introduce el identificador del administrador"
						required> <label for="identificador">
						Identificador del administrador</label>
				</div>
				<div class="input-field col l3 m6 s12">
					<input type="password" name="clave"
						placeholder="Introduce su contraseña" required> <label
						for="clave">Clave del administrador</label>
				</div>
				<br> <br> <br> <br> <input class="button"
					type="submit" value="Iniciar Sesión">
			</div>
		</form>
		<p>
			<a href="Pagina7.jsp">¿Has olvidado tu contraseña?</a>
		</p>

		<form class="col s12" action="MainServlet">
			<div class="row">
				<legend>
					<h5>¿Quieres ver otra tabla?</h5>
				</legend>
				<div class="input-field col l3 m6 s12">
					<input type="hidden" name="action" value="collectdata" required>
					<input type="hidden" name="format" value="html">
					<input type="text" name="identificador"
						placeholder="Introduce el usuario del administrador" required>

					<label for="identificador"> Usuario del administrador</label>
				</div>
				<input class="button" type="submit" value="Buscar tabla">
			</div>
		</form>
	</div>



</body>
</html>