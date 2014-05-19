package test;

import java.util.ArrayList;

import main.ranking.Ranking;
import main.search.BindingWord;
import main.search.SearchResult;

public class SearchTest {

	public static void main(String[] args) {

		BindingWord binding;
		Ranking ranking = new Ranking();

		binding = new BindingWord("tera16@naver.com"); // binding 에 전달

		ArrayList<SearchResult> result = ranking.getResult(binding
				.getSearchWord());

		System.out.println("result의 갯수 : " + result.size());
		
		for (int i = 0; i < result.size(); i++) {
			
			System.out.println("엔진 : " + result.get(i).getEngine() + "노출도 : "
					+ result.get(i).getExposure() + "  해당 주소 : "
					+ result.get(i).getURL());
		}

	}
}
