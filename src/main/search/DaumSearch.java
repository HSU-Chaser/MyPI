package main.search;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class DaumSearch {
	private static final String daum = "http://apis.daum.net/search/web?";
	private static final String key = "&apikey=8d960746ca81a14d1fd0fa4b8359ccfb1a1a0fab";
	private String query;
	private ArrayList<SearchResult> result = new ArrayList<SearchResult>();

	public DaumSearch(String query) {
		this.query = query;
	}

	public ArrayList<SearchResult> getResult() {
		String xml = getXMLResult();

		return result;
	}

	private String buildSearchUrl() {
		// Required parameters
		StringBuilder request = new StringBuilder(daum);
		request.append("q=\"" + query + "\"");
		request.append(key);

		// Optional parameters
		request.append("&result=50");

		return request.toString();
	}

	private String getXMLResult() {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			URL url = new URL(buildSearchUrl());
			System.out.println("Daum 요청 : " + url.toString());
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
