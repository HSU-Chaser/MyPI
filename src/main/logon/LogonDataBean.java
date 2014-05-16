package main.logon;

public class LogonDataBean {
	private String email;
	private String password;
	private String certKey;
	private String certStatus;

	public String getCertKey() {
		return certKey;
	}

	public void setCertKey() {
		Encryptor encryptor = new Encryptor();
		this.certKey = encryptor.encryptMD5();
	}

	public String getCertStatus() {
		return certStatus;
	}

	public void setCertStatus(String certStatus) {
		this.certStatus = certStatus;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		Encryptor encryptor = new Encryptor();
		this.password = encryptor.encryptSHA(password);
	}
}
