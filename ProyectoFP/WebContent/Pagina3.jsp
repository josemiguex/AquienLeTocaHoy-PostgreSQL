<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="es.ingenia.proyectofp.Usuario, es.ingenia.proyectofp.Admin"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administración de usuarios</title>
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

<style>
body {
	background-image: url(IMG/Pagina3.jpg);
	background-attachment: fixed; /*para que sea estático*/
	background-position: top left; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}

a {
	color: black;
}
</style>
</head>
<body background="IMG/Pagina3.jpg">
	<h4
		style="text-align: center; color: white; text-shadow: 0.1em 0.1em #333;">¿A
		quién le toca hoy?</h4>


	<script>
	if (${noError == 'true'}) {
		  alert("Contraseña cambiada correctamente");
	}
	</script>

	<%
		Usuario[] datosUsuario = (Usuario[]) request.getAttribute("datosUsuario");
		Admin datosAdmin = (Admin) session.getAttribute("datosAdmin");
	%>

	<div class="container">
		<div class="row">
			<div class="col l12 m12 s12">

				<table style="margin: 0 auto;" bgcolor="#dbdbdb" class="striped">
					<form action="MainServlet?action=deleteuser" method="post"
						name="form1">
						<thead>
							<tr>
								<th></th>
								<th>DNI</th>
								<th>Nombre y Apellidos</th>
								<th>Pasajero</th>
								<th>Conductor</th>
								<th>Última Fecha y Hora</th>
						</thead>
						<%
							for (int i = 0; i < datosUsuario.length; i++) {

								if (datosUsuario[i].getFecha() == null) {
									datosUsuario[i].setFecha("-----------------------------");
									datosUsuario[i].setHora("");
								}
								out.print("<tr><td><input type=\"checkbox\" name=\"dni\" id=\"" + datosUsuario[i].getDni()
										+ "\" value=\"" + datosUsuario[i].getDni() + "\"><label for=\"" + datosUsuario[i].getDni()
										+ "\"> </td><td><a href=\"MainServlet?action=modifyuser&num=" + i + "\">" + datosUsuario[i].getDni() + "</a></td><td><a href=\"MainServlet?action=modifyuser&num=" + i + "\">" + datosUsuario[i].getNombre() + " "
										+ datosUsuario[i].getApellidos() + "</a></td><td>" + datosUsuario[i].getPasajero() + "</td><td>"
										+ datosUsuario[i].getConductor() + "</td><td>" + datosUsuario[i].getFecha() + " "
										+ datosUsuario[i].getHora() + "</td></tr>");

							}
						%>


					</form>
				</table>
			</div>
		</div>
	</div>


	<nav>


	<div class="nav-wrapper #616161 grey darken-2">
		<form action="MainServlet" method="get" name="form2">
			<input type="hidden" name="action" value="adduser"> <a
				onclick="document.forms['form2'].submit(); return false;"
				class="btn-floating btn-large waves-effect waves-light #bdbdbd grey lighten-1 left"><i
				class="material-icons">add</i></a>

		</form>

		<form action="MainServlet" name="form4" method="get">
		<input type="hidden" name="action" value="changepassword"></form>
		<ul class="left" id="nav-mobile" class="left hide-on-med-and-down">
			<form action="MainServlet" name="form3" method="get">
				<input type="hidden" name="action" value="annotate">
				<%
					session.setAttribute("datosAdmin", datosAdmin);
					session.setAttribute("datosUsuario", datosUsuario);
				%>

			</form>

			<input type="hidden" name="IdAdministrador"
				value="<%=datosAdmin.getIdadministrador()%>">
			<li><a onclick="document.forms['form1'].submit(); return false;">Eliminar</a></li>
			<li><a onclick="document.forms['form3'].submit(); return false;">Anotar</a></li>





		</ul>
		<ul class="right" id="nav-mobile" class="right hide-on-med-and-down">
			<li><a onclick="document.forms['form4'].submit(); return false;">Cambiar
					contraseña</a></li>
			<li><a href="MainServlet?action=logout">Cerrar sesión</a></li>
		</ul>

	</div>
	</nav>
</body>
</html>