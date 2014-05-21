package main.extending.form;

import java.util.ArrayList;

import main.extending.Cyworld;
import main.extending.CyworldBlog;
import main.extending.DaumBlog;
import main.extending.Dreamwiz;
import main.extending.Egloos;
import main.extending.Gallog;
import main.extending.NaverBlog;
import main.extending.NaverKin;
import main.extending.NaverMe2day;
import main.extending.TodayHumor;
import main.extending.Twitter;

public class Storage {

	public static ArrayList<String> nickNameList = null;
	public static ArrayList<String> imgUrlList = null;
	public static ArrayList<String> exposureUrlList = null;
	public static String realName = "null";
	public static String realBirthday = "null";
	public static String realEmail = "null";

	private String clientId;
	private String clientEmail;

	public Storage(String clientEmail) {
		this.clientEmail = clientEmail;
		clientId = this.clientEmail.split("@")[0];
		init();
	}

	public void init() {
		nickNameList = null;
		nickNameList = new ArrayList<String>();
		imgUrlList = null;
		imgUrlList = new ArrayList<String>();
		exposureUrlList = null;
		exposureUrlList = new ArrayList<String>();
	}

	public void execute() {

		Search[] webSite;
		webSite = new Search[11];

		webSite[0] = new NaverBlog();
		webSite[1] = new Twitter();
		webSite[2] = new NaverMe2day();
		webSite[3] = new DaumBlog();
		webSite[4] = new Egloos();
		webSite[5] = new Gallog();
		webSite[6] = new NaverKin();
		webSite[7] = new TodayHumor();
		webSite[8] = new Dreamwiz();
		webSite[9] = new CyworldBlog();
		webSite[10] = new Cyworld();
		// webSite[11] = new Tistory(); // 진행중
		
		for (int i = 0; i < webSite.length - 1; i++) {
			webSite[i].searchMaterials(getClientId());
		}
		webSite[webSite.length - 1].searchMaterials(getClientEmail()); // Cyworld

		System.out.println("");
		System.out.println(getClientId() + "님의 닉네임");
		for (int i = 0; i < nickNameList.size(); i++) {
			System.out.println(nickNameList.get(i));
		}
		System.out.println("");
		System.out.println(getClientId() + "님의 프로필이미지Url");
		for (int i = 0; i < imgUrlList.size(); i++) {
			System.out.println(imgUrlList.get(i));
		}
		System.out.println("");
		System.out.println(getClientId() + "님의 주요 신상정보 노출 웹");
		for (int i = 0; i < exposureUrlList.size(); i++) {
			System.out.println(exposureUrlList.get(i));
		}

		System.out.println("");
		System.out.println(getClientId() + "님의 그 외 주요 신상정보");
		System.out.println("실명 : " + realName);
		System.out.println("생년월일 : " + realBirthday);
		System.out.println("사용 이메일 : " + realEmail);

	}

	public String getClientId() {
		return clientId;
	}

	public String getClientEmail() {
		return clientEmail;
	}
	
	

}
