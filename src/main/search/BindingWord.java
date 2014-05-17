package main.search;

import java.util.ArrayList;

import main.extending.form.Storage;
import main.logon.LogonDBBean;
import main.logon.LogonDataBean;

public class BindingWord {

	String memberEmail = "";
	Storage storage;

	public BindingWord(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getSearchWord() {

		LogonDataBean dataBean;
		String memberId = memberEmail.split("@")[0];
		String searchWord = "";
		ArrayList<String> dbInfo = new ArrayList<String>();
		String combinedDB = "";
		ArrayList<String> extendingInfo = new ArrayList<String>();
		String combinedExtending = "";
		
		searchWord = "\"" + memberId + "\"";
		
		try {
			dataBean = new LogonDataBean();
			dataBean = LogonDBBean.getInstance().getMember(memberEmail);
			
			//extraInfo는 tinyInt로 default 0, true일때 1을 저장할 것이므로
			System.out.println("ExtraInfo에 들어있는 값 : " + dataBean.getExtraInfo());
			if(Boolean.parseBoolean(dataBean.getExtraInfo())){
				
				if(!dataBean.getBirthday().equals(null)){
					dbInfo.add(dataBean.getBirthday());
				}
				if(!dataBean.getCellphone().equals(null)){
					dbInfo.add(dataBean.getCellphone());
				}
				if(!dataBean.getEmail().equals(null)){
					dbInfo.add(dataBean.getEmail());
				}			
				if(!dataBean.getHomephone().equals(null)){
					dbInfo.add(dataBean.getHomephone());
				}			
				if(!dataBean.getName().equals(null)){
					dbInfo.add(dataBean.getName());
				}
				if(!dataBean.getOccupation().equals(null)){
					dbInfo.add(dataBean.getOccupation());
				}
				if(!dataBean.getSchool().equals(null)){
					dbInfo.add(dataBean.getSchool());
				}
				if(!dataBean.getSex().equals(null)){
					dbInfo.add(dataBean.getSex());
				}
				for(int i=0; i<dbInfo.size(); i++){
					combinedDB = combinedDB.concat("|" + dbInfo.get(i));
				}
				
				searchWord.concat(combinedDB);
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		storage = new Storage(memberEmail);
		storage.execute(); // start the extending algorithm
		
		extendingInfo.addAll(Storage.nickNameList);
		if(!Storage.realName.equals("null")){
			extendingInfo.add(Storage.realName);
		}
		if(!Storage.realBirthday.equals("null")){
			extendingInfo.add(Storage.realBirthday);
		}
		if(!Storage.realEmail.equals("null")){
			extendingInfo.add(Storage.realEmail);
		}

		System.out.println("extendingInfo의 size : " + extendingInfo.size());
		
		for(int i=0; i<extendingInfo.size(); i++){
			combinedExtending = combinedExtending.concat("|" + extendingInfo.get(i));
		}
		
		searchWord = searchWord.concat(combinedExtending);
		System.out.println("combinedDB : " + combinedDB + " combinedExtending : " + combinedExtending);
	
		return searchWord;
	}

}
