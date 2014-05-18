package main.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class MakeObject {
	static ArrayList<SearchResult> result;
	GoogleSearch googleSearch = null;
	NaverSearch naverSearch = null;
	DaumSearch daumSearch = null;

	public ArrayList<SearchResult> getResult(HashMap<String, String> keywordMap) {

		result = null;

		Set<String> keySet = keywordMap.keySet();
		Iterator<String> itBind = keySet.iterator();
		Iterator<String> itCase = keySet.iterator();

		String naverCategory[] = {"blog", "news", "cafearticle", "kin", "webkr", "doc"};
		String daumCategory[] = {"board", "web", "knowledge" /* , "cafe", "blog" */};

		System.out.println("Test : 현재 키 리스트 개수 : " + keySet.size());

		StringBuffer orBinding = new StringBuffer("");

		while (itBind.hasNext()) {
			String data = keywordMap.get(itBind.next());
			System.out.println("현재 들어온 데이터 : " + data);

			orBinding.append("+OR+");
			orBinding.append(data);

		}
		System.out.println(orBinding);
		// 구글 통합 바인딩 검색어
		googleSearch = new GoogleSearch(orBinding.toString(), 5);
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
			//	addingDaum("\"" + keywordMap.get(key) + "\"", 10, daumCategory);

				break;
			case "email":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
			//	addingDaum("\"" + keywordMap.get(key) + "\"", 10, daumCategory);

				break;
			case "email2":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
			//	addingDaum("\"" + keywordMap.get(key) + "\"", 10, daumCategory);

				break;
			case "homephone":

				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
			//	addingDaum("\"" + keywordMap.get(key) + "\"", 10, daumCategory);

				break;
			case "memberid":

				// memberid의 복잡도 계산 가능한지 체크
				addingGoogle("\"" + keywordMap.get(key) + "\"", 10);
				addingNaver("\"" + keywordMap.get(key) + "\"", 10,
						naverCategory);
			//	addingDaum("\"" + keywordMap.get(key) + "\"", 3, daumCategory);

				break;

			}

		}

		return result;
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