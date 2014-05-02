package main.search;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class NaverSearch {
	private static final String naver = "http://openapi.naver.com/search?";
	private static final String key = "&key=e9f2af290088b3d1d298ced9a41c4263";
	private ArrayList<SearchResult> result = new ArrayList<SearchResult>();
	private String query;

	public NaverSearch(String query) {
		this.query = query;
	}

	public ArrayList<SearchResult> getResult() {
		// Initialize
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		InputStream is;
		Document document = null;
		try {
			builder = factory.newDocumentBuilder();
			is = new ByteArrayInputStream(getXMLResult().getBytes("UTF-8"));
			document = builder.parse(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.getDocumentElement().normalize();

		// Get Data
		Element root = document.getDocumentElement();
		NodeList list = root.getElementsByTagName("item");

		// Make SearchResult ArrayList
		for (int i = 0; i < list.getLength(); i++) {
			Node node = list.item(i);
			Element element = (Element) node;

			String title = null;
			String url = null;
			String snippet = null;
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				url = element.getElementsByTagName("link").item(0)
						.getTextContent();
				title = element.getElementsByTagName("title").item(0)
						.getTextContent();
				snippet = element.getElementsByTagName("description").item(0)
						.getTextContent();
			}
			int resultNumber = i + 1;

			SearchResult searchResult = new SearchResult("Naver", title, url, snippet,
					resultNumber);
			result.add(searchResult);
		}

		return result;
	}

	private String buildSearchUrl() {
		// Required parameters
		StringBuilder request = new StringBuilder(naver);
		request.append("query=\"" + query + "\"");
		request.append(key);
		request.append("&target=webkr");

		// Optional parameters
		request.append("&display=20");

		return request.toString();
	}

	private String getXMLResult() {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			URL url = new URL(buildSearchUrl());
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