package main.search;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MakeObject {
	static ArrayList<SearchResult> result;
	GoogleSearch googleSearch = null;
	NaverSearch naverSearch = null;
	DaumSearch daumSearch = null;

	public ArrayList<SearchResult> getResult(HashMap<String, String> keywordMap) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, IOException {
		ImageSearch imageSearch = new ImageSearch();
		
		result = null;

		Set<String> keySet = keywordMap.keySet();
		Iterator<String> itBind = keySet.iterator();
		Iterator<String> itCase = keySet.iterator();

		String naverCategory[] = { "blog", "news", "cafearticle", "kin",
				"webkr", "doc" };
		String daumCategory[] = { "board", "web", "knowledge" /* , "cafe", "blog" */};

		System.out.println("Test : 현재 키 리스트 개수 : " + keySet.size());

		StringBuffer orBinding = new StringBuffer("");

		while (itBind.hasNext()) {
			String data = keywordMap.get(itBind.next());
			System.out.println("현재 들어온 데이터 : " + data);

			orBinding.append("OR+");
			orBinding.append(data);

		}
		String testImageSearch = "황기태";

		// System.out.println(orBinding);
		// googleSearch = new GoogleSearch(orBinding.toString(), 5);

		googleSearch = new GoogleSearch(testImageSearch, 5);

		result = googleSearch.getResult();

		while (itCase.hasNext()) {
			String key = itCase.next();
			System.out.println("현재 들어온 키값 : " + key);

			switch (key) {

			// memberid, email, birthday, cellphone, homephone, name,
			// occupation, school, sex, email2

			case "cellphone":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
				// addingDaum("\"" + keywordMap.get(key) + "\"", 10,
				// daumCategory);

				break;
			case "email":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
				// addingDaum("\"" + keywordMap.get(key) + "\"", 10,
				// daumCategory);

				break;
			case "email2":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
				// addingDaum("\"" + keywordMap.get(key) + "\"", 10,
				// daumCategory);

				break;
			case "homephone":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
				// addingDaum("\"" + keywordMap.get(key) + "\"", 10,
				// daumCategory);

				break;
			case "memberid":

				// memberid의 복잡도 계산 가능한지 체크
				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
				// addingDaum("\"" + keywordMap.get(key) + "\"", 3,
				// daumCategory);

				break;

			}

		}
		
		
		
	/*	
	 * imageSearch.setImageSearchResult();
	 * 
	 * setImageSearchResult(검색어, 이미지 갯수제한)
	 */
		
		return result;
	}

	public static boolean properID(String id) {
		
		boolean flag = false;

		Pattern proper = Pattern
				.compile("[\\w]{6,10}[\\d]{2,4}|[\\d]{2,4}[\\w]{6,10}");
		Matcher m = proper.matcher(id);

		if (m.matches() == true)
			flag = true;
		else
			flag = false;

		return flag;

	}

	public void addingGoogle(String query, int limit) {

		googleSearch = new GoogleSearch(query, limit);

		result.addAll(googleSearch.getResult());

	}

	public void addingNaver(String query, int limit, String[] category) {

		for (int i = 0; i < category.length; i++) {
			naverSearch = new NaverSearch(query, limit, category[i]);
			result.addAll(naverSearch.getResult());
		}

	}

	public void addingDaum(String query, int limit, String[] category) {

		for (int i = 0; i < category.length; i++) {

			daumSearch = new DaumSearch(query, limit, category[i]);
			result.addAll(daumSearch.getResult());

		}

	}
}