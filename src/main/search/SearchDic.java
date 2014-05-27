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

		//먼저 2개로 시작해보겠다.
		String[] binding = { map.get("id"), map.get("email"), map.get("name"), map.get("cellphone"), map.get("homephone")
				, map.get("birthday"), map.get("address"), map.get("school"), map.get("workplace"), map.get("occupation"),
				map.get("email2"), map.get("birthday2"), map.get("nickname"), map.get("nickname2")};
		
		int grammarNum = binding.length;
		
		
		
		for (int i = 0; i < grammarNum; i++) {

			getSearchWordList().add(binding[i]);

		}

		eliminateNull();

	}

	public void eliminateNull() {

		for (int i = 0; i < getSearchWordList().size(); i++) {

			if (getSearchWordList().get(i).contains("null")) {

				System.out.println("들어왔습니다 : " + getSearchWordList().get(i));
				String replaceString = getSearchWordList().get(i).replace("null", "d");
				
				getSearchWordList().set(i, replaceString);

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
		
		for(int i = 0; i<getSearchWordList().size(); i++){
			System.out.println(getSearchWordList().get(i));
		
		}

	}

}
