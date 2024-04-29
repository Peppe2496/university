<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body style="background-size: 100vw 100vh"background="https://www.turismoroma.it/sites/default/files/universit%C3%A0%20COP.jpg" >
<% String nome= (String)session.getAttribute("nome");
String cognome= (String)session.getAttribute("cognome");
String materia=(String)session.getAttribute("materia");
ResultSet appelli=(ResultSet)request.getAttribute("appelli");
ResultSet elenco=(ResultSet)request.getAttribute("elenco_studenti");
String nomeMateria= (String)request.getAttribute("Materia");
String Data= (String)request.getAttribute("Data");


%>
<% if(nome==null && cognome==null){
	
	response.sendRedirect("index.jsp");
}
%>
<div class="text-light mt-5" align="center" style="box-shadow: 0 2px 4px 0 rgba(0,0,0,10), 0 6px 20px 0 rgba(0,0,0,1); margin-top:50%; padding:30px; max-width: 600px; margin: 0 auto; border-radius: 8px; background-color: rgba(255, 255, 255, 0.1); ">
<h1>Bentornato <%=nome%><%=cognome%></h1>
<% if(appelli!=null){	

%>
<p> Per la sua materia: <%=materia %> sono disponibili i seguenti appelli </p>
<table border=1>
<tr>
<th>ID Appello</th>
<th>Data</th>
</tr>
<%
while(appelli.next()){	
%>
<tr>
<th><%=appelli.getInt(1)%></th>
<th><%=appelli.getDate("Data") %></th>
</tr>
</table>
<% }%>
<form action="StampaStudenti" method="post">
<input class="m-2" type="number" name="ID_appello"><br>
<input class="m-2" type="submit" value="Vai">

</form>
<a href="logout.jsp" role="button"><button>Logout</button></a>

<%
}%>
<% if(elenco!=null){%>	

<p>Per l'esame<%=nomeMateria %> in data<%=Data %>si sono prenotati i seguenti studenti: </p>
<table class="m-4" border=1>
<tr>
<th>Nome</th>
<th>Cognome</th>
<th>Matricola</th>
</tr>

<%
while(elenco.next()){	
%>
<tr>
<th><%=elenco.getString("nome")%></th>
<th><%=elenco.getString("cognome")%></th>
<th><%=elenco.getString("Matricola") %></th>
<% }%>
<%} %>
</tr>
</table>
<a href="javascript:history.back()" role="button"><button>Torna indietro</button></a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>