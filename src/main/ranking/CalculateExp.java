package main.ranking;

import java.util.HashMap;

import main.patternanalysis.RankingCount;

public class CalculateExp {

	private HashMap<String, String> keywordMap;
	RankingCount rankingCount;

	public CalculateExp(HashMap<String, String> keywordMap) {
		this.keywordMap = keywordMap;
	}

	int urlExposure;

	// InfoStorage 로부터 해당 카운트를 멤버로 받아서 계산을 하고

	public int getExposure() {

		rankingCount = new RankingCount(keywordMap);

		// rankingCount.get~ 해서 카운트를 불러와서 랭킹 알고리즘 설계하면 끝
		
		
		
		
		
		
		
		
		
		
		return urlExposure;

	}

}
