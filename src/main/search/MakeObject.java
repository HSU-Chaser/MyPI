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

	public ArrayList<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ImageSearch imageSearch = new ImageSearch();

		result = null;

		String naverCategory[] = { "blog", "news", "cafearticle", "kin",
				"webkr", "doc" };
		String daumCategory[] = { "board", "web", "knowledge" /* , "cafe", "blog" */};

		// 여기서 구글, 네이버에 걸어줘야되는데 일단 구글만 생각하면, 숫자를 다 스테틱하게 저장해야되는데
		// 1번 그래마 2번 그래마 이런식으로 다 해줘야된다..
		// 일단 5개로 고정해서 받아보도록 하겠다.

		// 그냥 add만 했다간 처음에 붙일게 없어서 null포인트가 날 것이지만, 일단 놔두고 진행
		// id, email은 반드시받는 정보이므로, 정보가 없을 경우는, id, email로 최대한 지랄한 결과를 내보내면 될듯

		
		googleSearch = new GoogleSearch(searchWordList.get(0), 5);
		result = googleSearch.getResult();

		for (int i = 1; i < searchWordList.size(); i++) {

			addingGoogle(searchWordList.get(i), 5);

		}

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