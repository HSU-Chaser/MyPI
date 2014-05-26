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

}
