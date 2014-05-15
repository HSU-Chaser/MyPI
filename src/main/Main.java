package main;

import java.util.ArrayList;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Main {
	private static String query;

	public Main(String query) {
		this.query = query;
	}

	public static void main(String[] args) throws Exception {
		// 로그인 확인 후 이메일에서 아이디 검색 - 미구현

		// 추출한 아이디로 검색 후 결과를 받아옴 - 구현
		MakeObject search = new MakeObject();
		ArrayList<SearchResult> result = search.getResult(query);

		// 받아온 결과의 link의 페이지 분석 - 구현
		//for (int i = 0; i < result.size(); i++) {
			OpenURL url = new OpenURL(result.get(1).getURL());
			url.Reader();
		//}

		// 페이지 정렬하여 출력 - 미구현

	}
}