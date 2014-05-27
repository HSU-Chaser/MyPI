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

		ArrayList<String> oneWord = new ArrayList<String>();
		ArrayList<String> twoWord = new ArrayList<String>();

		//단일 항목 검색
		String[] oneBinding = { map.get("id"), map.get("email"),
				map.get("name"), map.get("cellphone"), map.get("homephone"),
				map.get("birthday"), map.get("address"), map.get("school"),
				map.get("workplace"), map.get("occupation"), map.get("email2"),
				map.get("birthday2"), map.get("nickname"), map.get("nickname2") };
		
		// 복합 항목 검색
//		String[] twoBinding = {

		int grammarNum = oneBinding.length;

		for (int i = 0; i < grammarNum; i++) {
			oneWord.add(oneBinding[i]);
		}
		clearNullOne(oneWord);
		
		// 처음엔 이렇게 넣어버리고, 그 뒤부턴 addAll
		for(int i=0; i<oneWord.size(); i++){
			getSearchWordList().add(oneWord.get(i));
		}
		
		
		
		
		
	
	}
	
	// null일경우 해당 항목 삭제하면서 갑니다.
	public ArrayList<String> clearNullOne(ArrayList<String> list) {
		
		int size = list.size();

		for (int i = 0; i < size; i++) {

			if (list.get(i).contains("null")) {

				System.out.println("clearNullOne 들어왔습니다 : " + list.get(i));
				list.remove(i);
				i--; size--;
				
			}
		}
		return list;
	}

	public ArrayList<String> clearNullTwo(ArrayList<String> list) {

		for (int i = 0; i < getSearchWordList().size(); i++) {

			if (getSearchWordList().get(i).contains("null")) {

				System.out.println("들어왔습니다 : " + getSearchWordList().get(i));
				String replaceString = getSearchWordList().get(i).replace(
						"null", "+");

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

		// for(int i = 0; i<getSearchWordList().size(); i++){
		// System.out.println(getSearchWordList().get(i));
		//
		// }

		return list;

	}

}
