package main.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class MakeObject {
	static ArrayList<SearchResult> result;
	GoogleSearch googleSearch = null;
	NaverSearch naverSearch = null;
	DaumSearch daumSearch = null;

	public ArrayList<SearchResult> getResult(HashMap<String, String> keywordMap) {

		result = null;
		
		Set<String> keySet = keywordMap.keySet();
		Iterator<String> itBind = keySet.iterator();
		Iterator<String> itCase = keySet.iterator();
		
		System.out.println("Test : 현재 키 리스트 개수 : " + keySet.size());
		
		
		StringBuffer orBinding = new StringBuffer("");
		
		while(itBind.hasNext()){
			String data = keywordMap.get(itBind.next());
			System.out.println("현재 들어온 데이터 : " + data);
			
			orBinding.append("+OR+");
			orBinding.append(data);
			
			
		}
		System.out.println(orBinding);		
		googleSearch = new GoogleSearch(orBinding.toString());
		result = googleSearch.getResult();
				

		while (itCase.hasNext()) {
			String key = itCase.next();
			System.out.println("현재 들어온 키값 : " + key);

			switch (key) {

			// memberid, email, birthday, cellphone, homephone, name, occupation, school, sex, email2
			
			case "cellphone":
				
				addingResultGND("\"" + keywordMap.get(key) + "\"");
				
				break;
			case "email":
				
				addingResultGND("\"" + keywordMap.get(key) + "\"");
				
				break;
			case "email2":
				
				addingResultGND("\"" + keywordMap.get(key) + "\"");
				
				break;
			case "homephone":
				
				addingResultGND("\"" + keywordMap.get(key) + "\"");
				
				break;
			case "memberid":
				
				addingResultGND("\"" + keywordMap.get(key) + "\"");
				
				break;
			
				
				
			}

		}


		return result;
	}

	public void addingResultGND(String query) {

		googleSearch = new GoogleSearch(query);
		naverSearch = new NaverSearch(query);
		daumSearch = new DaumSearch(query);

		result.addAll(googleSearch.getResult());
		result.addAll(naverSearch.getResult());
		result.addAll(daumSearch.getResult());

	}

}