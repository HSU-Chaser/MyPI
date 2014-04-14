package search.daum;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class DaumSearch {
	private static final String daum = "http://apis.daum.net/search/web?";
	private static final String key = "&apikey=8d960746ca81a14d1fd0fa4b8359ccfb1a1a0fab";

	public String buildSearchUrl(String query) {
		// Required parameters
		StringBuilder request = new StringBuilder(daum);
		request.append("q=\"" + query + "\"");
		request.append(key);

		// Optional parameters
		request.append("&result=50");

		return request.toString();
	}

	public String getXMLResult(String query) {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();
		
		try {
			// Build Query
			DaumSearch daum = new DaumSearch();
			URL url = new URL(daum.buildSearchUrl("gtaer"));
			System.out.println("Daum ?�청 : " + url.toString());
			// ?�결
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/xml");
			// ?�기
			InputStreamReader isr = new InputStreamReader(
					conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			// 결과??��
			String read;
			while ((read = br.readLine()) != null) {
				readBuffer.append(read);
			}
			// ?�기
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
