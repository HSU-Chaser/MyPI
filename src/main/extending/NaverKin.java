package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;

public class NaverKin extends Search {
	public NaverKin() {
		setBasicForm("http://kin.naver.com/profile/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);

				if (list.get(i).contains("content=\"none\""))
					System.out.println("네이버 지식인 페이지가 없습니다.");

				if (list.get(i).contains("og:title")) {
					setNickName(list.get(i).split(" ")[2].replace('"', '!')
							.split("!")[1]);
					if (!storage.nickNameList.get(0).equals(getNickName())) {
						storage.nickNameList.add(getNickName());
					}
					storage.exposureUrlList.add(getUrl());
					break;
				}
				i++;
			}
			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
