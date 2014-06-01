package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;

import main.ranking.ExtendedInfo;

public class FindPattern {
	RankingCount rankingCount = new RankingCount();
	HashMap<String, String> userMap = new HashMap<String, String>();

	public RankingCount countingProcess(ArrayList<String> document) {
		userMap.clear();
		userMap = ExtendedInfo.getKeywordMap();

		// 패턴 분석 삭제
		for (int i = 0; i < document.size(); i++) {
			if (!(userMap.get("cellphone").equals("null"))) {
				if (document.get(i).contains(userMap.get("cellphone"))) {
					rankingCount.cellphoneCount++;

				}
			}
			if (!(userMap.get("homephone").equals("null"))) {
				if (document.get(i).contains(userMap.get("homephone"))) {
					rankingCount.homephoneCount++;

				}
			}
			if (document.get(i).contains(userMap.get("id"))) {
				rankingCount.idCount++;
			}
			if (document.get(i).contains(userMap.get("email"))) {
				rankingCount.emailCount++;
			}

			if (!(userMap.get("name").equals("null"))) {
				if (document.get(i).contains(userMap.get("name"))) {
					rankingCount.nameCount++;
				}
			}
			if (!(userMap.get("address").equals("null"))) {
				if (document.get(i).contains(userMap.get("address"))) {
					rankingCount.addressCount++;
				}
			}
			if (!(userMap.get("workplace").equals("null"))) {
				if (document.get(i).contains(userMap.get("workplace"))) {
					rankingCount.workplaceCount++;

				}
			}
			if (!(userMap.get("birthday").equals("null"))) {
				if (document.get(i).contains(userMap.get("birthday"))) {
					rankingCount.birthdayCount++;

				}
			}
			if (!(userMap.get("school").equals("null"))) {
				if (document.get(i).contains(userMap.get("school"))) {
					rankingCount.schoolCount++;
		
				}
			}
			if (!(userMap.get("occupation").equals("null"))) {
				if (document.get(i).contains(userMap.get("occupation"))) {
					rankingCount.occupationCount++;
				}
			}

			// nickname 검사
			if (!(userMap.get("nickname1").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname1"))) {
					rankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname2").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname2"))) {
					rankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname3").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname3"))) {
					rankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname4").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname4"))) {
					rankingCount.nicknameCount++;
				}
			}
			if (!(userMap.get("nickname5").equals("null"))) {
				if (document.get(i).contains(userMap.get("nickname5"))) {
					rankingCount.nicknameCount++;
				}
			}

		}

		//document.clear();
		return rankingCount;
	}
}
