package main.ranking;

import main.patternanalysis.Constant;
import main.patternanalysis.RankingCount;

public class CalculateExp implements Constant {

	RankingCount rankingCount;

	public double getExposure(String URL) {

		PageRank pageRank = new PageRank();

		rankingCount = new RankingCount();

		double urlExposure = 0;

		int totalKeyword = TOTALKEYWORD;

		// 가중치 먹이고

		double KF_WT = rankingCount.residentCount * 7.174
				+ rankingCount.cellphoneCount * 6.087
				+ rankingCount.homephoneCount * 5.283 + rankingCount.idCount
				* 6.087 + rankingCount.emailCount * 5.696
				+ rankingCount.nameCount * 5.370 + rankingCount.addressCount
				* 6.891 + rankingCount.workplaceCount * 5.717
				+ rankingCount.birthdayCount * 5.717 + rankingCount.schoolCount
				* 4.913 + rankingCount.occupationCount * 4.891
				+ rankingCount.nicknameCount * 6.087 * 1 / 2;

		System.out.println(rankingCount.residentCount + " "
				+ rankingCount.cellphoneCount + " "
				+ rankingCount.homephoneCount + " " + rankingCount.idCount
				+ " " + rankingCount.emailCount + " " + rankingCount.nameCount
				+ " " + rankingCount.addressCount + " "
				+ rankingCount.workplaceCount + " "
				+ rankingCount.birthdayCount + " " + rankingCount.schoolCount
				+ " " + rankingCount.occupationCount + " "
				+ rankingCount.nicknameCount);

		urlExposure = (KF_WT / totalKeyword); //   

		return Math.round(urlExposure);

	}
}
