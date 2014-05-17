package main.search;

import java.util.ArrayList;

public class MakeObject {
	static ArrayList<SearchResult> result;

	
	public ArrayList<SearchResult> getResult(String searchWord) {
		
//		result = new ArrayList<SearchResult>();
		result = null;
		
		GoogleSearch googleSearch = null;
		NaverSearch naverSearch = null;
		DaumSearch daumSearch = null;
		
		String googleQuery = searchWord.replace("|", "+OR+");
		String naverQuery = searchWord;
		String daumQuery = searchWord;

		
		
		
		googleSearch = new GoogleSearch(googleQuery);
		
		naverSearch = new NaverSearch(naverQuery);
		
		daumSearch = new DaumSearch(daumQuery);

		result = googleSearch.getResult();
		result.addAll(naverSearch.getResult());
		result.addAll(daumSearch.getResult());

		return result;
	}
}