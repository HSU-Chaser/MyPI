package main.patternanalysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RankingCount implements Reliability{

	// web source
	public static List<String> list = new ArrayList<String>();

	// 객체 안만들어도 참조가 되려나?
	private HashMap<String, String> keywordMap;

	public RankingCount(HashMap<String, String> keywordMap) {
		this.keywordMap = keywordMap;
	}

	// deterministic list
	public static List<String> emailList = new ArrayList<String>();
	public static List<String> addressList = new ArrayList<String>();
	public static List<String> cellphoneList = new ArrayList<String>();
	public static List<String> residentList = new ArrayList<String>();
	public static List<String> birthdayList = new ArrayList<String>();

	private int emailCount[] = new int[3];
	private int cellphoneCount[] = new int[3];
	private int birthdayCount[] = new int[3];
	private int addressCount[] = new int[3];
	private int residentCount[] = new int[3];

	// 쓰는건 index 2까지만 쓰지만 일단.
	private int homephoneCount[] = new int[3];
	private int idCount[] = new int[3];
	private int nameCount[] = new int[3];
	private int schoolCount[] = new int[3];

	// private int hobbyCount = 0;

	public void initCount(){
		
		for(int i=0; i<3; i++){
			emailCount[i] = 0;
			cellphoneCount[i] = 0;
			birthdayCount[i] = 0;
			addressCount[i] = 0;
			residentCount[i] = 0;
		}
	}
	
	public void countProcess() {

		initCount();
		
		for (int i = 0; i < emailList.size(); i++) {

			if(emailList.get(i).contains(keywordMap.get("email"))){
				emailCount[ORINAL]++;
			}
			else if(keywordMap.containsKey("email2")){
				if(emailList.get(i).contains(keywordMap.get("email2"))){
					emailCount[0]++;
				}
			}
			else{
				emailCount[2]++;
			}
		}

		for (int i = 0; i < addressList.size(); i++) {

		}
		for (int i = 0; i < cellphoneList.size(); i++) {

		}
		for (int i = 0; i < residentList.size(); i++) {

		}
		for (int i = 0; i < birthdayList.size(); i++) {

		}

	}

	public int[] getHomephoneCount() {

		return homephoneCount;
	}

	public int[] getIdCount() {
		return idCount;
	}

	public int[] getNameCount() {
		return nameCount;
	}

	public int[] getSchoolCount() {
		return schoolCount;
	}

	public int[] getEmailCount() {

		return emailCount;
	}

	public int[] getCellphoneCount() {

		return cellphoneCount;
	}

	public int[] getBirthdayCount() {

		return birthdayCount;
	}

	public int[] getAddressCount() {

		return addressCount;
	}

	public int[] getResidentCount() {

		return residentCount;
	}

}
