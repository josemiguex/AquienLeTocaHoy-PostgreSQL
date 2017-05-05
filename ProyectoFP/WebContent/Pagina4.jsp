<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="es.ingenia.proyectofp.Usuario, es.ingenia.proyectofp.Admin"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<link rel="stylesheet" type="text/css" href="CSS/Pagina4.css">

<title>Añadir usuario</title>

<style>
body {
	background-image: url(IMG/Pagina4.jpg);
	background-attachment: fixed; /*para que sea estático*/
	background-position: bottom center; /*arriba a la derecha*/
	background-repeat: no-repeat; /*que no se repita el fondo*/
}
</style>

</head>
<body>

	<script>
	if (${duplicado == 'true'}) {
		  alert("El DNI o email que has introducido ya está en uso");
	}
	</script>


	<h4 style="text-align: center;">¿A quién le toca hoy?</h4>
	<%
		Admin datosAdmin = (Admin) session.getAttribute("datosAdmin");
		Usuario[] datosUsuario = (Usuario[]) request.getAttribute("datosUsuario");
		session.setAttribute("datosAdmin", datosAdmin);
		session.setAttribute("datosUsuario", datosUsuario);
	%>

	<%
		String servlet = "MainServlet?action=useradded";
		String nombre = "";
		String apellidos = "";
		String dni = "";
		String email = "";
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			nombre = datosUsuario[num].getNombre();
			apellidos = datosUsuario[num].getApellidos();
			dni = datosUsuario[num].getDni();
			email = datosUsuario[num].getEmail();

			servlet = "MainServlet?action=usermodified";
		}
	%>

	<form class="col s12" action="<%=servlet%>" method="post">
		<div class="row">

			<div class="input-field col l4 m12 s12">
				<input type="text" name="nombre" placeholder="Nombre"
					value="<%=nombre%>" required> <label for="Nombre">
					Nombre </label>
			</div>
			<div class="input-field col l4 m6 s12">
				<input type="text" name="apellidos" placeholder="Apellidos"
					value="<%=apellidos%>" required> <label for="Apellidos">Apellidos</label>
			</div>

			<div class="input-field col l6 m6 s12">
				<input type="text" name="dni" id="DNI" placeholder="DNI"
					value="<%=dni%>" maxlength="9" required> <label for="DNI">DNI</label>
			</div>
			<div class="input-field col l6 m6 s12">
				<input type="email" name="email" placeholder="Correo electrónico"
					value="<%=email%>" required> <label for="email"
					data-error="wrong" data-success="right">Correo electrónico</label>

			</div>
			<br> <br> <br> <br>
			<center>

				<%
					if (request.getParameter("num") == null) {
						out.println("<input class=\"button\" type=\"submit\" value=\"Añadir Usuario\">");
					} else {
						
						out.println("<input type=\"hidden\" name=\"datos\" value=\"datos\">");
						out.println("<input type=\"hidden\" name=\"num\" value=\"" + num + "\">");
						out.println("<input type=\"hidden\" name=\"dniActual\" value=\"" + datosUsuario[num].getDni() + "\">");
						out.println("<input type=\"hidden\" name=\"emailActual\" value=\"" + datosUsuario[num].getEmail() + "\">");
						out.println("<input class=\"button\" type=\"submit\" value=\"Modificar Usuario\">");
					}
				%>
			</center>
		</div>
	</form>


</body>
</html>