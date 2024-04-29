<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Registra utente</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

form {
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 20px;
	margin-bottom: 15px;
}

input[type="text"], input[type="password"], button {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="text"], input[type="password"] {
	font-size: 16px;
}

button {
	background-color: #4caf50;
	color: white;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

a.button {
	display: block;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	background-color: #007bff;
	padding: 10px 0;
	border-radius: 4px;
}

a.button:hover {
	background-color: #0056b3;
}
</style>
<script>
<%String messaggio = (String) request.getAttribute("messaggio");%>
        window.onload = function() {
            // Verifica se la variabile "messaggio" è valorizzata
            <%if (messaggio != null && !messaggio.isEmpty()) {%>
                alert("<%=messaggio%>
	");
<%}%>
	};
</script>
</head>
<body style="background-size: 100vw 100vh"
	background="https://www.tecnicadellascuola.it/wp-content/uploads/2023/08/Sapienza_entrance_20040201351-scaled.jpg">



	<div class="col-md-2 p-3">
		<a href="index.jsp" role="button"><button>
				<i class="fas fa-arrow-left"></i> Torna indietro
			</button></a>
	</div>
	<div class="p-3" align="center">
		<form action="registra" method="post">
			<div class="row">
				<div class="col-md-6">
					<h1>Inserisci Nome</h1>
					<input class="rounded-1 m-2" type="text" name="name">
				</div>
				<div class="col-md-6">
					<h1>Inserisci Cognome</h1>
					<input class="rounded-1 m-2" type="text" name="surname">
				</div>
			</div>
			<h1>Inserisci Username</h1>
			<input class="rounded-1 m-2" type="text" name="username"
				maxlength="10">
			<p>
			<h1>Inserisci Password</h1>
			<input class="rounded-1 m-2" type="password" name="password"
				maxlength="5">
			<p>
			<h1>Conferma Password</h1>
			<input class="rounded-1 m-2" type="password" name="confermaPassword"
				maxlength="5">
			<p>
				<input class="m-4 rounded-1" type="submit" value="Registrati">
			<p>
		</form>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>