package main.extending;

import main.extending.form.Search;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverMe2day extends Search {
	public NaverMe2day() {
		setBasicForm("http://me2day.net/");
	}

	public void searchMaterials(String coreMaterial) {

		Document doc;
		setUrl(getBasicForm() + coreMaterial);

		try {
			doc = Jsoup.connect(getBasicForm() + coreMaterial).get();
			
			storage.exposureUrlList.add(getUrl());
			
			Elements text = doc.select("html title");
			Elements img = doc.select("div.image_box");

			for (Element e : text) {
				setNickName(e.html().toString().split("님")[0]);
				storage.nickNameList.add(getNickName());
			}
			
			for (Element e : img) {
				setImgUrl(e.html().split(" ")[5].replace('"', ' ').split(" ")[1]);
				storage.imgUrlList.add(getImgUrl());
			}

		} catch (Exception e) {
			if (e.toString().contains("HttpStatusException")) {
				System.out.println("네이버 미투데이가 없습니다.");
			}
		}

	}
}