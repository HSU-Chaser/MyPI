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
	
	private static String imgSearchWord;

	public static String getImgSearchWord(){
		
		return imgSearchWord;
	}
	public void setImgSearchWord(String imgSearchWord){
		this.imgSearchWord = imgSearchWord;
	}
	
	// 검색어 사전을 만드는 모듈
	public void bindingWord(HashMap<String, String> map) {

		imgSearchWord = "";
		
		ArrayList<String> singleWord = new ArrayList<String>();
		ArrayList<String> complexWord = new ArrayList<String>();
		int singleGrammar;
		int complexGrammar;
		// 단일 항목 검색

		String[] singleBinding = { "\"" + map.get("id") + "\"",
				"\"" + map.get("email") + "\"",
				"\"" + map.get("homephone") + "\"",
				"\"" + map.get("cellphone") + "\"",
				"\"" + map.get("address") + "\"" };

		String[] complexBinding = {
				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("cellphone") + "\"",
				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("school") + "\"",
				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("email") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("email2") + "\"",
				"\"" + map.get("name") + "\"" + "+AND+" + "\"" + map.get("id")
						+ "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\"" + map.get("email")
						+ "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("email2") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname2") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname3") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname4") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname5") + "\"" };
		
		
		
		if((!map.get("name").equals("null")) && (!map.get("occupation").equals("null"))){
			setImgSearchWord("\"" + map.get("name") + "\"" + "+" + map.get("occupation") + "+OR+" + map.get("school"));
		}
		
		else{
			setImgSearchWord("\"" + map.get("email") + "\"");
		}
		

		singleGrammar = singleBinding.length;
		for (int i = 0; i < singleGrammar; i++) {
			singleWord.add(singleBinding[i]);
		}

		// 처음엔 이렇게 넣어버리고, 그 뒤부턴 addAll
		for (int i = 0; i < singleWord.size(); i++) {
			getSearchWordList().add(removeNull(singleWord).get(i));
		}

		complexGrammar = complexBinding.length;
		for (int i = 0; i < complexGrammar; i++) {
			complexWord.add(complexBinding[i]);
		}

		getSearchWordList().addAll(removeNull(complexWord));

		System.out.println("현재 전체 들어간 전체 검색어의 개수 : "
				+ getSearchWordList().size());
	}

	// null일경우 해당 항목 삭제하면서 갑니다.
	public ArrayList<String> removeNull(ArrayList<String> list) {

		int size = list.size();

		for (int i = 0; i < size; i++) {

			if (list.get(i).contains("null")) {

				System.out.println("clearNullOne 들어왔습니다 : " + list.get(i));
				list.remove(i);
				i--;
				size--;

			}
		}
		return list;
	}

}
