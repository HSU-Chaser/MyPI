package main.ranking;

import java.io.IOException;
import java.util.ArrayList;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	static ArrayList<SearchResult> result;

	public ArrayList<SearchResult> getResult(String query) {
		CalculateExp calExp = new CalculateExp();
		MakeObject object = new MakeObject();
		
		//먼저, 구글, 네이버, 다음 검색하게 하고
		result = object.getResult(query);

		for (int i = 0; i < result.size(); i++) {
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

		return result;
	}
}
