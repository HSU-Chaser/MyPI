package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;

public class Cyworld extends Search {
	public Cyworld() {
		setBasicForm("http://search.cyworld.com/search/all.html?thr=sbus&ssn=043&asn=004300673&q=");
	}

	// cyworld는 매우 중요한 정보를 다룸, 특히 coreMaterial은 이메일을 쪼갠 id를 받지만, 싸이월드는 이메일을 받아야됨
	// 아얘 이메일부분을 case로 다양화할 필요도 있음 1개 나올때까지 계속 돌리기 등
	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial + "%40nate.com");
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;
		String tid = ""; //uid에 대한 tid
		
		String realName = ""; //본명
		String email = ""; //이메일
		String birthday = ""; //생년월일(양, 음력)
		
		
		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "euc-kr");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("nameUIOpen")) {
					tid = list.get(i).split("'")[1].split("'")[0];
					setUrl("http://minihp.cyworld.com/svcs/MiniHp.cy/index/"
							+ tid + "?tid=60202405&urlstr=&f=&gate=_top");
					break;
				}
				i++;
			}
			br.close();
			rd.close();
			inputURL.close();
			inputURL = new URL(getUrl()).openStream();
			rd = new InputStreamReader(inputURL, "euc-kr");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);

				if (list.get(i).contains("검색결과가 없습니다")) {
					System.out.println("싸이월드가 없습니다");
					break;
				}
				if (list.get(i).contains("tName")) {
					storage.realName = list.get(i).replace('"', '!').split("!")[5];
					storage.exposureUrlList.add("http://minihp.cyworld.com/pims/main/pims_main.asp?tid="+tid);

				} 
				if(list.get(i).contains("mailto")){
					email = list.get(i).split(":")[1].replace('"','!').split("!")[0];
				}
				
				if(list.get(i).contains("생년월일")){
					storage.realBirthday = list.get(i).split(">")[4].split("<")[0];
				}
				
				if(list.get(i).contains("미니홈피 주소")){   //주소 뒷부분에 코어한 정보가 많아서 nickname으로 빼놓음
					setNickName(list.get(i).split("/")[3]);
					storage.nickNameList.add(getNickName());
				}
				
				if(list.get(i).contains("swfphotoPath")){
					setImgUrl(list.get(i).replace('"','!').split("!")[5]);
					storage.imgUrlList.add(getImgUrl());
				}
				i++;
			}

			br.close();
			rd.close();
			inputURL.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
