package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;

public class TodayHumor extends Search {
	public TodayHumor() {
		setBasicForm("http://www.todayhumor.co.kr/board/list.php?kind=search&keyfield=name&keyword=");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;
		int check = 0;
		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "utf-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("DEF2FF")) { // 게시글에 쓰는 백그라운드 색상 #DEF2FF
					storage.exposureUrlList.add(getUrl());
					check = 1;
					break;
				}
				i++;
			}
			if(check == 0){
				System.out.println("오늘의유머 게시물이 없습니다.");
			}

			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}