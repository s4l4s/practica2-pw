<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Práctica 2</title>
</head>
<body>
	<%
	if(request.getParameter("reset")!=null){
	%>
	<jsp:setProperty property="emailUser" value="" name="CustomerBean"/>
	<%
	}
	if( CustomerBean == null || CustomerBean.getEmailUser()=="" ){
		//si el usuario no esta logado
	%>
		<a href="p2/mvc/controller/loginController.jsp">Acceder</a>
		<a href="p2/mvc/controller/registroController.jsp">Registro</a>
	<%
	}else{
	%>
		¡¡Bienvenido <jsp:getProperty property="firstNameUser" name="CustomerBean"/> <jsp:getProperty property="lastNameUser" name="CustomerBean"/><br/>
		(<jsp:getProperty property="emailUser" name="CustomerBean"/>)
		<a href="p2/mvc/controller/modifyController.jsp">Modificar</a>
		<a href="p2/mvc/controller/logoutController.jsp">Desconectar</a>
	<%
	}
	%>
</body>
</html>