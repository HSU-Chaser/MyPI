package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;

import main.ranking.ExtendedInfo;

public class FindPattern {

	HashMap<String, String> userMap = new HashMap<String, String>();

	public void countingProcess(ArrayList<String> document) {
		userMap.clear();
		userMap = ExtendedInfo.getKeywordMap();

		initCount();

		// 패턴 분석 삭제

		for (int i = 0; i < document.size(); i++) {
			if (!(userMap.get("cellphone").equals("null"))) {
				if (document.get(i).contains(userMap.get("cellphone"))) {
					RankingCount.cellphoneCount++;
				}
			}
			if (!(userMap.get("homephone").equals("null"))) {
				if (document.get(i).contains(userMap.get("homephone"))) {
					RankingCount.homephoneCount++;
				}
			}
			if (document.get(i).contains(userMap.get("id"))) {
				RankingCount.idCount++;
			}
			if (document.get(i).contains(userMap.get("email"))) {
				RankingCount.emailCount++;
			}

			if (!(userMap.get("name").equals("null"))) {
				if (document.get(i).contains(userMap.get("name"))) {
					RankingCount.nameCount++;
				}
			}
			if (!(userMap.get("address").equals("null"))) {
				if (document.get(i).contains(userMap.get("address"))) {
					RankingCount.addressCount++;
				}
			}
			if (!(userMap.get("workplace").equals("null"))) {
				if (document.get(i).contains(userMap.get("workplace"))) {
					RankingCount.workplaceCount++;
				}
			}
			if (!(userMap.get("birthday").equals("null"))) {
				if (document.get(i).contains(userMap.get("birthday"))) {
					RankingCount.birthdayCount++;
				}
			}
			if (!(userMap.get("school").equals("null"))) {
				if (document.get(i).contains(userMap.get("school"))) {
					RankingCount.schoolCount++;
				}
			}
			if (!(userMap.get("occupation").equals("null"))) {
				if (document.get(i).contains(userMap.get("occupation"))) {
					RankingCount.occupationCount++;
				}
			}

			// nickname 검사
			if (!(userMap.get("nickname1").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname2").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname2"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname3").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname3"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname4").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname4"))) {
					RankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname5").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname5"))) {
					RankingCount.nicknameCount++;
				}
			}

		}

		document.clear();

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
