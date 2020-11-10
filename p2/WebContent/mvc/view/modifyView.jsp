<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
</head>
<body>
	<%
	String nextPage = "../controller/modifyController.jsp";
	String message = request.getParameter("message");
	if ( message == null ) message = "";
	
	//Comprobamos que el usuario SÍ esté logado
	if(CustomerBean == null || CustomerBean.getEmailUser().equals("")){
		nextPage = "../../index.jsp";
	} else
	{
		//Si lo está, recogemos todos los datos para modificarlo, excepto el email
		%>
		<br/>
		<form method="post" action="../controller/modifyController.jsp">
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