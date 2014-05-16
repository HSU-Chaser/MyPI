package main.ranking;

import java.io.IOException;
import java.util.ArrayList;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	static ArrayList<SearchResult> result;

	public ArrayList<SearchResult> getResult(String query) {
		MakeObject object = new MakeObject();
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
			
			// 점수계산
			
			sr.setExposure(exposure);
			result.set(i, sr);
		}

		// 정렬

		return result;
	}
}
