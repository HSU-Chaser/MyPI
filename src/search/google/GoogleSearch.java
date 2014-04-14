package search.google;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class GoogleSearch {
	private static final String google = "http://www.google.com/search?";
	private static final String key = "&key=AIzaSyCMGfdDaSfjqv5zYoS0mTJnOT3e9MURWkU";
	private static final String cx = "&cx=010276989280583185703:8ss-tvlus7w";

	public String buildSearchUrl(String query) {
		// Required parameters
		StringBuilder request = new StringBuilder(google);
		request.append("q=\"" + query + "\""); // Query
		request.append(key); // API Key
		request.append(cx); // Custom Search Engine ID

		// Optional parameters
		request.append("&client=google-csbe"); // Search Engine Type
		request.append("&output=xml_no_dtd"); // Output to XML
		request.append("&ie=utf-8"); // Input Encoding
		request.append("&oe=utf-8"); // Output Encoding

		return request.toString();
	}

	public String getXMLResult(String query) {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			GoogleSearch google = new GoogleSearch();
			URL url = new URL(google.buildSearchUrl("gtaer"));
			System.out.println("Google ?”ì²­ : " + url.toString());
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