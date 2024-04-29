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
<title>Benvenuto</title>
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

input[type="text"],
input[type="password"],
button {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"],
input[type="password"] {
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
</head>
<body style="background-size: 100vw 100vh"
	background="https://www.tecnicadellascuola.it/wp-content/uploads/2023/08/Sapienza_entrance_20040201351-scaled.jpg">

	<%
	String messaggio = (String) request.getAttribute("messaggio");
	%>
	<%
	if (messaggio != null) {
	%>
	<p align="center">
		<a style="font-family: helvetica; color: yellow; font-size: 20px">
	<%
			out.print(messaggio);
			%>
		</a>
		<%-- si poteva fare anche con l'espressione <%=messaggio%> --%>
	</p>
	<%
	}
	%>

	<div align="center">
		<div class=" p-3 m-2" align="center">
			<form action="login" method="post">
				<h1><b>Nome Utente</b></h1>
				<input class="rounded-1 m-2" type="text" name="username">
				<p>
				<h1><b>Password<b></h1>
				<input class="rounded-1 m-2" type="password" name="password">
				<p>
					<input class="m-2 rounded-1" type="submit" value="Accedi">
				<p>
				<p><b>Non hai ancora un account ?</b></p>
			</form>
			
			

		</div>
		<a href="registrazione.jsp" role="button"><button
					class="rounded-1 m-1" style="width:5%">Registrati</button></a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>