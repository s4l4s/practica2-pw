<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.pw.bussiness.user.User, es.uco.pw.data.dao.UserDAO" %>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>

<%
	String nextPage = "../../index.jsp";
	String message = "";
	
	
	//Comprobar que el Bean NO está vacío
	String email = CustomerBean.getEmailUser();
	if(CustomerBean != null || !email.equals(""))
	{
		//Sacamos todos los parametros pasados como arg. Se modifican todos menos el email
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		//Comprobar que los parametros NO están vacíos
		if(firstname != null){
		//Comprobar, por si acaso, que el email logado existe en la BBDD
		UserDAO userDAO = new UserDAO();
		User user = userDAO.queryByEmail(email);
		if(user != null)
		{
			//Hacemos la modificación en la BBDD	
			user.setPassword(password);
			user.setFirstname(firstname);
			user.setLastname(lastname);
			int status = userDAO.modify(user);
			//Y ahora en el CustomerBean
			%>
			<jsp:setProperty property="firstNameUser" value="<%=firstname%>" name="CustomerBean"/>
			<jsp:setProperty property="lastNameUser" value="<%=lastname%>" name="CustomerBean"/>
			<jsp:setProperty property="passwordUser" value="<%=password%>" name="CustomerBean"/>
			<%
		} else{
			nextPage = "../view/modifyView.jsp";
			message = "Usuario logado no encontrado en la base de datos";
		}
	}else{
		//Mandamos a vista por primera vez
		nextPage = "../view/modifyView.jsp";
	}
	}
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=message%>" name="message"/>
</jsp:forward>
		