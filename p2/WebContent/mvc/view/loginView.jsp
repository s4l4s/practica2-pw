<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean">></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acceso</title>
</head>
<body>
	<%
	String nextPage = "../controller/loginController.jsp)";
	String messageNextPage = request.getParameter("message");
	if( messageNextPage == null ) messageNextPage = "";
	
	//Comprobamos si el usuario está logado, aunque no debería de ocurrir. En ese caso lo devolvemos al index
	if(CustomerBean != null && !CustomerBean.getEmailUser().equals("")){
		nextPage = "../../index.jsp";
	} else
	//Si no lo está, recogemos los datos del login para enviarlos al controlador
	{
	%>
	<%= messageNextPage
	%><br/><br/>
	<form method="post" action="../controller/loginController.jsp">
		<label for="email">Email: </label>
		<input type="text" name="email"><br/>
		<label for="password">Password: </label>
		<input type="text" name="password"><br/>
		<input type="submit" value="Submit">
	</form>
	<%
	}
	%>

</body>
</html>