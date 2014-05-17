package main.ranking;

import java.io.IOException;
import java.util.ArrayList;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	static ArrayList<SearchResult> result;

	public ArrayList<SearchResult> getResult(String searchWord) {
		CalculateExp calExp = new CalculateExp();
		
		
		System.out.println("들어옴 1");
		MakeObject makeObject = new MakeObject();
		System.out.println("들어옴 2 : " + searchWord);
		
		
		//먼저, 구글, 네이버, 다음 검색하게 하고
		result = makeObject.getResult(searchWord);
		System.out.println("들어옴 3");
		
		for (int i = 0; i < result.size(); i++) {
			
			System.out.println("들어옴 4");
			SearchResult sr = result.get(i);

			int exposure = 0;

			OpenURL pattern = new OpenURL(sr.getURL());
			
			try {
				pattern.Reader(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 계산을 해서, exposure를 리턴해줘서 받으면 됨
			exposure = calExp.getExposure();
			
			sr.setExposure(exposure);
			result.set(i, sr);
		}

		// 정렬

		System.out.println("들어옴 5");
		return result;
	}
}
