package main.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import main.ranking.ImageStorage;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ImageSearch {
	public static void setImageSearchResult(String searchWord, int limit)
			throws IOException, IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		ArrayList<String> imageSearchList = new ArrayList<String>();

		System.out.println("검색어와 한계점 : " + searchWord + "   " + limit);

		String query = searchWord;
		URL url = new URL(
				"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="
						+ URLEncoder.encode(query, "UTF-8")
						+ "&userip=127.0.0.1:8080&rsz=" + limit);
		URLConnection connection = url.openConnection();

		connection.setConnectTimeout(3000);
		connection.addRequestProperty("Referer", "http://google.com");

		String line;
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream()));
		while ((line = reader.readLine()) != null) {
			builder.append(line);
		}

		// System.out.println(builder);

		Map<String, Object> classMap = new HashMap<String, Object>();
		JSONObject jsonObject = JSONObject.fromObject(builder.toString());
		Map<String, Object> model = (Map<String, Object>) JSONObject.toBean(
				jsonObject, java.util.HashMap.class, classMap);

		JSONArray responseData = JSONArray
				.fromObject(model.get("responseData"));
		JSONObject results = responseData.getJSONObject(0);
		JSONArray image_data = JSONArray.fromObject(results.get("results"));

		System.out.println("이미지 데이터 사이즈 : " + image_data.size());
		for (int i = 0; i < image_data.size(); i++) {
			// System.out.println( image_data.get(i) );
			JSONArray img_url = JSONArray.fromObject(image_data.get(i));
			imageSearchList.add((JSONObject.fromObject(img_url.get(0))
					.get("url")).toString());

			System.out.println((JSONObject.fromObject(img_url.get(0))
					.get("url")).toString());
		}

		System.out.println("이미지서치 끝, 넘긴 이미지 개수 - 전: " + imageSearchList.size());

		ImageStorage.init();
		ImageStorage.getImgUrlList().addAll(imageSearchList);

		System.out
				.println("이미지서치 끝, 넘긴 이미지 개수 - 후 : " + imageSearchList.size());
		System.out.println("이미지서치 끝, 이미지스토리지 이미지 개수 : "
				+ ImageStorage.getImgUrlList().size());

		ImageStorage.deleteBlank();
	}
}