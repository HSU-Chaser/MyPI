package main.search;

import java.util.ArrayList;

public class SearchMain {
	ArrayList<SearchResult> result = null;

	public ArrayList<SearchResult> getResult(String query) {
		GoogleSearch googleSearch = new GoogleSearch(query);
		// NaverSearch naverSearch = new NaverSearch(query);
		// DaumSearch daumSearch = new DaumSearch(query);

		result = googleSearch.getResult();
		
		if (result == null) {
			System.out.println("No Results!!");
			return null;
		} else
			return result;
	}
}
