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
		int complexWeight = 0;

		// 가중치 먹이고

		double KT_resident = 2 * (1 - Math.pow(0.5, rankingCount.residentCount));
		double KT_cellphone = 2 * (1 - Math.pow(0.5,
				rankingCount.cellphoneCount));
		double KT_homephone = 2 * (1 - Math.pow(0.5,
				rankingCount.homephoneCount));
		double KT_id = 2 * (1 - Math.pow(0.5, rankingCount.idCount));
		double KT_email = 2 * (1 - Math.pow(0.5, rankingCount.emailCount));
		double KT_name = 2 * (1 - Math.pow(0.5, rankingCount.nameCount));
		double KT_address = 2 * (1 - Math.pow(0.5, rankingCount.addressCount));
		double KT_workplace = 2 * (1 - Math.pow(0.5, rankingCount.addressCount));
		double KT_birthday = 2 * (1 - Math.pow(0.5, rankingCount.birthdayCount));
		double KT_school = 2 * (1 - Math.pow(0.5, rankingCount.schoolCount));
		double KT_occupation = 2 * (1 - Math.pow(0.5,
				rankingCount.occupationCount));
		double KT_nickname = 2 * (1 - Math.pow(0.5, rankingCount.nicknameCount));

		double KF_WT = KT_resident * 7.2 + KT_cellphone * 6.1
				+ KT_homephone * 5.3 + KT_id * 6.1 + KT_email * 5.7
				+ KT_name * 5.4 + KT_address * 6.9 + KT_workplace * 5.7
				+ KT_birthday * 5.7 + KT_school * 4.9 + KT_occupation
				* 4.9 + KT_nickname * 6.1 * 0.5;

		// int pr = pageRank.getPR(URL);

		System.out.println("주민" + rankingCount.residentCount + " " + "핸드폰"
				+ rankingCount.cellphoneCount + " " + "집전화"
				+ rankingCount.homephoneCount + " " + "아이디"
				+ rankingCount.idCount + " " + "이메일" + rankingCount.emailCount
				+ " " + "이름" + rankingCount.nameCount + " " + "주소"
				+ rankingCount.addressCount + " " + "직장"
				+ rankingCount.workplaceCount + " " + "생일"
				+ rankingCount.birthdayCount + " " + "학교"
				+ rankingCount.schoolCount + " " + "직업"
				+ rankingCount.occupationCount + " " + "닉네임"
				+ rankingCount.nicknameCount);

		// * (1 + pr); // / totalKeyword

		urlExposure = KF_WT
				* calCoupling(KT_resident, KT_cellphone, KT_homephone, KT_id,
						KT_email, KT_name, KT_address, KT_workplace,
						KT_birthday, KT_school, KT_occupation, KT_nickname);
		;

		return Math.round(urlExposure);

	}

	public int calCoupling(double KT_resident, double KT_cellphone,
			double KT_homephone, double KT_id, double KT_email, double KT_name,
			double KT_address, double KT_workplace, double KT_birthday,
			double KT_school, double KT_occupation, double KT_nickname) {
		int complexWeight = 0;

		if (KT_resident != 0)
			complexWeight++;
		if (KT_cellphone != 0)
			complexWeight++;
		if (KT_homephone != 0)
			complexWeight++;
		if (KT_id != 0)
			complexWeight++;
		if (KT_email != 0)
			complexWeight++;
		if (KT_name != 0)
			complexWeight++;
		if (KT_address != 0)
			complexWeight++;
		if (KT_workplace != 0)
			complexWeight++;
		if (KT_birthday != 0)
			complexWeight++;
		if (KT_school != 0)
			complexWeight++;
		if (KT_occupation != 0)
			complexWeight++;
		if (KT_nickname != 0)
			complexWeight++;

		return complexWeight;
	}

}
