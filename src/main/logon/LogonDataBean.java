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

	private String cell1;
	private String cell2;
	private String cell3;
	private String home1;
	private String home2;
	private String home3;
	private String birth1;
	private String birth2;
	private String birth3;

	public void setClient_num(int client_num) {
		this.client_num = client_num;
	}

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
	
	public String getcell1() {
		cell1 = cellphone.substring(0, 3);
		return cell1;

	}

	public String getcell2() {
		if (cellphone.length() == 12)
			cell2 = cellphone.substring(4, 7);
		else if (cellphone.length() == 13)
			cell2 = cellphone.substring(4, 8);
		return cell2;

	}

	public String getcell3() {
		if (cellphone.length() == 12)
			cell3 = cellphone.substring(8, 12);
		else if (cellphone.length() == 13)
			cell3 = cellphone.substring(9, 13);
		return cell3;

	}
	
	public String gethome1() {
		if (homephone.substring(0, 3).equals("02-") && homephone.length()==11)
			home1 = homephone.substring(0, 2);
		else if (homephone.length() == 12)
			home1 = homephone.substring(0, 3);
		else if (homephone.length() == 13)
			home1 = homephone.substring(0, 3);
		return home1;

	}

	public String gethome2() {
		if (homephone.substring(0,3).equals("02-") && homephone.length()==11)
			home2 = homephone.substring(3,6);
		if (homephone.length() == 12)
			home2 = homephone.substring(4, 7);
		else if (homephone.length() == 13)
			home2 = homephone.substring(4, 8);
		return home2;

	}

	public String gethome3() {
		if (homephone.substring(0,3).equals("02-") && homephone.length()==11)
			home3 = homephone.substring(7,11);
		if (homephone.length() == 12)
			home3 = homephone.substring(8, 12);
		else if (homephone.length() == 13)
			home3 = homephone.substring(9, 13);
		return home3;

	}
	
	public String getbirth1() {
		birth1 = birthday.substring(0, 4);
		return birth1;

	}

	public String getbirth2() {
		birth2 = birthday.substring(5,7);
		return birth2;

	}

	public String getbirth3() {
		birth3 = birthday.substring(8,10);
		return birth3;

	}
	

}
