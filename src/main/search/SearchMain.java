package main.search;

import java.util.ArrayList;

public class SearchMain {
	ArrayList<SearchResult> result = null;
	ArrayList<SearchResult> naverResult = null;
	ArrayList<SearchResult> daumResult = null;

	public ArrayList<SearchResult> getResult(String query) {
		GoogleSearch googleSearch = new GoogleSearch(query);
		NaverSearch naverSearch = new NaverSearch(query);
		DaumSearch daumSearch = new DaumSearch(query);

		result = googleSearch.getResult();
		result.addAll(naverSearch.getResult());
		result.addAll(daumSearch.getResult());

		if (result == null) {
			System.out.println("No Search Result.");
		}

		return result;
	}
}
