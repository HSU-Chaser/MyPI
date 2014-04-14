package search.naver;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class NaverSearch {
	private static final String naver = "http://openapi.naver.com/search?";
	private static final String key = "&key=e9f2af290088b3d1d298ced9a41c4263";

	public String buildSearchUrl(String query) {
		// Required parameters
		StringBuilder request = new StringBuilder(naver);
		request.append("query=\"" + query + "\"");
		request.append(key);
		request.append("&target=webkr");

		// Optional parameters

		return request.toString();
	}

	public String getXMLResult(String query) {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			NaverSearch naver = new NaverSearch();
			URL url = new URL(naver.buildSearchUrl("gtaer"));
			System.out.println("Naver ?”ì²­ : " + url.toString());
			// ?°ê²°
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/xml");
			// ?½ê¸°
			InputStreamReader isr = new InputStreamReader(
					conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			// ê²°ê³¼??ž¥
			String read;
			while ((read = br.readLine()) != null) {
				readBuffer.append(read);
			}
			// ?«ê¸°
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
