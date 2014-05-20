package main.patternanalysis;

import java.util.ArrayList;
import java.util.List;

import main.patternanalysis.information.*;

public class FindPattern {
	public List<String> list = new ArrayList<String>();

	public FindPattern(List<String> list) {
		this.list = list;
	}
	
	public void initList(){
		
		RankingCount.emailList.clear();
		RankingCount.addressList.clear();
		RankingCount.cellphoneList.clear();
		RankingCount.residentList.clear();
		RankingCount.birthdayList.clear();
		RankingCount.homephoneList.clear();
		
	}

	public void find() {
		
		initList();
		
		//리스트화가 가능한 6개 패턴
		
		for(String line : list){
			Address.PatternAnalysis(line);
			BirthDay.PatternAnalysis(line);
			Email.PatternAnalysis(line);
			Cellphone.PatternAnalysis(line);
			ResidentNumber.PatternAnalysis(line);
			Homephone.PatternAnalysis(line);
		}
		
		//리스트화가 불가능한 나머지 N개 패턴에 대해서는  
		
		
		
		
		
		
		
	}
}
