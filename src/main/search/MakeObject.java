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
		
	

		

		
		
		
		
		
		
//		String testImageSearch = "\"" + "tera16" + "\"" + "+서영덕" + "+한성대";
//		googleSearch = new GoogleSearch(testImageSearch, 5);
//		result = googleSearch.getResult();

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