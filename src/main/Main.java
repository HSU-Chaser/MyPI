package main;

import java.util.ArrayList;
import java.util.Scanner;

import main.patternanalysis.OpenURL;
import main.search.SearchMain;
import main.search.SearchResult;

public class Main {
	public static void main(String[] args) throws Exception {
		// 로그인 확인 후 DB에 있는 이메일에서 아이디 추출
		Scanner in = new Scanner(System.in);
		String query = in.next();

		// 추출한 아이디로 검색 후 결과를 받아옴
		SearchMain search = new SearchMain();
		ArrayList<SearchResult> result = search.getResult(query);

		// 받아온 결과의 link의 페이지 분석
		for (int i = 0; i < result.size(); i++) {
			OpenURL url = new OpenURL(result.get(i).getURL());
			url.Reader();
		}

		// 페이지 정렬하여 출력 (jsp로?)

	}
}