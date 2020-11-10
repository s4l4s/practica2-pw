<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="es.uco.pw.data.dao.UserDAO, es.uco.pw.bussiness.user.User" %>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>

<%
	String nextPage = "../../index.jsp";
	String message = "";
	
	//Comprobación del bean para sacar todos los parametros pasados como arg al volver de la vista
	if(CustomerBean == null || CustomerBean.getEmailUser().equals("")){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		
		//Comprobamos que los param no estén vacíos
		if(email != null){
		
		//Comprobamos que no exista ningun usuario con ese email
		UserDAO userDAO = new UserDAO();
		User user = userDAO.queryByEmail(email);
		if(user == null){
			//Primero insertamos el nuevo usuario en la BBDD
			user.setEmail(email);
			user.setPassword(password);
			user.setFirstname(firstname);
			user.setLastname(lastname);
			int status = userDAO.insert(user);//no se q hacer con el status
			//Ahora lo añadimos al Bean para que quede logado en esta sesión
		%>
			<jsp:setProperty property="emailUser" value="<%=email%>" name="CustomerBean"/>
			<jsp:setProperty property="passwordUser" value="<%=password%>" name="CustomerBean"/>
			<jsp:setProperty property="firstNameUser" value="<%=firstname%>" name="CustomerBean"/>
			<jsp:setProperty property="lastNameUser" value="<%=lastname%>" name="CustomerBean"/>
		<%
		} else {
			nextPage = "../view/registroView.jsp";
			message = "El usuario introducido ya existe";
			}
		} else {
			//Mandamos a vista por primera vez
			nextPage = "../view/loginView.jsp";
		}
	}
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=message%>" name="message"/>
</jsp:forward>
		