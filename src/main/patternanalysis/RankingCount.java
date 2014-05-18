package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RankingCount {

	// html
	public static List<String> list = new ArrayList<String>();
	// 객체 안만들어도 참조가 되려나?
	private HashMap<String, String> keywordMap;

	public RankingCount(HashMap<String, String> keywordMap) {
		this.keywordMap = keywordMap;
	}

	// deterministic list
	public static List<String> emailList = new ArrayList<String>();
	public static List<String> addressList = new ArrayList<String>();
	public static List<String> handphoneList = new ArrayList<String>();
	public static List<String> residentList = new ArrayList<String>();
	public static List<String> birthdayList = new ArrayList<String>();

	// return count
	public void countProcess() {

	}

	public int getEmailCount() {

		int emailCount = 0;

		return emailCount;
	}

	public int getCellphoneCount() {

		int emailCount = 0;

		return emailCount;
	}

	public int getBirthdayCount() {

		int emailCount = 0;

		return emailCount;
	}



}
