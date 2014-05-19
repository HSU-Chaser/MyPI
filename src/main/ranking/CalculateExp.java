package main.ranking;

import java.util.HashMap;

import main.patternanalysis.RankingCount;
import main.patternanalysis.Reliability;

public class CalculateExp implements Reliability {

	RankingCount rankingCount;
	private HashMap<String, String> keywordMap;
	private int urlExposure = 0;

	public CalculateExp(HashMap<String, String> keywordMap) {
		this.keywordMap = keywordMap;
	}

	public int getExposure() {

		rankingCount = new RankingCount(keywordMap);
		rankingCount.countProcess();
		// rankingCount.get~ 해서 카운트를 불러와서 랭킹 알고리즘 설계하면 끝
		
		
		
		rankingCount.getCellphoneCount();
		rankingCount.getEmailCount();
		
		int array[] = rankingCount.getCellphoneCount();
		int cellphoneExp = array[ORIGIN] * 10  + array[EXTEND] * 5 + array[PATTERN] * 1;
		
		array = rankingCount.getEmailCount();
		int emailExp = array[ORIGIN] * 8 + array[EXTEND] * 4 + array[PATTERN] * 1;
		
		
		
		
		
		System.out.println("TEST : " + "cellphoneExp : " + cellphoneExp  + "   emailExp : " + emailExp);
		urlExposure = cellphoneExp + emailExp;
		
		return urlExposure;

	}
}
