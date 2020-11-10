<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.pw.bussiness.user.User, es.uco.pw.data.dao.UserDAO" %>
<jsp:useBean id="CustomerBean" scope="session" class="es.uco.pw.display.javabean.CustomerBean"></jsp:useBean>

<%
	String nextPage = "../../index.jsp";
	String message = "Usuario desconectado";
	
	//Comprobar que el Bean NO está vacío
	String email = CustomerBean.getEmailUser();
	if(CustomerBean != null || !email.equals(""))
	{
		CustomerBean.setEmailUser("");
		CustomerBean.setPasswordUser("");
		CustomerBean.setFirstNameUser("");
		CustomerBean.setLastNameUser("");
		nextPage = "../../logoutView.jsp";
	}
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=message%>" name="message"/>
</jsp:forward>