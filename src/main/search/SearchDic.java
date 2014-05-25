package main.search;

import java.util.ArrayList;
import java.util.HashMap;

import main.extending.form.ExtendedStorage;
import main.logon.LogonDBBean;
import main.logon.LogonDataBean;

public class SearchDic {

	String memberEmail = "";
	ExtendedStorage storage;

	public SearchDic(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	private static ArrayList<String> searchWordList;

	public static ArrayList<String> getSearchWordList() {

		if (searchWordList == null) {
			searchWordList = new ArrayList<String>();
		}

		return searchWordList;
	}

	// 검색어 사전을 만드는 모듈
	public void bindingWord(HashMap<String, String> map) {

		
		
		
		
		
		
		
		eliminateNull();

	}
	
	public void eliminateNull() {

		for (int i = 0; i < getSearchWordList().size(); i++) {

			if (getSearchWordList().get(i).contains("null")) {
				
				getSearchWordList().get(i).replace("null", "");
				
			}
		}

		for (int i = 0; i < getSearchWordList().size(); i++) {
			
			if (getSearchWordList().get(i).contains("\"")){
				
				//모든 "" 질의는 항상 첫번째에 올것이다.
				if(getSearchWordList().get(i).split("\"")[1].equals("null")){
					
					getSearchWordList().remove(i);
					
				}
				
			}
			
		}

	}

	// 확장된 키워드에 대한 헤쉬맵 생성
	public HashMap<String, String> getKeywordMap() {

		HashMap<String, String> keywordMap = null;
		keywordMap = new HashMap<String, String>();
		LogonDataBean dataBean;
		String memberId = memberEmail.split("@")[0];

		// searchWord = "\"" + memberId + "\"" + "_"; // _는 구분자 역할

		try {
			dataBean = new LogonDataBean();
			dataBean = LogonDBBean.getInstance().getMember(memberEmail);

			// extraInfo는 tinyInt로 default 0, true일때 1을 저장할 것이므로
			keywordMap.put("memberid", memberId);
			keywordMap.put("email", dataBean.getEmail());

			if (!dataBean.getBirthday().equals("null")) {
				keywordMap.put("birthday", dataBean.getBirthday());
			}
			if (!dataBean.getCellphone().equals("null")) {
				keywordMap.put("cellphone", dataBean.getCellphone());
			}
			if (!dataBean.getHomephone().equals("null")) {
				keywordMap.put("homephone", dataBean.getHomephone());
			}
			if (!dataBean.getName().equals("null")) {
				keywordMap.put("name", dataBean.getName());
			}
			if (!dataBean.getOccupation().equals("null")) {
				keywordMap.put("occupation", dataBean.getOccupation());
			}
			if (!dataBean.getSchool().equals("null")) {
				keywordMap.put("school", dataBean.getSchool());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		storage = new ExtendedStorage(memberEmail);
		storage.execute(); // start the extending algorithm

		if (!keywordMap.containsKey("name")) {
			if (!ExtendedStorage.realName.equals("null")) {

				System.out.println("Test : " + ExtendedStorage.realName);
				keywordMap.put("name", ExtendedStorage.realName);
			}
		}
		if (!keywordMap.containsKey("birthday")) {
			if (!ExtendedStorage.realBirthday.equals("null")) {

				System.out.println("Test : " + ExtendedStorage.realBirthday);
				keywordMap.put("occupation", ExtendedStorage.realBirthday);
			}
		}
		if ((!ExtendedStorage.realEmail.equals("null"))
				&& !(ExtendedStorage.realEmail.equals(memberEmail))) {

			System.out.println("Test : " + ExtendedStorage.realEmail);
			keywordMap.put("email2", ExtendedStorage.realEmail);
		}

		return keywordMap;

	}
}
