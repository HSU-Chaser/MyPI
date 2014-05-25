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

			if (getSearchWordList().get(i).contains("\"")) {

				// 모든 "" 질의는 항상 첫번째에 올것이다.
				if (getSearchWordList().get(i).split("\"")[1].equals("null")) {

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

		storage = new ExtendedStorage(memberEmail);
		storage.execute(); // start the extending algorithm

		int nickNameCount = storage.nickNameList.size();

		try {
			dataBean = new LogonDataBean();
			dataBean = LogonDBBean.getInstance().getMember(memberEmail);

			keywordMap.put("email", dataBean.getEmail());
			keywordMap.put("id", memberId);
			keywordMap.put("name", dataBean.getName());
			keywordMap.put("cellphone", dataBean.getCellphone());
			keywordMap.put("homephone", dataBean.getHomephone());
			keywordMap.put("birthday", dataBean.getBirthday());
			keywordMap.put("address", dataBean.getAddress());
			keywordMap.put("school", dataBean.getSchool());
			keywordMap.put("workplace", dataBean.getWorkplace());
			keywordMap.put("occupation", dataBean.getOccupation());

			if (!keywordMap.containsKey("name")) {
				keywordMap.put("name", storage.realName);
			}
			keywordMap.put("email2", storage.realEmail);
			keywordMap.put("birthday2", storage.realBirthday);

			for (int i = 0; i < nickNameCount; i++) {

				switch (i) {

				// MAXIMUM of NickNameList = 5
				case 0:
					keywordMap.put("nickname", storage.nickNameList.get(i));
					break;
				case 1:
					keywordMap.put("nickname2", storage.nickNameList.get(i));
					break;
				case 2:
					keywordMap.put("nickname3", storage.nickNameList.get(i));
					break;
				case 3:
					keywordMap.put("nickname4", storage.nickNameList.get(i));
					break;
				case 4:
					keywordMap.put("nickname5", storage.nickNameList.get(i));
					break;

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return keywordMap;

	}
}
