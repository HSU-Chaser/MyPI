package main.logon;

public class LogonDataBean {
	private String email;
	private String password;
	private boolean certStatus;

	public boolean getCertStatus() {
		return certStatus;
	}

	public void setCertStatus(boolean certStatus) {
		this.certStatus = certStatus;
	}

	// 이하 추가된 부분
	private int exp_grade;
	private String name;
	private String cellphone;
	private String sex;
	private String birthday;
	private String homephone;
	private String occupation;
	private String school;
	private String extraInfo;

	public int getExp_grade() {
		return exp_grade;
	}

	public void setExp_grade(int exp_grade) {
		this.exp_grade = exp_grade;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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

	public String getExtraInfo() {
		return extraInfo;
	}

	public void setExtraInfo(String extraInfo) {
		this.extraInfo = extraInfo;
	}
}
