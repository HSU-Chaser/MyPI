package search;

import search.daum.DaumSearch;
import search.google.GoogleSearch;
import search.naver.NaverSearch;

public class SearchMain {
	public static void main(String[] args) {
		String query = "gtaer";

		GoogleSearch googleSearch = new GoogleSearch();
		NaverSearch naverSearch = new NaverSearch();
		DaumSearch daumSearch = new DaumSearch();

		System.out.println(googleSearch.getXMLResult(query));
		System.out.println();
		System.out.println(naverSearch.getXMLResult(query));
		System.out.println();
		System.out.println(daumSearch.getXMLResult(query));
	}
}
