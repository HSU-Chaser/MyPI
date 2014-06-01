package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import main.ranking.ExtendedInfo;

public class KeywordCounting {
	RankingCount rankingCount = new RankingCount();
	HashMap<String, String> userMap = new HashMap<String, String>();

	public RankingCount countingProcess(StringBuffer document) {
		userMap.clear();
		userMap = ExtendedInfo.getKeywordMap();

		// 패턴 분석 삭제

		String doc = document.toString();
		

		rankingCount.idCount = doc.split(userMap.get("id")).length - 1;

		rankingCount.emailCount = doc.split(userMap.get("email")).length - 1;

		if (!(userMap.get("cellphone").equals("null"))) {
			rankingCount.cellphoneCount = doc.split(userMap.get("cellphone")).length - 1;
		}
		if (!(userMap.get("homephone").equals("null"))) {
			rankingCount.homephoneCount = doc.split(userMap.get("homephone")).length - 1;
		}

		if (!(userMap.get("name").equals("null"))) {
			rankingCount.nameCount = doc.split(userMap.get("name")).length - 1;
		}
		if (!(userMap.get("address").equals("null"))) {
			rankingCount.addressCount = doc.split(userMap.get("address")).length - 1;
		}
		if (!(userMap.get("workplace").equals("null"))) {
			rankingCount.workplaceCount = doc.split(userMap.get("workplace")).length - 1;
		}
		if (!(userMap.get("birthday").equals("null"))) {
			rankingCount.birthdayCount = doc.split(userMap.get("birthday")).length - 1;
		}
		if (!(userMap.get("school").equals("null"))) {
			rankingCount.schoolCount = doc.split(userMap.get("school")).length - 1;
		}
		if (!(userMap.get("occupation").equals("null"))) {
			rankingCount.occupationCount = doc.split(userMap.get("occupation")).length - 1;
		}

		// nickname 검사
		if (!(userMap.get("nickname1").equals("null"))) {
			rankingCount.nicknameCount = doc.split(userMap.get("nickname1")).length - 1;
		}
		if (!(userMap.get("nickname2").equals("null"))) {
			rankingCount.nicknameCount = doc.split(userMap.get("nickname2")).length - 1;
		}
		if (!(userMap.get("nickname3").equals("null"))) {
			rankingCount.nicknameCount = doc.split(userMap.get("nickname3")).length - 1;
		}
		if (!(userMap.get("nickname4").equals("null"))) {
			rankingCount.nicknameCount = doc.split(userMap.get("nickname4")).length - 1;
		}
		if (!(userMap.get("nickname5").equals("null"))) {
			rankingCount.nicknameCount = doc.split(userMap.get("nickname5")).length - 1;
		}

		// document.clear();
		return rankingCount;
	}
}
