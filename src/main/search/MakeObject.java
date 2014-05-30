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
	private static ArrayList<SearchResult> result;

	GoogleSearch googleSearch = null;
	NaverSearch naverSearch = null;
	DaumSearch daumSearch = null;

	// 구글 기준의 검색어를 입력받는다.
	public ArrayList<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ImageSearch imageSearch = new ImageSearch();
		ArrayList<String> naverSearchWordList = new ArrayList<String>();
		

		result = null;
		result = new ArrayList<SearchResult>();

		String naverCategory[] = { "blog", "news", "cafearticle", "kin",
				"webkr", "doc" };
		String daumCategory[] = { "board", "web", "knowledge" /* , "cafe", "blog" */};

		// null이 들어오지않게 하는 검색으로, 여기서 이미지 검색어를 넣어주면 될 것 같다.
		googleSearch = new GoogleSearch(searchWordList.get(0), 5);
		result = googleSearch.getResult();

		
		// Google 검색 실시
		for (int i = 1; i < searchWordList.size(); i++) {
			addingGoogle(searchWordList.get(i), 10);
		}

		// Naver 검색 실시- searchWordList를 Naver식으로 변형하는 한 어레이 리스트
		for (int i = 0; i < searchWordList.size(); i++) {
			if (searchWordList.get(i).contains("AND")) {
				searchWordList.set(i, searchWordList.get(i).replace("AND", "+"));
			}
			naverSearchWordList.add(searchWordList.get(i));
			addingNaver(naverSearchWordList.get(i), 5, naverCategory);
		}

		// Google 이미지 검색 실시  limit 8이 한계		
		imageSearch.setImageSearchResult(SearchDic.getImgSearchWord(), 8);
		
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
