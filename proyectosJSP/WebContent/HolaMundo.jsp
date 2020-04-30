<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.acarballeira.Utilidades"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HolaMundo</title>
</head>
<body>
	<!-- Scriptlet -->
	<%
		double num = Utilidades.dameNumeroAleatorio();
		if (num > 0.95) {
	%>
		<h2>Terás un bo día!</h2><p>(<%= num %>)</p>
	<%
		} else {
	%>
		<h2>A vida vai costa abaixo ...</h2><p>(<%= num %>)</p>
	<%
		}
	%>
	<a href="<%= request.getRequestURI() %>"><h3>Proba outra vez!!!</h3></a>
</body>
</html>