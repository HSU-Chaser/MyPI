package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;

import main.ranking.ExtendedInfo;

public class FindPattern {

	public ArrayList<String> document = new ArrayList<String>();
	HashMap<String, String> userMap = new HashMap<String, String>();

	public FindPattern(ArrayList<String> document) {
		this.document = document;
	}

	public void countingProcess() {

		userMap.clear();
		userMap = ExtendedInfo.getKeywordMap();

		initCount();

		// 패턴 분석 삭제

		for (int i = 0; i < document.size(); i++) {

			if (document.contains(userMap.get("cellphone"))) {
				RankingCount.cellphoneCount++;
			}
			if (document.contains(userMap.get("homephone"))) {
				RankingCount.homephoneCount++;
			}
			if (document.contains(userMap.get("id"))) {
				RankingCount.idCount++;
			}
			if (document.contains(userMap.get("email"))) {
				RankingCount.emailCount++;
			}
			if (document.contains(userMap.get("name"))) {
				RankingCount.nameCount++;
			}
			if (document.contains(userMap.get("address"))) {
				RankingCount.addressCount++;
			}
			if (document.contains(userMap.get("workplace"))) {
				RankingCount.workplaceCount++;
			}
			if (document.contains(userMap.get("birthday"))) {
				RankingCount.birthdayCount++;
			}
			if (document.contains(userMap.get("school"))) {
				RankingCount.schoolCount++;
			}
			if (document.contains(userMap.get("occupation"))) {
				RankingCount.occupationCount++;
			}

			// nickname 검사
			if (!(userMap.get("nickname").equals("null"))) {
				if (document.contains(userMap.get("nickname"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname2").equals("null"))) {
				if (document.contains(userMap.get("nickname2"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname3").equals("null"))) {
				if (document.contains(userMap.get("nickname3"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname4").equals("null"))) {
				if (document.contains(userMap.get("nickname4"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname5").equals("null"))) {
				if (document.contains(userMap.get("nickname5"))) {
					RankingCount.nicknameCount++;
				}
			}

		}

	}

	
	public void initCount() {

		RankingCount.emailCount = 0;
		RankingCount.cellphoneCount = 0;
		RankingCount.birthdayCount = 0;
		RankingCount.addressCount = 0;
		RankingCount.residentCount = 0;
		RankingCount.homephoneCount = 0;
		RankingCount.idCount = 0;
		RankingCount.nameCount = 0;
		RankingCount.schoolCount = 0;
		RankingCount.nicknameCount = 0;
		RankingCount.workplaceCount = 0;
		RankingCount.occupationCount = 0;

	}
}
