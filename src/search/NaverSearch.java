package search;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class NaverSearch {
	private static final String naver = "http://openapi.naver.com/search?";
	private static final String key = "&key=e9f2af290088b3d1d298ced9a41c4263";
	private String query;
	private ArrayList<SearchResult> result = new ArrayList<SearchResult>();

	public NaverSearch(String query) {
		this.query = query;
	}

	public ArrayList<SearchResult> getResult() {
		String xml = getXMLResult();

		return result;
	}

	private String buildSearchUrl() {
		// Required parameters
		StringBuilder request = new StringBuilder(naver);
		request.append("query=\"" + query + "\"");
		request.append(key);
		request.append("&target=webkr");

		// Optional parameters

		return request.toString();
	}

	private String getXMLResult() {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			URL url = new URL(buildSearchUrl());
			System.out.println("Naver 요청 : " + url.toString());
			// 연결
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/xml");
			// 읽기
			InputStreamReader isr = new InputStreamReader(
					conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			// 결과저장
			String read;
			while ((read = br.readLine()) != null) {
				readBuffer.append(read);
			}
			// 닫기
			br.close();
			isr.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		return readBuffer.toString();
	}
}
