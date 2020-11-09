<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="es.uco.pw.bussiness.user.User,es.uco.pw.data.dao.UserDAO" %>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>

<%
	String nextPage = "../../index.jsp";
	String message = "";
	//Se comprueba si el customerBean está vacío, si es así, rescata el email y la contraseña de la vista
	if(CustomerBean == null || CustomerBean.getEmailUser().equals("")){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//Ahora se comprueba si los parametros rescatados están vacíos o no, para después buscar en la BBDD
		if(email != null){
			UserDAO userDAO = new UserDAO();
			User user = userDAO.queryByEmail(email, password);
			
			//Comprobamos si devuelve null o un usuario
			if(user != null  &&  user.getEmail().equalsIgnoreCase(email)){
				//Obtenemos los parametros necesarios del usuario
				String firstname = user.getFirstname();
				String lastname = user.getLastname();
				//Hacemos el cambio en el CustomerBean
				%>
				<jsp:setProperty property="firstNameUser" value="<%=firstname%>" name="CustomerBean"/>
				<jsp:setProperty property="lastNameUser" value="<%=lastname%>" name="CustomerBean"/>
				<jsp:setProperty property="emailUser" value="<%=email%>" name="CustomerBean"/>
				<%
			} else{
				
				nextPage = "../view/loginView.jsp";
				message = "Usuario introducido no v&aacute;lido";
			}
		} else{
			
			nextPage = "../view/loginView.jsp";
			
		}
	}
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=message%>" name="message"/>
</jsp:forward>