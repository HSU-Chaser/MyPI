package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;

public class Egloos extends Search {
	public Egloos() {
		setBasicForm(".egloos.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl("http://" + coreMaterial + getBasicForm());
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream InputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(InputURL);
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				list.add(buffer);

				if (list.get(i).contains("블로그가 존재하지 않습니다")) {
					System.out.println("이글루가 없습니다.");
					break;
				}

				if (i == 5 && list.get(i).contains("author")) { //author가 5번째에 나오는것을 쓴다고 확정지어버림

					setNickName((list.get(i).substring(29).replace('"', '!')
							.split("!")[1]));
					storage.nickNameList.add(getNickName());
					storage.exposureUrlList.add(getUrl());
				} 
				if (list.get(i).contains("img src")) {
					setImgUrl((list.get(i).split("<")[2].replace('"', '!')
							.split("!")[1]));
					storage.imgUrlList.add(getImgUrl());
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
