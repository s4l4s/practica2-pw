<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log out</title>
</head>
<body>
	<%
	String message = request.getParameter("message");
	if(CustomerBean != null && !CustomerBean.getEmailUser().equals("")){
	%>
		message <br/>
		<a href="ej2.2/index.jsp">Volver a inicio</a>
	<%
	}
	%>
</body>
</html>