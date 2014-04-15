package search;

import java.util.ArrayList;

public class SearchMain {
	public static void main(String[] args) throws Exception {
		String query = "gtaer";

		GoogleSearch googleSearch = new GoogleSearch(query);
		NaverSearch naverSearch = new NaverSearch(query);
		DaumSearch daumSearch = new DaumSearch(query);

		ArrayList<SearchResult> result = null;
		result = googleSearch.getResult();
		if (result == null) {
			System.out.println("No Results!!");
		}

		for (int i = 0; i < result.size(); i++) {
			System.out.println("제목 : " + result.get(i).getTitle());
			System.out.println("주소 : " + result.get(i).getURL());
			System.out.println("내용 : " + result.get(i).getSnippet());
			System.out.println("------------------------------------");
		}

	}
}
