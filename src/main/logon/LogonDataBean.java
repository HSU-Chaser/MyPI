package main.logon;

public class LogonDataBean {

	public boolean getCertStatus() {
		return certStatus;
	}

	public void setCertStatus(boolean certStatus) {
		this.certStatus = certStatus;
	}

	// 이하 추가된 부분

	private int client_num;
	private String email;

	public void setClient_num(int client_num) {
		this.client_num = client_num;
	}

	private String password;
	private String name;
	private String cellphone;
	private String homephone;
	private String birthday;
	private String address;
	private String school;
	private String workplace;
	private String occupation;
	private int current_grade;
	private boolean certStatus;

	public int getClient_num() {
		return client_num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public int getCurrent_grade() {
		return current_grade;
	}

	public void setCurrent_grade(int exp_grade) {
		this.current_grade = exp_grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getHomephone() {
		return homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
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

	// 로그인 암호화
	public void setPassword(String password) {
		this.password = Encryptor.encryptSHA(password);
	}

}
