package main.ranking;

import java.util.HashMap;

import main.extending.form.ExtendedStorage;
import main.logon.LogonDBBean;
import main.logon.LogonDataBean;

public class ExtendedInfo {
	String memberEmail = "";
	ExtendedStorage storage;
	
	public ExtendedInfo(String memberEmail){
		this.memberEmail = memberEmail;
	}
	
	private static HashMap<String, String> keywordMap;

	public static HashMap<String, String> getKeywordMap() {

		if (keywordMap == null) {
			keywordMap = new HashMap<String, String>();
		}

		return keywordMap;
	}
	
	// 확장된 키워드에 대한 헤쉬맵 생성
	public void makeKeywordMap() {
		keywordMap = new HashMap<String, String>();
		LogonDataBean dataBean;
		String memberId = memberEmail.split("@")[0];

		// searchWord = "\"" + memberId + "\"" + "_"; // _는 구분자 역할

		storage = new ExtendedStorage(memberEmail);
		storage.execute(); // start the extending algorithm

		int nickNameCount = storage.nickNameList.size();

		try {
			dataBean = new LogonDataBean();
			dataBean = LogonDBBean.getInstance().getMember(memberEmail);

			keywordMap.put("email", dataBean.getEmail());
			keywordMap.put("id", memberId);
			keywordMap.put("name", dataBean.getName());
			keywordMap.put("cellphone", dataBean.getCellphone());
			keywordMap.put("homephone", dataBean.getHomephone());
			keywordMap.put("birthday", dataBean.getBirthday());
			keywordMap.put("address", dataBean.getAddress());
			keywordMap.put("school", dataBean.getSchool());
			keywordMap.put("workplace", dataBean.getWorkplace());
			keywordMap.put("occupation", dataBean.getOccupation());

			if (!keywordMap.containsKey("name")) {
				keywordMap.put("name", storage.realName);
			}
			keywordMap.put("email2", storage.realEmail);
			keywordMap.put("birthday2", storage.realBirthday);

			
			for (int i = 0; i < nickNameCount; i++) {
				switch (i) {
				// MAXIMUM of NickNameList = 5
				case 0:
					keywordMap.put("nickname", storage.nickNameList.get(i));
					
					keywordMap.put("nickname", "null");
					break;
				case 1:
					keywordMap.put("nickname2", storage.nickNameList.get(i));

					keywordMap.put("nickname2", "null");
					break;
				case 2:
					keywordMap.put("nickname3", storage.nickNameList.get(i));

					keywordMap.put("nickname3", "null");
					break;
				case 3:
					keywordMap.put("nickname4", storage.nickNameList.get(i));

					keywordMap.put("nickname4", "null");
					break;
				case 4:
					keywordMap.put("nickname5", storage.nickNameList.get(i));

					keywordMap.put("nickname5", "null");
					break;
				}
			}
			
			if(nickNameCount < 5) {
				for(int i=0; i<5-nickNameCount; i++){
					keywordMap.put("nickname" + (nickNameCount+i+1), "null");
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
