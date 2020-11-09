package es.uco.pw.display.javabean;

public class CustomerBean implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String emailUser = "";
	
	private String passwordUser = "";
	
	private String firstNameUser = "";
	
	private String lastNameUser = "";

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}

	public String getPasswordUser() {
		return passwordUser;
	}

	public void setPasswordUser(String passwordUser) {
		this.passwordUser = passwordUser;
	}

	public String getFirstNameUser() {
		return firstNameUser;
	}

	public void setFirstNameUser(String firstNameUser) {
		this.firstNameUser = firstNameUser;
	}

	public String getLastNameUser() {
		return lastNameUser;
	}

	public void setLastNameUser(String lastNameUser) {
		this.lastNameUser = lastNameUser;
	}
	
	
	
}
