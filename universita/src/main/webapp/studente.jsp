<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Area Studenti</title>
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
<body style="background-size: 100vw 100vh"background="https://www.turismoroma.it/sites/default/files/universit%C3%A0%20COP.jpg" >

<%String matricola=(String)session.getAttribute("matricola");
ResultSet res=(ResultSet) request.getAttribute("tabella_corso");
ResultSet res1=(ResultSet) request.getAttribute("elenco_appelli");
String materia=(String) request.getAttribute("materia");
String messaggio = (String) request.getAttribute("successo");
String data = (String) request.getAttribute("data");
String materia2 = (String) request.getAttribute("materia2");
%>
<% if(matricola==null){
	
	response.sendRedirect("index.jsp");
}
%>
<div  class="text-light mt-5" align="center" style="box-shadow: 0 2px 4px 0 rgba(0,0,0,10), 0 6px 20px 0 rgba(0,0,0,1); margin-top:50%; padding:30px; max-width: 600px; margin: 0 auto; border-radius: 8px; background-color: rgba(255, 255, 255, 0.1); ">
<h1>Benvenuto studente:<%=matricola %></h1> 

<% if(res!=null) {%>
<table class="m-2" border=1>
<tr>
<th>ID corso</th>
<th>materia</th>
<th>nome docente</th>
<th>cognome docente</th>
</tr>
<%
while(res.next()){	
%>
<tr>
<th><%=res.getInt("idcorso") %></th>
<th><%=res.getString("materia") %></th>
<th><%=res.getString("nome") %></th>
<th><%=res.getString("cognome") %></th>
<%} %>
</tr>
</table>


<form action="Prenotazione" method="post">
Inserisci la prenotazione che vuoi effettuare
<br>
<input class="m-2" type="number" name="materia"><br>
<input class="m-2" type="submit" value="Prenota">
<%} %>
</form>

<% if(res1!=null) {%>
<p>Per l'esame di <%=materia%> sono disponibili i seguenti appelli:</p>
<table border=1>
<tr>
<th>ID Appello</th>
<th>Data</th>
</tr>
<%
while(res1.next()){	
%>
<tr>
<th><%=res1.getInt(1)%></th>
<th><%=res1.getDate("Data") %></th>
<%} %>
</tr>
</table>

<form action="Prenota" method="post">
Inserisci la prenotazione che vuoi effettuare
<br>
<input class="m-2" type="number" name="appello"><br>
<input class="m-2 rounded-1" type="submit" value="Prenota">
</form>
<a href="logout.jsp" role="button"><button>Logout</button></a>
<a href="javascript:history.back()" role="button"><button>Torna indietro</button></a>
<%} %>
<%if(materia2!=null && data!=null){ %>
<p> Prenotazione effettuata con successo in data <%=data %> per il corso <%=materia2 %></p>
<%} %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>