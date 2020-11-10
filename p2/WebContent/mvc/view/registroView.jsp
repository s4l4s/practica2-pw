<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
</head>
<body>

	<%
	String nextPage = "../controller/registroController.jsp";
	String message = request.getParameter("message");
	if(message == null) message = "";
	
	//Comprobar que no esta logado (no debería)
	if(CustomerBean !=null && !CustomerBean.getEmailUser().equals("")){
		nextPage = "../../index.jsp";
	} else {
	//Recogemos los datos del registro
	%>
	<%= message
	%><br/><br/>
	<form method="post" action="../controller/registroController.jsp">
		<label for="email">Email: </label>
		<input type="text" name="email"><br/>
		<label for="password">Password: </label>
		<input type="text" name="password"><br/>
		<label for="firstname">First Name: </label>
		<input type="text" name="firstname"><br/>
		<label for="lastname">Last Name: </label>
		<input type="text" name="lastname"><br/>
		<input type="submit" value="Submit">
	</form>
	<%
	}
	%>

</body>
</html>