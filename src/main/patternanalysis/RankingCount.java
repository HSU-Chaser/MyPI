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
	public static ArrayList<String> emailList = new ArrayList<String>();
	public static ArrayList<String> addressList = new ArrayList<String>();
	public static ArrayList<String> cellphoneList = new ArrayList<String>();
	public static ArrayList<String> residentList = new ArrayList<String>();
	public static ArrayList<String> birthdayList = new ArrayList<String>();
	public static ArrayList<String> homephoneList = new ArrayList<String>();

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
		
		System.out.println("TEST : " + "initCount()");
	
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
				
				emailCount[ORIGIN]++;
//				System.out.println(emailCount[ORIGIN]);
			}
			else if(keywordMap.containsKey("email2")){
				if(emailList.get(i).contains(keywordMap.get("email2"))){
					emailCount[ORIGIN]++;
				}
			}
			else{
				emailCount[PATTERN]++;
			}
			//test
//			System.out.println(emailCount[ORIGIN]);
//			System.out.println(emailCount[PATTERN]);
		}

		for (int i = 0; i < addressList.size(); i++) {
			
			if(addressList.get(i).contains(keywordMap.get("address"))){
				addressCount[ORIGIN]++;
			}
			else{
				addressCount[PATTERN]++;
			}
			//test
//			System.out.println(addressCount[ORIGIN]);
//			System.out.println(addressCount[PATTERN]);
			
		}
		for (int i = 0; i < cellphoneList.size(); i++) {

			if(cellphoneList.get(i).contains(keywordMap.get("cellphone"))){
				cellphoneCount[ORIGIN]++;
			}
			else{
				cellphoneCount[PATTERN]++;
			}
			//test
//			System.out.println(cellphoneCount[ORIGIN]);
//			System.out.println(cellphoneCount[PATTERN]);
//			
		}
		for (int i = 0; i < residentList.size(); i++) {
			if(residentList.get(i).contains(keywordMap.get("resident"))){
				residentCount[ORIGIN]++;
			}
			else{
				residentCount[PATTERN]++;
			}
			//test
//			System.out.println(residentCount[ORIGIN]);
//			System.out.println(residentCount[PATTERN]);
		}
		for (int i = 0; i < birthdayList.size(); i++) {
			if(birthdayList.get(i).contains(keywordMap.get("birthday"))){
				birthdayCount[ORIGIN]++;
			}
			else{
				birthdayCount[PATTERN]++;
			}
			//test
//			System.out.println(birthdayCount[ORIGIN]);
//			System.out.println(birthdayCount[PATTERN]);
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
