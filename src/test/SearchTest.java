package test;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

import main.ranking.ImageStorage;
import main.ranking.Ranking;
import main.search.BindingWord;
import main.search.SearchResult;

public class SearchTest {

	public static void main(String[] args) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, IOException {

		BindingWord binding;
		Ranking ranking = new Ranking();

		
		
		//jsp 에서는 세션값으로 이메일을 받아서 넣으면 됩니다.
		binding = new BindingWord("tera16@naver.com"); // binding 에 전달

		
		ArrayList<SearchResult> result = ranking.getResult(binding
				.getKeywordMap());

		for(int i=0; i<ImageStorage.getImgUrlList().size(); i++){
			System.out.println("Test : " + ImageStorage.getImgUrlList().get(i));
		}
		
		System.out.println("result의 갯수 : " + result.size());
		
		for (int i = 0; i < result.size(); i++) {
			
			System.out.println("엔진 : " + result.get(i).getEngine() + "노출도 : "
					+ result.get(i).getExposure() + "  해당 주소 : "
					+ result.get(i).getURL());
		}

		
		
	}
}
 