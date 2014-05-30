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

		
		double KT_resident = 2 * ( 1 - Math.pow(0.5, rankingCount.residentCount));
		double KT_cellphone =  2 * ( 1 - Math.pow(0.5, rankingCount.cellphoneCount));
		double KT_homephone =  2 * ( 1 - Math.pow(0.5, rankingCount.homephoneCount));
		double KT_id =  2 * ( 1 - Math.pow(0.5, rankingCount.idCount));
		double KT_email =  2 * ( 1 - Math.pow(0.5, rankingCount.emailCount));
		double KT_name =  2 * ( 1 - Math.pow(0.5, rankingCount.nameCount));
		double KT_address =  2 * ( 1 - Math.pow(0.5, rankingCount.addressCount));
		double KT_workplace =  2 * ( 1 - Math.pow(0.5, rankingCount.addressCount));
		double KT_birthday =  2 * ( 1 - Math.pow(0.5, rankingCount.birthdayCount));
		double KT_school =  2 * ( 1 - Math.pow(0.5, rankingCount.schoolCount));
		double KT_occupation =  2 * ( 1 - Math.pow(0.5, rankingCount.occupationCount));
		double KT_nickname =  2 * ( 1 - Math.pow(0.5, rankingCount.nicknameCount));
		
		
		
		double KF_WT = KT_resident * 7.174
				+KT_cellphone * 6.087
				+ KT_homephone * 5.283 + KT_id
				* 6.087 + KT_email * 5.696
				+KT_name * 5.370 + KT_address
				* 6.891 + KT_workplace * 5.717
				+ KT_birthday * 5.717 +KT_school
				* 4.913 + KT_occupation* 4.891
				+ KT_nickname * 6.087 * 1 / 2;

		
		
		System.out.println(rankingCount.residentCount + " "
				+ rankingCount.cellphoneCount + " "
				+ rankingCount.homephoneCount + " " + rankingCount.idCount
				+ " " + rankingCount.emailCount + " " + rankingCount.nameCount
				+ " " + rankingCount.addressCount + " "
				+ rankingCount.workplaceCount + " "
				+ rankingCount.birthdayCount + " " + rankingCount.schoolCount
				+ " " + rankingCount.occupationCount + " "
				+ rankingCount.nicknameCount);

		urlExposure = KF_WT * (1 + pageRank.getPR(URL)); //    / totalKeyword

		return Math.round(urlExposure);

	}
}
