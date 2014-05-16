package main.search;

import java.util.ArrayList;

public class MakeObject {
	static ArrayList<SearchResult> result;

	
	public ArrayList<SearchResult> getResult(String searchWord) {
		result = null;
		GoogleSearch googleSearch = null;
		NaverSearch naverSearch = null;
		DaumSearch daumSearch = null;
		
		String query = "";
		// query = 바인딩 한 쿼리 전달
		
		
		googleSearch = new GoogleSearch(query);
		naverSearch = new NaverSearch(query);
		daumSearch = new DaumSearch(query);

		result = googleSearch.getResult();
		result.addAll(naverSearch.getResult());
		result.addAll(daumSearch.getResult());

		return result;
	}
}